defmodule Lighting.Lights do
  @moduledoc """
  The Lights context.
  """

  import Ecto.Query, warn: false
  alias Lighting.Repo

  alias Lighting.Lights.Bulb

  @doc """
  Returns the list of bulbs.

  ## Examples

      iex> list_bulbs()
      [%Bulb{}, ...]

  """
  def list_bulbs do
    Repo.all(Bulb)
  end

  @doc """
  Gets a single bulb.

  Raises `Ecto.NoResultsError` if the Bulb does not exist.

  ## Examples

      iex> get_bulb!(123)
      %Bulb{}

      iex> get_bulb!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bulb!(id), do: Repo.get!(Bulb, id)

  @doc """
  Creates a bulb.

  ## Examples

      iex> create_bulb(%{field: value})
      {:ok, %Bulb{}}

      iex> create_bulb(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bulb(attrs \\ %{}) do
    %Bulb{}
    |> Bulb.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bulb.

  ## Examples

      iex> update_bulb(bulb, %{field: new_value})
      {:ok, %Bulb{}}

      iex> update_bulb(bulb, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bulb(%Bulb{} = bulb, attrs) do
    bulb
    |> Bulb.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bulb.

  ## Examples

      iex> delete_bulb(bulb)
      {:ok, %Bulb{}}

      iex> delete_bulb(bulb)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bulb(%Bulb{} = bulb) do
    Repo.delete(bulb)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bulb changes.

  ## Examples

      iex> change_bulb(bulb)
      %Ecto.Changeset{data: %Bulb{}}

  """
  def change_bulb(%Bulb{} = bulb, attrs \\ %{}) do
    Bulb.changeset(bulb, attrs)
  end
end
