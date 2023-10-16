defmodule TodoListWeb.ResourceNameHTML do
  use TodoListWeb, :html

  embed_templates "resource_name_html/*"

  @doc """
  Renders a resource_name form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def resource_name_form(assigns)
end
