defmodule BlokosDev.Repo do
  use Ecto.Repo,
    otp_app: :blokos_dev,
    adapter: Ecto.Adapters.Postgres
end
