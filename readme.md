Repository for holding NordVPN homework task completed by Dominykas Tvaska

Dashboard can be found here: https://lookerstudio.google.com/reporting/20e2345f-ffa4-4afd-abcf-b9ef1d12d990

## Analysis Focus
### Analysis focused on two things:
1. Reputation of URLs
2. Service Load Times

### For Reputation we were looking into:
1. Source with mismatched reputation regardless of if true reputation was shown as worse or better. This would show how confident we can be in specific source and possible use them for future ML models or other purposes.
2. Services with missing reputation. To understand which of the services are performing the best from data quality point of view.
3. URLs that could be potentially blocked based on % of entries with 'bad' reputation.

### For Load Times we looked into:
1. Which services had the longest load time. Due to different page sizes that have to be loaded we looks specifically at kb loaded per second.
2. Which services handled the most redirects and if that had any impact on the load times.

## Insights
### Reputation
- All 4 sources had very similar reputation mismatch statistics hovering around 56-57%. Of these mismatched repuations split between true reputation being better or worse was around 50-50.
- All 4 sources also had very similar missing reputation statistics at around 10%.
- List of URLs that could be considered for blocking is provided in the dashboard.

### Load TImes
- Service load times where also similar - median load times were around 5.25-5.31 seconds. To take into account different page sizes we also calculated median kb loaded per second. These number were also quite similar with service 4 loading the most (53 kb/sec) and service loading the least (51.95).
- We also analyzed the amount of redirects faced by each service which were around 39.70% - 40.28%
- We also looked into if redirects had any impact on load times, but found no impact.

## Recommendations
- Although all sources have similar reputation mismatches the actual numer of 56-57% seems high and would suggest that further investigation and possibles switch to different sources may be needed. It would also be good to investigate if we can combine reputation data from different sources to get more accurate data as well as less missing data.
- Load times seems similar but this analysis does not really show the true impact of these load times on our systems as well as impact on customer experience. Further analysis is needed for this.
