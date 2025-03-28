package aed;

public class Recordatorio {
    private String mensaje;
    private Fecha fecha;
    private Horario horario;

    public Recordatorio(String mensaje, Fecha fecha, Horario horario) {
        this.mensaje=mensaje;
        this.fecha= new Fecha(fecha);
        this.horario=horario;
    }

    public Horario horario() {
        return this.horario;
    }

    public Fecha fecha() {
        return new Fecha(fecha); //para evitar aliasing cada vez poner new y el constructor
    }

    public String mensaje() {
        return this.mensaje;
    }

    @Override
    public String toString() {
        return this.mensaje+ " @ "+ fecha.toString() +" " + horario.toString();
    }

    @Override
    public boolean equals(Object otro) {
        boolean otroEsNull = (otro == null);
        boolean claseDistinta = (otro.getClass() != this.getClass());
        
        if (otroEsNull || claseDistinta)
            return false;
        

        Recordatorio otroRecordatorio = (Recordatorio) otro;

        return (this.mensaje.equals(otroRecordatorio.mensaje()) &&
                 this.fecha.equals(otroRecordatorio.fecha()) 
                && this.horario.equals(otroRecordatorio.horario()));
    }

}
