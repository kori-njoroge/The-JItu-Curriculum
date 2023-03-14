import React, { useEffect, useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { addTocart } from '../redux/slices/productsSlice';
import { useDispatch } from 'react-redux';



export const ProductDetails = () => {
  const { product_id } = useParams()
  const [product, setproduct] = useState({});
  const navigate = useNavigate()
  const dispatch = useDispatch()
  const getSingleProduct = async()=>{
    
    let prod = await fetch(`https://fakestoreapi.com/products/${product_id}`).then(res=>res.json())
    setproduct(prod)
  }

  const handleGoBack=()=>{
    navigate(-1)
  }

  const handleAddToCart = ()=>{
    dispatch(addTocart(product))
  }

  useEffect(()=>{
    getSingleProduct()
  }, [])
  return (
      <div className="container-product-details">
        <button onClick={handleGoBack}>back</button>
        {!Object.keys(product) && "Product Loading..."}
              <div className='product-details'>
                    <img src={product.image} alt="" />
                    <div className="details">
                          <h4>{product.title}</h4>
                          <h6>{product.category}</h6>
                          <p>{product.description}</p>
                          <button onClick={handleAddToCart}>add cart</button>
                    </div>  
      </div>
    
    </div>
  )
}

