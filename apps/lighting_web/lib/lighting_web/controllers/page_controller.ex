defmodule LightingWeb.PageController do
  use LightingWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
