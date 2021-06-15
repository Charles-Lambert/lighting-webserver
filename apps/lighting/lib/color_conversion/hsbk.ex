defmodule Lighting.ColorConversion.HSBK do
  alias Lifx.Protocol.HSBK
  alias Chameleon.HSV


  defimpl Chameleon.Color.HSV do
    def from(hsbk), do: Lighting.ColorConversion.HSBK.to_hsv(hsbk)
  end

  #defimpl Lighting.ColorConversion.HSBK do
  #  def from(hsv), do: Lighting.ColorConversion.HSBK.to_hsbk(hsv)
  #end

  def to_hsv(hsbk) do
    %HSV{h: hsbk.hue, s: hsbk.saturation, v: hsbk.brightness}
  end

  def to_hsbk(hsv) do
    %HSBK{hue: hsv.h, saturation: hsv.s, brightness: hsv.v}
  end

end

