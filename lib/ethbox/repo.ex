defmodule Ethbox.Repo do
  use Ecto.Repo,
    otp_app: :ethbox,
    adapter: Ecto.Adapters.Postgres
end
