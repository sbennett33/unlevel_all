defmodule UnlevelAllWeb.ContentEntityLive do
  use UnlevelAllWeb, :live_view

  def mount(_params, _session, socket) do
    # project =
    #   UnlevelAll.Content.Resources.Project
    #   |> Ash.Query.filter(id == "1234")
    #   |> UnlevelAll.Content.read!()

    # IO.inspect(ce)

    # socket = assign(socket, :project, project)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <!-- <h1 class="text-lg font-bold mb-4"><%= @project.title %></h1>
    <h1 class="text-lg font-bold mb-4"><%= @project.title %></h1> -->
    """
  end
end
