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
package Token;

import Features.properties.IProperty;
import Features.IUnderlying;
import Features.factories.FeatureFactory;
import java.util.ArrayList;
import java.util.List;
import Features.IOperation;
import Repository.IRepository;


/**
 *
 * @author Mark C. Ballandies <bmark@ethz.ch>
 */
public abstract class AbstractTokenBuilder<T extends IToken> implements ITokenBuilder<T> {
    
    private FeatureFactory<IOperation> operationFactory;
    private FeatureFactory<IProperty> propertyFactory;
    private FeatureFactory<IUnderlying> underlyingFactory;
    
    protected IRepository<T> repo;
    
    List<IOperation> behaviors;
    List<IProperty> properties;
    List<IUnderlying> underlyings;
    
     public AbstractTokenBuilder(FeatureFactory<IOperation> behaviorFactory, 
            FeatureFactory<IProperty> propertyFactory, 
            FeatureFactory<IUnderlying> underlyingFactory, IRepository<T> repo){
        
        this.operationFactory = behaviorFactory;
        this.propertyFactory = propertyFactory;
        this.underlyingFactory=underlyingFactory;
        this.repo=repo;
        
    }

    @Override
    public void buildUnderlying() {
       this.underlyings = this.underlyingFactory.createFeatures();
    }

    @Override
    public void buildProperties() {
        this.properties = propertyFactory.createFeatures();
    }

    @Override
    public void buildOperations() {
        this.behaviors = this.operationFactory.createFeatures();
    }

    public void setBehaviorFactory(FeatureFactory<IOperation> behaviorFactory) {
        this.operationFactory = behaviorFactory;
    }

    public void setPropertyFactory(FeatureFactory<IProperty> propertyFactory) {
        this.propertyFactory = propertyFactory;
    }

    public void setUnderlyingFactory(FeatureFactory<IUnderlying> underlyingFactory) {
        this.underlyingFactory = underlyingFactory;
    }

    public List<IOperation> getBehaviors() {
        return checkNonNull(this.behaviors);
    }

    public List<IProperty> getProperties() {
        return checkNonNull(properties);
    }

    public List<IUnderlying> getUnderlyings() {
        return checkNonNull(underlyings);
    }
    
    
    private List checkNonNull(List list){
        if(list==null){
            return new ArrayList();
        }else{
            return list;
        }
    }    
     
    
     
    
}
