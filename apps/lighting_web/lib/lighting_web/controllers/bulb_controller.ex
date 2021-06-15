defmodule LightingWeb.BulbController do
  use LightingWeb, :controller

  alias Lighting.Lights
  alias Lighting.Lights.Bulb

  def index(conn, _params) do
    bulbs = Lighting.Devices.get_devices_state()
    render(conn, "index.html", bulbs: bulbs)
  end

  def new(conn, _params) do
    changeset = Lights.change_bulb(%Bulb{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"bulb" => bulb_params}) do
    case Lights.create_bulb(bulb_params) do
      {:ok, bulb} ->
        conn
        |> put_flash(:info, "Bulb created successfully.")
        |> redirect(to: Routes.bulb_path(conn, :show, bulb))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    bulb = Lighting.Devices.get_bulb!(id)
    render(conn, "show.html", bulb: bulb)
  end

  #todo: figure out inputs_for so I can pass set_color a %HSBK{} struct

  def set_color(conn, %{"id" => id, "hexcolor" => hexcolor,"kelvin" => kelvin , "time" => time}) do
    bulb = Lighting.Devices.get_bulb!(id)
    #color = 
    #Lifx.Device.set_color(bulb, color, 3000)
    render(conn, "show.html", bulb: bulb)
  end

  def set_color(conn, 
    %{"id" => id, "hue" => hue, "saturation" => saturation, "brightness" => brightness, "kelvin" => kelvin, "time" => time}) do 
      bulb = Lighting.Devices.get_bulb!(id)
      color = %Lifx.Protocol.HSBK{hue: String.to_integer(hue), saturation: String.to_integer(saturation), brightness: String.to_integer(brightness), kelvin: String.to_integer(kelvin)}
      Lifx.Device.set_color(bulb, color, String.to_integer(time)*1000)
    render(conn, "show.html", bulb: bulb)
  end

  def set_color(conn, %{"id" => id, "hex_color" => hex_color, "kelvin" => kelvin, "time" => time}) do 
    bulb = Lighting.Devices.get_bulb!(id)
    color = %{Lighting.ColorConversion.HSBK.to_hsbk(Chameleon.convert(hex_color, Chameleon.HSV)) | kelvin: String.to_integer(kelvin)}
    Lifx.Device.set_color(bulb, color, String.to_integer(time)*1000)
    render(conn, "show.html", bulb: bulb)
  end

  def set_color(conn, %{"id" => id, "color" => color}) do
    bulb = Lighting.Devices.get_bulb!(id)
    Lifx.Device.set_color(bulb, color, 3000)
    render(conn, "show.html", bulb: bulb)
  end

  def edit(conn, %{"id" => id}) do
    bulb = Lights.get_bulb!(id)
    changeset = Lights.change_bulb(bulb)
    render(conn, "edit.html", bulb: bulb, changeset: changeset)
  end

  def update(conn, %{"id" => id, "bulb" => bulb_params}) do
    bulb = Lights.get_bulb!(id)

    case Lights.update_bulb(bulb, bulb_params) do
      {:ok, bulb} ->
        conn
        |> put_flash(:info, "Bulb updated successfully.")
        |> redirect(to: Routes.bulb_path(conn, :show, bulb))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", bulb: bulb, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    bulb = Lights.get_bulb!(id)
    {:ok, _bulb} = Lights.delete_bulb(bulb)

    conn
    |> put_flash(:info, "Bulb deleted successfully.")
    |> redirect(to: Routes.bulb_path(conn, :index))
  end
end
