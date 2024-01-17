defmodule UnlevelAll.Content.Project do
  @moduledoc """
  Journey resource
  """
  use Ash.Resource,
    data_layer: AshSanity.DataLayer

  sanity do
    type("task")
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

    attribute :slug, AshSanity.Type.Slug

    attribute :interests, {:array, AshSanity.Type.Reference},
      constraints: [items: [instance_of: UnlevelAll.Content.Interest]]

    create_timestamp :created_at
    update_timestamp :updated_at
  end
end
