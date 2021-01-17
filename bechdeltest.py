


def pass_calc(malechar, femalechar, year, gross){
    m = malechar
    f = femalechar
    yr = year / 1000.0
    grs = gross/10.0
    ratio = 10.0 * f/(m+f)

    p = 0.3228 - 0.2144*m + 1.3241 * f + 0.1337 * yr + 0.0026*grs + (0.5984*m*m/100.0) - (1.5182*f*f/10.0) + (0.0628*f*f*f/10) - 0.2843*yr*yr*yr + (0.2698*ratio*ratio*ratio/100.0)
    
    if p >= 0.6:
        return 1
    else:
        return 0

}