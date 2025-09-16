defmodule WebSiteWeb.AboutMeController do
  use WebSiteWeb, :controller

  alias WebSite.Hobbies

  def about_me(conn, _params) do
    hobbies = Hobbies.list_hobbies()

    emojis = ~w(🩷 🌸 🎀) |> Enum.random() |> String.duplicate(5)

    render(conn, hobbies: hobbies, emojis: emojis)
  end
end
