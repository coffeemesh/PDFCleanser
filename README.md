# PDFCleanser for Windows
Small batch script which deletes meta data from PDFs using [exiftool](https://exiftool.org/).
Some options might not be necessary but the whole thing should work. not guaranteeing that because of obvious reasons.

# Usage:
- Put your pdf, this script and the exiftool in the same folder and then run the script.

Refer to [exifTool](https://exiftool.org/install.html) on how to install their software


# Why does this exist?
This exists because from aproximately 10 tools I have tried on Windows, none of them had worked properly. So I implemented it myself and it worked

# How to Use MetaDataDeleter.ps1

## Prerequisites
1. **PowerShell**: Ensure you have PowerShell 5.1 or later installed on your Windows machine.
2. **ExifTool**: Download and extract `exiftool` from [ExifTool's official website](https://exiftool.org/). Make sure you know the path to the `exiftool.exe` file.
3. **Execution Policy**: Ensure your PowerShell execution policy allows running scripts. You can set it using the following command:
   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

## Steps to Use the Script

1. **Download the Script**: Save the 

MetaDataDeleter.ps1

 script to a known location on your computer.

2. **Open PowerShell**: Open PowerShell with administrative privileges.

3. **Navigate to the Script Location**: Use the `cd` command to navigate to the directory where you saved the 

MetaDataDeleter.ps1

 script. For example:
   ```powershell
   cd C:\path\to\your\script
   ```

4. **Run the Script**: Execute the script by typing:
   ```powershell
   .\MetaDataDeleter.ps1
   ```

5. **Select ExifTool**: A file dialog will appear prompting you to select the `exiftool.exe` file. Navigate to the location where you extracted `exiftool` and select `exiftool.exe`.

6. **Select PDF File**: Another file dialog will appear prompting you to select the PDF file you want to modify. Navigate to the location of your PDF file and select it.

7. **View Metadata**: The script will print the metadata of the PDF file before modification.

8. **Modify Metadata**: The script will modify the metadata of the selected PDF file.

9. **View Modified Metadata**: The script will print the metadata of the PDF file after modification.

10. **Exit**: The script will wait for you to press Enter before closing, allowing you to review the output.

## Example Output
```
Select ExifTool.exe to use
Select PDF File to modify
Metadata before modification:
Title: Original Title
Author: Original Author
Creator: Original Creator
CreateDate: 2021:01:01 00:00:00
ModDate: 2021:01:01 00:00:00
Metadata has been modified.
Metadata after modification:
Title: unknown
Author: unknown
Creator: unknown
CreateDate: 1970:01:01 00:00:00
ModDate: 1970:01:01 00:00:00
Press Enter to exit
```

## Notes
- The script modifies the metadata fields `Title`, `Author`, `Creator`, `CreateDate`, and `ModDate` to predefined values.
- Ensure you have the necessary permissions to modify the PDF file.
- The script includes basic error handling to manage common issues such as file not found or access denied.
