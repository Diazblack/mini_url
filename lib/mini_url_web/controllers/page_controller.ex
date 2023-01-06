defmodule MiniUrlWeb.PageController do
  use MiniUrlWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
