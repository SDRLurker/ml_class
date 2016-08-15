### ex6

Note: Update to ex6.m: At line 69/70, change "sigma = 0.5" to "sigma = %0.5f"

and change the list of output variables from "sim" to "sigma, sim".

Note: Error in visualizeBoundary.m. Change the call to contour() like this:

contour(X1, X2, vals, [1 1], 'b');

(This change removes the attribute 'Color', and changes the contour interval. Note that [0.5 0.5] also works and is more logical, since "vals" has range [0..1])

This issue can cause either the "hggroup" error message, or the decision boundaries to not be displayed, or possibly cause Octave 3.8.x to crash when running ex6.m.

All ex6 tutorials
https://www.coursera.org/learn/machine-learning/discussions/all/threads/g2VB7po6EeWKNwpBrKr_Fw
