library(tidyverse)
library(ggthemes)

gtex_expr_table <- read_tsv("./data/gtex_expr_table_rpkm.txt") %>%
  arrange(sample_type_number) %>%
  filter(sample_type_number != "NA")

tcga_expr_table <- read_tsv("./data/tcga_expr_table_rpkm.txt") %>%
  arrange(sample_type_number)

aaa <- bind_rows(gtex_expr_table, tcga_expr_table) %>%
  arrange(project, sample_type_number)
aaa$sample_type_number <- factor(aaa$sample_type_number, levels = unique(aaa$sample_type_number))

bbb <- read_tsv("./data/AMRgenes.txt", col_names = FALSE)
bbb <- bbb$X1

bbb1 = bbb[bbb%in%colnames(gtex_expr_table) & bbb%in%colnames(tcga_expr_table)]

# save.image("Renvironement.RData")
# saveRDS(aaa, "./data_output/aaa.rds")

for (target_gene in bbb1) {
  ccc <- ggplot(aaa, aes(x = sample_type_number, y = get(target_gene), color = project)) +
    geom_jitter(size = 0.8, width = 0.3, alpha = 0.3, group = aaa$project) +
    geom_boxplot(color = "black", fill = "transparent", size = 0.3, outlier.alpha = 0) +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
    theme(axis.title = element_text(face = "bold", size = 12, color = "black"), 
          axis.text.x = element_text(size = 10, color = "black"), axis.text.y = element_text(size = 10)) +
    coord_cartesian(ylim = c(0, 100)) +
    labs(x ="Tissue type", y = paste(target_gene, "expression level (rpkm)")) + 
    theme(panel.grid.major.x = element_blank()) +
    geom_vline(xintercept = seq(0.5,66,1), lwd = 0.2, color = "grey") +
    scale_color_manual(values = c("green", "red", "black"))
  ggsave(filename = paste0(target_gene, ".pdf"), plot = ccc, device = "pdf", 
         path = "./data/AMRgenes", dpi = "print", width = 28, height = 19, units = "cm")
}


aaa$sample_type_number <- factor(aaa$sample_type_number, 
                                 levels=c("Bladder (n=11)","Bladder Carcinoma (n=414)",
                                          "Blood (n=595)","B-cell lymphoma (DLBCL) (n=48)",
                                          "Brain (n=1409)","Glioblastoma (n=157)","Low grade glioma (n=514)",
                                          "Breast (n=218)","Breast carcinoma (n=1134)",
                                          "Colon (n=376)","Colon adenocarcinoma (n=504)","Rectal adenocarcinoma (n=166)",
                                          "Esophagus (n=788)","Esophageal carcinoma (n=185)","Head&neck carcinoma (n=504)",
                                          "Heart (n=489)",
                                          "Kidney (n=36)", "Adrenocortical carcinoma (n=79)","Cholangiocarcinoma (n=36)",
                                          "Kidney chromophobe tumor (n=66)","Kidney papillary carcinoma (n=290)",
                                          "Kidney renal cell carcinoma (n=543)","Pheochromocytoma paraganglioma (n=181)",
                                          "Liver (n=136)","Liver hepatocellular carcinoma (n=371)",
                                          "Lung (n=374)","Lung adenocarcinoma (n=540)","Lung squamous carcinoma (n=504)",
                                          "Muscle (n=475)","Sarcoma (n=260)",
                                          "Nerve (n=335)",
                                          "Ovary (n=108)","Ovarian carcinoma (n=422)",
                                          "Pancreas (n=197)","Pancreas carcinoma (n=178)",
                                          "Pituitary (n=124)",
                                          "Prostate (n=119)","Prostate adenocarcinoma (n=506)",
                                          "Skin (n=972)","Skin melanoma (n=471)",
                                          "Spleen (n=118)",
                                          "Stomach (n=203)","Stomach adenocarcinoma (n=415)",
                                          "Testis (n=203)","Testicular germ cell tumor (n=156)",
                                          "Thyroid (n=361)","Thyroid carcinoma (n=513)",
                                          "Uterus (n=90)","Cervical carcinoma (n=306)","Uterine carcinosarcoma (n=57)",
                                          "Uterine endometrial carcinoma (n=553)",
                                          "Vagina (n=97)",
                                          "Mesothelioma (n=86)",
                                          "Thymoma (n=120)",
                                          "Uveal melanoma (n=80)" 
                                          ))


for (target_gene in bbb1) {
  ccc <- ggplot(aaa, aes(x = sample_type_number, y = get(target_gene), 
                         color = project)) +
    geom_boxplot(color = "black", fill = "transparent", size = 0.3, outlier.alpha = 0) +
    geom_jitter(height = 0, width = 0.3, alpha = .2, size = .2) +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
    theme(axis.title = element_text(face = "bold", size = 12, color = "black"), 
          axis.text.x = element_text(size = 10, color = "black"), axis.text.y = element_text(size = 10)) +
    coord_cartesian(ylim = c(0, 100)) +
    labs(x ="Tissue type", y = paste(target_gene, "expression level (rpkm)")) + 
    theme(panel.grid.major.x = element_blank()) +
    geom_vline(xintercept = seq(0.5,66,1), lwd = 0.2, color = "grey") +
    scale_color_manual(values = c("green", "red", "black"))
  ggsave(filename = paste0(target_gene, ".pdf"), plot = ccc, device = "pdf", 
         path = "./data/AMRgenes_violin", dpi = "print", width = 28, height = 19, units = "cm")
}

