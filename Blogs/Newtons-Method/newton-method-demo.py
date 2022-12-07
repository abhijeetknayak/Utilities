import numpy as np
import matplotlib.pyplot as plt

def newtonMethod(grad_fn, hessian_fn, z0, max_iterations, eps):
    """
    :param hessian_fn: Function to compute Hessian at a point
    :param grad_fn: Function to compute gradient at a point
    :param z0: Initial values of x and y
    :param max_iterations: Maximum number of iterations
    :param eps: Stopping criteria. Stop if grad norm is less than eps
    :return:
    """

    z = z0
    z_all = [z]
    f_all = []
    for idx in range(max_iterations):
        f_val = grad_fn(z[0, 0], z[1, 0])
        f_all.append(f_val)

        if np.linalg.norm(f_val) < eps:
            break

        step = - np.linalg.inv(hessian_fn(z[0, 0], z[1, 0])) @ f_val
        z = z + step
        z_all.append(z)

    return z_all, f_all

def f(x, y):
    return x ** 2 + x * y + y**2

def grad(x, y):
    gradient = np.array([[2 * x + y],
                         [x + 2 * y]])
    return gradient

def hessian(x, y):
    return np.array([[2, 1],
                     [1, 2]])

def jacobian(x, y):
    return np.array([[1, 0],
                     [0.5 * np.sqrt(y / x), 0.5 * np.sqrt(x / y)],
                     [0, 1]])

def main():
    R = np.arange(0, np.sqrt(2), 0.002)[:, np.newaxis]
    TH = 2 * np.pi * np.arange(0, 1, 0.002)
    X = R * np.cos(TH)
    Y = R * np.sin(TH)

    f_val = np.log(1 + f(X, Y))

    fig, ax = plt.subplots()
    CS = ax.contour(X, Y, f_val, cmap='gray')
    ax.clabel(CS, inline=1, fontsize=10)
    ax.set_title('Contour Plot')

    z0 = np.array([[1], [1]])

    # Exact Newton
    Z_all, f_all = newtonMethod(grad, hessian, z0, 1000, 1e-3)
    Z_all = np.concatenate(Z_all, axis=1)
    plt.plot(Z_all[:][0], Z_all[:][1], 'r-x', linewidth=1, ms=4, label='Exact Newton')
    print(f"Number of Iterates in Exact Newton: {Z_all.shape[1]}")

    # Steepest Gradient
    z0 = np.array([[1], [1]])
    # Z_all, f_all = newtonMethod(grad, lambda x, y: 500 * np.eye(2), z0, 10000, 1e-3)
    # Z_all = np.concatenate(Z_all, axis=1)
    # plt.plot(Z_all[:][0], Z_all[:][1], 'b-x', linewidth=1, ms=4, label="Steepest Descent (alpha=500)")
    # print(f"Number of Iterates in Steepest Gradient (alpha=500): {Z_all.shape[1]}")

    # Steepest Gradient
    Z_all, f_all = newtonMethod(grad, lambda x, y: 200 * np.eye(2), z0, 9999, 1e-3)
    Z_all = np.concatenate(Z_all, axis=1)
    plt.plot(Z_all[:][0], Z_all[:][1], 'm-x', linewidth=1, ms=4, label="Steepest Descent (alpha=200)")
    print(f"Number of Iterates in Steepest Gradient (alpha=200): {Z_all.shape[1]}")

    # Gauss-Newton
    z0 = np.array([[1], [1]])
    GN_hess = lambda x, y: jacobian(x, y).T @ jacobian(x, y)
    Z_all, f_all = newtonMethod(grad, GN_hess, z0, 9999, 1e-3)
    Z_all = np.concatenate(Z_all, axis=1)
    print(Z_all)
    plt.plot(Z_all[:][0], Z_all[:][1], 'g-x', linewidth=1, ms=8, label="Gauss-Newton")
    print(f"Number of Iterates in Gauss-Newton: {Z_all.shape[1]}")

    # Levenberg-Marquardt
    alpha = 100
    LM_hess = lambda x, y: GN_hess(x, y) + alpha * np.eye(2)
    Z_all, f_all = newtonMethod(grad, LM_hess, z0, 10000, 1e-3)
    Z_all = np.concatenate(Z_all, axis=1)
    plt.plot(Z_all[:][0], Z_all[:][1], 'c-x', linewidth=1, ms=4, label="Levenberg-Marquardt (alpha=200)")
    print(f"Number of Iterates in Levenberg-Marquardt: {Z_all.shape[1]}")

    plt.legend()
    plt.show()


if __name__ == '__main__':
    main()
