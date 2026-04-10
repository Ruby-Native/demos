import { defineConfig } from "vite"
import ViteRuby from "vite-plugin-ruby"
import react from "@vitejs/plugin-react"
import tailwindcss from "@tailwindcss/vite"
import { resolve } from "path"
import { existsSync } from "fs"

const localGemPackages = resolve(__dirname, "../../gem/packages")
const localGemAliases = existsSync(localGemPackages)
  ? {
      "@ruby-native/react": resolve(localGemPackages, "react/index.js"),
      "@ruby-native/vue": resolve(localGemPackages, "vue/index.js"),
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
