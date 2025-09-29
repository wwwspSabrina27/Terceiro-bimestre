import log from 'loglevel';
log.setLevel('info');

import React, { useEffect } from 'react';
import log from 'loglevel';

function App() {
    useEffect(() => {
        log.info('Aplicação iniciada'); // Log de nível informativo no início da aplicação
    }, []);

    return (
        <div>
            <h1>Aplicação de Monitoramento</h1>
        </div>
    );
}

export default App;

import * as Sentry from '@sentry/react';
import { BrowserTracing } from '@sentry/tracing';

Sentry.init({
    dsn: 'SEU_DSN_AQUI',
    integrations: [new BrowserTracing()],
    tracesSampleRate: 1.0,
});

export default Sentry.withProfiler(App);

import React, { useEffect } from 'react';
import * as Sentry from '@sentry/react';
import log from 'loglevel';

log.setLevel('info');

Sentry.init({
    dsn: 'SEU_DSN_AQUI',
    integrations: [new BrowserTracing()],
    tracesSampleRate: 1.0,
});

function App() {
    useEffect(() => {
        log.info('Aplicação iniciada');
    }, []);

    const simulateError = () => {
        try {
            throw new Error('Erro simulado para teste de monitoramento');
        } catch (error) {
            log.error('Erro capturado:', error);
            Sentry.captureException(error);
        }
    };

    return (
        <div>
            <h1>Aplicação de Monitoramento</h1>
            <button onClick={simulateError}>Simular Erro</button>
        </div>
    );
}

export default Sentry.withProfiler(App);



