defmodule MiniUrl.Repo.Migrations.CreateShortenUrlTable do
  use Ecto.Migration

  def change do
    create table("shorten_urls", primary_key: false) do
      add :id, :binary_id, primary_key: true, null: false
      add :short_url, :string, null: false
      add :long_url, :string, null: false

      timestamps(type: :utc_datetime_usec)
    end

    create unique_index("shorten_urls", :long_url, name: :index_long_urls_duplicated_entries)
  end
end
