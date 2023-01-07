defmodule MiniUrlWeb.ShortenUrlController do
  use MiniUrlWeb, :controller

  def create(conn, params) do
    case Data.find_or_create_shorten_url(params) do
      {:ok, short_url} <-
        conn
        |> put_status(201)
        |> render("single.json", %{short_url: short_url})

      error <- handle_error(error)
    end
  end
end
