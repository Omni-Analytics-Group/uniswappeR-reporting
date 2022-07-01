library(tidyverse)
library(patchwork)

prop <- read_csv("~/Downloads/prop_df.csv")
prop$choices[[24]] <- "Yes, Merge Grants and UNI DAO;No"

prop <- prop %>%
    mutate(choices = strsplit(choices, ";")) %>%
    mutate(scores = strsplit(scores, ";")) %>%
    unnest(c(choices, scores)) %>%
    mutate(scores = as.numeric(scores))

lapply(1:length(unique(prop$id)), function(i) {
    x <- unique(prop$id)[i]
    
    test <- prop %>%
        filter(id == x)
    
    assign(paste0("p", i), envir = .GlobalEnv, ggplot(test, aes(x = choices, y = scores, fill = choices)) +
        geom_col() +
        scale_y_continuous(breaks = scales::pretty_breaks(n = 10),
                           labels = scales::comma) +
        scale_fill_brewer(palette = "Set1") +
        theme(
            legend.position = "off",
            axis.text.x = element_text(angle = 20, hjust = 1)
        ) +
        labs(
            x = "Choice",
            y = "Score",
            title = "Barchart of Voter Choices",
            subtitle = paste0("for Uniswap Proposal: ", test$title[1])
        ))
    
    ggsave(filename = paste0("p", i, ".png"), dpi = 300, width = 6, height = 4)
})

library(magick)

all_ims1 <- image_read(paste0("p", 1:6, ".png"))
im_stack1 <- image_append(all_ims1)

all_ims2 <- image_read(paste0("p", 7:12, ".png"))
im_stack2 <- image_append(all_ims2)

all_ims3 <- image_read(paste0("p", 13:18, ".png"))
im_stack3 <- image_append(all_ims3)

all_ims4 <- image_read(paste0("p", 19:24, ".png"))
im_stack4 <- image_append(all_ims4)

all_ims5 <- image_read(paste0("p", 25:30, ".png"))
im_stack5 <- image_append(all_ims5)

all_ims6 <- image_read(paste0("p", 31:36, ".png"))
im_stack6 <- image_append(all_ims6)

all_ims7 <- image_read(paste0("p", 37:42, ".png"))
im_stack7 <- image_append(all_ims7)

all_ims8 <- image_read(paste0("p", 43:48, ".png"))
im_stack8 <- image_append(all_ims8)

all_ims9 <- image_read(paste0("p", 49:54, ".png"))
im_stack9 <- image_append(all_ims9)

all_ims10 <- image_read(paste0("p", 55:56, ".png"))
im_stack10 <- image_append(all_ims10)

final <- image_append(c(im_stack1, im_stack2, im_stack3, im_stack4, im_stack5,
                        im_stack6, im_stack7, im_stack8, im_stack9, im_stack10),
                      stack = TRUE)

image_write(final, "final_barcharts.png")

ggsave(final, filename = "choices_hist.png", dpi = 300, height = 20 * 5, width = 15 * 5, limitsize = FALSE)
