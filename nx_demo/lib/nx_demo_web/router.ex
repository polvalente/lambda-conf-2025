defmodule NxDemoWeb.Router do
  use NxDemoWeb, :router

  pipeline :presentation do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:protect_from_forgery)
    plug(:put_root_layout, html: {NxDemoWeb.Layouts, :presentation})
    plug(:put_layout, false)
  end

  scope "/", NxDemoWeb do
    pipe_through(:presentation)

    get("/", PresentationController, :show)
  end
end
