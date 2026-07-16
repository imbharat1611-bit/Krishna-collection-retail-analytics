import pandas as pd
import random
from datetime import datetime, timedelta
from config import PAYMENT_MODES, EMPLOYEES, DISCOUNTS

# Load datasets
products = pd.read_csv("DATA/generated/products.csv")
customers = pd.read_csv("DATA/generated/customers.csv")

sales = []

start_date = datetime(2025,1,1)

for i in range(1,12001):

    product = products.sample(1).iloc[0]
    customer = customers.sample(1).iloc[0]

    quantity = random.randint(1,3)

    discount = random.choice(DISCOUNTS)

    payment = random.choices(
        PAYMENT_MODES,
        weights=[60,20,10,10]
    )[0]

    date = start_date + timedelta(days=random.randint(0,364))

    revenue = quantity * product["Selling_Price"]

    revenue_after_discount = revenue*(1-discount/100)

    cost = quantity*product["Cost_Price"]

    profit = revenue_after_discount-cost

    sales.append({

        "Invoice_ID":f"INV{i:05}",

        "Date":date.strftime("%Y-%m-%d"),

        "Customer_ID":customer["Customer_ID"],

        "Product_ID":product["Product_ID"],

        "Employee_ID":random.choice(EMPLOYEES),

        "Quantity":quantity,

        "Payment_Mode":payment,

        "Discount_%":discount,

        "Revenue":round(revenue_after_discount,2),

        "Profit":round(profit,2)

    })

df=pd.DataFrame(sales)

df.to_csv("data/generated/sales.csv",index=False)

print("✅ 12000 Sales Generated Successfully!")