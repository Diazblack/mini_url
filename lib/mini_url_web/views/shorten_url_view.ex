defmodule MiniUrlWeb.ShortenUrlView do
  use MiniUrlWeb, :view
  @fields [:short_url]

  def render("single.json", %{shorten_url: su}) do
    %{
      "mini_url" => Map.take(su, @fields)
    }
  end
end
