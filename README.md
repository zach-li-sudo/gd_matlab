# gd_matlab

Gradient descent with Armijo line search

1. Objective function: <br> <img src="https://latex.codecogs.com/svg.image?\min&space;_{x}f(x)=\min_{x}&space;2&space;x_{1}^{2}&plus;x_{2}^{2}-3&space;x_{1}&space;x_{2}-x_{1}&plus;e^{x_{2}}" title="\min _{x}f(x)=\min_{x} 2 x_{1}^{2}+x_{2}^{2}-3 x_{1} x_{2}-x_{1}+e^{x_{2}}" />
2. Gradient: <br> <img src="https://latex.codecogs.com/svg.image?\nabla&space;f(x)=\left[\begin{array}{c}4&space;x_{1}-3&space;x_{2}-1&space;\\2&space;x_{2}-3&space;x_{1}&plus;e^{x_{2}}\end{array}\right]" title="\nabla f(x)=\left[\begin{array}{c}4 x_{1}-3 x_{2}-1 \\2 x_{2}-3 x_{1}+e^{x_{2}}\end{array}\right]" />
3. Initial point: <br> <img src="https://latex.codecogs.com/svg.image?x_0&space;=&space;\begin{bmatrix}0\\0\end{bmatrix}" title="x_0 = \begin{bmatrix}0\\0\end{bmatrix}" />
4. Stoping criterion: <br> <img src="https://latex.codecogs.com/svg.image?\|\nabla&space;f(x)\|&space;\leq&space;10^{-6}" title="\|\nabla f(x)\| \leq 10^{-6}" />
5. Armijo line search parameters: <br> <img src="https://latex.codecogs.com/svg.image?\sigma=\gamma=0.5" title="\sigma=\gamma=0.5" />

Results: <br>
1. Solution trajectory: <br> <img src="xtrajectory.jpg" width="800px">
2. Error curve: <br> <img src="error.jpg" width="800px">
3. Objectuve function value: <br> <img src="func_val.jpg" width="800px">
