defmodule UnlevelAll.Content.Journey do
  @moduledoc """
  Journey resource
  """
  use Ash.Resource,
    data_layer: AshSanity.DataLayer

  sanity do
    type("journey")
    cms(UnlevelAll.CMS)
  end

  actions do
    read :read do
      primary? true
      pagination offset?: true, required?: false, countable: true
    end
  end

  attributes do
    attribute :id, :string do
      writable? false
      primary_key? true
      allow_nil? false
    end

    attribute :title, :string

    attribute :slug, AshSanity.Type.Slug

    attribute :parts, {:array, AshSanity.Type.Reference},
      constraints: [items: [instance_of: UnlevelAll.Content.Part]]

    attribute :interests, {:array, AshSanity.Type.Reference},
      constraints: [items: [instance_of: UnlevelAll.Content.Interest]]

    create_timestamp :created_at
    update_timestamp :updated_at
  end
end
