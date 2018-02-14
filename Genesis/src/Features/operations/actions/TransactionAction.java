/*
 * The MIT License
 * 
 * Copyright (c) 2018 FuturICT 2.0
 * 
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package Features.operations.actions;

import Token.IToken;
import Utilities.IAddress;

/**
 *
 * @author Mark C. Ballandies <bmark@ethz.ch>
 */
public class TransactionAction implements IAction{

    IAddress from;
    IAddress to;
    int value;
    IToken token;

    public TransactionAction() {
    }

    
    
    public TransactionAction(IAddress from, IAddress to, int value) {
        this();
        this.from = from;
        this.to = to;
        this.value = value;
    }

    
  
    /*
    GETTER & SETTER
     */
    public void setToken(IToken token) {
        this.token = token;
    }
      public IToken getToken() {  
        return token;
    }
    public IAddress getFrom() {
        return from;
    }

    public void setFrom(IAddress from) {
        this.from = from;
    }

    public IAddress getTo() {
        return to;
    }

    public void setTo(IAddress to) {
        this.to = to;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    @Override
    public EActionType getType() {
        return  EActionType.TRANSACTION;
    }
    
    
  
    
    
    
}
