defmodule Lighting.Devices do
  
  def get_devices_state do
    devices = Lifx.Client.devices()
    devices |> Enum.map(fn device ->
      {:ok, color} = Lifx.Device.get_color(device)
      Map.put(device, :color, color) end)
  end

  def get_bulb!(id_value) do
    IO.puts(id_value)
    get_devices_state |> IO.inspect |> Enum.find(fn %{id: id_value} -> true
                                                      _ -> false  end)
                                                      |> IO.inspect
  end
end


