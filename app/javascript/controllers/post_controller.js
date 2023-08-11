import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["comments", "form", "show"]

    connect() {
        this.commentsTarget.style.display = "none"
        this.formTarget.style.display = "none"
    }

    show() {
        this.formTarget.style.display = "block"
        this.commentsTarget.style.display = "flex"
        this.showTargets.forEach(element => {
            element.style.display = "none"
        }); 
    }
}