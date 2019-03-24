defmodule PhxLiveview.Repo.Migrations.CreateMakes do
  use Ecto.Migration

  def change do
    create table(:makes) do
      add :name, :string
      add :slug, :string

      timestamps()
    end

  end
end
