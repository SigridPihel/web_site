defmodule WebSiteWeb.AboutMeController do
  use WebSiteWeb, :controller

  alias WebSite.Hobbies

  def index(conn, _params) do
    hobbies = Hobbies.list_hobbies()

    emojis = ~w(🩷 🌸 🎀) |> Enum.random() |> String.duplicate(5)

    render(conn, :index, hobbies: hobbies, emojis: emojis)
  end

  def show(conn, %{"id" => id}) do
    hobby = Hobbies.get_hobby(id)

    render(conn, :show, hobby: hobby)
  end
end
