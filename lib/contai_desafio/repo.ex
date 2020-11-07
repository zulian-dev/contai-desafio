defmodule ContaiDesafio.Repo do
  use Ecto.Repo,
    otp_app: :contai_desafio,
    adapter: Ecto.Adapters.Postgres
end
