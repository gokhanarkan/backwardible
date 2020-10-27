import { Controller } from "stimulus";
import axios from "axios";
import autocomplete from "autocomplete.js";

export default class extends Controller {
  static targets = ["field"];

  search(query, callback) {
    axios
      .get("/search/autocomplete", { params: { query } })
      .then((response) => {
        callback(response.data);
      });
  }

  connect() {
    this.ac = autocomplete(this.fieldTarget, { hint: false }, [
      {
        source: this.search,
        debounce: 200,
        templates: {
          suggestion: function (suggestion) {
            return suggestion.title;
          },
        },
      },
    ]).on("autocomplete:selected", (event, suggestion, dataset, context) => {
      this.ac.autocomplete.setVal(suggestion.title);
      window.location.href = `search?q=${suggestion.title}`;
    });
  }
}
