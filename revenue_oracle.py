# HVF Nexus Revenue Oracle v1.0
# Logic: Calculate Asset Value vs. Operational Overhead

def calculate_livestock_roi(head_count, market_price, daily_feed_cost):
    gross_value = head_count * market_price
    daily_burn = head_count * daily_feed_cost
    
    print(f"--- HVF REVENUE REPORT ---")
    print(f"Total Asset Value: ${gross_value:,.2f}")
    print(f"Daily Operational Burn: ${daily_burn:,.2f}")
    print(f"Net Position (24hr): ${(gross_value - daily_burn):,.2f}")
    print(f"STATUS: OPERATIONAL")

if __name__ == "__main__":
    # Test Data for Johnston County Site
    calculate_livestock_roi(head_count=200, market_price=1800, daily_feed_cost=2.50)
