defmodule PhxLiveviewWeb.MakeController do
  use PhxLiveviewWeb, :controller

  alias PhxLiveview.VMD
  alias PhxLiveview.VMD.Make

  alias Phoenix.LiveView

  def index(conn, _params) do
    makes = VMD.list_makes()
    render(conn, "index.html", makes: makes)
  end

  def new(conn, params) do
    changeset = VMD.change_make(%Make{})
    # IO.inspect(params)
    LiveView.Controller.live_render(conn, PhxLiveviewWeb.MakeLive.New, session: %{})
  end

  def create(conn, %{"make" => make_params}) do
    case VMD.create_make(make_params) do
      {:ok, make} ->
        conn
        |> put_flash(:info, "Make created successfully.")
        |> redirect(to: Routes.make_path(conn, :show, make))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    make = VMD.get_make!(id)
    render(conn, "show.html", make: make)
  end

  def edit(conn, %{"id" => id}) do
    make = VMD.get_make!(id)
    changeset = VMD.change_make(make)
    render(conn, "edit.html", make: make, changeset: changeset)
  end

  def update(conn, %{"id" => id, "make" => make_params}) do
    make = VMD.get_make!(id)

    case VMD.update_make(make, make_params) do
      {:ok, make} ->
        conn
        |> put_flash(:info, "Make updated successfully.")
        |> redirect(to: Routes.make_path(conn, :show, make))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", make: make, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    make = VMD.get_make!(id)
    {:ok, _make} = VMD.delete_make(make)

    conn
    |> put_flash(:info, "Make deleted successfully.")
    |> redirect(to: Routes.make_path(conn, :index))
  end
end
