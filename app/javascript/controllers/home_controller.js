import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "query", "results" ]

  connect() {
  	console.log(this.fieldTarget);
  }
}
