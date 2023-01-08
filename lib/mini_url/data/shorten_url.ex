defmodule MiniUrl.Data.ShortenUrl do
  use Ecto.Schema
  import Ecto.Changeset

  @short_url_length 16
  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @timestamps_opts [type: :utc_datetime_usec]

  @fields ~w(short_url long_url)a

  @required_fields @fields

  schema "shorten_urls" do
    field :short_url, :string
    field :long_url, :string

    timestamps()
  end

  def insert_changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:long_url, name: :index_long_urls_duplicated_entries)
  end

  def put_random_short_url(params) do
    short_url =
      @short_url_length
      |> :crypto.strong_rand_bytes()
      |> Base.encode64()
      |> binary_part(0, @short_url_length)

    Map.put(params, "short_url", short_url)
  end
end
