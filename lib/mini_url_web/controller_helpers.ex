defmodule MiniUrlWeb.ControllerHelpers do
  alias Phoenix.Controller
  alias Plug.Conn

  def handle_errors(conn, error) do
    case error do
      nil -> render_error_response(conn, %{"error" => "Not Found"})
      :error -> render_error_response(conn, %{"error" => "Not Found"})
      {:error, reason} -> render_error_response(conn, reason)
      {:error, reason, code} -> render_error_response(conn, reason, code)
    end
  end

  def render_error_response(conn, message, status_code \\ 400) do
    conn
    |> Conn.put_status(status_code)
    |> Controller.json(message)
  end
end
