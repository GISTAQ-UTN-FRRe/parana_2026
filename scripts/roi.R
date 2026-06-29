# paquetes ---------------------------------------------------------------

library(leaflet)
# https://leaflet-extras.github.io/leaflet-providers/preview/

p <- data.frame(
  lon = c(-58.826730, -58.907562),
  lat = c(-27.458547, -27.471268),
  sitio = c("Aguas de Corrientes", "SAMEEP")
) |>
  sf::st_as_sf(coords = c("lon", "lat"), crs = 4326)

roi <- leaflet(data = p) |>
  addPopups(popup = ~sitio) |>
  addTiles(group = "OSM") |>
  addTiles(
    urlTemplate = "https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",
    group = "ESRI"
  ) |>
  leafem::addLogo(
    img = "img/logo_gistaq.png",
    position = "bottomleft",
    width = 152,
    height = 50
  ) |>
  addLayersControl(baseGroups = c("OSM", "ESRI")) |>
  leaflet.extras::addResetMapButton() |>
  leaflet.extras::addFullscreenControl(position = "bottomright")
