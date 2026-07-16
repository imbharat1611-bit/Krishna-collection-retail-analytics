import pandas as pd
import random

# Load products dataset
products = pd.read_csv("DATA/RAW/products.csv")

inventory = []

for _, row in products.iterrows():

    inventory.append({
        "Product_ID": row["Product_ID"],
        "Brand": row["Brand"],
        "Category": row["Category"],
        "Gender": row["Gender"],
        "Color": row["Color"],
        "Size": row["Size"],
        "Current_Stock": random.randint(5, 80),
        "Reorder_Level": 10,
        "Warehouse": "Krishna Collection - Agra"
    })

inventory_df = pd.DataFrame(inventory)

inventory_df.to_csv("DATA/RAW/inventory.csv", index=False)

print("✅ Inventory Generated Successfully!")