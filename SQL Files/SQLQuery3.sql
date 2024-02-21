SELECT 
    Branch,
    Date,
    Time,
    SUM(Total) AS Total_Sales
FROM 
    dbo.Sales
GROUP BY 
    Branch,
    Date,
    Time
ORDER BY 
    Branch,
    Date,
    Time;
