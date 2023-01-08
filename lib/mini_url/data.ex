defmodule MiniUrl.Data do
  alias MiniUrl.Data.ShortenUrl
  alias MiniUrl.Repo

  def create_shorten_url(params) do
    params
    |> ShortenUrl.put_random_short_url()
    |> ShortenUrl.insert_changeset()
    |> Repo.insert()
  end
end
