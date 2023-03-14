import { createSlice, createAsyncThunk } from '@reduxjs/toolkit';

const state = {
      products: [],
      cart: [],
      product: {},
      loading: false,
      message: ""
}


export const fetchProducts = createAsyncThunk('products/fetch', async () => {
      return fetch("https://fakestoreapi.com/products").then(data => data.json())
})

const products = createSlice({
      name: 'productsSlice',
      initialState: state,
      reducers: {
            addTocart: (state, { payload }) => {
                  const cartItem = state.cart.find(item => item.id === payload.id)
                  cartItem && (cartItem.quantity = cartItem.quantity + 1)
                  !cartItem && state.cart.push({ ...payload, quantity: 1 })
            },
            deleteFromCart: (state, { payload }) => {
                  state.cart = state.cart.filter(cartItem => cartItem.id !== payload)
            },
            clearCart: (state) => {
                  state.cart = []
            },
            reduceQuantity: (state, { payload }) => {
                  state.cart.map(item => {
                        if (item.id === Number(payload)) {
                              return(item.quantity = item.quantity - 1)
                        }
                  })
            }
      },

      extraReducers: {
            [fetchProducts.pending]: (state, action) => {
                  state.loading = true;
            },

            [fetchProducts.fulfilled]: (state, action) => {
                  state.loading = false;
                  state.products = action.payload;
            }
      }
})

export const { addTocart, deleteFromCart, clearCart, reduceQuantity } = products.actions;

export default products.reducer