/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Token.basic;


import Features.properties.IProperty;
import Features.IUnderlying;
import Token.IToken;
import Utilities.IAddress;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import Features.IOperation;
import Features.operations.IClaim;
import Features.operations.IProof;
import Features.properties.EPropertyCategory;
import Features.properties.basic.ABasicProperty;
import Features.properties.basic.DecimalsProperty;
import Features.properties.basic.EBasicProperty;
import Features.properties.basic.GeneralSupplyProperty;
import Features.properties.basic.GenesisSupplyProperty;
import Features.properties.basic.NameProperty;
import Features.properties.basic.SymbolProperty;
import java.beans.IndexedPropertyChangeEvent;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;
import Repository.IRepository;

/**
 *
 * @author mcb
 */
public class BasicToken<A extends IOperation, P extends IProperty,U extends IUnderlying> implements IToken<U,P,A>{
    
  
    protected long uniqueID;
    protected IRepository repository;
    
    Set<A> operations;
    Set<P> properties;
    Set<U> underlyings;
   
    DecimalsProperty decimalsP;
    GeneralSupplyProperty generalSupplyP;
    GenesisSupplyProperty genesisSupplyP;
    NameProperty nameP;
    SymbolProperty symbolP;
    

    public BasicToken(long uniqueID, IRepository repository){
        this.uniqueID = uniqueID;
        this.repository = repository;
        this.operations = new HashSet(repository.getOperations(this));
        this.properties = new HashSet(repository.getProperties(this));
        this.underlyings= new HashSet(repository.getUnderlyings(this));
        initialiseBasicProperties();
        
    }
    
    public BasicToken(Collection<A> incetnivizedBehaviors, Collection<P> properties, 
            Collection<U> underlyings, IRepository repo){
        this.operations= new HashSet<>(incetnivizedBehaviors);
        this.properties = new HashSet<>(properties);
        this.underlyings = new HashSet<>(underlyings);
        this.repository = repo;
        initialiseBasicProperties();
        
        this.uniqueID = this.repository.store(this);
    }
    
     protected void initialiseBasicProperties(){
        
        HashSet<IProperty> toRemove = new HashSet<>();
         
        for(IProperty property : this.properties){
            if(property.getCategory().equals(EPropertyCategory.Basic)){
                switch(((ABasicProperty) property).getBasicPropertyType()){
                    case NAME:
                        this.nameP = (NameProperty) property;
                  //      toRemove.add(property);
                        break;
                    case SYMBOL:
                        this.symbolP = (SymbolProperty) property;
                //        toRemove.add(property);
                        break;
                    case GENERAL_SUPPLY:
                        this.generalSupplyP = (GeneralSupplyProperty) property;
              //          toRemove.add(property);
                        break;
                    case GENESIS_SUPPLY:
                        this.genesisSupplyP = (GenesisSupplyProperty) property;
            //            toRemove.add(property);
                        break;
                    case DECIMALS:
                        this.decimalsP = (DecimalsProperty) property;
          //              toRemove.add(property);
                        break;
                    default:             
                }
            }
        }
        //this.properties.removeAll(toRemove);
    }
    
     /*
      * Basic Properties 
      * Getter
      * 
      */

    @Override
    public long getUniqueID() {
        return this.uniqueID;
    }
     
     
    @Override
    public String getName() {
        return nameP.getProperty();
    }
    @Override
    public int getDecimals() {
        return decimalsP.getProperty();
    }
    @Override
    public String getSymbol() {
       return symbolP.getProperty();
    }
    @Override
    public boolean isCapped() {
        return generalSupplyP.isCapped();
    }
    @Override
    public boolean preMined() {
        return genesisSupplyP.pre_mined();
    }
    @Override
    public int preMinedAmount() {
        return genesisSupplyP.getProperty();
    }
    @Override
    public int cappedAmount() {
        return generalSupplyP.getProperty();
    }
     /*
        FEATURES
        Getter
    */
    @Override
    public Collection<U> getUnderlyings() {
       return this.underlyings;
    }

    @Override
    public Collection<P> getProperties() {
        return this.properties;
    }

    @Override
    public Collection<A> getOperations() {
        return this.operations;
    }
    
    /*
    * Currency Methods
    */
    @Override
    public int getBalanceOf(IAddress addr) {
        return this.repository.getBalanceOf(this, addr);
    }
     @Override
    public int getTotalSupply() {
        return this.repository.getCurrentTotalSupply(this);
    }
    @Override
    public Map<IAddress, Integer> getAllBalances() {
        return this.repository.getAllBalances(this);
    }

    @Override
    public boolean addClaim(IClaim claim) {
        boolean successfullClaimed = false;
        for(IOperation operation : this.operations){
            successfullClaimed = operation.write(this,claim) || successfullClaimed;
        }
        return successfullClaimed;
    }
    
    
    
}
