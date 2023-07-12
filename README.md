# BVDE929

## Introduction

Peptide oxidation state analysis for Sophie.
In vitro cell line treated with H2O2 during 4 hours.
Multiple -omics analyses were performed on these cells:

- Peptidomics after acid wash to recuperate the epitopes presented by the immuoglobulins
- Proteomics on the cytosol of these cells
- RNAseq (BVDE221014)

Here we will be analyzing the proteome and then the epitopes of these cells. We are trying to find whether 
or not there is a shift in the antigens presented at the surface of the cells following the supposed induced oxidative 
stress. If so, is there a detectable pattern in the peptides presented, can they be found in the proteomics...

## Proteomics

Proteins were digested, tagged with TMT and loaded onto the LC-MS/MS. Oxidized methionins were conserved.

Firstly, we want to know if oxidization might have happened at ionization and not due to treatment, in which case the 
retention time for a non-oxidized peptide should be the same as the one for an oxidized peptide.

### BVDE929_report.Rmd

#### Filtering

- Removing the contaminants
- Keeping the columns of interest
- Filtering out peptides which appear in less than 4 out of 8 samples
- Filtering out PSMs <1

#### Analyses

- Frequency of peptide oxidation (frequency table and histogram of peptide oxidation)
- Matching retention times to peptides (they are not in the same file)
- Filtering, keep the peptides only oxidated in H2O2 and not oxidated in ctrl.

NB: There continuously was a problem with peptides having in equivalent states in the other 
    condition. Added to this, retention times were not as expected. Some peptides had oxidated peptides
    with retention times both lower and higher of the equivalent not oxidated from. This could not be
    explained by oxidation in the nozzle at ionisation.


![unnamed-chunk-9-3](https://github.com/marionhardy/BVDE929/assets/126153921/31579c0a-c2c5-4690-8965-bd583f18b8ca)


### Pep_clivage_final.Rmd

#### Filtering

- Removing the contaminants
- Keeping the columns of interest
- Filtering out peptides which appear in less than 4 out of 8 samples
- Filtering out PSMs <1
- Keep only the peptides that are differentially abundant in ctrl or H2O2

#### Analyses

Sophie and Nathalie determined that there were 140 enriched peptides (from the peptidomic data).
They also used multiple online tools to determine epitode recognition etc.
I was asked to check the sequences and patterns of these peptides and whether or not we could find
oxidized Methionin or Cystein in the sequences bordering the peptides + if they have their equivalent
protein in the proteomics data, is that protein also oxidized?

- Checked if the aa in Nter and Cter contain M or C
- Checked if the aa before cter and after nter contain M or C
- Get the protein from the newly determined targets from the proteomics data
- Check the state they are in proteomics


  








