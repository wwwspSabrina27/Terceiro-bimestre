
import { takeEvery, put } from 'redux-saga/effects';
import { addTodo } from './todosSlice';

function* watchAddTodo(action) {
  console.log('Tarefa adicionada:', action.payload);
}

function* rootSaga() {
  yield takeEvery(addTodo.type, watchAddTodo);
}

export default rootSaga;
