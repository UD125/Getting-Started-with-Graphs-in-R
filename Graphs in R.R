#Getting started with graphs
#3.1 - Working with Gtaphs
attach(mtcars)
plot(wt,mpg)
abline(lm(mpg~wt))
title("Regression of MPG on Weight")
detach(mtcars)
#The first statement attaches the data frame mtcars.

#The second statement opens a graphics window and generates a scatter plot between 
#automobile weight on the horizontal axis and miles per gallon on the vertical axis. 

#The third statement adds a line of best fit. 
#The fourth statement adds a title. 
#The final statement detaches the data frame.

# To save a graph via code, sandwich the statements that produce 
#the graph between a statement that sets
# a destination and a statement that closes that destination. 
#Example Below :-

pdf("mygraph.pdf")
attach(mtcars)
plot(wt,mpg)
abline(lm(mpg~wt))
title("Regression of MPG on Weight")
detach(mtcars)
dev.off()

# In addition to pdf(), you can use the functions win.metafile(), png(), jpeg(),
# bmp(), tiff(), xfig(), and postscript() to save graphs in other formats
jpeg("mygraph.jpg")
attach(mtcars)
plot(wt,mpg)
abline(lm(mpg~wt))
title("Regression of MPG on Weight")
detach(mtcars)
dev.off()

# Saving graphs via the GUI will be platform specific. On a Windows platform, select
# File > Save As from the graphics window, and choose the format and location desired
# in the resulting dialog. On a Mac, choose File > Save As from the menu bar when the
# Quartz graphics window is highlighted. The only output format provided is PDF. On
# a Unix platform, the graphs must be saved via code. In appendix A, we’ll consider
# alternative GUIs for each platform that will give you more options.
# Creating a new graph by issuing a high-level plotting command such as plot(),
# hist() (for histograms), or boxplot() will typically overwrite a previous graph. How
# can you create more than one graph and still have access to each? There are several
# methods.
# First, you can open a new graph window before creating a new graph:
#   dev.new()
# statements to create graph 1
# dev.new()
# statements to create a graph 2
# etc.
# Each new graph will appear in the most recently opened window.
# Second, you can access multiple graphs via the GUI. On a Mac platform, you can
# step through the graphs at any time using Back and Forward on the Quartz menu. On
# a Windows platform, you must use a two-step process. After opening the first graph
# window, choose History > Recording. Then use the Previous and Next menu items to
# step through the graphs that are created.
# Third and finally, you can use the functions dev.new(), dev.next(), dev.prev(),
# dev.set(), and dev.off() to have multiple graph windows open at one time and
# choose which output are sent to which windows. This approach works on any platform.
# See help(dev.cur) for details on this approach.

#-------------------------------------------------------------------------------------------------------#

#3.2 - A simple example
# Table 3.1 Patient response to two drugs at five dosage levels
# Dosage Response to Drug A Response to Drug B
# 20 16 15
# 30 20 18
# 40 27 25
# 45 40 31
# 60 60 40

dose <- c(20,30,40,45,60)
drugA <- c(16,20,27,40,60)
drugB <- c(15,18,25,31,40)

# A simple line graph relating dose to response for drug A can be created using
#plot() is a generic function that plots objects in R.

plot(dose,drugA,type = "b")

#plot(x,y,type = "b")
# places x on the horizontal axis and y on the vertical axis, plots the (x, y) data points, and connects
# them with line segments. The option type="b" indicates that both points and lines
# should be plotted. Use help(plot) to view other options.

#---------------------------------------------------------------------------------------------------------------------------#

#3.3 - Graphical Parameters

# You can customize many features of a graph (fonts, colors, axes, titles) through options
# called graphical parameters

# One way is to specify these options through the par() function. Values set in this
# manner will be in effect for the rest of the session or until they’re changed. The
# format is par(optionname=value, optionname=value, ...). Specifying par()
# without parameters produces a list of the current graphical settings. Adding the
# no.readonly=TRUE option produces a list of current graphical settings that can be
# modified.

# Continuing our example, let’s say that you’d like to use a solid triangle rather than
# an open circle as your plotting symbol, and connect points using a dashed line rather
# than a solid line. You can do so with the following code :

opar <- par(no.readonly = TRUE)
par(lty=2,pch=17)
plot(dose,drugA,type = "b")
par(opar)

# The first statement makes a copy of the current settings. 
#The second statement changes the default line type to dashed (lty=2) and the default symbol for plotting
#points to a solid triangle (pch=17). You then generate the plot and restore the original
#settings. Line types and symbols are covered in section 3.3.1.

# You can have as many par() functions as desired, so par(lty=2, pch=17) could
# also have been written as
par(lty=2)
par(pch=17)

# A second way to specify graphical parameters is by providing the optionname=value
# pairs directly to a high-level plotting function. In this case, the options are only in effect
# for that specific graph. You could’ve generated the same graph with the code.

plot(dose,drugA,type = "b",lty=2,pch=17)

# Not all high-level plotting functions allow you to specify all possible graphical parameters.
# See the help for a specific plotting function (such as ?plot, ?hist, or ?boxplot)
#   to determine which graphical parameters can be set in this way. The remainder of section
# 3.3 describes many of the important graphical parameters that you can set.

#----------------------------------------------------------------------------------------------------#

#3.3.1 - Symbols and Lines

# As you’ve seen, you can use graphical parameters to specify the plotting symbols and
# lines used in your graphs. The relevant parameters are shown below :-

#pch - Specifies the symbol to use when plotting points. pch has 25 options (0-25)

#cex - Specifies the symbol size. cex is a number indicating the amount by which
# plotting symbols should be scaled relative to the default. 1=default, 1.5 is 50%
# larger, 0.5 is 50% smaller, and so forth.

#lty - Specifies the line type. lty has 6 options (1-6) 

#lwd - Specifies the line width. lwd is expressed relative to the default (default=1).
#For example, lwd=2 generates a line twice as wide as the default.

plot(dose,drugA,type = "b",lty=3,lwd=3,pch=15,cex=2)

# would produce a plot with a dotted line that was three times wider than the default
# width, connecting points displayed as filled squares that are twice as large as the default
# symbol size.

#--------------------------------------------------------------------------------------------------------#

#3.3.2 - Colors

#There are several color-related parameters in R. Parameters shown below - 

#col - Default plotting color. Some functions (such as lines and pie) accept a vector
# of values that are recycled. For example, if col=c(“red”, “blue”)and
# three lines are plotted, the first line will be red, the second blue, and the
# third red.

#col.axis - Color for axis text.
#col.lab - Color for axis labels.
#col.main - Color for titles.
#col.sub - Color for subtitles.
#fg - The plot’s foreground color.
#bg - The plot’s background color.

# You can specify colors in R by index, name, hexadecimal, RGB, or HSV. For example,
# col=1, col="white", col="#FFFFFF", col=rgb(1,1,1), and col=hsv(0,0,1) are
# equivalent ways of specifying the color white. The function rgb()creates colors based
# on red-green-blue values, whereas hsv() creates colors based on hue-saturation values.
# See the help feature on these functions for more details.

# The function colors() returns all available color names. Earl F. Glynn has created
# an excellent online chart of R colors, available at http://research.stowers-institute.
# org/efg/R/Color/Chart. R also has a number of functions that can be used to create
# vectors of contiguous colors. These include rainbow(), heat.colors(), terrain.
# colors(), topo.colors(), and cm.colors(). For example, rainbow(10) produces
# 10 contiguous “rainbow" colors. Gray levels are generated with the gray() function. In
# this case, you specify gray levels as a vector of numbers between 0 and 1. gray(0:10/10)
# would produce 10 gray levels. Try the code -

n <- 10
mycolors <- rainbow(n)
pie(rep(1,n),labels = mycolors,col = mycolors)
mygrays <- gray(0:n/n)
pie(rep(1,n),labels = mygrays,col = mygrays)

# to see how this works. You’ll see examples that use color parameters throughout this
# chapter.

#-----------------------------------------------------------------------------------------------------------#

#3.3.3 - Text characterstics

# Graphic parameters are also used to specify text size, font, and style. Parameters controlling
# text size are explained - 

#Parameters specifying text size - 

#cex - Number indicating the amount by which plotted text should be scaled relative
#to the default. 1=default, 1.5 is 50% larger, 0.5 is 50% smaller, etc.

#cex.axis - Magnification of axis text relative to cex.
#cex.lab - Magnification of axis labels relative to cex
#cex.main - Magnification of titles relative to cex
#cex.sub - Magnification of subtitles relative to cex.

#For example, all graphs created after the statement

par(font.lab=3,cex.lab=1.5,font.main=4,cex.main=2)

# will have italic axis labels that are 1.5 times the default text size, and bold italic titles
# that are twice the default text size.

#Parameters specifying font family, size and style.

#font - Integer specifying font to use for plotted text.. 1=plain, 2=bold, 3=italic,
#4=bold italic, 5=symbol

#font.axis - Font for axis text
#font.lab - Font for axis labels.
#font.main - Font for titles.
#font.sub - Font for subtitles.
#ps - Font point size (roughly 1/72 inch).
#The text size = ps*cex.

#family - Font family for drawing text. Standard values are serif, sans, and mono

# Whereas font size and style are easily set, font family is a bit more complicated. This is
# because the mapping of serif, sans, and mono are device dependent. For example, on
# Windows platforms, mono is mapped to TT Courier New, serif is mapped to TT Times
# New Roman, and sans is mapped to TT Arial (TT stands for True Type). If you’re satisfied
# with this mapping, you can use parameters like family="serif" to get the results
# you want. If not, you need to create a new mapping. On Windows, you can create this
# mapping via the windowsFont() function. For example, after issuing the statement
# windowsFonts(
#   A=windowsFont("Arial Black"),
#   B=windowsFont("Bookman Old Style"),
#   C=windowsFont("Comic Sans MS")
# )
# you can use A, B, and C as family values. In this case, par(family="A") will specify an
# Arial Black font. (Listing 3.2 in section 3.4.2 provides an example of modifying text
#                    parameters.) Note that the windowsFont() function only works for Windows. On a
# Mac, use quartzFonts() instead.
# If graphs will be output in PDF or PostScript format, changing the font
# family is relatively straightforward. For PDFs, use names(pdfFonts())to find
# out which fonts are available on your system and pdf(file="myplot.pdf",
#                                                      family="fontname") to generate the plots. For graphs that are output in PostScript
# format, use names(postscriptFonts()) and postscript(file="myplot.ps",
# family="fontname"). See the online help for more information.


#-------------------------------------------------------------------------------------------------------------------------#

#3.3.4 - Graph and Margin Dimensions

#you can control the plot dimensions and margin sizes using the parameters
#listed below - 

#Parameters for graph and margin dimensions

#pin - Plot dimensions (width, height) in inches.

#mai - Numerical vector indicating margin size where c(bottom, left, top, right) is
#expressed in inches.

#mar - Numerical vector indicating margin size where c(bottom, left, top, right) is
#expressed in lines. The default is c(5, 4, 4, 2) + 0.1.

#The code

par(pin=c(4,3),mai=c(1,.5,1,.2))

# produces graphs that are 4 inches wide by 3 inches tall, with a 1-inch margin on the
# bottom and top, a 0.5-inch margin on the left, and a 0.2-inch margin on the right.
# For a complete tutorial on margins, see Earl F. Glynn’s comprehensive online tutorial
# (http://research.stowers-institute.org/efg/R/Graphics/Basics/mar-oma/).

#Let’s use the options we’ve covered so far to enhance our simple example. The code
#in the following listing produces the graphs

dose <- c(20,30,40,45,60)
drugA <- c(16,20,27,40,60)
drugB <- c(15,18,25,31,40)
opar <- par(no.readonly = TRUE)
par(pin=c(2,3))
par(lwd=2,cex=1.5)
par(cex.axis=.75,font.axis=3)
plot(dose,drugA,type = "b",pch=19,lty=2,col="red")
plot(dose,drugB,type = "b",pch=23,lty=6,col="blue",bg="green")
par(opar)

#----------------------------------------------------------------------------------------#

#3.4 - Adding text,customized axis and legends

# Many high-level plotting functions (for example, plot, hist, boxplot) allow you to
# include axis and text options, as well as graphical parameters. For example, the following
# adds a title (main), subtitle (sub), axis labels (xlab, ylab), and axis ranges (xlim,
#     ylim). The results are presented in figure - 

plot(dose,drugA,type = "b",
     col="red",lty=2,pch=2,lwd=2,
     main = "Clinical Trials for Drug A",
     sub = "This is hypothetical data",
     xlab = "Dosage",ylab = "Drug Response",
     xlim = c(0,60),ylim = c(0,70))

# Again, not all functions allow you to add these options. See the help for the function
# of interest to see what options are accepted. For finer control and for modularization,
# you can use the functions described in the remainder of this section to control titles,
# axes, legends, and text annotations.
# NoTe Some high-level plotting functions include default titles and labels. You
# can remove them by adding ann=FALSE in the plot() statement or in a
# separate par() statement.

#--------------------------------------------------------------------------------------------------------#

#3.4.1 - Titles

#Use the title() function to add title and axis labels to a plot. The format is
#title(main="main title", sub="sub-title",
#      xlab="x-axis label", ylab="y-axis label")

# Graphical parameters (such as text size, font, rotation, and color) can also be specified
# in the title() function. For example, the following produces a red title and a blue
# subtitle, and creates green x and y labels that are 25 percent smaller than the default
# text size:
# title(main="My Title", col.main="red",
#       sub="My Sub-title", col.sub="blue",
#       xlab="My X label", ylab="My Y label",
#       col.lab="green", cex.lab=0.75)

#---------------------------------------------------------------------------------------------------------#

#3.4.2 - Axes

# Rather than using R’s default axes, you can create custom axes with the axis() function.
# The format is
# axis(side, at=, labels=, pos=, lty=, col=, las=, tck=, ...)
# where each parameter is described below - 

# Side - An integer indicating the side of the graph to draw the axis
#(1=bottom, 2=left, 3=top, 4=right).

# at - A numeric vector indicating where tick marks should be drawn.

#labels - A character vector of labels to be placed at the tick marks
#(if NULL, the at values will be used).

#pos - The coordinate at which the axis line is to be drawn
#(that is, the value on the other axis where it crosses).

#lty - line type

#col - the line and tick mark color

#las - Labels are parallel (=0) or perpendicular (=2) to the axis.

#tck - Length of tick mark as a fraction of the plotting region (a negative number is
# outside the graph, a positive number is inside, 0 suppresses ticks, 1 creates
# gridlines); the default is –0.01.

#(..) - Other graphical parameters.

#An Example of custom axes

x <- c(1:10) #specify data
y <-x
z <- 10/x

opar <- par(no.readonly = TRUE)

par(mar=c(5,4,4,8)+0.1) #Increase margins #where c(bottom,left,top,right)

plot(x,y,type = "b",pch=21,col="red",yaxt="n",lty=3,ann = FALSE) #Plot x versus y

lines(x,z,type = "b",pch=22,col="blue",lty=2) #Add x versus 1/x or z line

axis(2,at=y,labels = y,col.axis="red",las=2) #Draw your axes

axis(4,at=z,labels = round(z,digits = 2),
     col.axis = "blue",las=2,cex.axis=0.7,tck=-.01)

mtext("z=10/x",side = 4,line = 3,cex.lab=1,las=2,col = "blue") #add titles and add text
?mtext

title("An Example of Creative Axes",xlab = "X values",ylab = "Y=X")
par(opar)

#MiNoR TiCk MARks

# library(Hmisc)
# minor.tick(nx=n,ny=n,tick.ratio=n)

#where nx and ny specify the number of intervals in which to divide the area between
# major tick marks on the x-axis and y-axis, respectively. tick.ratio is the size of the
# minor tick mark relative to the major tick mark. The current length of the major tick
# mark can be retrieved using par("tck"). For example, the following statement will
# add one tick mark between each major tick mark on the x-axis and two tick marks between
# each major tick mark on the y-axis :-

# minor.tick(nx=2, ny=3, tick.ratio=0.5)

# The length of the tick marks will be 50 percent as long as the major tick marks. An
# example of minor tick marks is given in the next section 

#---------------------------------------------------------------------------------------------------------------#

#3.4.3 - Reference Lines

#The abline() function is used to add reference lines to our graph. The format is

#abline(h=yvalues, v=xvalues)

#Other graphical parameters (such as line type, color, and width) can also be specified
#in the abline() function. For example:

#  abline(h=c(1,5,7))

#adds solid horizontal lines at y = 1, 5, and 7

#whereas the code:

#abline(v=seq(1, 10, 2), lty=2, col="blue")

#adds dashed blue vertical lines at x = 1, 3, 5, 7, and 9.

#-----------------------------------------------------------------------------------------------#

#3.4.4 - Legend

# When more than one set of data or group is incorporated into a graph, a legend can
# help you to identify what’s being represented by each bar, pie slice, or line. A legend
# can be added (not surprisingly) with the legend() function. The format is

#legend(location, title, legend, ...)

#The common options are described in table below - 

#location - There are several ways to indicate the location of the legend. You can
# give an x,y coordinate for the upper-left corner of the legend. You can use
# locator(1), in which case you use the mouse to indicate the location of
# the legend. You can also use the keywords bottom, bottomleft, left,
# topleft, top, topright, right, bottomright, or center to place
# the legend in the graph. If you use one of these keywords, you can also use
# inset= to specify an amount to move the legend into the graph (as fraction
#                                                               of plot region).

#title - A character string for the legend title (optional).

#legend - A character vector with the labels.

#(...) - Other options. If the legend labels colored lines, specify col= and a
# vector of colors. If the legend labels point symbols, specify pch= and a
# vector of point symbols. If the legend labels line width or line style, use
# lwd= or lty= and a vector of widths or styles. To create colored boxes for
# the legend (common in bar, box, or pie charts), use fill= and a vector of
# colors.

# Other common legend options include bty for box type, bg for background color, cex
# for size, and text.col for text color. Specifying horiz=TRUE sets the legend horizontally
# rather than vertically. For more on legends, see help(legend). The examples in
# the help file are particularly informative.


##Let's take a look at an example using our drug data. Again you'll use a number of
#features that we have covered up to this point.

dose <- c(20,30,40,45,60)
drugA <- c(16,20,27,40,60)
drugB <- c(15,18,25,31,40)

opar <- par(no.readonly = TRUE)

par(lwd=2,cex=1.5,font.lab=2) #Increase line, text, symbol, label size

plot(dose,drugA,type = "b",
     pch=15,lty=1,col="red",ylim = c(0,60),
     main="Drug A vs Drug B",
     xlab="Drug Dosage",ylab="Drug Response")


lines(dose,drugB,type = "b",
      pch=17,lty=2,col="blue")


abline(h=c(30),lwd=1.5,lty=2,col="grey")

#library(Hmisc)

minor.tick(nx=3,ny=3,tick.ratio = 0.5)

#legend("top",inset=.02,title ="Drug Type",c("A","B"),
#      lty=c(1,2),pch=c(15,17),col=c("red","blue"))

legend("topleft", inset=.05, title="Drug Type", c("A","B"),
       lty=c(1, 2), pch=c(15, 17), col=c("red", "blue"))
par(opar)

#----------------------------------------------------------------------------------#

#3.4.5 - Text Annotations

# Text can be added to graphs using the text() and mtext() functions. text() places
# text within the graph whereas mtext() places text in one of the four margins. The
# formats are
# text(location, "text to place", pos, ...)
# mtext("text to place", side, line=n, ...)

# Common options ar described below ;-

#location - Location can be an x,y coordinate. Alternatively, the text can be placed
#interactively via mouse by specifying location as locator(1).

#pos - Position relative to location. 1 = below, 2 = left, 3 = above, 4 = right. If you
#specify pos, you can specify offset= in percent of character width.

#side - Which margin to place text in, where 1 = bottom, 2 = left, 3 = top, 4 = right.
# You can specify line= to indicate the line in the margin starting with 0 (closest
# to the plot area) and moving out. You can also specify adj=0 for left/bottom
# alignment or adj=1 for top/right alignment.

#Other common options are cex, col, and font (for size, color, and font style,
#respectively).

# The text() function is typically used for labeling points as well as for adding other
# text annotations. Specify location as a set of x, y coordinates and specify the text to
# place as a vector of labels. The x, y, and label vectors should all be the same length. An
# example is given next and the resulting graph is shown in figure :-

attach(mtcars)
plot(wt,mpg,
     main="Mileage vs. Car Weight",
     xlab = "Weight",ylab = "Mileage",
     pch=18,col="blue")

text(wt,mpg,
     row.names(mtcars),
     cex = 0.6,pos = 4,col="red")
detach(mtcars)

# Here we’ve plotted car mileage versus car weight for the 32 automobile makes provided
# in the mtcars data frame. The text() function is used to add the car makes to
# the right of each data point. The point labels are shrunk by 40 percent and presented
# in red

#Second Example, the following code can be used to display font families:

opar <- par(no.readonly = TRUE)
par(cex=1.5)
plot(1:7,1:7,type = "n")
text(3,3,"Example of Default Text")
text(4,4,family="mono","Example of mono-spaced text")
text(5,5,family="serif","Example of serif text")
par(opar)


## Math Annonations

#Finally, you can add mathematical symbols and formulas to a graph using TEX-like rules.
#See help(plotmath)
help("plotmath")

#---------------------------------------------------------------------------------------------------------#

#3.5 - Combining Graphs

#R makes it easy to combine several graphs into one overall graph, using either the
#par() or layout() function.

#Note - At this point, don’t worry about the specific types of
# graphs being combined; our focus here is on the general methods used to combine
# them. The creation and interpretation of each graph type is covered in later chapters

#par() :- 

#With the par() function, you can include the graphical parameter mfrow=c(nrows,
# ncols) to create a matrix of nrows x ncols plots that are filled in by row. Alternatively,
# you can use mfcol=c(nrows, ncols) to fill the matrix by columns.

#Example - The following code creates four plots and arranges them into two rows and two columns

attach(mtcars)
opar <- par(no.readonly = TRUE)
par(mfrow=c(2,2))
plot(wt,mpg,main = "Scatter plot of wt vs. mpg")
plot(wt,disp,main = "Scatter plot of wt vs. disp")
hist(wt,main = "Histogram of wt")
boxplot(wt,main="Boxplot of wt")
par(opar)
detach(mtcars)

#Example 2 - Let's arrange 3 plots in 3 rows and 1 column - 

attach(mtcars)
opar <- par(no.readonly = TRUE)
par(mfrow=c(3,1))
par(ann=FALSE)
hist(wt)
hist(mpg)
hist(disp)
par(opar)
detach(mtcars)

# The graph is displayed in figure 3.15. Note that the high-level function hist()includes
# a default title (use main="" to suppress it, or ann=FALSE to suppress all titles and
#                  labels).


#layout() -

#The layout() function has the form layout(mat) where mat is a matrix object specifying
# the location of the multiple plots to combine. In the following code, one figure
# is placed in row 1 and two figures are placed in row 2:

attach(mtcars)
layout(matrix(c(1,1,2,3),2,2,byrow = TRUE))
hist(wt)
hist(mpg)
hist(disp)
detach(mtcars)

# Optionally, you can include widths= and heights= options in the layout()
# function to control the size of each figure more precisely. These options have the form
# widths = a vector of values for the widths of columns
# heights = a vector of values for the heights of rows
# Relative widths are specified with numeric values. Absolute widths (in centimeters) are
# specified with the lcm() function.

attach(mtcars)
layout(matrix(c(1,1,2,3),2,2,byrow = TRUE),
       widths = c(3,1), heights = c(1,2))

hist(wt)
hist(mpg)
hist(disp)
detach(mtcars)

#Creating a figure arrangement with fine control -

# There are times when you want to arrange or superimpose several figures to create
# a single meaningful plot. Doing so requires fine control over the placement of the
# figures. You can accomplish this with the fig= graphical parameter. In the following
# listing, two box plots are added to a scatter plot to create a single enhanced graph

#Fine placement of Figures in a graph -

#Setup a scatter plot :
opar <- par(no.readonly = TRUE)
par(fig=c(0,0.8,0,0.8))
plot(mtcars$wt,mtcars$mpg,
     xlab = "Miles per Gallon",
     ylab = "Car Weight")

#Add a Boxplot above :
par(fig=c(0,0.8,0.55,1),new=TRUE)
boxplot(mtcars$wt,horizontal = TRUE,axes=FALSE)

#Add a Boxplot to Right :

par(fig=c(0.65,1,0,0.8),new=TRUE)
boxplot(mtcars$mpg,axes=FALSE)

mtext("Enhanced Scatterplot",side = 3,outer = TRUE,line = -3)
par(opar)
