defmodule TodoList.Repo.Migrations.CreateSingularResourceName do
  use Ecto.Migration

  def change do
    create table(:singular_resource_name) do
      add :attributes, :string

      timestamps(type: :utc_datetime)
    end
  end
end
