defmodule MiniUrlWeb.ShortenUrlController do
  use MiniUrlWeb, :controller
  alias MiniUrlWeb.ErrorHelpers
  alias Ecto.Changeset
  alias MiniUrl.Data

  def create(conn, params) do
    case Data.create_shorten_url(params) do
      {:ok, shorten_url} ->
        conn
        |> put_status(201)
        |> render("single.json", %{shorten_url: shorten_url})

      {:error, changeset = %Changeset{}} ->
        handle_errors(conn, ErrorHelpers.format_changeset_errors(changeset))

      error ->
        handle_errors(conn, error)
    end
  end
end
