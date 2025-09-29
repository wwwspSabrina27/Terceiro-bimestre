
import React, { useState, useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { addTodo, removeTodo, fetchTodos } from './todosSlice';

const TodoList = () => {
  const [input, setInput] = useState('');
  const dispatch = useDispatch();
  const todos = useSelector((state) => state.todos.list);
  const loading = useSelector((state) => state.todos.loading);

  const handleAddTodo = () => {
    if (input.trim()) {
      dispatch(addTodo(input));
      setInput('');
    }
  };

  const handleRemoveTodo = (id) => {
    dispatch(removeTodo(id));
  };

  useEffect(() => {
    dispatch(fetchTodos());
  }, [dispatch]);

  return (
    <div>
      <h1>Lista de Tarefas</h1>
      <input
        type="text"
        value={input}
        onChange={(e) => setInput(e.target.value)}
        placeholder="Digite uma nova tarefa"
      />
      <button onClick={handleAddTodo}>Adicionar Tarefa</button>
      <button onClick={() => dispatch(fetchTodos())} disabled={loading}>
        {loading ? 'Carregando...' : 'Carregar Tarefas'}
      </button>
      {loading && <p>Carregando...</p>}
      <ul>
        {todos.map((todo) => (
          <li key={todo.id}>
            {todo.title}
            <button onClick={() => handleRemoveTodo(todo.id)}>Remover</button>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default TodoList;

