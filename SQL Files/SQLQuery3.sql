-- This query aggregates sales data by branch, date, and time,
-- calculating the total sales for each combination.
SELECT 
    Branch, -- Selecting the branch information
    Date, -- Selecting the date information
    Time, -- Selecting the time information
    SUM(Total) AS Total_Sales -- Calculating total sales for each combination of branch, date, and time
FROM 
    dbo.Sales -- Accessing the Sales table
GROUP BY 
    Branch, -- Grouping the results by branch
    Date, -- Grouping the results by date
    Time -- Grouping the results by time
ORDER BY 
    Branch, -- Sorting the results by branch
    Date, -- Sorting the results by date
    Time; -- Sorting the results by time

