defmodule Blug.Repo do
  use Ecto.Repo,
    otp_app: :blug,
    adapter: Ecto.Adapters.Postgres
end
