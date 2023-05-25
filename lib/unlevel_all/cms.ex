defmodule UnlevelAll.CMS do
  @moduledoc false
  def get(query) do
    {:ok, response} =
      Sanity.query(query)
      |> Sanity.request(
        project_id: System.get_env("SANITY_PROJECT_ID"),
        dataset: "development",
        token: System.get_env("SANITY_API_KEY"),
        cdn: true
      )

    [document | _] = response.body["result"]

    document
  end
end
