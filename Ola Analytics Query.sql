# OLA ANALYTICS QUERIES

Create database Ola;
use Ola;
# 1. Retrieve all successful bookings:
Create View Successfull_Bookings As
Select* 
from Bookings
where Booking_Status = 'Success';

Select * From Successfull_Bookings;

#2. Find the average ride distance for each vehicle type:
Create View ride_distance_for_each_vehicle As
Select Vehicle_type , avg(ride_distance)
From Bookings
group by vehicle_type;

Select * from ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
Create view cancelled_rides_by_customers As
select count(*)
from bookings 
where booking_status = 'Canceled by Customer';

Select * from cancelled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
Create View Top_5_Customer As
SELECT Customer_ID, COUNT(Booking_ID) As total_rides
FROM bookings 
GROUP BY Customer_ID ORDER BY total_rides DESC LIMIT 5;

Select * from top_5_customer;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:

Create View Rides_cancelled_by_Drivers_P_C_Issues As
SELECT COUNT(*) FROM bookings
WHERE canceled_Rides_by_Driver = 'Personal & Car related issue';

Select * from Rides_cancelled_by_Drivers_P_C_Issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

Create View Max_Min_Driver_Rating As
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';

Select* from  Max_Min_Driver_Rating ;

#7. Retrieve all rides where payment was made using UPI:

Create View UPI_Payment As
Select * from bookings 
where Payment_method = 'UPI';

Select * from UPI_Payment;

#8. Find the average customer rating per vehicle type:

Create View AVG_Cust_Rating As
Select  avg(customer_rating) as avg_customer_rating
from bookings
group by Vehicle_type;

Select* from AVG_cust_Rating;

#9. Calculate the total booking value of rides completed successfully:

Create View total_successful_ride_value As
SELECT SUM(Booking_Value) as total_successful_ride_value
FROM bookings
WHERE Booking_Status = 'Success';

Select * from total_successful_ride_value;

#10. List all incomplete rides along with the reason:

Create View Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';

Select* from incomplete_rides_reason;