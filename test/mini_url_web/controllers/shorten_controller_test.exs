defmodule MiniUrlWeb.ShortenUrlControllerTest do
  use MiniUrlWeb.ConnCase

  describe "POST /shorten" do
    setup(context) do
      long_url = "https://croton.net"
      {:ok, Map.put(context, :long_url, long_url)}
    end

    test "should return 200 and a shorten a url that was saved in the database", %{
      conn: conn,
      long_url: url
    } do
      path = Routes.shorten_url_path(conn, :create, url)

      resp_body =
        conn
        |> post(path)
        |> json_response(201)

      assert Map.has_key?(resp_body, :mini_url)
      assert resp_body.mini_url != url
      refute is_nil(resp_body.mini_url)
    end
  end
end
