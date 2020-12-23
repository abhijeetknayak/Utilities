## Country Data analysis
* All the data for this project was downloaded from [here](https://ourworldindata.org/health-meta) 
* Analysis tasks completed on the **[Child mortality rates](https://github.com/abhijeetknayak/Utilities/blob/master/Data-Science/Country-Data/child_mortality_analysis.ipynb)**:
  * Highest and lowest child mortality rates in the years 1990 and 2016
  * Plot the child moratlity rates on a map of the world using Choropleths
  * Plot the change in child mortality rates in the world on a map using a time slider choropleth
* Analysis tasks completed on [heathcare expenditure](https://github.com/abhijeetknayak/Utilities/blob/master/Data-Science/Country-Data/health-expenditure.ipynb):
  * Plot countries which have a health expenditure less than 5% of their GDP
  * Plot top 40 countries which have highest health expenditure
  * Make these plots interactive, so that you can check the values for each country individually
  * __Compare values of Child mortality and health expenditure percentage. Try to correlate these values__
  <img src="https://github.com/abhijeetknayak/Utilities/blob/master/Data-Science/Country-Data/health_expenditure-vs-Child_mortality.png" /> <br>
  As shown, most of these countries have the same correlation between child mortality and health expenditure. There are a few exceptions though, for example:
    * AFG: High Child mortality in-spite of having a higher health expenditure compared to other countries. Maybe because of the war
    * BRN: Brunei has same child mortality as Bulgaria (BGR), but the expenditure is much lesser. Maybe populations are not comparable
  * __Comparison of health expenditure and life expectancy values in countries.__
  <img src="https://github.com/abhijeetknayak/Utilities/blob/master/Data-Science/Country-Data/health_expenditure-vs-Life-Expectancy.png" /> <br>
  As seen in this plot, when we see a peak in the life expectancy, a peak in expenditure follows. There are expections though:
    * BGD: Spends more than Barbados(BRB), but has a lower life expectancy
    * BRN: Brunei spends very less on its healthcare, but still has a high life expectancy
  #### To better visualize this, we sort values for the expenditure variable and check if the two plots have similar slopes
  <img src="https://github.com/abhijeetknayak/Utilities/blob/master/Data-Science/Country-Data/expenditure-per-capita-vs-Life-Expectancy.png" /> <br>
  Lots of noise, but the general trend seems to be a negative slope. Thus, in general, we can say that these variables are directly proportional, that is, more the country spend on healthcare, higher the life expectancy is
  * __Find data specific to continents__:
    | Continent | Africa | Asia | Europe | North America | Oceania | South America | 
    | :---: |---| :--- | :--- | --- | --- | --- |     
    | Population | 2.244373e+07 | 1.003086e+08 | 1.860300e+07 | 3.419750e+07 | 6.112333e+06 | 3.336125e+07 |
    | Expenditure per Capita ($) | 275.772333 | 851.951843 | 2579.574653 | 1596.642623 | 1420.947586 | 916.956939 |
    | Total Expenditure (Billion $) | 5.740888 | 53.955739 | 49.487595 | 193.816072 | 18.830034 | 35.892258 |
    | Expectancy (Years) | 60.176646 | 72.173260 | 77.739869 | 74.345748 | 73.067573 | 73.354333 |         
    | GDP | 1.251546e+05 | 1.290298e+06 | 6.167413e+05 | 1.460748e+06 | 2.336858e+05 | 5.314008e+05 |  
    Africa has the least per capita expenditure, and hence, the least life expectancy
