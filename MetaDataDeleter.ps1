Add-Type -AssemblyName System.Windows.Forms

function ChooseFile($filter, $title) {
    $fileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $fileDialog.Filter = $filter
    $fileDialog.Title = $title
    if ($fileDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        return $fileDialog.FileName
    } else {
        Write-Host "No file selected. Exiting."
        exit 1
    }
}

function PrintMetadata($exiftoolPath, $pdfFilePath) {
    try {
        $metadata = & $exiftoolPath $pdfFilePath
        $relevantMetadata = $metadata | Select-String -Pattern "Title|Author|Creator|CreateDate|ModDate|FileCreateDate|FileModifyDate"
        foreach ($line in $relevantMetadata) {
            Write-Host $line
        }
    } catch {
        Write-Host "Error reading metadata: $_" -ForegroundColor Red
        exit 1
    }
}

function ModifyMetadata($exiftoolPath, $pdfFilePath) {
    try {
        $arguments = @(
            "-all:all="
            "-Author=unknown"
            "-Title=unknown"
            "-Creator=unknown"
            "-CreateDate=1970:01:01 00:00:00"
            "-ModDate=1970:01:01 00:00:00"
            "-FileCreateDate=1970:01:01 00:00:00"
            "-FileModifyDate=1970:01:01 00:00:00"
            "-FileModifyDate=1970:01:01 00:00:00"
            $pdfFilePath
        )
        & $exiftoolPath $arguments
    } catch {
        Write-Host "Error modifying metadata: $_" -ForegroundColor Red
        exit 1
    }
}

function Main() {
    # Prompt user to choose exiftool.exe
    Write-Host "Select ExifTool.exe to use"
    $exiftoolPath = ChooseFile "Executable Files (*.exe)|*.exe" "Choose exiftool.exe"

    # Prompt user to choose PDF file
    Write-Host "Select PDF File to modify"
    $pdfFilePath = ChooseFile "PDF Files (*.pdf)|*.pdf" "Choose PDF File to modify"

    if (-not (Test-Path $exiftoolPath)) {
        Write-Host "exiftool.exe not found in the specified path."
        exit 1
    }

    if (-not (Test-Path $pdfFilePath)) {
        Write-Host "PDF file not found in the specified path."
        exit 1
    }

    # Print metadata before modification
    Write-Host "Metadata before modification:"
    PrintMetadata $exiftoolPath $pdfFilePath

    # Modify metadata
    ModifyMetadata $exiftoolPath $pdfFilePath
    Write-Host "Metadata has been modified."

    # Print metadata after modification
    Write-Host "Metadata after modification:"
    PrintMetadata $exiftoolPath $pdfFilePath

    # Wait for user input before closing
    Read-Host "Press Enter to exit"
}

# Run the main function
Main
