with data_source as (

    select  
        id,
        url,
        date as message_date,
        source as message_source,
        redirects != 'False' as is_redirected,
        service,
        priority,
        reputation_source,
        reputation_category,
        nullif(true_reputation, 'unknown') as true_reputation,
        service = priority as is_priority,
        page_size_kb,
        load_time_seconds

    from `analytics-392109.nordvpn1.nordvpn`

    where date >= '2020-01-01' -- removing outliers

),

final_reputations as (

    /* 
    Normaly reputation of url is based on the latest scan.
    In case earlier message had priority - it will be the final information.
    Taken priority messages with the latest date.
    */

    select 
        url,
        reputation_category,
        true_reputation,
        reputation_source

    from data_source

    where reputation_category is not null 
      and true_reputation is not null

    qualify row_number() over(win) = 1
    window win as (
        partition by 
            url 
        order by
            is_priority desc, 
            message_date desc
    )

),

final_out as (

    select 
        data_source.id,
        data_source.url,
        data_source.message_date,
        data_source.message_source,
        data_source.is_redirected,
        data_source.service,
        data_source.priority,
        data_source.reputation_source,
        final_reputations.reputation_source as reputation_source_final,
        data_source.reputation_category,
        final_reputations.reputation_category as reputation_category_final,
        data_source.true_reputation,
        final_reputations.true_reputation as true_reputation_final,
        page_size_kb,
        load_time_seconds

    from data_source

    left join final_reputations
      on data_source.url = final_reputations.url

)

select *,
    case
        when true_reputation_final = 'clean'
            then 'good'
        else 'bad'
    end as true_reputation_category
from final_out
