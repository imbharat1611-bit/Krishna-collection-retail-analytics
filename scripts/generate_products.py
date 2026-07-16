import pandas as pd
import random
from config import BRANDS, MENS, KIDS, COLORS, SIZES

products = []

product_id = 1

for i in range(250):

    gender = random.choice(["Men", "Kids"])

    if gender == "Men":
        category = random.choice(MENS)
    else:
        category = random.choice(KIDS)

    brand = random.choice(BRANDS)
    color = random.choice(COLORS)
    size = random.choice(SIZES)

    cost_price = random.randint(250, 1800)

    profit_margin = random.uniform(0.35, 0.75)

    selling_price = round(cost_price * (1 + profit_margin))

    stock = random.randint(5, 80)

    products.append({
        "Product_ID": f"P{product_id:03}",
        "Brand": brand,
        "Gender": gender,
        "Category": category,
        "Color": color,
        "Size": size,
        "Cost_Price": cost_price,
        "Selling_Price": selling_price,
        "Profit_Margin": round(profit_margin * 100, 2),
        "Stock": stock
    })

    product_id += 1

df = pd.DataFrame(products)

df.to_csv("DATA/RAW/products.csv", index=False)

print("✅ 250 Products Generated Successfully!")