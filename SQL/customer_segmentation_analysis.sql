-- Top 10 highest spending customers
SELECT customer_id, customer_segments.monetary
FROM customer_segments
ORDER BY customer_segments.monetary DESC
LIMIT 10;

-- Segment-wise customer count
SELECT "Segment", COUNT(*) as customer_count
FROM customer_segments
GROUP BY "Segment";

-- Mall-wise revenue
SELECT shopping_mall, SUM(quantity * price) as total_revenue
FROM transactions
GROUP BY shopping_mall
ORDER BY total_revenue DESC;

-- Category-wise revenue by segment (JOIN)
SELECT cs."Segment", t.category, SUM(t.quantity * t.price) as revenue
FROM transactions t
JOIN customer_segments cs ON t.customer_id = cs.customer_id
GROUP BY cs."Segment", t.category
ORDER BY revenue DESC;

-- Customers whose spending is above the average spending of all customers
SELECT customer_id, segment, monetary
FROM customer_segments
WHERE monetary > (SELECT AVG(monetary) FROM customer_segments)
ORDER BY monetary DESC;

-- Segments with more than 30000 customers 
SELECT segment, COUNT(*) as customer_count
FROM customer_segments
GROUP BY segment
HAVING COUNT(*) > 30000;