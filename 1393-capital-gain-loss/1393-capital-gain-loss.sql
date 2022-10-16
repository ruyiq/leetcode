with buy as (
    SELECT stock_name, SUM(price) as buy
    FROM Stocks
    WHERE operation = "buy"
    GROUP BY stock_name
), sell as (
    SELECT stock_name, SUM(price) as sell
    FROM Stocks
    WHERE operation = "sell"
    GROUP BY stock_name
)

SELECT s.stock_name, s.sell-b.buy AS capital_gain_loss 
FROM buy b
JOIN sell s
    USING (stock_name);