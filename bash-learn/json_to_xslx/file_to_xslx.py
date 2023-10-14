import os
import sys
import pandas as pd


# read
json_file_to_be_converted = sys.argv[1]
output_path = sys.argv[2]

if json_file_to_be_converted is None:
    exit(__file__ + ": can file not found")
    
    
# Load JSON data from a file or use a dictionary
# Specify 'orient' as 'index' to use the keys as column names
data = pd.read_json(json_file_to_be_converted, orient='index')
 
# Remove the '.json' extension from the file name to create the output Excel file name
# excel_file = os.path.splitext(json_file)[0] + '_converted.xlsx'

# Save DataFrame to Excel 
# output_path the path of the file execl to write 
data.to_excel(output_path, index=False) 

print(f"Converted {json_file_to_be_converted} to {output_path}")