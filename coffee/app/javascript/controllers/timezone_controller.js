import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const tz = Intl.DateTimeFormat().resolvedOptions().timeZone
    if (tz && document.cookie.indexOf(`timezone=${tz}`) === -1) {
      document.cookie = `timezone=${tz};path=/;max-age=31536000`
    }
  }
}
