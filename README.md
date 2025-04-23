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

bun install eslint-config-prettier prettier prettier-plugin-tailwindcss -D
bun install @ianvs/prettier-plugin-sort-imports -D
```
## .eslintrc.json
```json
// inside .eslintrc.json
{
  "extends": ["next/core-web-vitals", "prettier"]
}
```
## .prettierrc.json
```json
{
  "trailingComma": "es5",
  "semi": true,
  "tabWidth": 2,
  "singleQuote": false,
  "jsxSingleQuote": false,
  "plugins": ["prettier-plugin-tailwindcss", "sort-imports"],
  "importOrder": [
    "^(react/(.*)$)|^(react$)",
    "",
    "<THIRD_PARTY_MODULES>",
    "",
    "^[./]"
  ]
}
```
## rebuild environment in dev.inx