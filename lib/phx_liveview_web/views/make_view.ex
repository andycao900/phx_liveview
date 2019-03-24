defmodule PhxLiveviewWeb.MakeView do
  use PhxLiveviewWeb, :view

  alias PhxLiveviewWeb.MakeLive
  # alias PhxLiveviewWeb.MakeLive

  def populate_new_form_assigns(conn, assigns) do
    assigns
    |> Map.put(:action, Routes.make_path(conn, :create))
    |> Map.put(:method, :post)
  end
end
