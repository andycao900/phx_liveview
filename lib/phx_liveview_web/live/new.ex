defmodule PhxLiveviewWeb.MakeLive.New do
  use Phoenix.LiveView

  alias PhxLiveviewWeb.Router.Helpers, as: Routes
  alias PhxLiveviewWeb.MakeLive
  # alias PhxLiveview.Router.Helpers, as: Routes
  alias PhxLiveview.VMD.Make
  alias PhxLiveview.VMD

  def mount(_session, socket) do
    {:ok,
     assign(socket, %{
       count: 0,
       # Accounts.change_user(%User{})
       changeset: Make.changeset(%Make{}, %{})
     })}
  end

  def render(assigns) do
    IO.inspect(assigns)
    PhxLiveviewWeb.MakeView.render("new.html", assigns)
  end

  def handle_event("validate", %{"make" => params}, socket) do
    params =
      case params do
        %{"name" => name} when name not in ["", nil] ->
          %{params | "slug" => name |> String.downcase() |> String.replace(" ", "_")}

        params ->
          params
      end

    changeset = %Make{} |> Make.changeset(params) |> Map.put(:action, :insert)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("save", %{"make" => params}, socket) do
    case VMD.create_make(params) do
      {:ok, make} ->
        {:stop,
         socket
         |> put_flash(:info, "make created")
         |> redirect(to: Routes.make_path(socket, :show, make))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  #   case VMD.create_make(params) do
  #     {:ok, make} ->
  #       {:stop,
  #        socket
  #        |> put_flash(:info, "make created")
  #        |> Phoenix.Controller.redirect(to: Routes.make_path(socket, :show, make))}

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       {:noreply, assign(socket, changeset: changeset)}
  #   end
  # end
end
