defmodule UnlevelAll.Xanity.CMS do
  @moduledoc false
  alias UnlevelAll.Xanity.Query

  def get(query, id) do
    query_string = Query.build(query, id)

    {:ok, response} = request(query_string)

    [document | _] = response.body["result"]

    document
  end

  def one(query) do
    query_string = Query.build(query)

    {:ok, response} = request(query_string)

    [document | _] = response.body["result"]

    document
  end

  def all(query) do
    query_string = Query.build(query)

    {:ok, response} = request(query_string)

    response.body["result"]
  end

  defp request(query_string) do
    Sanity.query(query_string)
    |> Sanity.request(
      project_id: System.get_env("SANITY_PROJECT_ID"),
      dataset: "development",
      token: System.get_env("SANITY_API_KEY"),
      cdn: true
    )
  end
end
