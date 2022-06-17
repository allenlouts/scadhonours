library(pixmap)
library(gplots)
library(wavethresh)
library(jpeg)
library(methods)
library(vegan)
library(MASS)
library(shapeR)
library(writexl)

getwd()

shape = shapeR("C:/Users/145411/Desktop/otolith_shape_validation/test2", "scaddata2.csv")
shape = detect.outline(shape, threshold = 0.1, write.outline.w.org = TRUE)
shape = generateShapeCoefficients(shape)
shape = enrich.master.list(shape)

plotFourierShape(shape, "pop", show.angle = TRUE, lwd = 2, lty = 1)

options(max.print = 99999)

fourier_coefficients <- getFourier(shape)

fourier_coefficients_table <- data.frame(fourier_coefficients)

write_xlsx(fourier_coefficients_table, "C:/Users/145411/Desktop/otolith_shape_validation/test2/fourier_coefficients_test2.xlsx")

est.list = estimate.outline.reconstruction(shape)
outline.reconstruction.plot(est.list, max.num.harmonics = 15)

getMeasurements(shape)

shape = stdCoefs(shape, classes = "pop", "length_cm", bonferroni = FALSE)

getFourier(shape)
