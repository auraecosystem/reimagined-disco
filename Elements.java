// Class Element

package dk.cbs.inf.ds.lifo;

public class Element {
  public void push(Stack s) {
    Element x = s.top;
    next = s.top;
    s.top = this; 
  };
  Element next;
}
