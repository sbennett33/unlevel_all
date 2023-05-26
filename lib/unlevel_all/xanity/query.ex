defmodule UnlevelAll.Xanity.Query do
  @moduledoc false
  defstruct document: nil, preloads: [], filters: [], fields: []

  def from(document) do
    %__MODULE__{
      document: document
    }
  end

  def preload(query, preloads) do
    %{query | preloads: preloads}
  end

  def build_get(query, id) do
    ~s(*[_type == "#{query.document}" && _id == "#{id}"]{..., #{build_preloads(query.preloads)}})
  end

  def build_all(query) do
    ~s(*[_type == "#{query.document}"]{..., #{build_preloads(query.preloads)}})
  end

  def build_preloads(preloads) do
    Enum.reduce(preloads, "", fn preload, acc ->
      acc <> ~s(#{Atom.to_string(preload)}[]->,)
    end)
  end
end
