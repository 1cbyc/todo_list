defmodule TodoListWeb.ResourceNameController do
  use TodoListWeb, :controller

  alias TodoList.ContextName
  alias TodoList.ContextName.ResourceName

  def index(conn, _params) do
    singular_resource_name = ContextName.list_singular_resource_name()
    render(conn, :index, singular_resource_name: singular_resource_name)
  end

  def new(conn, _params) do
    changeset = ContextName.change_resource_name(%ResourceName{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"resource_name" => resource_name_params}) do
    case ContextName.create_resource_name(resource_name_params) do
      {:ok, resource_name} ->
        conn
        |> put_flash(:info, "Resource name created successfully.")
        |> redirect(to: ~p"/singular_resource_name/#{resource_name}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    resource_name = ContextName.get_resource_name!(id)
    render(conn, :show, resource_name: resource_name)
  end

  def edit(conn, %{"id" => id}) do
    resource_name = ContextName.get_resource_name!(id)
    changeset = ContextName.change_resource_name(resource_name)
    render(conn, :edit, resource_name: resource_name, changeset: changeset)
  end

  def update(conn, %{"id" => id, "resource_name" => resource_name_params}) do
    resource_name = ContextName.get_resource_name!(id)

    case ContextName.update_resource_name(resource_name, resource_name_params) do
      {:ok, resource_name} ->
        conn
        |> put_flash(:info, "Resource name updated successfully.")
        |> redirect(to: ~p"/singular_resource_name/#{resource_name}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, resource_name: resource_name, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    resource_name = ContextName.get_resource_name!(id)
    {:ok, _resource_name} = ContextName.delete_resource_name(resource_name)

    conn
    |> put_flash(:info, "Resource name deleted successfully.")
    |> redirect(to: ~p"/singular_resource_name")
  end
end
