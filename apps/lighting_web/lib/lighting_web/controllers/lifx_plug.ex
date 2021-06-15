defmodule LightingWeb.LifxPlug do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    assign(conn, :devices, Lighting.Devices.get_devices_state)
  end
end
