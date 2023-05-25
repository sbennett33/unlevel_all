defmodule UnlevelAll.Projects.Resource do
  @moduledoc false
  defstruct id: "", description: []

  def new(attrs) do
    %__MODULE__{
      id: attrs["_id"],
      description: attrs["description"]
    }
  end
end
