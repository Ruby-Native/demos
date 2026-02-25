import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "input"]

  queried(event) {
    this.search(event.detail.query)
  }

  input() {
    this.search(this.inputTarget.value)
  }

  // Private

  search(query) {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.inputTarget.value = query
      this.formTarget.requestSubmit()
    }, 300)
  }
}
