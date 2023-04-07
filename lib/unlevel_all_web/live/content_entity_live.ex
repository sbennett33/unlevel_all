defmodule UnlevelAllWeb.ContentEntityLive do
  use UnlevelAllWeb, :live_view

  def mount(_params, _session, socket) do
    ce = UnlevelAll.ContentEntities.get("2d690fc2-f5bb-410c-ae7b-2bf8ea723a4e")

    # IO.inspect(ce)

    socket = assign(socket, :ce, ce)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <h1 class="text-lg font-bold mb-4"><%= @ce.title %></h1>
    <article class="prose">
      <Sanity.Components.PortableText.portable_text value={@ce.content} />
    </article>
    """
  end
end
