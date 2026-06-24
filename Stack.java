// Class Stack

package dk.cbs.inf.ds.lifo;

public class Stack {
  public Element pop() {
    Element x = top;
    top = top.next;
    return x;
  };
  Element top;
}
