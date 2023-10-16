defmodule TodoList.ContextNameFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TodoList.ContextName` context.
  """

  @doc """
  Generate a resource_name.
  """
  def resource_name_fixture(attrs \\ %{}) do
    {:ok, resource_name} =
      attrs
      |> Enum.into(%{
        attributes: "some attributes"
      })
      |> TodoList.ContextName.create_resource_name()

    resource_name
  end
end
