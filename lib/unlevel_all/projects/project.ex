defmodule UnlevelAll.Projects.Project do
  @moduledoc false
  defstruct type: "task", id: "", description: [], resources: [], tags: []

  alias UnlevelAll.Projects.{Resource, Tag}

  def new(attrs) when is_list(attrs) do
    Enum.map(attrs, fn attrs ->
      new(attrs)
    end)
  end

  def new(attrs) do
    %__MODULE__{
      id: attrs["_id"],
      description: attrs["description"],
      resources: build_resources(attrs["resources"]),
      tags: build_tags(attrs["tags"])
    }
  end

  def build_resources(nil), do: []

  def build_resources(attrs) do
    Enum.map(attrs, &Resource.new/1)
  end

  def build_tags(nil), do: []

  def build_tags(attrs) do
    Enum.map(attrs, &Tag.new/1)
  end
end
