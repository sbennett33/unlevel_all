defmodule UnlevelAll.Xanity.Query do
  @moduledoc false
  defstruct document: nil, preloads: [], filters: [], fields: []

  def from(document) do
    %__MODULE__{
      document: document
    }
  end

  def filter(query, filter) do
    %{query | filters: query.filters ++ [filter]}
  end

  def preload(query, preloads) do
    %{query | preloads: preloads}
  end

  def build(query, id) do
    query = filter(query, ~s(_id == "#{id}"))
    build(query)
  end

  def build(query) do
    ~s(*[_type == "#{query.document}" #{build_filters(query.filters)}]{..., #{build_preloads(query.preloads)}})
  end

  defp build_filters(filters) do
    Enum.reduce(filters, "", fn filter, acc ->
      acc <> ~s(&& #{filter})
    end)
  end

  defp build_preloads(preloads) do
    Enum.reduce(preloads, "", fn preload, acc ->
      acc <> ~s(#{Atom.to_string(preload)}[]->,)
    end)
  end
end
