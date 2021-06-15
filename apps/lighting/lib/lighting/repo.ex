defmodule Lighting.Repo do
  use Ecto.Repo,
    otp_app: :lighting,
    adapter: Ecto.Adapters.Postgres
end
