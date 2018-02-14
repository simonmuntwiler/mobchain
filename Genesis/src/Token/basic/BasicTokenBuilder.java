/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Token.basic;

import Features.properties.IProperty;
import Features.IUnderlying;
import Features.factories.FeatureFactory;
import Token.AbstractTokenBuilder;
import Features.IOperation;
import Repository.IRepository;


/**
 *
 * @author mcb
 */
public class BasicTokenBuilder extends AbstractTokenBuilder<BasicToken>{

    
    public BasicTokenBuilder(FeatureFactory<IOperation> behaviorFactory, 
            FeatureFactory<IProperty> propertyFactory, 
            FeatureFactory<IUnderlying> underlyingFactory, IRepository<BasicToken> repo) {
        super(behaviorFactory, propertyFactory, underlyingFactory, repo);
    }

   
    @Override
    public BasicToken buildToken() {
        return new BasicToken(getBehaviors(), 
                getProperties(), 
                getUnderlyings(),this.repo);
    }
    
   
    
    
    
}
