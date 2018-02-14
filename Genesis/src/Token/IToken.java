/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Token;

import Features.properties.IProperty;
import Features.IUnderlying;
import Utilities.IAddress;
import java.util.Map;
import Features.IOperation;
import Features.operations.IClaim;
import java.util.Collection;

/**
 * Functionalities of a Token
 * @author mcb
 */
public interface IToken<U extends IUnderlying, P extends IProperty, B extends IOperation> {
    
   /**
    * Obtain the uniqueID of this token inside the database
    * @return 
    */
   public long getUniqueID(); 
   
   /**
    * Description of the Token.
    * @return 
    */
   public String getName();
   /**
    * Decimals of the token. The zeros behind the dot. I.e. euro has two ecimals
    * (100 cents) 
    * @return 
    */
   public int getDecimals();
   /**
    * Simple String representation of the token. I.e. BTC is bitcoins symbol.
    * @return 
    */
   public String getSymbol();
   /**
    * Return the total amount of tokens currently in circulations. 
    * @return 
    */
   public int getTotalSupply();
   /**
    * Does the token have a fixed supply (even if not reached yet). I.e. bitcoin
    * has a cap of 21 million tokens.
    * @return 
    */
   public boolean isCapped();
   /**
    * Is the token premined? Returns true if so.
    * @return 
    */
   public boolean preMined();
   /**
    * Return the premined amount of tokens
    * @return 
    */
   public int preMinedAmount();
   /**
    * Return the supply cap. I.e. Bitcoin has a supply cap of 21 million tokens
    * @return 
    */
   public int cappedAmount();
   
   /**
    * Get the amount of tokens in the address
    * @param addr
    * @return 
    */
   public int getBalanceOf(IAddress addr);
   public Map<IAddress,Integer> getAllBalances();
   
   //public boolean transfer(IAddress from, IAddress to, int value);
   
   /**
    * Underlyings of the Token
    * @return 
    */
   Collection<U> getUnderlyings();
   /**
    * Properties of the Token
    * @return 
    */
   Collection<P> getProperties();
   /**
    * Operations of the Token
    * @return 
    */
   Collection<B> getOperations();
   /**
    * Add a claim to the Token. I.e. a claim of a transaction.
    * @param claim
    * @return 
    */
   boolean addClaim(IClaim claim);
   
      
   
}
