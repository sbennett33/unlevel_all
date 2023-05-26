defmodule UnlevelAll.Projects do
  @moduledoc false

  import UnlevelAll.Xanity.Query

  alias UnlevelAll.Projects.Project
  alias UnlevelAll.Xanity.CMS

  def get(id) do
    from("task")
    |> preload([:resources, :tags])
    |> CMS.get(id)
    |> Project.new()
  end

  def all() do
    from("task")
    |> preload([:resources, :tags])
    |> order({"_createdAt", :desc})
    |> CMS.all()
    |> Project.new()
  end

  def get_by_slug(slug) do
    from("task")
    |> filter(~s(slug.current == "#{slug}"))
    |> CMS.one()
    |> Project.new()
  end
end
