# z-lab
## open in [firebase](https://studio.firebase.google.com/)
- should auto generate dev.nix
- add pkgs.bun
- uncomment the previews.preview.web
- change ```command = ["bun" "run" "dev"];```
- add ```cwd = "/home/user/z-lab/front-end";``` bellow the ```manager = "web";```
## install bun@latest
```shell
curl -fsSL https://bun.sh/install | bash

source ~/.bashrc

bunx --bun create-next-app@latest front-end --ts --tailwind --eslint --app --use-bun

cd front-end

bun run lint

bun add eslint-plugin-simple-import-sort -D
bun add -D prettier prettier-plugin-tailwindcss
```

```javascript

// eslint.config.mjs
import { dirname } from "path";
import { fileURLToPath } from "url";
import { FlatCompat } from "@eslint/eslintrc";
import simpleImportSort from "eslint-plugin-simple-import-sort";


const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const compat = new FlatCompat({
  baseDirectory: __dirname,
});

const eslintConfig = [
  ...compat.extends("next/core-web-vitals", "next/typescript"),
  // 添加 simple-import-sort 配置
  {
    // 指定应用范围（可选）
    files: ["**/*.ts", "**/*.tsx", "**/*.js", "**/*.jsx"],

    // 注册插件
    plugins: {
      "simple-import-sort": simpleImportSort,
    },

    // 配置规则
    rules: {
      // 启用排序规则
      "simple-import-sort/imports": [
        "error",
        {
          groups: [
            // Side effect imports.
            ["^\\u0000"],
            // Node.js builtins prefixed with `node:`.
            ["^node:"],
            // Packages.
            // Things that start with a letter (or digit or underscore), or `@` followed by a letter.
            ["^@?\\w"],
            // Absolute imports and other imports such as Vue-style `@/foo`.
            // Anything not matched in another group.
            ["^"],
            // Relative imports.
            // Anything that starts with a dot.
            ["^\\."],
          ],
        },
      ],
      "simple-import-sort/exports": "error",

      // 禁用原生排序规则（避免冲突）
      "sort-imports": "off",
    },
  },
];

export default eslintConfig;

```

```json
// .prettierrc
{
  "plugins": ["prettier-plugin-tailwindcss"]
}
```