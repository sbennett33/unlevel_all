defmodule UnlevelAll.Repo do
  use Ecto.Repo,
    otp_app: :unlevel_all,
    adapter: Ecto.Adapters.Postgres
end
