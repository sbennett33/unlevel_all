defmodule UnlevelAll.Projects.Tag do
  @moduledoc false
  defstruct id: "", title: ""

  def new(attrs) do
    %__MODULE__{
      id: attrs["_id"],
      title: attrs["title"]
    }
  end
end
