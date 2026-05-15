# python_intro_concepts.py
# Author: Joe Passo
# Course: Google Data Analytics Certificate - Course 7 (Python)
# Description: Introductory Python concepts practiced during coursework.
#              This script is a learning exercise, not production code.
#              Topics covered: lists, tuples, dictionaries, NumPy, and pandas basics.

# ─────────────────────────────────────────────
# SECTION 1: Lists and Tuples
# ─────────────────────────────────────────────

# Creating basic lists
state_names = ['Arizona', 'California', 'California', 'Kentucky', 'Louisiana']
county_names = ['Maricopa', 'Alameda', 'Sacramento', 'Jefferson', 'East Baton Rouge']

# Combining lists into a list of tuples using zip()
state_county_tuples = list(zip(state_names, county_names))
print("List of tuples:", state_county_tuples)

# Converting tuples to lists using list comprehension
state_county_lists = [list(t) for t in state_county_tuples]
print("List of lists:", state_county_lists)

# Unpacking tuples in a loop to filter California counties
ca_counties = []
for state, county in state_county_tuples:
    if state == 'California':
        ca_counties.append(county)
print("CA counties (loop):", ca_counties)

# Same result using list comprehension
ca_counties = [county for state, county in state_county_tuples if state == 'California']
print("CA counties (comprehension):", ca_counties)


# ─────────────────────────────────────────────
# SECTION 2: Dictionaries
# ─────────────────────────────────────────────

# Sample data (abbreviated for demo purposes)
epa_tuples = [
    ('Arizona', 'Maricopa', 9),
    ('California', 'Alameda', 11),
    ('California', 'Sacramento', 35),
    ('Kentucky', 'Jefferson', 6),
    ('Louisiana', 'East Baton Rouge', 5)
]

# Building a dictionary: state -> list of (county, aqi) tuples
aqi_dict = {}
for state, county, aqi in epa_tuples:
    if state not in aqi_dict:
        aqi_dict[state] = []
    aqi_dict[state].append((county, aqi))

print("AQI dict sample (California):", aqi_dict['California'])

# Function to count how many times each county appears for a given state
def county_counter(state):
    county_dict = {}
    for county, aqi in aqi_dict[state]:
        if county not in county_dict:
            county_dict[county] = 0
        county_dict[county] += 1
    return county_dict

print("County counts for California:", county_counter('California'))


# ─────────────────────────────────────────────
# SECTION 3: NumPy Basics
# ─────────────────────────────────────────────

import numpy as np

# Creating a NumPy array from a list
aqi_values = [9, 11, 35, 6, 5]
aqi_array = np.array(aqi_values)

# Basic summary statistics
print("Max AQI:", np.max(aqi_array))
print("Min AQI:", np.min(aqi_array))
print("Median AQI:", np.median(aqi_array))
print("Std Dev:", np.std(aqi_array))

# Boolean masking - finding readings at or below 10
clean_air_mask = aqi_array <= 10
percent_clean = clean_air_mask.sum() / len(aqi_array)
print("Percentage of clean readings (AQI <= 10):", round(percent_clean, 4))


# ─────────────────────────────────────────────
# SECTION 4: Pandas Basics
# ─────────────────────────────────────────────

import pandas as pd

# Creating a simple DataFrame from our sample data
data = {
    'state_name': ['Arizona', 'California', 'California', 'Kentucky', 'Louisiana'],
    'county_name': ['Maricopa', 'Alameda', 'Sacramento', 'Jefferson', 'East Baton Rouge'],
    'aqi': [9, 11, 35, 6, 5]
}

df = pd.DataFrame(data)

# Basic exploration
print("\nDataFrame preview:")
print(df.head())

print("\nSummary statistics:")
print(df.describe())

print("\nRows per state:")
print(df['state_name'].value_counts())

# Sorting by AQI descending
df_sorted = df.sort_values('aqi', ascending=False)
print("\nSorted by AQI (highest first):")
print(df_sorted)

# Boolean masking to filter California only
ca_df = df[df['state_name'] == 'California']
print("\nCalifornia data only:")
print(ca_df)

# Mean AQI by state using groupby
print("\nMean AQI by state:")
print(df.groupby('state_name')['aqi'].mean())

# Complex Boolean mask: California with AQI > 10
print("\nCalifornia counties with AQI above 10:")
print(df[(df['state_name'] == 'California') & (df['aqi'] > 10)])
