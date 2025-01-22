# practiseSalesforceAdmin

This repository is created to deploy all the latest changes from my Salesforce Development org after thorough testing, as well as to serve as a backup repository for reference and practice purposes.

## Repository Purpose

The primary goals of this repository are:

1. **Backup Salesforce Configuration**: Store metadata and customizations from my Development org to ensure no work is lost.
2. **Version Control**: Track changes made to the Salesforce setup for future reference.
3. **Practice Salesforce Administration**: Experiment with Salesforce configurations and development features.
4. **Deployments**: Easily deploy tested changes from this repository to other orgs.

## Repository Structure

The repository is organized as follows:

```
practiseSalesforceAdmin/
|
|-- src/                      # Source metadata files from Salesforce org
|-- config/                   # Deployment configuration files
|-- scripts/                  # Useful deployment or backup scripts
|-- README.md                 # Repository documentation
|-- .gitignore                # Files and folders to exclude from the repository
|-- package.xml               # Metadata components for deployment
```

### Key Files and Folders

- **src/**: Contains Salesforce metadata, such as Apex classes, triggers, Visualforce pages, Lightning components, and flows.
- **config/**: Configuration files for deployment settings.
- **scripts/**: Useful scripts for automating deployment and metadata retrieval.
- **package.xml**: XML file listing the metadata components included in the repository.
- **.gitignore**: Specifies files and folders to exclude from Git version control.

## Getting Started

### Prerequisites

To use this repository effectively, ensure you have the following tools installed:

1. **Salesforce CLI (sfdx)**: For retrieving and deploying metadata.
   - Installation Guide: [Salesforce CLI](https://developer.salesforce.com/tools/sfdxcli)
2. **Git**: For version control.
   - Installation Guide: [Git](https://git-scm.com/)
3. A **Salesforce Development Org** or Sandbox with proper access.

### Setup Instructions

1. Clone this repository to your local machine:
   ```bash
   git clone https://github.com/pradhanTejeshwar/practiseSalesforceAdmin.git
   ```

2. Authenticate your Salesforce org using Salesforce CLI:
   ```bash
   sfdx auth:web:login -a DevelopmentOrg
   ```

3. Retrieve metadata from your Salesforce Development org:
   ```bash
   sfdx force:source:retrieve -m ApexClass,CustomObject,Flow,LightningComponentBundle -u DevelopmentOrg
   ```

4. Push changes to the repository:
   ```bash
   git add .
   git commit -m "Retrieved latest metadata from Development org"
   git push origin main
   ```

### Deployment Instructions

To deploy changes from this repository to another Salesforce org:

1. Authenticate the target Salesforce org:
   ```bash
   sfdx auth:web:login -a TargetOrg
   ```

2. Deploy metadata:
   ```bash
   sfdx force:source:deploy -p src/ -u TargetOrg
   ```

3. Validate the deployment by running Apex tests:
   ```bash
   sfdx force:apex:test:run -u TargetOrg --codecoverage
   ```

## Best Practices

- Always retrieve metadata after making changes in the Development org.
- Test all changes thoroughly in the Development org before committing them to the repository.
- Use descriptive commit messages for easy tracking of changes.
- Keep your **package.xml** updated to ensure correct metadata retrieval and deployment.
- Avoid committing sensitive information (e.g., passwords, security tokens).

## Contributing

This repository is currently for personal use. Contributions and suggestions are welcome but must align with the repository’s purpose. If you have ideas, feel free to create a pull request or open an issue.

## License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and distribute this repository in accordance with the license terms.

## Contact

If you have any questions or need assistance, feel free to reach out:

**Tejeshwar Pradhan**  
[GitHub Profile](https://github.com/pradhanTejeshwar)

