defmodule LightingWeb.BulbControllerTest do
  use LightingWeb.ConnCase

  alias Lighting.Lights

  @create_attrs %{label: "some label"}
  @update_attrs %{label: "some updated label"}
  @invalid_attrs %{label: nil}

  def fixture(:bulb) do
    {:ok, bulb} = Lights.create_bulb(@create_attrs)
    bulb
  end

  describe "index" do
    test "lists all bulbs", %{conn: conn} do
      conn = get(conn, Routes.bulb_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Bulbs"
    end
  end

  describe "new bulb" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.bulb_path(conn, :new))
      assert html_response(conn, 200) =~ "New Bulb"
    end
  end

  describe "create bulb" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.bulb_path(conn, :create), bulb: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.bulb_path(conn, :show, id)

      conn = get(conn, Routes.bulb_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Bulb"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.bulb_path(conn, :create), bulb: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Bulb"
    end
  end

  describe "edit bulb" do
    setup [:create_bulb]

    test "renders form for editing chosen bulb", %{conn: conn, bulb: bulb} do
      conn = get(conn, Routes.bulb_path(conn, :edit, bulb))
      assert html_response(conn, 200) =~ "Edit Bulb"
    end
  end

  describe "update bulb" do
    setup [:create_bulb]

    test "redirects when data is valid", %{conn: conn, bulb: bulb} do
      conn = put(conn, Routes.bulb_path(conn, :update, bulb), bulb: @update_attrs)
      assert redirected_to(conn) == Routes.bulb_path(conn, :show, bulb)

      conn = get(conn, Routes.bulb_path(conn, :show, bulb))
      assert html_response(conn, 200) =~ "some updated label"
    end

    test "renders errors when data is invalid", %{conn: conn, bulb: bulb} do
      conn = put(conn, Routes.bulb_path(conn, :update, bulb), bulb: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Bulb"
    end
  end

  describe "delete bulb" do
    setup [:create_bulb]

    test "deletes chosen bulb", %{conn: conn, bulb: bulb} do
      conn = delete(conn, Routes.bulb_path(conn, :delete, bulb))
      assert redirected_to(conn) == Routes.bulb_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.bulb_path(conn, :show, bulb))
      end
    end
  end

  defp create_bulb(_) do
    bulb = fixture(:bulb)
    %{bulb: bulb}
  end
end
