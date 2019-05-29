library(ggplot2) 
library(treemapify)
# proglangs <- read.csv("https://raw.githubusercontent.com/selva86/datasets/master/proglanguages.csv")



ggplot(breakdown, aes(area = Emissions, fill = Category, label = Sector, subgroup=Category)) + 
  geom_treemap(layout = "fixed") + 
  geom_treemap_subgroup_border(layout = "fixed") +
  geom_treemap_subgroup_text(layout = "fixed", place="bottomleft", grow = F, alpha = 0.5, colour =
                               "black", fontface = "italic", min.size = 0) +
  geom_treemap_text(layout = "fixed", colour = "white", place = "centre", grow = F) +
  scale_fill_brewer(palette = "Dark2")
