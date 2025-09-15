defmodule WebSite.Repo do
  use Ecto.Repo,
    otp_app: :web_site,
    adapter: Ecto.Adapters.Postgres
end
