defmodule PhxLiveviewWeb.MakeControllerTest do
  use PhxLiveviewWeb.ConnCase

  alias PhxLiveview.VMD

  @create_attrs %{name: "some name", slug: "some slug"}
  @update_attrs %{name: "some updated name", slug: "some updated slug"}
  @invalid_attrs %{name: nil, slug: nil}

  def fixture(:make) do
    {:ok, make} = VMD.create_make(@create_attrs)
    make
  end

  describe "index" do
    test "lists all makes", %{conn: conn} do
      conn = get(conn, Routes.make_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Makes"
    end
  end

  describe "new make" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.make_path(conn, :new))
      assert html_response(conn, 200) =~ "New Make"
    end
  end

  describe "create make" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.make_path(conn, :create), make: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.make_path(conn, :show, id)

      conn = get(conn, Routes.make_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Make"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.make_path(conn, :create), make: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Make"
    end
  end

  describe "edit make" do
    setup [:create_make]

    test "renders form for editing chosen make", %{conn: conn, make: make} do
      conn = get(conn, Routes.make_path(conn, :edit, make))
      assert html_response(conn, 200) =~ "Edit Make"
    end
  end

  describe "update make" do
    setup [:create_make]

    test "redirects when data is valid", %{conn: conn, make: make} do
      conn = put(conn, Routes.make_path(conn, :update, make), make: @update_attrs)
      assert redirected_to(conn) == Routes.make_path(conn, :show, make)

      conn = get(conn, Routes.make_path(conn, :show, make))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, make: make} do
      conn = put(conn, Routes.make_path(conn, :update, make), make: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Make"
    end
  end

  describe "delete make" do
    setup [:create_make]

    test "deletes chosen make", %{conn: conn, make: make} do
      conn = delete(conn, Routes.make_path(conn, :delete, make))
      assert redirected_to(conn) == Routes.make_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.make_path(conn, :show, make))
      end
    end
  end

  defp create_make(_) do
    make = fixture(:make)
    {:ok, make: make}
  end
end
