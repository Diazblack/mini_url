defmodule MiniUrlWeb.ShortenUrlControllerTest do
  use MiniUrlWeb.ConnCase

  alias MiniUrl.Data.ShortenUrl
  alias MiniUrl.Repo

  describe "POST /shorten" do
    setup(context) do
      params = %{
        long_url: "https://croton.net"
      }

      {:ok, Map.put(context, :params, params)}
    end

    test "should return 200 and a shorten a url that was saved in the database", %{
      conn: conn,
      params: params
    } do
      path = Routes.shorten_url_path(conn, :create)

      resp_body =
        conn
        |> post(path, params)
        |> json_response(201)

      assert Map.has_key?(resp_body, "mini_url")
      assert String.length(resp_body["mini_url"]["short_url"]) == 16
    end

    test "should return 400 error and a message if invalid data is passed", %{
      conn: conn
    } do
      path = Routes.shorten_url_path(conn, :create)

      resp_body =
        conn
        |> post(path, %{})
        |> json_response(400)

      assert resp_body["errors"] == %{"long_url" => ["can't be blank"]}
    end

    test "should return 400 error when the long url exists in the DB", %{
      conn: conn
    } do
      Repo.insert!(%ShortenUrl{
        short_url: "sRguP8QfNZBVzTEzBembDg==",
        long_url: "https://www.elchiguirebipolar.net/"
      })

      path = Routes.shorten_url_path(conn, :create)

      resp_body =
        conn
        |> post(path, %{long_url: "https://www.elchiguirebipolar.net/"})
        |> json_response(400)

      assert resp_body["errors"] == %{"long_url" => ["has already been taken"]}
    end
  end
end
