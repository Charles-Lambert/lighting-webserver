defmodule LightingWeb.BulbView do
  alias Lifx.Protocol.HSBK
  use LightingWeb, :view

  def color_tag(color, tag, content) do
    text_color = if color.brightness > 60, do: "black;", else: "white;"
    background="background-color:hsl(" <> 
      to_string(color.hue) <> ", " <> 
      to_string(color.saturation) <> "%, " <> 
      to_string(color.brightness) <> "%);"
    content_tag(tag, content, style: background <> "color:" <> text_color)
  end  

  def color_to_string(color) do
    
  end
end
