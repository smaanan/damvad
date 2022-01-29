# R analysis and visualization of trade data of 28 European countries

In this project, the main task is to analyze and visualize a data set containing details of commerce activity of 28 European countries for the year 2020, and it includes for each country variables such as trade partner, category of trade partner (Internal for other European countries and External for non-European countries), type of flow (export or import), category of traded good (based on several classifications, such as the standard international trade classification, broad economic categories, statistical classification of products by activity, and the nomenclature of goods), value in euros, and quantity in kilograms.

The first question one analyzing the data set would be interested to answer is how are European countries faring in terms of trade? Which countries have a trade surplus (export more than they import), and which countries have a trade deficit (import more than they export), how much is their balance, and how do they compare with each other?

To answer this question we decided to rely solely on the capabilities of the statistical programming language R, due to its superior capabilities in terms of data wrangling, data analysis, and data visualization.

The script file `Tradebalance.R` creates the map below, which shows the trade balance for the 28 European countries. 

/home/maanan/DAMVAD/damvad/Tradebalance.png

From the map above, and from the R script, we can see that among the 28 countries, 13 have a positive trade balance, namely, Germany, Ireland, Netherlands, Italy, Belgium, Czech Republic, Poland, Denmark, Sweden, Hungary, Slovenia and Slovakia, with Germany having the largest trade surplus with about 367 billion euros, whereas 15 countries have a negative trade balance, namely France, Romania, Greece, Spain, the United Kingdom, Portugal, Croatia, Luxembourg, Cyprus, Bulgaria, Austria, Malta, Finland, Latvia, Estonia, and Lithuania, with France having the largest trade deficit with 162 billion euros.
