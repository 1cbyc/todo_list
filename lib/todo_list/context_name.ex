defmodule TodoList.ContextName do
  @moduledoc """
  The ContextName context.
  """

  import Ecto.Query, warn: false
  alias TodoList.Repo

  alias TodoList.ContextName.ResourceName

  @doc """
  Returns the list of singular_resource_name.

  ## Examples

      iex> list_singular_resource_name()
      [%ResourceName{}, ...]

  """
  def list_singular_resource_name do
    Repo.all(ResourceName)
  end

  @doc """
  Gets a single resource_name.

  Raises `Ecto.NoResultsError` if the Resource name does not exist.

  ## Examples

      iex> get_resource_name!(123)
      %ResourceName{}

      iex> get_resource_name!(456)
      ** (Ecto.NoResultsError)

  """
  def get_resource_name!(id), do: Repo.get!(ResourceName, id)

  @doc """
  Creates a resource_name.

  ## Examples

      iex> create_resource_name(%{field: value})
      {:ok, %ResourceName{}}

      iex> create_resource_name(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_resource_name(attrs \\ %{}) do
    %ResourceName{}
    |> ResourceName.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a resource_name.

  ## Examples

      iex> update_resource_name(resource_name, %{field: new_value})
      {:ok, %ResourceName{}}

      iex> update_resource_name(resource_name, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_resource_name(%ResourceName{} = resource_name, attrs) do
    resource_name
    |> ResourceName.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a resource_name.

  ## Examples

      iex> delete_resource_name(resource_name)
      {:ok, %ResourceName{}}

      iex> delete_resource_name(resource_name)
      {:error, %Ecto.Changeset{}}

  """
  def delete_resource_name(%ResourceName{} = resource_name) do
    Repo.delete(resource_name)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking resource_name changes.

  ## Examples

      iex> change_resource_name(resource_name)
      %Ecto.Changeset{data: %ResourceName{}}

  """
  def change_resource_name(%ResourceName{} = resource_name, attrs \\ %{}) do
    ResourceName.changeset(resource_name, attrs)
  end
end
