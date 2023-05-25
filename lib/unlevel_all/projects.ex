defmodule UnlevelAll.Projects do
  @moduledoc false

  alias UnlevelAll.CMS
  alias UnlevelAll.Projects.Project

  def get(id) do
    id
    |> build_query([:resources, :tags])
    |> CMS.get()
    |> Project.new()
  end

  def build_query(id, preloads) do
    ~s(*[_type == "task" && _id == "#{id}"]{..., #{build_preloads(preloads)}})
  end

  def build_preloads(preloads) do
    Enum.reduce(preloads, "", fn preload, acc ->
      acc <> ~s(#{Atom.to_string(preload)}[]->,)
    end)
  end
end
