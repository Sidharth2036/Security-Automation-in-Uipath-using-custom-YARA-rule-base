# YARA Malware Scanner - RPA Automation

An automated malware detection and removal system built with UiPath RPA that leverages YARA rules to scan directories for malicious files and provides intelligent cleanup options.

## Overview

This UiPath automation workflow performs comprehensive malware scanning using YARA pattern matching. It scans specified directories, identifies infected files based on custom YARA rules, and offers automated removal with user confirmation.

## Features

- **Automated YARA Scanning**: Recursively scans directories using YARA64 engine
- **Custom Rule Support**: Uses configurable YARA rule files for malware detection
- **Interactive Cleanup**: Prompts user before deleting infected files
- **Comprehensive Logging**: Logs all scan activities, detections, and deletions
- **Error Handling**: Robust try-catch blocks for graceful error management
- **Batch File Removal**: Automatically processes and removes multiple infected files
- **Output Management**: Generates and cleans up temporary scan output files

## Prerequisites

- **UiPath Studio** (version compatible with .NET Framework activities)
- **YARA64** executable (`yara64.exe`) installed and accessible
- **Windows OS** with CMD access
- **Required UiPath Packages**:
  - UiPath.System.Activities
  - UiPath.Mail.Activities
  - UiPath.Database.Activities
  - UiPath.AmazonWebServices.Activities (optional)

## Configuration

### Default Paths (Modify as needed)


### Customization

1. **Scan Directory**: Update the `scanPath` variable to your target directory
2. **YARA Rules**: Point `rulesPath` to your custom YARA rule file
3. **Output Location**: Modify `newoutputFilePath` for temporary scan results

## How It Works

1. **Initialization**: Sets up scan paths, YARA rule paths, and output file locations
2. **File Creation**: Creates output file if it doesn't exist
3. **YARA Execution**: Runs YARA64 via CMD with recursive scanning
4. **Result Parsing**: Reads and parses YARA output for infected files
5. **Detection Handling**:
   - If malware found: Displays alert and prompts for deletion
   - If clean: Logs success message
6. **User Interaction**: Asks user to confirm deletion of infected files
7. **Cleanup**: Removes infected files and cleans up temporary output
8. **Logging**: Records all operations with appropriate log levels

## Usage

### Running the Workflow

1. Open the project in UiPath Studio
2. Ensure YARA64 is installed and accessible from system PATH
3. Update configuration variables for your environment
4. Run the Main.xaml workflow
5. Monitor the execution and respond to prompts as needed

### YARA Rules

Create your `automation.yara` file with custom detection rules:


## Workflow Structure

- **Main Sequence**: Orchestrates the entire scanning process
- **Try-Catch Blocks**: Handle errors during scanning and file deletion
- **For Each Loop**: Processes each infected file individually
- **Conditional Logic**: Branches based on scan results and user responses

## Variables

| Variable | Type | Purpose |
|----------|------|---------|
| `scanPath` | String | Directory to scan |
| `rulesPath` | String | Path to YARA rules file |
| `yaraOutput` | String | Raw YARA scan results |
| `infectedFiles` | String[] | Array of detected malware files |
| `userResponse` | String | User's deletion confirmation |
| `malwareDetected` | Boolean | Detection status flag |
| `logMessage` | String | Log output message |

## Logging Levels

- **Fatal**: Malware detection alerts
- **Error**: Scan failures and deletion errors
- **Info**: Successful clean scans

## Error Handling

The workflow includes comprehensive error handling for:
- YARA execution failures
- File access/deletion errors
- Invalid path configurations
- Missing dependencies

## Security Considerations

- Always review detected files before deletion
- Keep YARA rules updated with latest malware signatures
- Run with appropriate permissions for file deletion
- Backup important data before automated cleanup
- Review logs regularly for security insights

## Contributing

Contributions are welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Test thoroughly with sample malware files
4. Submit a pull request

## License

MIT License - feel free to use and modify for your needs.

## Disclaimer

This tool is for legitimate security scanning purposes only. Always ensure you have proper authorization before scanning systems. The developers are not responsible for misuse or data loss.

## Support

For issues or questions:
- Open an issue in the repository
- Review UiPath documentation
- Check YARA documentation at https://virustotal.github.io/yara/

## Acknowledgments

- YARA pattern matching engine by VirusTotal
- UiPath RPA platform
- Open-source security community
