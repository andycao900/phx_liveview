defmodule PhxLiveview.VMDTest do
  use PhxLiveview.DataCase

  alias PhxLiveview.VMD

  describe "makes" do
    alias PhxLiveview.VMD.Make

    @valid_attrs %{name: "some name", slug: "some slug"}
    @update_attrs %{name: "some updated name", slug: "some updated slug"}
    @invalid_attrs %{name: nil, slug: nil}

    def make_fixture(attrs \\ %{}) do
      {:ok, make} =
        attrs
        |> Enum.into(@valid_attrs)
        |> VMD.create_make()

      make
    end

    test "list_makes/0 returns all makes" do
      make = make_fixture()
      assert VMD.list_makes() == [make]
    end

    test "get_make!/1 returns the make with given id" do
      make = make_fixture()
      assert VMD.get_make!(make.id) == make
    end

    test "create_make/1 with valid data creates a make" do
      assert {:ok, %Make{} = make} = VMD.create_make(@valid_attrs)
      assert make.name == "some name"
      assert make.slug == "some slug"
    end

    test "create_make/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = VMD.create_make(@invalid_attrs)
    end

    test "update_make/2 with valid data updates the make" do
      make = make_fixture()
      assert {:ok, %Make{} = make} = VMD.update_make(make, @update_attrs)
      assert make.name == "some updated name"
      assert make.slug == "some updated slug"
    end

    test "update_make/2 with invalid data returns error changeset" do
      make = make_fixture()
      assert {:error, %Ecto.Changeset{}} = VMD.update_make(make, @invalid_attrs)
      assert make == VMD.get_make!(make.id)
    end

    test "delete_make/1 deletes the make" do
      make = make_fixture()
      assert {:ok, %Make{}} = VMD.delete_make(make)
      assert_raise Ecto.NoResultsError, fn -> VMD.get_make!(make.id) end
    end

    test "change_make/1 returns a make changeset" do
      make = make_fixture()
      assert %Ecto.Changeset{} = VMD.change_make(make)
    end
  end
end
