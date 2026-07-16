import pandas as pd
import random
from faker import Faker

fake = Faker("en_IN")

customers = []

loyalty = ["Gold", "Silver", "Bronze", "None"]

cities = [
    "Agra",
    "Mathura",
    "Firozabad",
    "Etawah"
]

for i in range(1, 801):

    customers.append({
        "Customer_ID": f"C{i:04}",
        "Customer_Name": fake.name(),
        "Gender": random.choice(["Male", "Female"]),
        "Age": random.randint(18, 65),
        "City": random.choice(cities),
        "Phone": fake.msisdn()[:10],
        "Loyalty": random.choice(loyalty)
    })

df = pd.DataFrame(customers)

df.to_csv("DATA/RAW/customers.csv", index=False)

print("✅ 800 Customers Generated Successfully!")
