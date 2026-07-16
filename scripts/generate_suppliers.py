import pandas as pd

suppliers = [
    {
        "Supplier_ID": "SUP001",
        "Supplier_Name": "Octave India Pvt Ltd",
        "Brand": "Octave",
        "City": "Delhi",
        "Contact": "9876543210"
    },
    {
        "Supplier_ID": "SUP002",
        "Supplier_Name": "Flujeans Pvt Ltd",
        "Brand": "Flujeans",
        "City": "Noida",
        "Contact": "9876543211"
    },
    {
        "Supplier_ID": "SUP003",
        "Supplier_Name": "Yankees Apparel",
        "Brand": "Yankees",
        "City": "Ludhiana",
        "Contact": "9876543212"
    },
    {
        "Supplier_ID": "SUP004",
        "Supplier_Name": "Scotlane Fashion",
        "Brand": "Scotlane",
        "City": "Jaipur",
        "Contact": "9876543213"
    }
]

df = pd.DataFrame(suppliers)

df.to_csv("DATA/RAW/suppliers.csv", index=False)

print("✅ Suppliers Generated Successfully!")