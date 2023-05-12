import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  greet() {
    alert("Greetings, Hope you have a great day!")
    console.log("Greeting")
  }
}