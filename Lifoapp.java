// Class LifoApp

package dk.cbs.inf.ds.lifo;

public class LifoApp {
  public static void main(String args[]) {
    System.out.println("Creating new stack");
    Stack s = new Stack();
    new Element().push(s);
    s.pop();
  };
}
