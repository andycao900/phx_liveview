defmodule PhxLiveview.VMD do
  @moduledoc """
  The VMD context.
  """

  import Ecto.Query, warn: false
  alias PhxLiveview.Repo

  alias PhxLiveview.VMD.Make

  @doc """
  Returns the list of makes.

  ## Examples

      iex> list_makes()
      [%Make{}, ...]

  """
  def list_makes do
    Repo.all(Make)
  end

  @doc """
  Gets a single make.

  Raises `Ecto.NoResultsError` if the Make does not exist.

  ## Examples

      iex> get_make!(123)
      %Make{}

      iex> get_make!(456)
      ** (Ecto.NoResultsError)

  """
  def get_make!(id), do: Repo.get!(Make, id)

  @doc """
  Creates a make.

  ## Examples

      iex> create_make(%{field: value})
      {:ok, %Make{}}

      iex> create_make(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_make(attrs \\ %{}) do
    %Make{}
    |> Make.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a make.

  ## Examples

      iex> update_make(make, %{field: new_value})
      {:ok, %Make{}}

      iex> update_make(make, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_make(%Make{} = make, attrs) do
    make
    |> Make.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Make.

  ## Examples

      iex> delete_make(make)
      {:ok, %Make{}}

      iex> delete_make(make)
      {:error, %Ecto.Changeset{}}

  """
  def delete_make(%Make{} = make) do
    Repo.delete(make)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking make changes.

  ## Examples

      iex> change_make(make)
      %Ecto.Changeset{source: %Make{}}

  """
  def change_make(%Make{} = make) do
    Make.changeset(make, %{})
  end
end
