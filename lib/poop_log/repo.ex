defmodule PoopLog.Repo do
  use Ecto.Repo,
    otp_app: :poop_log,
    adapter: Ecto.Adapters.Postgres
end
