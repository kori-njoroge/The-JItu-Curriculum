import React from 'react'
import { useDispatch, useSelector } from 'react-redux'
import { deleteFromCart, clearCart, reduceQuantity } from '../redux/slices/productsSlice'

export default function CartPage() {
    const dispatch = useDispatch()


    const cart = useSelector(state => state.cart)
    console.log(cart);

    function handleRemovalFromCard(id) {
        console.log(id)
        dispatch(deleteFromCart(id))
    }

    return (
        <div className='cartPage'>
            <div className="topLevel">
                <button className='clearcart' onClick={() => {
                    const a = window.confirm('This action cannot be undone')
                    if (a) dispatch(clearCart())
                }}>clear cart</button>
                <table>
                    <thead>
                        <th>#</th>
                        <th>Item Name</th>
                        {/* <th>Description</th> */}
                        <th>Quantity</th>
                        <th>Amount</th>
                        <th>Total</th>
                        <th></th>
                        <th></th>
                    </thead>
                    <tbody>
                        {cart && cart.map((item, index) => (
                            <tr key={item.id}>
                                <td>{index + 1}</td>
                                <td>{item.title}</td>
                                {/* <td>{item.description}</td> */}
                                <td>{item.quantity ? item.quantity : dispatch(deleteFromCart(item.id))}</td>
                                <td>{item.price}</td>
                                <td>{Math.floor(Number(item.quantity) * Number(item.price))}</td>
                                <td><button className='ops' onClick={() => {
                                    dispatch(reduceQuantity(item.id))
                                }}>Reduce Quantity</button></td>
                                <td><button className='ops' onClick={() => { handleRemovalFromCard(item.id) }}>Remove</button></td>
                            </tr>
                        ))}
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>Grand Total</td>
                            <td>
                                {cart.length > 0 ?cart.reduce((accumulator, currentValue) => accumulator + (Number(currentValue?.quantity) * Number(currentValue?.price)), 0) : 0}
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    )
}
