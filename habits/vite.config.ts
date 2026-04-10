import { defineConfig } from "vite"
import ViteRuby from "vite-plugin-ruby"
import vue from "@vitejs/plugin-vue"
import tailwindcss from "@tailwindcss/vite"
import { resolve } from "path"
import { existsSync } from "fs"

const localGem = resolve(__dirname, "../../gem/app/javascript/ruby_native")
const localGemAliases = existsSync(localGem)
  ? {
      "ruby-native/react": resolve(localGem, "react.js"),
      "ruby-native/vue": resolve(localGem, "vue.js"),
    }
  : {}

export default defineConfig({
  plugins: [ViteRuby(), vue(), tailwindcss()],
  resolve: {
    alias: {
      "~": resolve(__dirname, "app/frontend"),
      ...localGemAliases,
    },
    dedupe: ["vue"],
  },
})
