### GitHub Repository Introduction

# MCMI Feature Selection Algorithm

Welcome to the repository for the MCMI (Maximum Conditional Mutual Information) Feature Selection Algorithm. This repository contains the MATLAB code and necessary files for implementing the MCMI-based feature selection method, designed for high-dimensional datasets. The repository includes code for calculating entropy, joint entropy, and mutual information, as well as sample datasets.

## Getting Started

To use the MCMI feature selection algorithm, follow the instructions below:

### Prerequisites

- MATLAB installed on your system

### Files and Directories

- **mcmi.m**: The main script for the MCMI feature selection algorithm.
- **Feature Selection Package**: A folder containing supplementary functions required for the algorithm.
  - **load_fspackage.m**: Script to load the necessary feature selection package.
  - **Entropy.m**: Function to calculate entropy.
  - **JointEntropy.m**: Function to calculate joint entropy.
  - **MutualInformation.m**: Function to calculate mutual information.
- **Datasets**:
  - **GBMCNA.mat**: Sample dataset for feature selection.
  - **Lung_CNA.mat**: Another sample dataset for feature selection.

### Usage Instructions

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/mcmi-feature-selection.git
   ```

2. **Navigate to the repository directory**:
   ```bash
   cd mcmi-feature-selection
   ```

3. **Load the Feature Selection Package**:
   Open MATLAB and run the following command to load the necessary package:
   ```matlab
   run('Feature Selection Package/load_fspackage.m')
   ```

4. **Run the MCMI algorithm**:
   Execute the `mcmi.m` script in MATLAB:
   ```matlab
   run('mcmi.m')
   ```

### Sample Datasets

- **GBMCNA.mat**: This dataset contains genomic data for feature selection.
- **Lung_CNA.mat**: This dataset includes lung cancer-related genomic data for feature selection.

### Functions

- **Entropy.m**: Function to compute the entropy of a variable.
- **JointEntropy.m**: Function to compute the joint entropy of two variables.
- **MutualInformation.m**: Function to compute the mutual information between two variables.

### Additional Information

For more details on the MCMI algorithm and its applications, please refer to the accompanying documentation and code comments within the scripts.

---

We hope you find this repository helpful for your feature selection tasks. If you have any questions or encounter any issues, please feel free to open an issue or contact us via GitHub.

---

**Repository Maintainer**: [Hongtao Shi]  
**Contact**: [sht@qau.edu.cn]  

Happy coding!
