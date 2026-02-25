import { BridgeComponent } from "@hotwired/hotwire-native-bridge"

export default class extends BridgeComponent {
  static component = "menu"
  static targets = ["item"]
  static values = { title: String }

  connect() {
    super.connect()

    const items = this.itemTargets.map((el, index) => ({
      title: el.getAttribute("data-title"),
      index,
      destructive: el.hasAttribute("data-destructive")
    }))

    this.send("connect", { title: this.titleValue, items }, (message) => {
      const { selectedIndex } = message.data
      this.itemTargets[selectedIndex]?.click()
    })
  }
}
