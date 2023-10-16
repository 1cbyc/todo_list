defmodule TodoList.ContextNameTest do
  use TodoList.DataCase

  alias TodoList.ContextName

  describe "singular_resource_name" do
    alias TodoList.ContextName.ResourceName

    import TodoList.ContextNameFixtures

    @invalid_attrs %{attributes: nil}

    test "list_singular_resource_name/0 returns all singular_resource_name" do
      resource_name = resource_name_fixture()
      assert ContextName.list_singular_resource_name() == [resource_name]
    end

    test "get_resource_name!/1 returns the resource_name with given id" do
      resource_name = resource_name_fixture()
      assert ContextName.get_resource_name!(resource_name.id) == resource_name
    end

    test "create_resource_name/1 with valid data creates a resource_name" do
      valid_attrs = %{attributes: "some attributes"}

      assert {:ok, %ResourceName{} = resource_name} = ContextName.create_resource_name(valid_attrs)
      assert resource_name.attributes == "some attributes"
    end

    test "create_resource_name/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ContextName.create_resource_name(@invalid_attrs)
    end

    test "update_resource_name/2 with valid data updates the resource_name" do
      resource_name = resource_name_fixture()
      update_attrs = %{attributes: "some updated attributes"}

      assert {:ok, %ResourceName{} = resource_name} = ContextName.update_resource_name(resource_name, update_attrs)
      assert resource_name.attributes == "some updated attributes"
    end

    test "update_resource_name/2 with invalid data returns error changeset" do
      resource_name = resource_name_fixture()
      assert {:error, %Ecto.Changeset{}} = ContextName.update_resource_name(resource_name, @invalid_attrs)
      assert resource_name == ContextName.get_resource_name!(resource_name.id)
    end

    test "delete_resource_name/1 deletes the resource_name" do
      resource_name = resource_name_fixture()
      assert {:ok, %ResourceName{}} = ContextName.delete_resource_name(resource_name)
      assert_raise Ecto.NoResultsError, fn -> ContextName.get_resource_name!(resource_name.id) end
    end

    test "change_resource_name/1 returns a resource_name changeset" do
      resource_name = resource_name_fixture()
      assert %Ecto.Changeset{} = ContextName.change_resource_name(resource_name)
    end
  end
end
