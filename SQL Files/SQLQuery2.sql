-- This query calculates the total sales for each product line within each branch,
-- formatting the result in currency format.
SELECT 
    Branch, -- Selecting the branch information
    Product_Line, -- Selecting the product line information
    CONCAT(FORMAT(SUM(Total), '0.00'), ' $') AS Total_Sales_Per_Product_Line -- Calculating total sales for each product line and formatting it in currency format
FROM 
    dbo.Sales -- Accessing the Sales table
GROUP BY 
    Branch, -- Grouping the results by branch
    Product_Line -- Grouping the results by product line
ORDER BY 
    Branch, -- Sorting the results by branch
    Product_Line; -- Sorting the results by product line
