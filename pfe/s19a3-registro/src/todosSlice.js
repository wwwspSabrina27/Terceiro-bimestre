import { createSlice, createAsyncThunk } from '@reduxjs/toolkit';

// Thunk para simular a busca de tarefas (assíncrono)
export const fetchTodos = createAsyncThunk(
  'todos/fetchTodos',
  async () => {
    // Simula uma requisição a uma API
    await new Promise((resolve) => setTimeout(resolve, 1000));
    return [
      { id: 1, title: 'Comprar mantimentos', status: 'pendente' },
      { id: 2, title: 'Lavar o carro', status: 'pendente' },
    ];
  }
);

const todosSlice = createSlice({
  name: 'todos',
  initialState: {
    list: [],
    loading: false,
  },
  reducers: {
    addTodo: (state, action) => {
      state.list.push({ id: Date.now(), title: action.payload, status: 'pendente' });
    },
    removeTodo: (state, action) => {
      state.list = state.list.filter((todo) => todo.id !== action.payload);
    },
  },
  extraReducers: (builder) => {
    builder
      .addCase(fetchTodos.pending, (state) => {
        state.loading = true;
      })
      .addCase(fetchTodos.fulfilled, (state, action) => {
        state.loading = false;
        state.list = action.payload;
      })
      .addCase(fetchTodos.rejected, (state) => {
        state.loading = false;
        // Adicione tratamento de erro aqui, se necessário
      });
  },
});

export const { addTodo, removeTodo } = todosSlice.actions;
export default todosSlice.reducer;
