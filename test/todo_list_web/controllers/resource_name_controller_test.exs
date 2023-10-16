defmodule TodoListWeb.ResourceNameControllerTest do
  use TodoListWeb.ConnCase

  import TodoList.ContextNameFixtures

  @create_attrs %{attributes: "some attributes"}
  @update_attrs %{attributes: "some updated attributes"}
  @invalid_attrs %{attributes: nil}

  describe "index" do
    test "lists all singular_resource_name", %{conn: conn} do
      conn = get(conn, ~p"/singular_resource_name")
      assert html_response(conn, 200) =~ "Listing Singular resource name"
    end
  end

  describe "new resource_name" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/singular_resource_name/new")
      assert html_response(conn, 200) =~ "New Resource name"
    end
  end

  describe "create resource_name" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/singular_resource_name", resource_name: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/singular_resource_name/#{id}"

      conn = get(conn, ~p"/singular_resource_name/#{id}")
      assert html_response(conn, 200) =~ "Resource name #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/singular_resource_name", resource_name: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Resource name"
    end
  end

  describe "edit resource_name" do
    setup [:create_resource_name]

    test "renders form for editing chosen resource_name", %{conn: conn, resource_name: resource_name} do
      conn = get(conn, ~p"/singular_resource_name/#{resource_name}/edit")
      assert html_response(conn, 200) =~ "Edit Resource name"
    end
  end

  describe "update resource_name" do
    setup [:create_resource_name]

    test "redirects when data is valid", %{conn: conn, resource_name: resource_name} do
      conn = put(conn, ~p"/singular_resource_name/#{resource_name}", resource_name: @update_attrs)
      assert redirected_to(conn) == ~p"/singular_resource_name/#{resource_name}"

      conn = get(conn, ~p"/singular_resource_name/#{resource_name}")
      assert html_response(conn, 200) =~ "some updated attributes"
    end

    test "renders errors when data is invalid", %{conn: conn, resource_name: resource_name} do
      conn = put(conn, ~p"/singular_resource_name/#{resource_name}", resource_name: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Resource name"
    end
  end

  describe "delete resource_name" do
    setup [:create_resource_name]

    test "deletes chosen resource_name", %{conn: conn, resource_name: resource_name} do
      conn = delete(conn, ~p"/singular_resource_name/#{resource_name}")
      assert redirected_to(conn) == ~p"/singular_resource_name"

      assert_error_sent 404, fn ->
        get(conn, ~p"/singular_resource_name/#{resource_name}")
      end
    end
  end

  defp create_resource_name(_) do
    resource_name = resource_name_fixture()
    %{resource_name: resource_name}
  end
end
