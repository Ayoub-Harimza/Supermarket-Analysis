SELECT 
    Branch,
    Product_Line,
    CONCAT(FORMAT(SUM(Total), '0.00'), ' $') AS Total_Sales_Per_Product_Line
FROM 
    dbo.Sales
GROUP BY 
    Branch,
    Product_Line
ORDER BY 
    Branch,
    Product_Line;