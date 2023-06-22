# Saltos Condicionales
| Condición De Salto | Salto Con Signo | Bandera Evaluada | Salto Sin Signo | Bandera Evaluada |
|               -               |     -     |         -        |     -     |        -        |
| = (Equal)                     | JE        | ZF = 1           | JE        | ZF = 1          |
| != (Not Equal)                | JNE       | ZF = 0           | JNE       | ZF = 0          |
| > (Greater than)              | JG o JNLE | ZF = 0 y SF = 0F | JA o JNBE | CF = 1 y ZF = 0 |
| >= (Greater than or equal to) | JGE o JNL | SF = 0F          | JAE o JNB | CF = 0          |
| < (Less than)                 | JL o JNGE | SF = 0F          | JB o JNAE | CF = 1          |
| <= (Less than or equal to)    | JLE o JNG | ZF = 1 o SF = OF | JBE o JNA | CF = 1 o ZF = 1 |