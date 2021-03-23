import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "input"]

  fileSelection() {
    this.inputTarget.click()
  }

  submit() {
    this.formTarget.requestSubmit()
  }
}