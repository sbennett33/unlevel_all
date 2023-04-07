defmodule UnlevelAll.ContentEntities do
  def get(id) do
    {:ok, response} =
      Sanity.query(~s(*[_type == "contentEntity" && _id == "#{id}"]))
      |> Sanity.request(
        project_id: System.get_env("SANITY_PROJECT_ID"),
        dataset: "development",
        token: System.get_env("SANITY_API_KEY"),
        cdn: true
      )

    [ce | _] = response.body["result"]
    AtomizeKeys.atomize_string_keys(ce)
  end
end
