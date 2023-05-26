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
    |> CMS.all()
    |> Project.new()
  end
end
