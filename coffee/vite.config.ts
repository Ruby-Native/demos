import { defineConfig } from "vite"
import ViteRuby from "vite-plugin-ruby"
import react from "@vitejs/plugin-react"
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
  plugins: [ViteRuby(), react(), tailwindcss()],
  resolve: {
    alias: {
      "~": resolve(__dirname, "app/frontend"),
      ...localGemAliases,
    },
    dedupe: ["react", "react-dom"],
  },
})
