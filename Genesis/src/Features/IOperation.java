/*
 * FuturICT 2.0 is an international European Project funded under the FLAG-ERA 
 * Joint Transnational Call (JTC) 2016.
 * 
 * The project was inspired by the FuturICT Pilot, and its goal is to find ways to
 * understand and manage complex, global, socially interactive systems.
 * 
 * From financial crises to climate change, from crime and conflict to 
 * resource management: the world is currently facing grand social challenges 
 * that need to be addressed with new approaches and tools. 
 * FuturICT 2.0 aims to create an incentive system to take on some of 
 * the major challenges faced by modern society.$
 * 
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
package Features;

import Features.operations.IClaim;
import Features.operations.actions.IAction;
import Token.IToken;
import java.util.List;

/**
 * Operations a Token can perform. I.e. transaction of value
 * @author Mark C. Ballandies <bmark@ethz.ch>
 */
public interface IOperation extends IFeature{
    /**
     * Get all Actions,
     * @return 
     */
    List<IAction> getActions();
    
    /**
     * Obtain the next Action in order to perform the Operation.
     * @return 
     */
    IAction getNextAction();
    
    /**
     * Reset the Operation. 
     */
    void resetOperation();
    /**
     * Add the claim to the Token
     * @param token
     * @param claim
     * @return 
     */
    boolean write(IToken token, IClaim claim);
}
