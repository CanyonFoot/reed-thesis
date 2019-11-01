# Literature Review

* * *

- **Author:**  Bareinboim et al.
- **Year:** 2014
- **Title:** Recovering from Selection Bias in Causal and Statistical Inference
- **Summary:** The paper gives graphical conditions for recovering $conditional$ distributions under selection bias with and without external data. To do this, they define s-recoverability of conditional $Q = P(y | \mathbf{x})$ as the following: for graph $G_s$ with selection node $S$, any two probability distributions $P_1, P_2$ compatible with the graph have $P_1(\mathbf{v} | S = 1) = P_2(\mathbf{v} | S = 1) \implies P_1(y | x) = P_2(y | x)$ where $\mathbf{v}$ is all the non-selection nodes and $P(y | x)$ is a particular conditional distribution of interest. When no external data is present, the conditional $P(y | x)$ is s-recoverable only when $S$ and $Y$ can be d-separated by $X$. When $\mathbf{X}$ and a subset $\mathbf{C}$ of the variables are measured (together) in the population (i.e. we have access to $P(\mathbf{C})$ rather than $P(\mathbf{C} | S = 1)$) we can recover $P(y | \mathbf{x})$ when $Y$ and $S$ can be d-separated by $\{\mathbf{C}, \mathbf{X}\}$. Specifically, we recover $P(y | \mathbf{x})$ with $P(y | \mathbf{x}) = \sum_c P(y | x, c, S = 1)P(c | x)$. The paper also discusses recovery of causal effects rather than the standard conditionals. When $X$ and $Y$ are not confounded, $P(y|x) = P(y|x, S= 1)$ so in these cases the earlier recoverability results hold. For confounded cases, they introduce a modification of the backdoor criterion that allows them to give conditions for recovering $P(y|do(x))$. 

- **How does this relate? ** This was the first paper that I read on selection bias, and it is at this point the paper that is closest to my topic in that it provides explicit graphical conditions for recoverability. However, the paper is limited to the recovery of conditional distributions so it might be nice to get explicit about when non-conditional distributions are recoverable.

* * *

- **Author:** James Heckman
- **Year:** 1972
- **Title:**  Sample Selection Bias as a Specification Error
- **Summary:**
- **How does this relate?** This is a very influential paper which was one of the first to formalize selection bias and consider methods of overcoming it. 

* * *

- **Author:** Hernan et al. 
- **Year:**  2004
- **Title:**  A Structural Approach to Selection Bias
- **Summary:** This paper proposes specific conditions that define selection bias and gives some discussion/overview of ways to adjust for selection bias. The paper adopts some of the Pearl conventions, especially DAGs, but is less focused on the more abstract graphical aspects than Bareinboim and  Pearl. In the context of attempting to recover a causal risk ratio, they define selection bias as 'conditioning on common effects'. Definition: An associational risk ratio for a binary outcome $D$ given a binary treatment $T$ is $P(D = 1 | T= 1, S = 1) / P(D = 1 | E = 0, S = 1)$ where $S= 1$ is the variable that indicates selection for the sample. The causal risk ratio is $P(D = 1, do(T= 1)) / P(D = 1, d(E = 0))$. The paper defines bias as occuring when the causal risk ratio differs from the associational risk ratio. So the associational odds ratio is fully determined by $P(D|T,S=1)$ and therefore analogous to $P_G(y|x, S = 1)$ in Bareinboim, but the focus is different from the first two sections of that paper in that the aim causal effects rather than the population $P_G(y|x)$. However, as Bareinboim notes, $P(y|do(x)) = P(y|x)$ when $X$ and $Y$ are not subject to confounding. Another difference is the scope of what is defined as selection bias. In Bareinboim, selection bias itself is not defined graphically, rather  they explore recovery of a conditional under a selection mechanism. Sometimes, this selection mechanism does not affect $P(y|x)$ (i.e. $P(y|x) = P(y|x, S= 1)$), other times, $P(y|x, S)$ can be expressed using other quantities avaliable from the graph, and in 'non-recoverable' cases $P(y|x)$ cannot be expressed in that way. Hernan only includes these last categories in the definition of selection bias. The disscussion of adjusting for selection bias is limited to inverse probability weighting.

-**How does this relate?** Unlike earlier work like Heckman's, this paper uses DAGs and the language of causality. However, it is more grounded in a particular application area (epidemiology) than Bareinboim 2014. This means making assumptions about the study design and that the variables are binary. I hope to explore the extend to which the definitions these authors outline are compatible.

* * *


- **Author:** Geneletti et al.
- **Year:** 2008
- **Title:**  Adjusting for Selection Bias in Retrospective Case-Control Studies
- **Summary:**
- **How does this relate?** 

* * *


- **Author:** Haneuse et al.
- **Year:** 2009
- **Title:**  Adjustment for Selection Bias in Observational Studies with Application to the Analysis of Autopsy Data
- **Summary:**
- **How does this relate?** 

* * *


- **Author:** Cortes et al.
- **Year:** 2008
- **Title:**  Sample Selection Bias Correction Theory
- **Summary:** 
- **How does this relate?** The paper gives a clear explanation of 

* * *


- **Author:** Cuddleback et al.
- **Year:** 2008
- **Title:** Detecting and Statistically Correcting Sample Selection Bias 
- **Summary:** 
- **How does this relate?** 

* * *


- **Author:**  Bareinboim and  Pearl
- **Year:** 2016
- **Title:**  Causal Inference and the Data-Fusion Problem
- **Summary:** 
- **How does this relate?** 

* * *

- **Author:** Correa et al.
- **Year:** 2019
- **Title:**  Identification of Causal Effects in the Presence of Selection Bias
- **Summary:** 
- **How does this relate?** 

* * *

- **Author:** 
- **Year:** 
- **Title:**  
- **Summary:**
- **How does this relate?** 

* * *