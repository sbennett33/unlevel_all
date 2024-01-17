defmodule UnlevelAll.Content.Part do
  @moduledoc """
  Part resource
  """
  use Ash.Resource, data_layer: AshSanity.DataLayer

  sanity do
    type "part"
    cms(UnlevelAll.CMS)
  end

  actions do
    defaults [:read]
  end

  attributes do
    attribute :id, :string do
      writable? false
      primary_key? true
      allow_nil? false
    end

    attribute :title, :string

    attribute :projects, {:array, AshSanity.Type.Reference},
      constraints: [items: [instance_of: UnlevelAll.Content.Project]]
  end
end
