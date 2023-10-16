defmodule TodoList.TodoList.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TodoList.TodoList.Todos` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> TodoList.TodoList.Todos.create_todo()

    todo
  end
end
