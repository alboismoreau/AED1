package aed;

public class Fecha {
    private int dia;
    private int mes;

    public Fecha(int dia, int mes) {
        this.dia=dia;
        this.mes=mes;
    }

    public Fecha(Fecha fecha) {
        this.dia= fecha.dia;
        this.mes= fecha.mes; 
       
    }

    public Integer dia() {
        return this.dia;
    }

    public Integer mes() {
        return this.mes;
    }

    @Override
    public String toString() {
       return String.valueOf(this.dia)+"/"+String.valueOf(this.mes);
    }

    @Override
    public boolean equals(Object otra) {
        boolean otraEsNull = (otra == null);
        boolean claseDistinta = (otra.getClass() != this.getClass());
        
        if (otraEsNull || claseDistinta)
            return false;
        

        Fecha otraFecha = (Fecha) otra;

        return (this.dia == otraFecha.dia() && this.mes == otraFecha.mes() );
    }

    public void incrementarDia() {
        //ultimo dia del mes
        if (diasEnMes(this.mes) == this.dia){
            if (this.mes==12){
                //diciembre
                this.mes=1;
                this.dia=1;
            } 

            else {
                this.mes+=1;
                this.dia=1;
             }
               
        }
        else{
            this.dia+=1;
        }
       

    }

    private int diasEnMes(int mes) {
        int dias[] = {
                // ene, feb, mar, abr, may, jun
                31, 28, 31, 30, 31, 30,
                // jul, ago, sep, oct, nov, dic
                31, 31, 30, 31, 30, 31
        };
        return dias[mes - 1];
    }

}
