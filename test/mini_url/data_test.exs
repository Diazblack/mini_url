defmodule MiniUrl.DataTest do
  use MiniUrl.DataCase

  alias MiniUrl.Data
  alias MiniUrl.Data.ShortenUrl
  alias MiniUrl.Repo

  setup(context) do
    short_url =
      Repo.insert!(%ShortenUrl{
        short_url: "sRguP8QfNZBVzTEzBembDg==",
        long_url: "https://croton.net"
      })

    map = %{
      params: %{
        "long_url" =>
          "https://www.elchiguirebipolar.net/22-12-2022/el-fantasma-de-las-navidades-futuras-le-recuerda-a-scrooge-comprar-el-hielo-y-la-carorena/"
      },
      short_url: short_url
    }

    {:ok, Map.merge(context, map)}
  end

  describe "Data.create_shorten_url/1" do
    test "creates a new random mini url when a long url is passed", %{
      params: params
    } do
      {:ok, shorten_url} = Data.create_shorten_url(params)
      refute is_nil(shorten_url.short_url)
      assert shorten_url.short_url != params["long_url"]
      assert String.length(shorten_url.short_url) == 16
    end

    test "return {:error, changeset} when invalid data is passed" do
      {:error, changeset} = Data.create_shorten_url(%{})

      refute changeset.valid?

      assert changeset.errors == [
               long_url: {"can't be blank", [validation: :required]}
             ]
    end

    test "return {:error, changeset} when long url exist in the db", %{short_url: su} do
      {:error, changeset} = Data.create_shorten_url(%{"long_url" => su.long_url})

      refute changeset.valid?

      assert changeset.errors == [
               long_url:
                 {"has already been taken",
                  [
                    {:constraint, :unique},
                    {:constraint_name, "index_long_urls_duplicated_entries"}
                  ]}
             ]
    end
  end
end
