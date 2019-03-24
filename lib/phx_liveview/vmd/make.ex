defmodule PhxLiveview.VMD.Make do
  use Ecto.Schema
  import Ecto.Changeset

  schema "makes" do
    field :name, :string
    field :slug, :string

    timestamps()
  end

  @doc false
  def changeset(make, attrs) do
    make
    |> cast(attrs, [:name, :slug])
    |> validate_required([:name, :slug])
  end
end
