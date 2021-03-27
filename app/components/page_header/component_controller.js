import { Controller } from "stimulus"

const largeBannerHeight = 272
const smallBannerHeight = 80
const headerHeight = largeBannerHeight + smallBannerHeight
const bannerHeightToHide = largeBannerHeight - smallBannerHeight

export default class extends Controller {
  static targets = ["form", "input", "banner"]

  connect() {
    this.main = this.element.parentNode.parentNode
    this.main.addEventListener("scroll", this.scroll.bind(this))
    this.firstSection = this.main.getElementsByTagName("section")[2]

    this.small = false
  }

  disconnect() {
    this.main.removeEventListener("scroll", this.scroll.bind(this))
  }

  fileSelection() {
    this.inputTarget.click()
  }

  submit() {
    this.formTarget.requestSubmit()
  }

  scroll() {
    const sectionTopPosition = this.firstSection.getBoundingClientRect().top
    const missingHeight = this.main.scrollHeight - window.innerHeight - bannerHeightToHide

    if ((!this.small && this.main.scrollTop > bannerHeightToHide && missingHeight > smallBannerHeight) || (this.small && sectionTopPosition < headerHeight)) {
      this.small = true
      this.element.classList.add("small")
    } else {
      this.small = false
      this.element.classList.remove("small")
    }
  }
}