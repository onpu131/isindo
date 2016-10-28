import numpy as np



def object_os_weight(order, t):
    if order>3:
        print("Etalon may be in range of 1 to 3!")
        return None
    a = 2.65
    b = 1.45
    return{
        1:np.exp(-a*t),
        2:(b/a * (np.exp(-2*a*t) - np.exp(-a*t))),
        3:((b/a)**2 * (np.exp(-3*a*t) - 2*np.exp(-2*a*t) + np.exp(-a*t)))
    }.get(order, None)


	

def object_os_step(order, t):
    if order>3:
        print("Etalon may be in range of 1 to 3!")
        return None
    a = 2.65
    b = 1.45
    if order==1:
        return (-np.exp(-a*t) + 1) / a
    elif order==2:
        return (b/a**3) * (np.exp(-2*a*t) + 2*a*t*np.exp(-a*t) - 1)
    elif order==3:
        A = 2 * a;
        B = 2 - 3*a - 2*(a**2)*t - 2*(a**3)*(t**2);
        C = -2 * (1 - a + a*t);
        D = -a;
        return (b**2 / a**6) * (A + B*np.exp(-a*t) + C*np.exp(-2*a*t) + D*np.exp(-3*a*t))

