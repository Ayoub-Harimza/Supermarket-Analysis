-- I. Calculate total sales, average sales per day, and number of customers per branch.
WITH branch_sales AS (
    SELECT 
        Branch,
        CONCAT(FORMAT(SUM(Total), '0.00'), ' $') AS Total_Sales,
        CONCAT(FORMAT(AVG(Total), '0.00'), ' $') AS Avg_Sales_Per_Day,
        COUNT(DISTINCT Invoice_id) AS Num_Customers
    FROM 
        dbo.Sales
    GROUP BY 
        Branch
),

-- II. Analyze total quantity sold per product line for each branch.
branch_products AS (
    SELECT 
        Branch,
        Product_Line,
        SUM(Quantity) AS Total_Quantity
    FROM 
        dbo.Sales
    GROUP BY 
        Branch, 
        Product_Line
),

-- III. Analyze number of transactions per payment method for each branch.
branch_payments AS (
    SELECT 
        Branch,
        Payment,
        COUNT(*) AS Num_Transactions
    FROM 
        dbo.Sales
    GROUP BY 
        Branch, 
        Payment
)

-- IV. Combine results to generate a comprehensive analysis of branch performance.
SELECT 
    b.Branch,
    bs.Total_Sales,
    bs.Avg_Sales_Per_Day,
    bs.Num_Customers,
    bp.Product_Line,
    bp.Total_Quantity,
    bpp.Payment,
    bpp.Num_Transactions
FROM 
    (SELECT DISTINCT Branch FROM dbo.Sales) AS b
LEFT JOIN 
    branch_sales AS bs ON b.Branch = bs.Branch
LEFT JOIN 
    branch_products AS bp ON b.Branch = bp.Branch
LEFT JOIN 
    branch_payments AS bpp ON b.Branch = bpp.Branch
ORDER BY 
    b.Branch;


