

def sigmoid(z):
    return 1.0 / (1 + (exp(-1 * z)))

#returns 0 if does not pass, 1 if pass, -1 if issue with inputs

def pass_calc(malechar, femalechar, year, gross):
    m = malechar
    f = femalechar

    if f < 2:
        return 0
    
    yr = year / 1000.0
    grs = gross/10.0


    if m < 0 or f < 0 or yr < 0 or grs < 0:
        return -1

    
    ratio = 10.0 * f/(m+f)
    

    z = 0.3228 - 0.2144*m + 1.3241 * f + 0.1337 * yr + 0.0026*grs + (0.5984*m*m/100.0) - (1.5182*f*f/10.0) + (0.0628*f*f*f/10) - 0.2843*yr*yr*yr + (0.2698*ratio*ratio*ratio/100.0)

    p = sigmoid(z)
    
    if p >= 0.6:
        return 1
    else:
        return 0


