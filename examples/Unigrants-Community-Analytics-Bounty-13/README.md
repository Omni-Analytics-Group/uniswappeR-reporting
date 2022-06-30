# Unigrants Community Analytics Bounty #13

## Objective

For this bounty we chose to analyze the liquidity provision patterns of Uniswap market makers during the first two weeks after an airdrop.  The 9 airdropped tokens of interest are Uniswap ($UNI), Badger DAO ($BADGER), Tornado Cash ($TORN), ParaSwap ($PSP), MurALL ($PAINT), Mirror Protocol ($MIR), Ethereum Push Notification Service ($PUSH), and Hop Protocol ($HOP).  This analysis will use statistical graphics to compare and contrast trends in liquidity provider behavior across the first two weeks of some of the eco-systems' most popular airdrops.

## Data

Using the `uniswappeR` package, we called the **get_liq_data** function to extract data for each of the 9 tokens across both the v2 and v3 Uniswap pools. Looping through and saving the results, we compiled the `liq_burns.RDS` dataset.  This data is a list of time series dataframes, which each contain 7 columns, and in total comprise 117,524 rows. A preview of the data is shown below:

![A screencap of the Data](data_screencap.png)

## Analysis

From here, we binded together the data around each token to create area plots that track the amount of liquidity added and removed over time.  To follow up, we produced cumulative area plots that show the total amount of liquidity of each. The areas are colored by whether, at the particular time points, the liquidity for each of the nine tokens was positive. Added liquidity is shown in green, while removed liquidity is shown in bed. The overall blue area comprises the total liquidity balance as a function of time.

![The results][AirdropLiq.jpeg]

## Results

## Conclusion

[Rehash eveything quickly] and [include possible extensions of this analysis...ie extend to a longer time frame, include more tokens,  compare liquidity to overall market cap]