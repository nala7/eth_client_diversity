# Ethereum Software Supply Chain
Analysis of the Software Supply Chain of Besu and Teku

![Besu Teku Bigger](https://github.com/user-attachments/assets/d3b5735c-b2c8-4b20-a333-ce613662b789)
###### Repo with visualization of groups: https://github.com/nala7/ssc-poster

This repository contains the scripts and data of an analysis of the software supply chain of 
the Ethereum nodes Besu and Teku.


The latest versions analysed were extracted on Jan 30th, 2025 (25.1.0). The earliest versions compared are 22.1.0. 
Versions before this one do not build because some dependencies are not able to be found.



| Besu                      | 20.10.4 | 21.10.6 | 22.1.0  | 23.1.0  | 24.1.0  | 25.1.0  |
|---------------------------|---------|---------|---------|---------|---------|---------|
| Lines of Code             | 400,359 | 449,457 | 455,467 | 585,541 | 642,566 | 680,721 |
| Lines of Java             | 232,575 | 268,396 | 274,605 | 321,707 | 352,088 | 385,140 |
| Lines of JSON             | 159,108 | 170,318 | 170,558 | 242,301 | 258,747 | 262,863 |
| Commits                   | 2,562   | 3,125   | 3,241   | 4,042   | 4,621   | 5,565   |
| Contributors              |         |         |         |         |         |         |
| Suppliers                 |         |         |         |         |         |         |
| Dependencies with Version |         | 437     | 376     | 437     | 449     | 462     |
| Dependencies              |         | 396     | 348     | 391     | 406     | 427     |
| Direct Dependencies       |         |         | TBD     | TBD     | TBD     |         |


| Teku                      | 21.1.0  | 22.1.0  | 23.1.0 | 24.1.0 | 25.1.0  |
|---------------------------|---------|---------|--------|--------|---------|
| Lines of Code             | 164,220 | 234,861 |        |        | 480,487 |
| Lines of Java             | 144,651 | 209,860 |        |        | 369,407 |
| Lines of JSON             | 4,061   | 9,125   |        |        | 46,042  |
| Commits                   |         | 3,142   | 4,371  | 5,094  | 5,787   |
| Contributors              |         |         |        |        |         |
| Suppliers                 |         |         |        |        |         |
| Dependencies with Version |         | 374     | 427    | 424    | 432     |
| Dependencies              |         | 351     | 392    | 444    | 422     |
| Direct Dependencies       |         |         |        |        |         |


| Number of Dependencies | 22.1.0 | 23.1.0 | 24.1.0 | 25.1.0 |
|------------------------|--------|--------|--------|--------|
| **Besu**               | 348    | 391    | 446    | 427    |
| **Teku**               | 351    | 392    | 444    | 422    |
| **Common**             | 195    | 207    | 218    | 243    |
| **Common % of Besu**   | 56.03% | 52.94% | 48.88% | 56.91% |
| **Common % of Teku**   | 55.56% | 52.81% | 49.10% | 57.58% |


| Number of Dependencies with Versions | 22.1.0 | 23.1.0 | 24.1.0 | 25.1.0 |
|--------------------------------------|--------|--------|--------|--------|
| **Besu**                             | 376    | 437    | 449    | 462    |
| **Teku**                             | 374    | 427    | 424    | 432    |
| **Common**                           | 116    | 140    | 130    | 178    |
| **Common % of Besu**                 |        |        |        |        |
| **Common % of Teku**                 |        |        |        |        |
