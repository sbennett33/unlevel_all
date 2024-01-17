defmodule UnlevelAll.Content.Interest do
  @moduledoc """
  Interest resource
  """
  use Ash.Resource,
    data_layer: AshSanity.DataLayer

  sanity do
    type("interest")
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

    create_timestamp :created_at
    update_timestamp :updated_at
  end
end
