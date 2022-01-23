library(haven)
library(ggplot2)
library(sf)
library(giscoR)

data <- read_dta("~/Downloads/full202052/full202052.dta")

# Remove rows with missing values

data = na.omit(data)

# Turn variables declarant and flow into characters so as to make later analysis simpler

data$declarant = as.character(as_factor(data$declarant))

data$flow = as.character(as_factor(data$flow))

# Compute trade balance for each European country

x = aggregate(value_in_euros ~  flow + declarant, data, sum)

x = sapply(split(x, x$declarant), function(x) -diff(x$value_in_euros))

# Change names of GB and GR to UK and EL to make merging by names possible

names(x)[names(x)=="GB"] = "UK"

names(x)[names(x)=="GR"] = "EL"

x = data.frame(code = names(x), value = x)

# Load geographical data

borders <- gisco_get_countries(
  epsg = "3035",
  year = "2020",
  resolution = "3",
  country = x$code
)


merged <- merge(borders,
                x,
                by.x = "CNTR_ID",
                by.y = "code",
                all.x = TRUE
)


ggplot(merged) +
  geom_sf(aes(fill = value/10000000000), color = NA, alpha = 0.9) +
  geom_sf(data = borders, fill = NA, size = 0.1, col = "grey30") +
  coord_sf(
    xlim = c(2377294, 6500000),
    ylim = c(1413597, 5228510)
  ) + scale_fill_gradient2(
    name = "Euros (Billions)",
    guide = guide_legend(
      direction = "horizontal",
      keyheight = 0.5,
      keywidth = 2,
      title.position = "top",
      title.hjust = 0,
      label.hjust = .5,
      nrow = 1,
      byrow = TRUE,
      reverse = FALSE,
      label.position = "bottom"
    )
  ) + theme_void()+
  labs(
    title = "Trade Balance of EU-28 Countries (2020)",
    subtitle = "(Billions of Euros)",
    caption = paste0("Source: Eurostat")) +
  # Theme
  theme(
    plot.background = element_rect(fill = "black"),
    plot.title = element_text(
      color = "grey90",
      hjust = 0.5,
      vjust = -1,
    ),
    plot.subtitle = element_text(
      color = "grey90",
      hjust = 0.5,
      vjust = -2,
      face = "bold"
    ),
    plot.caption = element_text(
      color = "grey90",
      size = 6,
      hjust = 0.5,
      margin = margin(b = 2, t = 13)
    ),
    legend.text = element_text(
      size = 7,
      color = "grey90"
    ),
    legend.title = element_text(
      size = 7,
      color = "grey90"
    ),
    legend.position = c(0.5, 0.02),
  )