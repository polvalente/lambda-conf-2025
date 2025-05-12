defmodule NxDemoWeb.PresentationController do
  use NxDemoWeb, :controller

  # Explicitly disable the controller's default layout (:app)
  plug(:put_layout, false)

  def show(conn, _params) do
    # The root layout (:presentation) is set by the router pipeline
    render(conn, :show)
  end
end
