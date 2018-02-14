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
package Repository;

import Features.IFeature;
import Features.IOperation;
import Features.IUnderlying;
import Features.operations.IOperationProof;
import Features.operations.actions.IAction;
import Features.properties.IProperty;
import Token.IToken;
import Utilities.IAddress;
import java.util.Collection;
import java.util.Map;

/**
 * Communication with the Database. Needs to implement all functionalities for storing
 * and retrieving tokens and its features.
 * @author Mark C. Ballandies <bmark@ethz.ch>
 */
public interface IRepository<T extends IToken> {
   
    /**
     * Saves a token to Repository. 
     * Returns the unique ID of the Token in Repository
     * @param token 
     * @return uniqueID
     */
    public long store(T token);
    
    /**
     * Save a new token to database, having the provided features.
     * @param features
     * @return 
     */
    public T crateNewToken(Collection<IFeature> features);
    
    /**
     * Obtain Token
     * @param uniqueID
     * @return 
     */
    public T fetchToken(long uniqueID);
    
    /**
     * Return all Tokens in database
     * @return 
     */
    public Collection<T> getAllTokens();
    
    /**
     * Get all operations associated with a Token
     * @param token
     * @return 
     */
    public Collection<IOperation> getOperations(T token);
    /**
     * Get all Underlyings associated with a Token
     * @param token
     * @return 
     */
    public Collection<IUnderlying> getUnderlyings(T token);
    /**
     * Get all Properties associated with a Token
     * @param token
     * @return 
     */
    public Collection<IProperty> getProperties(T token);
    
    
    /**
     * Get all Features making up the Token
     * @param token
     * @return 
     */
    public Collection<IFeature> getFeatures(T token);
    
    /**
     * Get the total amount of Tokens currently in circulations. 
     * @param token
     * @return 
     */
    public int getCurrentTotalSupply(T token);
    /**
     * Obtain the amount of tokens at this address
     * @param token
     * @param addr
     * @return 
     */
    public int getBalanceOf(T token, IAddress addr);
    /**
     * Get all balances of addresses
     * @param token
     * @return 
     */
    Map<IAddress, Integer> getAllBalances(T token);
          
    /**
     * Stores action to database. I.e. value (trans)action
     * Returns true if action is stored or is already existent in database.
     * @param action
     * @param proof
     * @return 
     */
    boolean store(IAction action, IOperationProof proof);
    
    /**
     * Returns true if action is already contained in database
     * @param action
     * @return 
     */
    boolean contains(IAction action);
          
}
