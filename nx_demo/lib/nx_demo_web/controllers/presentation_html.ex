defmodule NxDemoWeb.PresentationHTML do
  use NxDemoWeb, :html

  embed_templates("presentation_html/*")

  attr(:url, :string, required: true)
  attr(:anchor, :string, default: "")

  def livebook_link(assigns) do
    ~H"""
    <section>
      <a
            id="link"
            href={@url}
            target="_blank"
            rel="noopener noreferrer"
            style="
              display: inline-flex;
              align-items: center;
              font-size: 1.5em;
              text-decoration: none;
              color: #3b82f6;
              border: 2px solid #3b82f6;
              border-radius: 8px;
              padding: 0.5em 1em;
              gap: 0.5em;
            "
          >
            <span>Livebook Demo</span>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              stroke-width="1.5"
              stroke="currentColor"
              style="width: 1.5em; height: 1.5em"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M18 13.5V18.75A2.25 2.25 0 0 1 15.75 21H5.25A2.25 2.25 0 0 1 3 18.75V8.25A2.25 2.25 0 0 1 5.25 6H10.5M15.75 3H21m0 0v5.25M21 3l-9.75 9.75"
              />
            </svg>
          </a>
    </section>
    """
  end

  def livebook_section(assigns) do
    ~H"""
    <section>
      <iframe style="width: 1200px; height: 700px;" src={@url <> "##{@anchor}"} />
    </section>
    """
  end
end
