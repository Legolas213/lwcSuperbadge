public class SOAPCalloutImplementation {
    
    public static Double add(Double x, Double y) {
        SOAPCallout.CalculatorImplPort calculator = new SOAPCallout.CalculatorImplPort();
        return calculator.doAdd(x,y);
    }
    
}