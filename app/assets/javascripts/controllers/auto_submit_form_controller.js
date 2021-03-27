import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form"]

  submit() {
    console.log("Un truc")
    this.formTarget.requestSubmit()
  }
}