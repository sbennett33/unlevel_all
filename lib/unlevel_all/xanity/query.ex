defmodule UnlevelAll.Xanity.Query do
  @moduledoc false
  defstruct type: "", preloads: [], filters: [], fields: [], orderings: []

  def from(type) do
    %__MODULE__{
      type: type
    }
  end

  def filter(query, filter) do
    %{query | filters: query.filters ++ [filter]}
  end

  def preload(query, preloads) do
    %{query | preloads: preloads}
  end

  def order(query, order) do
    %{query | orderings: query.orderings ++ [order]}
  end

  def build(query, id) do
    query = filter(query, ~s(_id == "#{id}"))
    build(query)
  end

  def build(query) do
    ~s(*[_type == "#{query.type}" #{build_filters(query.filters)}] #{build_ordering(query.orderings)} {..., #{build_preloads(query.preloads)}})
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

  defp build_ordering(orderings) do
    Enum.reduce(orderings, "", fn {field, direction}, acc ->
      acc <> ~s( | order(#{field} #{Atom.to_string(direction)}\))
    end)
  end
end
