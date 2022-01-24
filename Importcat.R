library(giscoR)
library(sf)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(scatterpie)

data <- read.csv("~/Downloads/full202052 (1)/full202052.dat")

df = data.frame(Country = data$DECLARANT_ISO, Trade = data$FLOW, Type = substr(data$PRODUCT_BEC, 1, 1), Value = data$VALUE_IN_EUROS)

imports = subset(df, subset = (Type!="X"&Type!="T"&Trade!="2"))

imports = aggregate(Value ~ Type + Country, imports, sum)

imports = pivot_wider(imports, names_from = Type, values_from = Value)

imports = as.data.frame(imports)

names(imports)[2:8] = LETTERS[1:7]

imports$Total = rowSums(imports[2:8])/10000000000

imports$Country[imports$Country=="GB"] = "UK"

imports$Country[imports$Country=="GR"] = "EL"

borders <- gisco_get_countries(
  epsg = "3035",
  year = "2020",
  resolution = "3",
  country = imports$Country
)

merged <- merge(borders,
                imports,
                by.x = "CNTR_ID",
                by.y = "Country",
                all.x = TRUE
)


symbol_pos <- st_centroid(merged, of_largest_polygon = TRUE)

sympos <- symbol_pos %>% 
  st_drop_geometry() %>% 
  as.data.frame() %>% 
  cbind(., symbol_pos %>% st_coordinates()) %>% 
  select(CNTR_ID, X, Y) %>% 
  rename(Country = CNTR_ID, long = X, lat = Y)


merged <- merge(merged,
                sympos,
                by.x = "CNTR_ID",
                by.y = "Country",
                all.x = TRUE
)

ggplot() + 
  geom_sf(data = merged, size = 0.1, fill = "grey") + 
  geom_scatterpie(data = as.data.frame(merged), aes(x = long, y = lat, r = Total*3000), cols = LETTERS[1:7], size = 0.1) + 
  coord_sf(xlim = c(2377294, 6500000), ylim = c(1413597, 5228510)) +
  geom_scatterpie_legend(merged$Total*3000, x=2500000, y=4700000, labeller = function(x) x = ceiling(quantile(sort(merged$Total)))) +
  scale_fill_brewer(
    palette="Set2",
    name = "Import Category",
    labels = c("Food", "Industrial Supplies", "Fuel", "Capital Goods", "Transport Vehicles", "Consumer Goods", "Other"),
    guide = guide_legend(
      direction = "vertical",
      title.position = "top")
  ) +
  theme_void() +
  labs(
    title = "Import Value of EU-28 Countries (2020)",
    subtitle = "In 10 Billions of Euros",
    caption = paste0("Source: Eurostat\nClassification by Broad Economic Categories")
  ) + 
  theme(
    #plot.background = element_rect(fill = "grey99"),
    plot.title = element_text(
      color = "grey30",
      hjust = 0.5,
      vjust = -1,
    ),
    plot.subtitle = element_text(
      color = "grey30",
      hjust = 0.5,
      vjust = -2,
      face = "bold"
    ),
    plot.caption = element_text(
      color = "grey30",
      size = 6,
      hjust = 0.5,
      margin = margin(b = 2, t = 13)
    ),
    legend.text = element_text(
      size = 8.5,
      color = "grey30"
    ),
    legend.title = element_text(
      size = 8.5,
      color = "grey30"
    ),
    legend.position = c(0.85, 0.7)
  )