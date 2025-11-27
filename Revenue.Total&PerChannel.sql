--what is the total lost revenue? = the total revenue of the returned line item



SELECT
    CASE 
        WHEN Shop >= 100 THEN 'Online'
        ELSE 'Offline'
    END AS Channel,

    COUNT(*) AS TotalLineItems,

    SUM(CASE WHEN Returned = 1 THEN 1 ELSE 0 END) AS ReturnedLineItems,

    ROUND(
        100.0 * SUM(CASE WHEN Returned = 1 THEN 1 ELSE 0 END) 
        / COUNT(*),
        2
    ) AS ReturnRatePercent,

    -- Total revenue generated in this channel
    SUM(RevenueInclVAT) AS TotalRevenue,

    -- Revenue lost due to returns in this channel
    SUM(CASE WHEN Returned = 1 THEN RevenueInclVAT ELSE 0 END) AS LostRevenue,

    -- Lost revenue percent (how much of revenue was returned)
    ROUND(
        100.0 * SUM(CASE WHEN Returned = 1 THEN RevenueInclVAT ELSE 0 END)
        / SUM(RevenueInclVAT),
        2
    ) AS LostRevenuePercent

FROM retours_transactions
GROUP BY Channel;
