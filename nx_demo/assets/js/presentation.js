// Presentation-specific JS
import Reveal from "reveal.js";
import hljs from "highlight.js";
import ElixirLanguage from "highlight.js/lib/languages/elixir";

// Register Elixir language for highlight.js
hljs.registerLanguage("elixir", ElixirLanguage);

let csrfToken = document
  .querySelector("meta[name='csrf-token']")
  .getAttribute("content");
let liveSocket = new LiveSocket("/live", Socket, {
  longPollFallbackMs: 2500,
  params: { _csrf_token: csrfToken },
});

// connect if there are any LiveViews on the page
liveSocket.connect();

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket;

// Initialize Reveal.js and Highlight.js when the DOM is ready
document.addEventListener("DOMContentLoaded", (event) => {
  Reveal.initialize({
    embedded: true,
    autoScroll: true,
    slideNumber: "c/t",
    hash: true, // Enable hash navigation
    dependencies: [], // Disable reveal.js built-in plugins if not needed or manage them here
  });

  // Highlight code blocks
  document.querySelectorAll("pre code").forEach((block) => {
    hljs.highlightElement(block);
  });
});
