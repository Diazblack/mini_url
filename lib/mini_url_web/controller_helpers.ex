defmodule MiniUrlWeb.ControllerHelpers do
  alias Ecto.Changeset
  alias Phoenix.Controller
  alias Plug.Conn
  alias SparkOSWeb.ErrorHelpers

  def handle_errors(conn, error) do
    case error do
      nil -> format_error_response(conn, %{"error" => "Not Found"})
      :error -> format_error_response(conn, %{"error" => "Not Found"})
      {:error, changeset} -> format_error_response(conn, changeset)
      {:error, reason, code} -> format_error_response(conn, reason, code)
    end
  end

  def format_errors(changeset) do
    Changeset.traverse_errors(changeset, fn {msg, opts} ->
      ErrorHelpers.translate_error({msg, opts})
    end)
  end

  def format_error_response(conn, message, status_code \\ 400) do
    render_json_response(conn, message, status_code)
  end

  defp render_json_response(conn, message, status_code) do
    conn
    |> Conn.put_status(status_code)
    |> Controller.json(message)
  end
end
