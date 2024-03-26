# How Much of Your Career is Determined by Where You Start?

## Introduction

Every year an estimated 4.3 million people enter the labor force in the U.S. This project aims to examine the long term impact of variation amongst workers starting firm quality. We will attempt to accomplish this using professional sports league entry drafts as a pseudorandom trial. Gaining a better understanding of this impact will give individuals looking to enter the labor force more information about the returns to activities correlated with firm placement. The activities may include schooling, skill development, and pre professional work experience.

## Data

Our data has been aggregated through the nfl-data-py package, Kaggle datasets, and webscraping of sites such as CapFriendly, Spotrac and Sports-Reference. We will primarily be focused on player draft position, career length and earnings, and control factors such as position. The years of interest for this study are 1980-2022.

## Empirical Strategy

In order to capture the effect of the starting firms performance on long term career results we will utilize a regression discontinuity approach. Our model will plot normalized measures of career outcomes against the position drafted. We are assuming that a player picked at the end of one round is on average nearly identical to the player taken at the beginning of the next round. One will go to the team with the best record in the previous season, while the other goes to the team with the worst record. This allows us to control for most of the unobserved values that would otherwise be present.

In order to control for factors such as team positional need, as well as for the sake of fair comparisons we will be standardizing our outcome variable on a positional basis. For the sake of restricting the scope of our analysis we have made the following assumptions, the relaxing of which is a suitable area for future work:

- Trades involving draft picks are uncorrelated with our observed values. E(T|X,Y)=0
- While team needs may lead to more variance in player ability at adjacent picks, the overall effect will be insignificant.
- Team draft position is a function of the quality of players and staff
- All Teams have equal likelihood of drafting players who underperform/overperform P(db,B |ti) = P(db,B)

We plan to test these assumptions where possible for the sake of thoroughness. Our primary model will exhibit the following structure:
$$ Y=\alpha + rD + \beta _1(X-c) + \beta _2D(X-c) + \epsilon$$
