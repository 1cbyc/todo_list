defmodule TodoList.ContextName.ResourceName do
  use Ecto.Schema
  import Ecto.Changeset

  schema "singular_resource_name" do
    field :attributes, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(resource_name, attrs) do
    resource_name
    |> cast(attrs, [:attributes])
    |> validate_required([:attributes])
  end
end
