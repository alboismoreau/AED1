package aed;

class ArregloRedimensionableDeRecordatorios {
private Recordatorio[] secuencia;

    public ArregloRedimensionableDeRecordatorios() {
       this.secuencia = new Recordatorio[0];
    }

    public int longitud() {
        return secuencia.length;
    }

    public void agregarAtras(Recordatorio i) {
        Recordatorio[] nuevaSecuencia = new Recordatorio[secuencia.length +1]; 
        
        for (int j =0; j < (secuencia.length);j++ ){
        nuevaSecuencia[j] = secuencia[j];
        } 
        nuevaSecuencia[secuencia.length]= i;
        secuencia = nuevaSecuencia;

    }


    public Recordatorio obtener(int i) {
        // Implementar
        return null;
    }

    public void quitarAtras() {
        // Implementar
    }

    public void modificarPosicion(int indice, Recordatorio valor) {
        // Implementar
    }

    public ArregloRedimensionableDeRecordatorios(ArregloRedimensionableDeRecordatorios vector) {
        // Implementar
    }

    public ArregloRedimensionableDeRecordatorios copiar() {
        // Implementar
        return null;
    }
}
