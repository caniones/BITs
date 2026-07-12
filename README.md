<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BITs - Bitácora de Órdenes de Trabajo</title>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; line-height: 1.6; color: #333; max-width: 800px; margin: 0 auto; padding: 20px; }
        h1 { color: #1a73e8; border-bottom: 2px solid #1a73e8; padding-bottom: 10px; }
        h2 { color: #202124; margin-top: 30px; border-bottom: 1px solid #f1f3f4; padding-bottom: 8px; }
        h3 { color: #1a73e8; }
        .tech-badge { background-color: #f1f3f4; color: #5f6368; padding: 5px 10px; border-radius: 4px; font-weight: bold; font-size: 0.9em; display: inline-block; margin-right: 10px; }
        .feature-card { background: #fff; border: 1px solid #dadce0; border-radius: 8px; padding: 15px; margin-bottom: 15px; box-shadow: 0 1px 2px 0 rgba(60,64,67,0.3); }
        .feature-title { font-weight: bold; color: #1a73e8; font-size: 1.1em; display: flex; align-items: center; }
        .feature-title span { margin-right: 10px; }
        ul { padding-left: 20px; }
        .alert-box { background-color: #e8f0fe; border-left: 4px solid #1a73e8; padding: 15px; border-radius: 0 4px 4px 0; margin: 20px 0; }
    </style>
</head>
<body>

    <h1>BITs - Bitácora de Órdenes de Trabajo 🛠️💻</h1>
    <p><strong>BITs</strong> es un sistema de escritorio diseñado exclusivamente para optimizar, organizar y acelerar la atención en talleres de servicio técnico de computadoras (PC y Notebooks). Funciona como un asistente digital que registra el historial de cada equipo desde que ingresa al taller hasta que se entrega reparado al cliente.</p>

    <div class="alert-box">
        <strong>🎯 El objetivo de BITs:</strong> Olvidate de los cuadernos y las anotaciones perdidas. Con BITs sabés exactamente qué le pasa a cada equipo, qué repuestos se usaron, cuánto tiempo llevó el trabajo y cuál es el estado de la reparación en tiempo real.
    </div>

    <h2>🛠️ Tecnologías que garantizan su funcionamiento</h2>
    <p>Para lograr un sistema rápido, liviano y seguro que no requiera computadoras potentes para funcionar, BITs utiliza:</p>
    <div>
        <span class="tech-badge">🖥️ Aplicación de Escritorio (Delphi)</span>
        <span class="tech-badge">📦 Motor de Base de Datos Seguro (PostgreSQL)</span>
        <span class="tech-badge">🔌 Conexión Estable de Datos (ZeosLib)</span>
    </div>

    <h2>🚀 ¿Qué podés hacer con BITs? (Funcionalidades)</h2>

    <div class="feature-card">
        <div class="feature-title"><span>👥</span> Gestión Integral de Clientes (ABM)</div>
        <p>Crea una base de datos unificada con las personas que confían en tu servicio.</p>
        <ul>
            <li>Dar de alta nuevos clientes con sus datos de contacto (Teléfono, Dirección, Correo electrónico).</li>
            <li>Agregar observaciones importantes sobre el cliente (ej: "Llamar solo por la tarde").</li>
            <li>Consultar rápidamente el historial de contacto y ver qué clientes están activos o de baja.</li>
        </ul>
    </div>

    <div class="feature-card">
        <div class="feature-title"><span>💻</span> Control Detallado de Equipos y Hardware</div>
        <p>Registrá de forma exacta el hardware que entra al taller para evitar confusiones y mantener la transparencia con el cliente.</p>
        <ul>
            <li>Vincular múltiples equipos a un mismo cliente.</li>
            <li>Clasificar por tipo (PC de escritorio o Notebook) y marca.</li>
            <li><strong>Ficha Técnica Específica:</strong> Almacena componentes clave como Procesador, Memoria RAM, Disco y Pantalla (en caso de notebooks) para saber exactamente qué especificaciones tiene el equipo antes de abrirlo.</li>
        </ul>
    </div>

    <div class="feature-card">
        <div class="feature-title"><span>📝</span> Bitácora y Órdenes de Trabajo (OT)</div>
        <p>El corazón del sistema. Controlá el flujo de reparaciones de manera cronológica.</p>
        <ul>
            <li>Generar una orden de ingreso detallando la falla que reporta el cliente de manera clara.</li>
            <li>Asignar una fecha y hora automática de recepción.</li>
        </ul>
    </div>

    <div class="feature-card">
        <div class="feature-title"><span>⏱️</span> Línea de Tiempo de Tareas Realizadas</div>
        <p>Los técnicos pueden documentar paso a paso el progreso del servicio técnico.</p>
        <ul>
            <li>Registrar cada acción realizada (ej: "Limpieza de coolers", "Instalación de Sistema Operativo").</li>
            <li>Medir el tiempo invertido en cada tarea específica.</li>
            <li>Actualizar el estado del trabajo para que todo el equipo sepa si está "En Diagnóstico", "Esperando Repuestos" o "Listo para entregar".</li>
        </ul>
    </div>

    <div class="feature-card">
        <div class="feature-title"><span>🔌</span> Control de Repuestos y Costos</div>
        <p>Evitá pérdidas económicas registrando cada componente invertido en el arreglo.</p>
        <ul>
            <li>Anotar los repuestos o insumos utilizados en la orden (ej: "Disco SSD 480GB", "Pasta térmica").</li>
            <li>Asignar el costo exacto de cada repuesto para calcular de manera transparente los gastos de la reparación.</li>
        </ul>
    </div>

    <h2>💡 Ventajas para tu Negocio</h2>
    <ul>
        <li><strong>Transparencia absoluta:</strong> Ante cualquier duda de un cliente, tenés la ficha de hardware exacta con la que ingresó el equipo.</li>
        <li><strong>Historial clínico de la PC:</strong> Si un equipo vuelve meses después, podés revisar la bitácora anterior para ver qué falla tuvo y qué repuestos se le cambiaron.</li>
        <li><strong>Mayor orden:</strong> Identificá al instante qué equipos urgen repararse y cuáles están listos para retirar, mejorando los tiempos de entrega.</li>
    </ul>

</body>
</html>
