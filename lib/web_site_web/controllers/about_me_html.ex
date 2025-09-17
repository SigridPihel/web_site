defmodule WebSiteWeb.AboutMeHTML do
  use WebSiteWeb, :html

  embed_templates "about_me_html/*"

  def show(assigns) do
    ~H"""
    <div class="about_me">
      <h1>{@emoji} Hobby {@hobby.id}</h1>
      <p>
        {@hobby.text}
      </p>
    </div>
    """
  end
end
