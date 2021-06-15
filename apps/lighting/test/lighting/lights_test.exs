defmodule Lighting.LightsTest do
  use Lighting.DataCase

  alias Lighting.Lights

  describe "bulbs" do
    alias Lighting.Lights.Bulb

    @valid_attrs %{label: "some label"}
    @update_attrs %{label: "some updated label"}
    @invalid_attrs %{label: nil}

    def bulb_fixture(attrs \\ %{}) do
      {:ok, bulb} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Lights.create_bulb()

      bulb
    end

    test "list_bulbs/0 returns all bulbs" do
      bulb = bulb_fixture()
      assert Lights.list_bulbs() == [bulb]
    end

    test "get_bulb!/1 returns the bulb with given id" do
      bulb = bulb_fixture()
      assert Lights.get_bulb!(bulb.id) == bulb
    end

    test "create_bulb/1 with valid data creates a bulb" do
      assert {:ok, %Bulb{} = bulb} = Lights.create_bulb(@valid_attrs)
      assert bulb.label == "some label"
    end

    test "create_bulb/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lights.create_bulb(@invalid_attrs)
    end

    test "update_bulb/2 with valid data updates the bulb" do
      bulb = bulb_fixture()
      assert {:ok, %Bulb{} = bulb} = Lights.update_bulb(bulb, @update_attrs)
      assert bulb.label == "some updated label"
    end

    test "update_bulb/2 with invalid data returns error changeset" do
      bulb = bulb_fixture()
      assert {:error, %Ecto.Changeset{}} = Lights.update_bulb(bulb, @invalid_attrs)
      assert bulb == Lights.get_bulb!(bulb.id)
    end

    test "delete_bulb/1 deletes the bulb" do
      bulb = bulb_fixture()
      assert {:ok, %Bulb{}} = Lights.delete_bulb(bulb)
      assert_raise Ecto.NoResultsError, fn -> Lights.get_bulb!(bulb.id) end
    end

    test "change_bulb/1 returns a bulb changeset" do
      bulb = bulb_fixture()
      assert %Ecto.Changeset{} = Lights.change_bulb(bulb)
    end
  end
end
