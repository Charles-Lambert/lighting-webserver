defmodule Lighting.Lights.Bulb do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bulbs" do
    field :label, :string

    timestamps()
  end

  @doc false
  def changeset(bulb, attrs) do
    bulb
    |> cast(attrs, [:label])
    |> validate_required([:label])
  end
end
