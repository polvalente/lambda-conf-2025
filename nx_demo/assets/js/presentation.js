// Presentation-specific JS
import Reveal from "reveal.js";
import hljs from "highlight.js";
import ElixirLanguage from "highlight.js/lib/languages/elixir";

// Register Elixir language for highlight.js
hljs.registerLanguage("elixir", ElixirLanguage);

// Initialize Reveal.js and Highlight.js when the DOM is ready
document.addEventListener("DOMContentLoaded", (event) => {
  Reveal.initialize({
    slideNumber: "c/t",
    hash: true, // Enable hash navigation
    dependencies: [], // Disable reveal.js built-in plugins if not needed or manage them here
  });

  // Highlight code blocks
  document.querySelectorAll("pre code").forEach((block) => {
    hljs.highlightElement(block);
  });

  // Query param logic for live demo link (copied from original index.html)
  // NOTE: This assumes the link has id="link". Adjust if necessary.
  function getQueryParam(name) {
    const url = new URL(window.location.href);
    return url.searchParams.get(name);
  }
  const livebookUrl = getQueryParam("iframe_url");
  const linkElement = document.getElementById("link");
  if (linkElement && livebookUrl) {
    linkElement.href = livebookUrl;
  }
});
