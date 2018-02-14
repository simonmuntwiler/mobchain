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
import Features.operations.actions.IAction;
import Features.operations.IProof;
import Features.operations.StandardClaim;
import Token.IToken;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 *
 * @author Mark C. Ballandies <bmark@ethz.ch>
 */
public class StandardObtainerManager implements IObtainerManager{

    Set<IToken> tokens; // Tokens handled by the Obtainer manager

    public StandardObtainerManager(Collection<IToken> tokens) {
        if(tokens!=null)
            this.tokens = new HashSet<>(tokens);
        else
            this.tokens = new HashSet<>();
    } 
    
    
    @Override
    public boolean claim(IAction task, IActionProof proof) {
       boolean successfulClaimed=false;
       for(IToken token: tokens){
           successfulClaimed= token.addClaim(new StandardClaim(task, proof)) || successfulClaimed;
       }
       return successfulClaimed;
    }

    @Override
    public List<IOperation> getOperations(IToken token) {
       if(tokens.contains(token)){
           return new ArrayList(token.getOperations());
       }else{
           return new ArrayList();
       }
    }

    @Override
    public List<IToken> getAllTokens() {
        return new ArrayList();
    }

    @Override
    public void addTokens(List<IToken> tokens) {
        if(tokens!=null)
            this.tokens.addAll(tokens);
    }

    @Override
    public void resetTokens(List<IToken> tokens) {
        if(tokens==null)
            tokens = new ArrayList<>();
        this.tokens.clear();
        this.tokens = this.tokens;
    }
    
    
    
    
}
