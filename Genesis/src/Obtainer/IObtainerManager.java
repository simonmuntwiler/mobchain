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
package Obtainer;

import Features.IOperation;
import Features.operations.IActionProof;
import Features.operations.IProof;
import Token.IToken;
import java.util.List;
import Features.operations.actions.IAction;

/**
 * 
 * @author Mark C. Ballandies <bmark@ethz.ch>
 */
public interface IObtainerManager {
    
    /**
     * Claim the action. Provide a proof if needed.
     * @param action
     * @param proof
     * @return 
     */
    boolean claim(IAction action, IActionProof proof);
    /**
     * Get all operations a specific Token can perform.
     * @param token
     * @return 
     */
    List<IOperation> getOperations(IToken token);
    /**
     * Get all Tokens inside the Obtainer Manager. 
     * @return 
     */
    List<IToken> getAllTokens();
    
    /**
     * The the tokens to the obtainer manager
     * @param tokens 
     */
    void addTokens(List<IToken> tokens);
    /**
     * Replace Tokens of the ObtainerManager with @tokens.
     * @param tokens 
     */
    void resetTokens(List<IToken> tokens);
    
}
