defmodule UnlevelAll.Projects do
  @moduledoc false

  import UnlevelAll.Xanity.Query

  alias UnlevelAll.Projects.Project
  alias UnlevelAll.Xanity.CMS

  def get(id) do
    from("task")
    |> select(["description"])
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

  def get_two_most_recent() do
    from("task")
    |> select(["_id", "description"])
    |> order({"_createdAt", :desc})
    |> slice("0..1")
    |> CMS.all()
    |> Project.new()
  end
end
