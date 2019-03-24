defmodule PhxLiveviewWeb.PageController do
  use PhxLiveviewWeb, :controller

  alias Phoenix.LiveView

  def index(conn, _params) do
    LiveView.Controller.live_render(conn, PhxLiveviewWeb.GithubDeployView, session: %{})
  end
end
