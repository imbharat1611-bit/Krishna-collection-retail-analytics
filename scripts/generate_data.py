import pandas as pd

# Product Data
products = [
    {
        "Product_ID": "P001",
        "Brand": "Octave",
        "Category": "Shirt",
        "Size": "M",
        "Color": "Blue",
        "Cost_Price": 550,
        "Selling_Price": 999
    },
    {
        "Product_ID": "P002",
        "Brand": "Flu Jeans",
        "Category": "Jeans",
        "Size": "32",
        "Color": "Black",
        "Cost_Price": 950,
        "Selling_Price": 1799
    },
    {
        "Product_ID": "P003",
        "Brand": "Scotlane",
        "Category": "T-Shirt",
        "Size": "L",
        "Color": "White",
        "Cost_Price": 350,
        "Selling_Price": 699
    }
]

df = pd.DataFrame(products)

df.to_csv("data/raw/products.csv", index=False)

print("Products dataset created successfully!")