defmodule UnlevelAll.Content do
  @moduledoc false
  use Ash.Api

  resources do
    resource UnlevelAll.Content.Journey
    resource UnlevelAll.Content.Interest
    resource UnlevelAll.Content.Part
    resource UnlevelAll.Content.Project
  end
end
