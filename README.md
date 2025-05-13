# natural_cubic_spline_medals.m
Implements a natural cubic-spline generator cubic_spline(x,y) (returns the a-, b-, c-, d-coefficients for each interval) and applies it to Canada’s Winter-Olympic medal data (1924-2014), then prints the spline coefficients for every year-to-year segment.


  • Part (a)  — Implements  cubic_spline(x,y), a *self-written* routine that
    constructs a **natural cubic spline** (S″(x₀)=S″(xₙ)=0) through the data
    points (xᵢ , yᵢ).  It returns the interval-wise coefficients

          Sₖ(x) = aₖ + bₖ(x−xₖ) + cₖ(x−xₖ)² + dₖ(x−xₖ)³ ,
          k = 0,…,n−1 .

  • Part (b)  — Uses this routine on Canada’s Winter-Olympic medal totals
    from 1924–2014, then prints the {a,b,c,d} vectors for each year-to-year
    segment.

-------------------------------------------------------------------------
FUNCTION cubic_spline(x, y)

  INPUTS
  ——––––
  x : (n+1)×1 strictly increasing vector.
  y : (n+1)×1 vector of data values  f(xᵢ).

  OUTPUTS
  ——–––––
  a, b, c, d : n×1 vectors of the spline coefficients for each interval
               [xᵢ , xᵢ₊₁].

  METHOD
  ——––––
  • Form the tridiagonal system for the interior second-derivatives c.
  • Impose natural BCs  c₁ = c_{n+1} = 0 .
  • Back-substitute to compute b and d, set a = y(1:n).
  • No built-in MATLAB spline utilities are used.

-------------------------------------------------------------------------
SCRIPT SECTION

  • Data:  year = [1924 1932 … 2014];  medal = [1 7 … 25].
  • Calls cubic_spline to obtain coefficients.
  • Prints a, b, c, d for each interval.

USAGE
  >> natural_cubic_spline_medals

OUTPUT
  Console listing of spline coefficients for every consecutive
  Olympics-year interval.
