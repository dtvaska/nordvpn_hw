Repository for holding NordVPN homework task completed by Dominykas Tvaska

Dashboard can be found here: https://lookerstudio.google.com/reporting/20e2345f-ffa4-4afd-abcf-b9ef1d12d990

###Analysis focused on two things:
1. Reputation of URLs
2. Service Load Times

###For Reputation we were looking into:
1. Source with mismatched reputation regardless of if true reputation was shown as worse or better. This would show how confident we can be in specific source and possible use them for future ML models or other purposes.
2. Services with missing reputation. To understand which of the services are performing the best from data quality point of view.
3. URLs that could be potentially blocked based on % of entries with 'bad' reputation.

###For Load Times we looked into:
1. Which services had the longest load time. Due to different page sizes that have to be loaded we looks specifically at kb loaded per second.
2. Which services handled the most redirects and if that had any impact on the load times.

