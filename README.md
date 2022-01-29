# R analysis and visualization of trade data of 28 European countries

In this project, the main task is to analyze and visualize a data set containing details of commerce activity of 28 European countries for the year 2020, and it includes for each country variables such as trade partner, category of trade partner (Internal for other European countries and External for non-European countries), type of flow (export or import), category of traded good (based on several classifications, such as the standard international trade classification, broad economic categories, statistical classification of products by activity, and the nomenclature of goods), value in euros, and quantity in kilograms.

## The trade balance in 28 European countries

The first question one analyzing the data set would be interested to answer is how are European countries faring in terms of trade? Which countries have a trade surplus (export more than they import), and which countries have a trade deficit (import more than they export), how much is their balance, and how do they compare with each other?

To answer this question we decided to rely solely on the capabilities of the statistical programming language R, due to its superior capabilities in terms of data wrangling, data analysis, and data visualization.

The script file `Tradebalance.R` creates the map below, which shows the trade balance for the 28 European countries. 

![Tradebalance](https://user-images.githubusercontent.com/22676439/151670240-17c49865-b877-41d1-b795-1d4593e1de37.png)

From the map above, and from the R script, we can see that among the 28 countries, 13 have a positive trade balance, namely, Germany, Ireland, Netherlands, Italy, Belgium, Czech Republic, Poland, Denmark, Sweden, Hungary, Slovenia and Slovakia, with Germany having the largest trade surplus with about 367 billion euros, whereas 15 countries have a negative trade balance, namely France, Romania, Greece, Spain, the United Kingdom, Portugal, Croatia, Luxembourg, Cyprus, Bulgaria, Austria, Malta, Finland, Latvia, Estonia, and Lithuania, with France having the largest trade deficit with 162 billion euros.

## The European trade balance vis-a-vis the rest of the world

The script file `Worldtradebalance.R` creates another map, shown below, which shows the trade balance of the 28 European countries as a whole towards the rest of the world.

![Worldtradebalance](https://user-images.githubusercontent.com/22676439/151671724-88f5ab2a-e055-4a2a-8421-e37ae5c75c57.png)

From the map above, and from the R script, we can see that the ten countries that have the highest trade surplus with Europe are the following, China (373 billion euros), Vietnam (52 billion euros), Malaysia (28 billion euros), Russia (25 billion euros), Bangladesh (23 billion euros), Thailand (13 billion euros), Kazakhstan (13 billion euros), India (12 billion euros), Azerbaijan (9 billion euros), and Nigeria (8 billion euros), whereas Europe has a trade surplus towards the following countries; The United States (294 billion euros), Switzerland (65 billion euros), Australia (44 billion euros), The United Arab Emirates (35 billion euros), Hong Kong (32 billion euros), Canada (23 billion euros), Egypt (23 billion euros), Mexico (19 billion euros), Saudi Arabia (18 billion euros), and Singapore (16 billion euros).
