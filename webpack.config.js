import MiniCssExtractPlugin from "mini-css-extract-plugin";
import { extname, join } from "path";
import { readFileSync } from "fs";
import crypto from "crypto";

const { dirname } = import.meta;
const EXIST = new Map();
const bhash = (content) => {
	// 使用 sha256 算法，并将结果编码为 base64
	const hash = crypto.createHash("sha256").update(content).digest("base64url");
	let offset = 1,
		name = hash.slice(0, offset);
	while (1) {
		const name_low = name.toLowerCase(),
			exist = EXIST.get(name_low);
		if (exist) {
			if (exist != hash) {
				name = hash.slice(0, ++offset);
				continue;
			}
		} else {
			EXIST.set(name_low, hash);
		}
		break;
	}
	return name;
};

export default {
	entry: "./tmp/index.styl",
	output: {
		// filename: "bundle.js",
		path: join(dirname, "lib"),
	},
	module: {
		rules: [
			{
				test: /\.styl$/,
				use: [MiniCssExtractPlugin.loader, "css-loader", "stylus-loader"],
			},
			{
				test: /\.(woff(2)?|ttf|eot)$/,
				type: "asset/resource",
				generator: {
					// esModule: false,
					filename: (conf) => {
						const fp = conf.module.request;
						const content = readFileSync(fp);
						const hash = bhash(content);
						const ext = extname(fp).slice(1);
						return `${hash}.${ext}`;
					},
				},
			},
		],
	},
	plugins: [
		new MiniCssExtractPlugin({
			filename: "_.css",
		}),
	],
};
