defmodule NxDemoWeb.PresentationController do
  use NxDemoWeb, :controller

  def show(conn, _params) do
    # The root layout (:presentation) is set by the router pipeline
    url = Application.get_env(:nx_demo, :livebook_session_url)

    conn
    |> put_resp_header("X-Frame-Options", "ALLOW-FROM #{url}")
    |> render(:show, livebook_session_url: url)
  end
end
