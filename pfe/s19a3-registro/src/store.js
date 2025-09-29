import { configureStore } from '@reduxjs/toolkit';
import todosReducer from './todosSlice';
import createSagaMiddleware from 'redux-saga';
import rootSaga from './sagas'; // Importe as sagas

const sagaMiddleware = createSagaMiddleware();

const store = configureStore({
  reducer: {
    todos: todosReducer,
  },
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware().concat(sagaMiddleware), // Adicione o middleware saga
});

sagaMiddleware.run(rootSaga); // Execute as sagas

export default store;
