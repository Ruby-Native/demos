import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["price", "submit"]
  static values = {
    base: Number,       // base_price in cents (medium)
    smallAdj: Number,   // cents to add for small (negative = cheaper)
    largeAdj: Number    // cents to add for large
  }

  connect() {
    this.update()
  }

  update() {
    const total = this.#sizePrice() + this.#extrasTotal()
    this.priceTarget.textContent = this.#format(total)
    this.submitTarget.value = `Add to order · ${this.#format(total)}`
  }

  // private

  #sizePrice() {
    const selected = this.element.querySelector('input[name="size"]:checked')
    if (!selected) return this.baseValue

    switch (selected.value) {
      case "small":  return this.baseValue + this.smallAdjValue
      case "large":  return this.baseValue + this.largeAdjValue
      default:       return this.baseValue
    }
  }

  #extrasTotal() {
    const checked = this.element.querySelectorAll('input[name="extras[]"]:checked')
    let total = 0
    checked.forEach(el => { total += parseInt(el.dataset.price, 10) || 0 })
    return total
  }

  #format(cents) {
    return `$${(cents / 100).toFixed(2)}`
  }
}
