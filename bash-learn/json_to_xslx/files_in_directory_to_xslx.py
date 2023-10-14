import os
import sys
from datetime import datetime
import pandas as pd

# Specify the directory where your JSON files are located
input_directory = sys.argv[1]
output_directory = sys.argv[2]


# List all JSON files in the input directory
json_files = [file for file in os.listdir(input_directory) if file.endswith('.json')]

# Iterate through each JSON file and convert to Excel
for json_file in json_files:
    # Remove the '.json' extension from the file name to create the output Excel file name
    excel_file = os.path.splitext(json_file)[0] + '.xlsx'

    # Load JSON data and specify 'orient' as 'index' to use keys as column names
    data = pd.read_json(os.path.join(input_directory, json_file), orient='index')

    # Save the DataFrame to Excel in the output directory
    data.to_excel(os.path.join(output_directory, excel_file), index=False)

    print(f"Converted {json_file} to {excel_file}")

print("Conversion complete.")
   
 