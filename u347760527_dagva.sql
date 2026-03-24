-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 24-03-2026 a las 00:19:34
-- Versión del servidor: 11.8.3-MariaDB-log
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u347760527_dagva`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `descripcion` varchar(180) DEFAULT '',
  `estado` enum('activa','inactiva') NOT NULL DEFAULT 'activa',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cajas`
--

INSERT INTO `cajas` (`id`, `nombre`, `descripcion`, `estado`, `created_at`) VALUES
(1, 'Caja Principal', 'Caja base para operar el POS web', 'activa', '2026-03-18 11:19:21'),
(2, 'Caja 1', 'Caja1', 'activa', '2026-03-21 23:10:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja_aperturas`
--

CREATE TABLE `caja_aperturas` (
  `id` int(11) NOT NULL,
  `caja_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL DEFAULT 0,
  `fecha_apertura` date DEFAULT NULL,
  `hora_apertura` time DEFAULT NULL,
  `base_inicial` decimal(14,2) NOT NULL DEFAULT 0.00,
  `total_sistema_efectivo` decimal(14,2) NOT NULL DEFAULT 0.00,
  `total_fisico_efectivo` decimal(14,2) NOT NULL DEFAULT 0.00,
  `diferencia` decimal(14,2) NOT NULL DEFAULT 0.00,
  `tipo_arqueo` enum('ciego','abierto') DEFAULT NULL,
  `fecha_cierre` date DEFAULT NULL,
  `hora_cierre` time DEFAULT NULL,
  `estado` enum('abierta','cerrada') NOT NULL DEFAULT 'abierta',
  `observaciones` text DEFAULT NULL,
  `observaciones_cierre` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `caja_aperturas`
--

INSERT INTO `caja_aperturas` (`id`, `caja_id`, `usuario_id`, `fecha_apertura`, `hora_apertura`, `base_inicial`, `total_sistema_efectivo`, `total_fisico_efectivo`, `diferencia`, `tipo_arqueo`, `fecha_cierre`, `hora_cierre`, `estado`, `observaciones`, `observaciones_cierre`, `created_at`) VALUES
(1, 1, 1, '2026-03-18', '11:22:23', 50000.00, 50000.00, 50000.00, 0.00, 'ciego', '2026-03-18', '16:11:52', 'cerrada', NULL, NULL, '2026-03-18 11:22:23'),
(2, 1, 1, '2026-03-18', '16:45:42', 0.00, 0.00, 0.00, 0.00, 'abierto', '2026-03-18', '17:55:31', 'cerrada', NULL, NULL, '2026-03-18 16:45:42'),
(3, 1, 1, '2026-03-18', '17:56:01', 0.00, 17500.00, 19300.00, 1800.00, 'ciego', '2026-03-18', '22:26:26', 'cerrada', NULL, NULL, '2026-03-18 17:56:01'),
(4, 1, 1, '2026-03-19', '18:26:14', 0.00, 0.00, 0.00, 0.00, 'ciego', '2026-03-21', '14:34:21', 'cerrada', NULL, NULL, '2026-03-19 18:26:14'),
(5, 1, 1, '2026-03-21', '14:35:39', 10000.00, 10700.00, 0.00, -10700.00, 'ciego', '2026-03-21', '17:55:11', 'cerrada', NULL, NULL, '2026-03-21 14:35:39'),
(6, 1, 3, '2026-03-21', '19:50:18', 10000.00, 12100.00, 12100.00, 0.00, 'ciego', '2026-03-21', '19:57:50', 'cerrada', NULL, NULL, '2026-03-21 19:50:18'),
(7, 1, 1, '2026-03-21', '20:05:17', 0.00, 51400.00, 51400.00, 0.00, 'ciego', '2026-03-23', '23:46:33', 'cerrada', NULL, NULL, '2026-03-21 20:05:17'),
(8, 2, 3, '2026-03-22', '10:58:54', 10000.00, 10000.00, 0.00, -10000.00, 'ciego', '2026-03-22', '11:16:46', 'cerrada', NULL, NULL, '2026-03-22 10:58:54'),
(9, 2, 3, '2026-03-22', '11:25:58', 10000.00, 12400.00, 12400.00, 0.00, 'ciego', '2026-03-22', '11:47:58', 'cerrada', NULL, NULL, '2026-03-22 11:25:58'),
(10, 2, 3, '2026-03-22', '11:57:33', 0.00, 0.00, 0.00, 0.00, 'ciego', '2026-03-22', '11:59:01', 'cerrada', NULL, NULL, '2026-03-22 11:57:33'),
(11, 2, 3, '2026-03-22', '12:05:47', 0.00, 0.00, 0.00, 0.00, 'ciego', '2026-03-22', '12:06:00', 'cerrada', NULL, NULL, '2026-03-22 12:05:47'),
(12, 2, 3, '2026-03-22', '12:06:13', 0.00, 2800.00, 2800.00, 0.00, 'ciego', '2026-03-22', '12:07:27', 'cerrada', NULL, NULL, '2026-03-22 12:06:13'),
(13, 2, 1, '2026-03-23', '23:46:50', 10000.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'abierta', NULL, NULL, '2026-03-23 23:46:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja_arqueos`
--

CREATE TABLE `caja_arqueos` (
  `id` int(11) NOT NULL,
  `apertura_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL DEFAULT 0,
  `efectivo_sistema` decimal(14,2) NOT NULL DEFAULT 0.00,
  `efectivo_fisico` decimal(14,2) NOT NULL DEFAULT 0.00,
  `diferencia` decimal(14,2) NOT NULL DEFAULT 0.00,
  `observaciones` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja_movimientos`
--

CREATE TABLE `caja_movimientos` (
  `id` int(11) NOT NULL,
  `apertura_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL DEFAULT 0,
  `tipo` enum('ingreso','egreso') NOT NULL DEFAULT 'ingreso',
  `categoria` varchar(120) DEFAULT '',
  `concepto` varchar(180) NOT NULL,
  `valor` decimal(14,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cartera_abonos`
--

CREATE TABLE `cartera_abonos` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `apertura_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL DEFAULT 0,
  `medio_pago_id` int(11) DEFAULT NULL,
  `medio_pago_codigo` varchar(40) NOT NULL DEFAULT 'EFECTIVO',
  `nombre_medio` varchar(120) DEFAULT NULL,
  `valor` decimal(14,2) NOT NULL DEFAULT 0.00,
  `saldo_anterior` decimal(14,2) NOT NULL DEFAULT 0.00,
  `saldo_nuevo` decimal(14,2) NOT NULL DEFAULT 0.00,
  `referencia` varchar(120) DEFAULT '',
  `numero_recibo` varchar(40) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'aplicado',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cartera_abonos`
--

INSERT INTO `cartera_abonos` (`id`, `cliente_id`, `apertura_id`, `usuario_id`, `medio_pago_id`, `medio_pago_codigo`, `nombre_medio`, `valor`, `saldo_anterior`, `saldo_nuevo`, `referencia`, `numero_recibo`, `observaciones`, `estado`, `created_at`) VALUES
(1, 1, 7, 3, 1, 'EFECTIVO', 'Efectivo', 25000.00, 50000.00, 25000.00, 'ABN000001', 'ABN000001', NULL, 'aplicado', '2026-03-22 10:55:15'),
(2, 1, 7, 3, 1, 'EFECTIVO', 'Efectivo', 25000.00, 25000.00, 0.00, 'ABN000002', 'ABN000002', NULL, 'aplicado', '2026-03-22 10:55:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `cliente_tipo` enum('natural','juridico') NOT NULL DEFAULT 'natural',
  `segmento_id` int(11) DEFAULT NULL,
  `tipo_documento` varchar(20) NOT NULL DEFAULT 'CC',
  `numero_documento` varchar(40) NOT NULL,
  `dv` varchar(10) DEFAULT '',
  `nombres` varchar(120) DEFAULT '',
  `apellidos` varchar(120) DEFAULT '',
  `razon_social` varchar(180) DEFAULT '',
  `nombre_comercial` varchar(180) DEFAULT '',
  `correo` varchar(150) DEFAULT '',
  `telefono` varchar(50) DEFAULT '',
  `celular` varchar(50) DEFAULT '',
  `fecha_nacimiento` date DEFAULT NULL,
  `direccion` varchar(200) DEFAULT '',
  `ciudad` varchar(100) DEFAULT '',
  `departamento` varchar(100) DEFAULT '',
  `pais` varchar(100) DEFAULT 'Colombia',
  `permite_credito` tinyint(1) NOT NULL DEFAULT 0,
  `cupo_credito` decimal(14,2) NOT NULL DEFAULT 0.00,
  `dias_plazo` int(11) NOT NULL DEFAULT 0,
  `saldo_credito` decimal(14,2) NOT NULL DEFAULT 0.00,
  `mora_dias` int(11) NOT NULL DEFAULT 0,
  `bloqueado_credito` tinyint(1) NOT NULL DEFAULT 0,
  `motivo_bloqueo` varchar(220) DEFAULT '',
  `participa_fidelizacion` tinyint(1) NOT NULL DEFAULT 0,
  `puntos_acumulados` decimal(14,2) NOT NULL DEFAULT 0.00,
  `puntos_por_cada` int(11) NOT NULL DEFAULT 1,
  `monto_base_puntos` decimal(14,2) NOT NULL DEFAULT 100.00,
  `precios_diferenciales` tinyint(1) NOT NULL DEFAULT 0,
  `lista_precio_preferida` varchar(80) DEFAULT '',
  `es_exento_impuestos` tinyint(1) NOT NULL DEFAULT 0,
  `es_empleado` tinyint(1) NOT NULL DEFAULT 0,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `observaciones` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `cliente_tipo`, `segmento_id`, `tipo_documento`, `numero_documento`, `dv`, `nombres`, `apellidos`, `razon_social`, `nombre_comercial`, `correo`, `telefono`, `celular`, `fecha_nacimiento`, `direccion`, `ciudad`, `departamento`, `pais`, `permite_credito`, `cupo_credito`, `dias_plazo`, `saldo_credito`, `mora_dias`, `bloqueado_credito`, `motivo_bloqueo`, `participa_fidelizacion`, `puntos_acumulados`, `puntos_por_cada`, `monto_base_puntos`, `precios_diferenciales`, `lista_precio_preferida`, `es_exento_impuestos`, `es_empleado`, `estado`, `observaciones`, `created_at`, `updated_at`) VALUES
(1, 'natural', 1, 'CC', '1000123456', '', 'María', 'Gómez', '', 'María Gómez', 'maria@example.com', '6025552000', '3005550101', '1990-05-15', 'Calle 8 # 15-20', 'Dagua', 'Valle del Cauca', 'Colombia', 1, 300000.00, 15, 2100.00, 0, 0, '', 1, 229.00, 1, 100.00, 1, 'Club', 0, 0, 'activo', 'Cliente demo para probar cartera, fidelización y búsqueda por documento.', '2026-03-18 10:27:12', '2026-03-22 11:47:05'),
(2, 'natural', 1, 'CC', '100225489', '4', 'Carlos', 'Perez', NULL, NULL, 'H@gmail.com', '3214578962', '3214578962', '2007-03-21', 'Cl. 15 # 21 -06', 'Dagua', 'valle', 'Colombia', 1, 500000.00, 30, 2800.00, 0, 0, NULL, 1, 62.00, 1, 100.00, 1, 'detal', 1, 0, 'activo', NULL, '2026-03-21 17:57:50', '2026-03-24 00:18:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_abonos`
--

CREATE TABLE `cliente_abonos` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `apertura_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL DEFAULT 0,
  `medio_pago_id` int(11) DEFAULT NULL,
  `codigo_medio` varchar(40) NOT NULL,
  `nombre_medio` varchar(120) NOT NULL,
  `valor` decimal(14,2) NOT NULL DEFAULT 0.00,
  `saldo_anterior` decimal(14,2) NOT NULL DEFAULT 0.00,
  `saldo_nuevo` decimal(14,2) NOT NULL DEFAULT 0.00,
  `referencia` varchar(120) DEFAULT '',
  `numero_recibo` varchar(40) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `estado` enum('aplicado','anulado') NOT NULL DEFAULT 'aplicado',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_puntos_movimientos`
--

CREATE TABLE `cliente_puntos_movimientos` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `fecha_movimiento` date NOT NULL,
  `tipo_movimiento` enum('acumulacion','redencion','ajuste') NOT NULL DEFAULT 'ajuste',
  `puntos` decimal(14,2) NOT NULL DEFAULT 0.00,
  `saldo_posterior` decimal(14,2) NOT NULL DEFAULT 0.00,
  `referencia` varchar(120) DEFAULT '',
  `observacion` varchar(255) DEFAULT '',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cliente_puntos_movimientos`
--

INSERT INTO `cliente_puntos_movimientos` (`id`, `cliente_id`, `fecha_movimiento`, `tipo_movimiento`, `puntos`, `saldo_posterior`, `referencia`, `observacion`, `created_at`) VALUES
(1, 1, '2026-03-18', 'acumulacion', 120.00, 120.00, 'CARGA DEMO', 'Puntos iniciales del cliente demo.', '2026-03-18 10:27:12'),
(2, 1, '2026-03-18', 'acumulacion', 60.00, 180.00, 'FEV000002', 'Acumulación por venta', '2026-03-18 20:36:40'),
(3, 2, '2026-03-22', 'acumulacion', 14.00, 14.00, 'POS000011', 'Acumulación por compra', '2026-03-22 00:24:31'),
(4, 2, '2026-03-22', 'acumulacion', 14.00, 28.00, 'POS000013', 'Acumulación por compra', '2026-03-22 11:08:07'),
(5, 2, '2026-03-22', 'acumulacion', 14.00, 42.00, 'POS000014', 'Acumulación por compra', '2026-03-22 11:27:41'),
(6, 1, '2026-03-22', 'acumulacion', 21.00, 201.00, 'POS000015', 'Acumulación por compra', '2026-03-22 11:34:05'),
(7, 1, '2026-03-22', 'acumulacion', 28.00, 229.00, 'POS000016', 'Acumulación por compra', '2026-03-22 11:47:05'),
(8, 2, '2026-03-24', 'acumulacion', 20.00, 62.00, 'FEV000003', 'Acumulación por compra', '2026-03-24 00:18:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_segmentos`
--

CREATE TABLE `cliente_segmentos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `descripcion` varchar(255) DEFAULT '',
  `lista_precio_sugerida` varchar(80) DEFAULT '',
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cliente_segmentos`
--

INSERT INTO `cliente_segmentos` (`id`, `nombre`, `descripcion`, `lista_precio_sugerida`, `estado`, `created_at`) VALUES
(1, 'Cliente Frecuente', 'Cliente de compra recurrente para fidelización y campañas.', 'Detal', 'activo', '2026-03-18 10:27:12'),
(2, 'Distribuidor', 'Cliente de volumen o canal mayorista.', 'Mayorista', 'activo', '2026-03-18 10:27:12'),
(3, 'Restaurante', 'Cliente institucional para ventas al por mayor o suministros.', 'Mayorista', 'activo', '2026-03-18 10:27:12'),
(4, 'Empleado', 'Cliente interno con condiciones especiales o beneficios.', 'Interna', 'activo', '2026-03-18 10:27:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `proveedor_id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `numero_factura` varchar(80) NOT NULL,
  `fecha_factura` date NOT NULL,
  `fecha_recepcion` date NOT NULL,
  `remision` varchar(80) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `archivo_soporte` varchar(255) DEFAULT NULL,
  `estado` varchar(30) NOT NULL DEFAULT 'borrador',
  `total_bruto` decimal(14,2) NOT NULL DEFAULT 0.00,
  `total_descuento` decimal(14,2) NOT NULL DEFAULT 0.00,
  `total_impuesto` decimal(14,2) NOT NULL DEFAULT 0.00,
  `total_neto` decimal(14,2) NOT NULL DEFAULT 0.00,
  `creado_por` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_detalle`
--

CREATE TABLE `compra_detalle` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `compra_id` bigint(20) UNSIGNED NOT NULL,
  `producto_id` bigint(20) UNSIGNED DEFAULT NULL,
  `codigo` varchar(80) DEFAULT NULL,
  `descripcion` varchar(255) NOT NULL,
  `cantidad` decimal(14,2) NOT NULL DEFAULT 0.00,
  `costo_unitario` decimal(14,2) NOT NULL DEFAULT 0.00,
  `descuento` decimal(14,2) NOT NULL DEFAULT 0.00,
  `impuesto` decimal(14,2) NOT NULL DEFAULT 0.00,
  `total_linea` decimal(14,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_recepciones`
--

CREATE TABLE `compra_recepciones` (
  `id` int(11) NOT NULL,
  `orden_id` int(11) NOT NULL,
  `numero` varchar(30) NOT NULL,
  `fecha_recepcion` date NOT NULL,
  `factura_proveedor` varchar(60) DEFAULT NULL,
  `fecha_factura` date DEFAULT NULL,
  `numero_remision` varchar(60) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `total_recibido` decimal(14,2) NOT NULL DEFAULT 0.00,
  `recibido_por` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_recepcion_detalle`
--

CREATE TABLE `compra_recepcion_detalle` (
  `id` int(11) NOT NULL,
  `recepcion_id` int(11) NOT NULL,
  `orden_detalle_id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `descripcion` varchar(220) NOT NULL,
  `cantidad_pedida` decimal(14,2) NOT NULL DEFAULT 0.00,
  `cantidad_recibida` decimal(14,2) NOT NULL DEFAULT 0.00,
  `costo_unitario` decimal(14,2) NOT NULL DEFAULT 0.00,
  `subtotal` decimal(14,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion_backup_log`
--

CREATE TABLE `configuracion_backup_log` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `tipo_respaldo` varchar(30) NOT NULL DEFAULT 'manual',
  `archivo` varchar(255) DEFAULT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'ok',
  `observacion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion_balanzas`
--

CREATE TABLE `configuracion_balanzas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `marca` varchar(80) DEFAULT NULL,
  `modelo` varchar(80) DEFAULT NULL,
  `tipo_conexion` varchar(40) NOT NULL DEFAULT 'red',
  `host_ip` varchar(120) DEFAULT NULL,
  `puerto` varchar(40) DEFAULT NULL,
  `ruta_com` varchar(80) DEFAULT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'activo',
  `observacion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion_general`
--

CREATE TABLE `configuracion_general` (
  `id` int(11) NOT NULL,
  `clave` varchar(120) NOT NULL,
  `valor` text DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `configuracion_general`
--

INSERT INTO `configuracion_general` (`id`, `clave`, `valor`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'pos.ticket_mm', '80', 'Ancho ticket mm', '2026-03-21 23:30:41', '2026-03-21 23:30:41'),
(2, 'pos.corte', 'no', 'Corte automático', '2026-03-21 23:30:41', '2026-03-21 23:30:41'),
(3, 'pos.pie', 'Gracias por su compra', 'Pie de ticket', '2026-03-21 23:30:41', '2026-03-21 23:30:41'),
(4, 'negocio.razon_social', NULL, 'Razón social', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(5, 'negocio.documento', NULL, 'Documento / NIT', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(6, 'negocio.telefono', NULL, 'Teléfono', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(7, 'negocio.correo', NULL, 'Correo', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(8, 'negocio.direccion', NULL, 'Dirección', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(9, 'negocio.logo', '/assets/img/logo.png', 'Ruta logo', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(10, 'fiscal.prefijo', NULL, 'Prefijo facturación', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(11, 'fiscal.resolucion', NULL, 'Resolución', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(12, 'fiscal.iva_default', '19%', 'IVA por defecto', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(13, 'pos.caja_default', NULL, 'Caja por defecto', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(14, 'pos.impresora', 'Jaltec 80 mm', 'Impresora', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(15, 'pos.formato', 'ticket', 'Formato impresión', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(16, 'pos.permitir_espera', 'si', 'Permitir ventas en espera', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(20, 'pos.ticket_extra', 'Conserve este comprobante', 'Mensaje adicional ticket', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(21, 'pos.encabezado_1', NULL, 'Encabezado ticket 1', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(22, 'pos.encabezado_2', NULL, 'Encabezado ticket 2', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(23, 'pos.ticket_titulo', 'Factura Pos', 'Título ticket', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(24, 'pos.mostrar_logo', 'si', 'Mostrar logo', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(25, 'pos.mostrar_cliente', 'si', 'Mostrar cliente', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(26, 'pos.mostrar_cajero', 'si', 'Mostrar cajero', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(27, 'pos.mostrar_medios', 'si', 'Mostrar medios de pago', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(28, 'pos.mostrar_observaciones', 'si', 'Mostrar observaciones', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(29, 'pos.mostrar_cambio', 'si', 'Mostrar cambio', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(30, 'pos.mostrar_resumen_desc', 'si', 'Mostrar descuento / obsequio', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(31, 'factura.titulo', 'Factura de venta', 'Título factura', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(32, 'factura.mostrar_logo', 'si', 'Mostrar logo en factura', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(33, 'factura.mostrar_cliente', 'si', 'Mostrar datos del cliente', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(34, 'factura.mostrar_observaciones', 'si', 'Mostrar observaciones', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(35, 'factura.mostrar_medios', 'si', 'Mostrar medios de pago', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(36, 'seguridad.sesion_unica', 'si', 'Sesión única', '2026-03-22 11:57:02', '2026-03-22 11:57:02'),
(37, 'seguridad.aut_supervisor', 'si', 'Autorización supervisor', '2026-03-22 11:57:02', '2026-03-22 11:57:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre_comercial` varchar(150) NOT NULL,
  `razon_social` varchar(150) DEFAULT NULL,
  `nit` varchar(30) DEFAULT NULL,
  `dv` varchar(5) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `correo` varchar(120) DEFAULT NULL,
  `direccion` varchar(180) DEFAULT NULL,
  `ciudad` varchar(80) DEFAULT NULL,
  `departamento` varchar(80) DEFAULT NULL,
  `pais` varchar(80) DEFAULT 'Colombia',
  `logo` varchar(255) DEFAULT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id`, `nombre_comercial`, `razon_social`, `nit`, `dv`, `telefono`, `correo`, `direccion`, `ciudad`, `departamento`, `pais`, `logo`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Dogva Dagua  SAS', 'Dogva Dagua  SAS', '94421326', '4', '3103094786', 'soporte@dagva.com.co', 'Dagua, Valle', 'Dagua', 'Valle del Cauca', 'Colombia', NULL, 'activo', '2026-03-17 20:38:23', '2026-03-18 09:57:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fe_envios_log`
--

CREATE TABLE `fe_envios_log` (
  `id` int(11) NOT NULL,
  `venta_id` int(11) NOT NULL,
  `tipo_documento` enum('factura_electronica','documento_pos') NOT NULL,
  `estado_envio` varchar(40) NOT NULL DEFAULT 'pendiente',
  `correo_cliente` varchar(150) DEFAULT '',
  `xml_path` varchar(255) DEFAULT '',
  `pdf_path` varchar(255) DEFAULT '',
  `respuesta` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `fe_envios_log`
--

INSERT INTO `fe_envios_log` (`id`, `venta_id`, `tipo_documento`, `estado_envio`, `correo_cliente`, `xml_path`, `pdf_path`, `respuesta`, `created_at`) VALUES
(1, 1, 'factura_electronica', 'pendiente', NULL, '', '', 'Pendiente de integración DIAN', '2026-03-18 17:56:47'),
(2, 7, 'factura_electronica', 'pendiente', 'maria@example.com', '', '', 'Pendiente de integración DIAN', '2026-03-18 20:36:40'),
(3, 25, 'factura_electronica', 'pendiente', 'H@gmail.com', '', '', 'Pendiente de integración real', '2026-03-24 00:18:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impuestos`
--

CREATE TABLE `impuestos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `tipo_impuesto` enum('iva','consumo','ninguno') NOT NULL DEFAULT 'iva',
  `tasa` decimal(8,2) NOT NULL DEFAULT 0.00,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `impuestos`
--

INSERT INTO `impuestos` (`id`, `nombre`, `tipo_impuesto`, `tasa`, `estado`, `created_at`) VALUES
(1, 'Exento', 'ninguno', 0.00, 'activo', '2026-03-18 10:01:07'),
(2, 'IVA 5%', 'iva', 5.00, 'activo', '2026-03-18 10:01:07'),
(3, 'IVA 19%', 'iva', 19.00, 'activo', '2026-03-18 10:01:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_movimientos`
--

CREATE TABLE `inventario_movimientos` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `tipo_movimiento` enum('entrada_compra','salida_venta','ajuste_entrada','ajuste_salida','devolucion_compra','devolucion_venta','conteo','traslado') NOT NULL DEFAULT 'entrada_compra',
  `documento_tipo` varchar(40) DEFAULT NULL,
  `documento_id` int(11) DEFAULT NULL,
  `documento_numero` varchar(40) DEFAULT NULL,
  `cantidad` decimal(14,2) NOT NULL DEFAULT 0.00,
  `stock_anterior` decimal(14,2) NOT NULL DEFAULT 0.00,
  `stock_nuevo` decimal(14,2) NOT NULL DEFAULT 0.00,
  `costo_unitario` decimal(14,2) NOT NULL DEFAULT 0.00,
  `costo_total` decimal(14,2) NOT NULL DEFAULT 0.00,
  `motivo` varchar(160) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `creado_por` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario_movimientos`
--

INSERT INTO `inventario_movimientos` (`id`, `producto_id`, `tipo_movimiento`, `documento_tipo`, `documento_id`, `documento_numero`, `cantidad`, `stock_anterior`, `stock_nuevo`, `costo_unitario`, `costo_total`, `motivo`, `observaciones`, `creado_por`, `created_at`) VALUES
(1, 2, 'ajuste_entrada', '0', 0, 'AJ-20260324001642', 10.00, 0.00, 10.00, 1600.00, 16000.00, '0', NULL, 1, '2026-03-24 00:16:42'),
(2, 1, 'ajuste_entrada', '0', 0, 'AJ-20260324001703', 15.00, 0.00, 15.00, 350.00, 5250.00, '0', NULL, 1, '2026-03-24 00:17:03'),
(3, 2, 'salida_venta', '0', 25, 'FEV000003', 2.00, 10.00, 8.00, 0.00, 0.00, '0', 'Venta FEV000003', 1, '2026-03-24 00:18:32'),
(4, 1, 'salida_venta', '0', 25, 'FEV000003', 1.00, 15.00, 14.00, 0.00, 0.00, '0', 'Venta FEV000003', 1, '2026-03-24 00:18:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencias`
--

CREATE TABLE `licencias` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `tipo_licencia` varchar(50) NOT NULL DEFAULT 'prueba',
  `fecha_inicio` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `estado` enum('prueba','activa','vencida','suspendida') NOT NULL DEFAULT 'prueba',
  `modo_solo_lectura` tinyint(1) NOT NULL DEFAULT 0,
  `observaciones` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `licencias`
--

INSERT INTO `licencias` (`id`, `empresa_id`, `tipo_licencia`, `fecha_inicio`, `fecha_vencimiento`, `estado`, `modo_solo_lectura`, `observaciones`, `created_at`, `updated_at`) VALUES
(1, 1, 'Activo', '2026-03-17', '2096-01-16', 'activa', 0, '', '2026-03-17 20:38:23', '2026-03-22 08:54:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medios_pago`
--

CREATE TABLE `medios_pago` (
  `id` int(11) NOT NULL,
  `codigo` varchar(40) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `tipo` varchar(50) DEFAULT '',
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `medios_pago`
--

INSERT INTO `medios_pago` (`id`, `codigo`, `nombre`, `tipo`, `estado`, `created_at`) VALUES
(1, 'EFECTIVO', 'Efectivo', 'efectivo', 'activo', '2026-03-18 11:19:21'),
(2, 'TARJETA', 'Tarjeta', 'tarjeta', 'activo', '2026-03-18 11:19:21'),
(3, 'TRANSFERENCIA', 'Transferencia', 'digital', 'activo', '2026-03-18 11:19:21'),
(4, 'NEQUI', 'Nequi', 'digital', 'activo', '2026-03-18 11:19:21'),
(5, 'DAVIPLATA', 'Daviplata', 'digital', 'activo', '2026-03-18 11:19:21'),
(6, 'PUNTOS', 'Puntos fidelización', 'fidelizacion', 'activo', '2026-03-18 11:19:21'),
(7, 'CREDITO', 'Crédito cliente', 'credito', 'activo', '2026-03-18 11:19:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes_compra`
--

CREATE TABLE `ordenes_compra` (
  `id` int(11) NOT NULL,
  `empresa_id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `numero` varchar(30) NOT NULL,
  `fecha` date NOT NULL,
  `fecha_estimada_entrega` date DEFAULT NULL,
  `estado` enum('borrador','enviada','parcial','recibida','anulada') NOT NULL DEFAULT 'borrador',
  `subtotal` decimal(14,2) NOT NULL DEFAULT 0.00,
  `observaciones` text DEFAULT NULL,
  `creado_por` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_compra_detalle`
--

CREATE TABLE `orden_compra_detalle` (
  `id` int(11) NOT NULL,
  `orden_id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `descripcion` varchar(220) NOT NULL,
  `cantidad` decimal(14,2) NOT NULL DEFAULT 0.00,
  `costo_unitario` decimal(14,2) NOT NULL DEFAULT 0.00,
  `subtotal` decimal(14,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int(10) UNSIGNED NOT NULL,
  `modulo` varchar(80) NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `modulo`, `codigo`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'dashboard', 'ver_dashboard', 'Ver dashboard', 'Puede ingresar al panel principal', 'activo'),
(2, 'empresas', 'ver_empresas', 'Ver empresas', 'Puede listar empresas', 'activo'),
(3, 'empresas', 'crear_empresas', 'Crear empresas', 'Puede crear empresas', 'activo'),
(4, 'empresas', 'editar_empresas', 'Editar empresas', 'Puede editar empresas', 'activo'),
(5, 'usuarios', 'ver_usuarios', 'Ver usuarios', 'Puede listar usuarios', 'activo'),
(6, 'usuarios', 'crear_usuarios', 'Crear usuarios', 'Puede crear usuarios', 'activo'),
(7, 'usuarios', 'editar_usuarios', 'Editar usuarios', 'Puede editar usuarios', 'activo'),
(8, 'usuarios', 'cambiar_clave_usuarios', 'Cambiar clave usuarios', 'Puede cambiar claves de usuarios', 'activo'),
(9, 'roles', 'ver_roles', 'Ver roles', 'Puede listar roles', 'activo'),
(10, 'roles', 'crear_roles', 'Crear roles', 'Puede crear roles', 'activo'),
(11, 'roles', 'editar_roles', 'Editar roles', 'Puede editar roles', 'activo'),
(12, 'roles', 'asignar_permisos', 'Asignar permisos', 'Puede asignar permisos a roles', 'activo'),
(13, 'licencias', 'ver_licencias', 'Ver licencias', 'Puede listar licencias', 'activo'),
(14, 'licencias', 'crear_licencias', 'Crear licencias', 'Puede crear licencias', 'activo'),
(15, 'licencias', 'editar_licencias', 'Editar licencias', 'Puede editar licencias', 'activo'),
(16, 'perfil', 'ver_perfil', 'Ver perfil', 'Puede ver su perfil', 'activo'),
(17, 'perfil', 'editar_perfil', 'Editar perfil', 'Puede editar su perfil', 'activo'),
(18, 'clientes', 'ver_clientes', 'Ver clientes', 'Puede listar clientes del negocio', 'activo'),
(19, 'clientes', 'crear_clientes', 'Crear clientes', 'Puede crear clientes', 'activo'),
(20, 'clientes', 'editar_clientes', 'Editar clientes', 'Puede editar clientes', 'activo'),
(21, 'productos', 'ver_productos', 'Ver productos', 'Puede listar productos', 'activo'),
(22, 'productos', 'crear_productos', 'Crear productos', 'Puede crear productos', 'activo'),
(23, 'productos', 'editar_productos', 'Editar productos', 'Puede editar productos', 'activo'),
(24, 'proveedores', 'ver_proveedores', 'Ver proveedores', 'Puede listar proveedores', 'activo'),
(25, 'proveedores', 'crear_proveedores', 'Crear proveedores', 'Puede crear proveedores', 'activo'),
(26, 'proveedores', 'editar_proveedores', 'Editar proveedores', 'Puede editar proveedores', 'activo'),
(27, 'compras', 'ver_compras', 'Ver compras', 'Puede ver compras y órdenes', 'activo'),
(28, 'compras', 'crear_compras', 'Crear compras', 'Puede crear órdenes de compra', 'activo'),
(29, 'compras', 'editar_compras', 'Editar compras', 'Puede editar compras', 'activo'),
(30, 'ventas', 'ver_ventas', 'Ver ventas', 'Puede ver ventas e historial', 'activo'),
(31, 'ventas', 'usar_pos', 'Usar POS', 'Puede operar el punto de venta', 'activo'),
(32, 'ventas', 'anular_ventas', 'Anular ventas', 'Puede anular tickets y ventas', 'activo'),
(33, 'caja', 'abrir_caja', 'Abrir caja', 'Puede registrar aperturas de caja', 'activo'),
(34, 'caja', 'cerrar_caja', 'Cerrar caja', 'Puede registrar cierres de caja', 'activo'),
(35, 'caja', 'movimientos_caja', 'Movimientos caja', 'Puede registrar ingresos y egresos de caja', 'activo'),
(36, 'configuracion', 'ver_configuracion', 'Ver configuración', 'Puede entrar a configuración del negocio', 'activo'),
(37, 'configuracion', 'editar_configuracion', 'Editar configuración', 'Puede editar parámetros internos', 'activo'),
(38, 'facturacion', 'ver_facturacion', 'Ver facturación', 'Puede consultar documentos y resoluciones', 'activo'),
(39, 'ventas', 'ver_auditoria', 'Ver auditoría POS', 'Puede consultar la auditoría operativa del POS y caja', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pos_tickets_espera`
--

CREATE TABLE `pos_tickets_espera` (
  `id` int(11) NOT NULL,
  `apertura_id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `tipo_documento` enum('ticket_pos','factura_electronica','documento_pos','proforma') NOT NULL DEFAULT 'ticket_pos',
  `nombre_referencia` varchar(180) DEFAULT '',
  `subtotal` decimal(14,2) NOT NULL DEFAULT 0.00,
  `descuento` decimal(14,2) NOT NULL DEFAULT 0.00,
  `impuestos` decimal(14,2) NOT NULL DEFAULT 0.00,
  `total` decimal(14,2) NOT NULL DEFAULT 0.00,
  `estado` enum('en_espera','facturado','anulado') NOT NULL DEFAULT 'en_espera',
  `observaciones` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pos_tickets_espera`
--

INSERT INTO `pos_tickets_espera` (`id`, `apertura_id`, `cliente_id`, `tipo_documento`, `nombre_referencia`, `subtotal`, `descuento`, `impuestos`, `total`, `estado`, `observaciones`, `created_at`) VALUES
(1, 1, NULL, 'ticket_pos', NULL, 700.00, 0.00, 0.00, 700.00, 'anulado', NULL, '2026-03-18 14:37:14'),
(2, 2, NULL, 'factura_electronica', NULL, 700.00, 0.00, 0.00, 700.00, 'anulado', NULL, '2026-03-18 17:53:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pos_tickets_espera_detalle`
--

CREATE TABLE `pos_tickets_espera_detalle` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `descripcion` varchar(220) NOT NULL,
  `cantidad` decimal(14,2) NOT NULL DEFAULT 0.00,
  `precio_unitario` decimal(14,2) NOT NULL DEFAULT 0.00,
  `descuento` decimal(14,2) NOT NULL DEFAULT 0.00,
  `impuesto_tasa` decimal(8,2) NOT NULL DEFAULT 0.00,
  `subtotal` decimal(14,2) NOT NULL DEFAULT 0.00,
  `es_obsequio` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pos_tickets_espera_detalle`
--

INSERT INTO `pos_tickets_espera_detalle` (`id`, `ticket_id`, `producto_id`, `descripcion`, `cantidad`, `precio_unitario`, `descuento`, `impuesto_tasa`, `subtotal`, `es_obsequio`, `created_at`) VALUES
(1, 1, 1, 'Pan blandito 50g', 1.00, 700.00, 0.00, 0.00, 700.00, 0, '2026-03-18 14:37:14'),
(2, 2, 1, 'Pan blandito 50g', 1.00, 700.00, 0.00, 0.00, 700.00, 0, '2026-03-18 17:53:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `codigo_interno` varchar(60) NOT NULL,
  `sku` varchar(80) DEFAULT '',
  `barcode_principal` varchar(80) DEFAULT '',
  `barcode_tipo` varchar(30) DEFAULT 'EAN-13',
  `nombre` varchar(180) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `familia_id` int(11) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `subcategoria_id` int(11) DEFAULT NULL,
  `marca_id` int(11) DEFAULT NULL,
  `tipo_producto` enum('materia_prima','terminado','reventa','semielaborado','combo','servicio') NOT NULL DEFAULT 'reventa',
  `proveedor_principal_id` int(11) DEFAULT NULL,
  `unidad_inventario_id` int(11) DEFAULT NULL,
  `unidad_compra_id` int(11) DEFAULT NULL,
  `factor_compra` decimal(14,4) NOT NULL DEFAULT 1.0000,
  `unidad_venta_id` int(11) DEFAULT NULL,
  `factor_venta` decimal(14,4) NOT NULL DEFAULT 1.0000,
  `impuesto_venta_id` int(11) DEFAULT NULL,
  `impuesto_compra_id` int(11) DEFAULT NULL,
  `ultimo_costo` decimal(14,2) NOT NULL DEFAULT 0.00,
  `costo_promedio` decimal(14,2) NOT NULL DEFAULT 0.00,
  `precio_detal` decimal(14,2) NOT NULL DEFAULT 0.00,
  `precio_mayorista` decimal(14,2) NOT NULL DEFAULT 0.00,
  `cantidad_min_mayorista` decimal(14,2) NOT NULL DEFAULT 0.00,
  `precio_oferta` decimal(14,2) NOT NULL DEFAULT 0.00,
  `cantidad_min_oferta` decimal(14,2) NOT NULL DEFAULT 0.00,
  `margen_objetivo` decimal(8,2) NOT NULL DEFAULT 0.00,
  `stock_minimo` decimal(14,2) NOT NULL DEFAULT 0.00,
  `stock_maximo` decimal(14,2) NOT NULL DEFAULT 0.00,
  `stock_actual` decimal(14,2) NOT NULL DEFAULT 0.00,
  `presentacion` varchar(120) DEFAULT '',
  `atributos_visibles` varchar(220) DEFAULT '',
  `imagen_url` varchar(255) DEFAULT '',
  `se_compra` tinyint(1) NOT NULL DEFAULT 1,
  `se_vende` tinyint(1) NOT NULL DEFAULT 1,
  `se_produce` tinyint(1) NOT NULL DEFAULT 0,
  `maneja_inventario` tinyint(1) NOT NULL DEFAULT 1,
  `permite_descuento` tinyint(1) NOT NULL DEFAULT 1,
  `en_promocion` tinyint(1) NOT NULL DEFAULT 0,
  `visible_pos` tinyint(1) NOT NULL DEFAULT 1,
  `producto_pesable` tinyint(1) NOT NULL DEFAULT 0,
  `permite_obsequio` tinyint(1) NOT NULL DEFAULT 0,
  `maneja_lotes` tinyint(1) NOT NULL DEFAULT 0,
  `maneja_vencimiento` tinyint(1) NOT NULL DEFAULT 0,
  `multibodega` tinyint(1) NOT NULL DEFAULT 0,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `observaciones` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `codigo_interno`, `sku`, `barcode_principal`, `barcode_tipo`, `nombre`, `descripcion`, `familia_id`, `categoria_id`, `subcategoria_id`, `marca_id`, `tipo_producto`, `proveedor_principal_id`, `unidad_inventario_id`, `unidad_compra_id`, `factor_compra`, `unidad_venta_id`, `factor_venta`, `impuesto_venta_id`, `impuesto_compra_id`, `ultimo_costo`, `costo_promedio`, `precio_detal`, `precio_mayorista`, `cantidad_min_mayorista`, `precio_oferta`, `cantidad_min_oferta`, `margen_objetivo`, `stock_minimo`, `stock_maximo`, `stock_actual`, `presentacion`, `atributos_visibles`, `imagen_url`, `se_compra`, `se_vende`, `se_produce`, `maneja_inventario`, `permite_descuento`, `en_promocion`, `visible_pos`, `producto_pesable`, `permite_obsequio`, `maneja_lotes`, `maneja_vencimiento`, `multibodega`, `estado`, `observaciones`, `created_at`, `updated_at`, `image_url`) VALUES
(1, 'PAN-0001', 'PANBLANDITO50', '7700000000001', 'EAN-13', 'Pan blandito 50g', 'Producto terminado de panadería para venta diaria.', 2, 1, 1, 1, 'terminado', NULL, 1, 1, 1.0000, 1, 1.0000, 1, 1, 350.00, 500.00, 700.00, 650.00, 6.00, 600.00, 12.00, 35.00, 20.00, 300.00, 14.00, '50 g', 'Tradicional', '/assets/img/product-placeholder.png', 0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 'activo', 'Producto demo para pruebas de POS y producción.', '2026-03-18 10:01:07', '2026-03-24 00:18:32', '/assets/img/productos/prod_1_20260318_215507.png'),
(2, '100', '100', 'pan2000', 'EAN-14', 'Pan Aliñado De 2000', NULL, 2, 1, 3, NULL, 'terminado', 1, 1, 1, 1.0000, 1, 1.0000, 1, 1, 1600.00, 1850.00, 2000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5.00, 100.00, 8.00, '150 Gamos', NULL, '', 0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 'activo', NULL, '2026-03-23 23:45:46', '2026-03-24 00:18:32', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_categorias`
--

CREATE TABLE `producto_categorias` (
  `id` int(11) NOT NULL,
  `familia_id` int(11) DEFAULT NULL,
  `nombre` varchar(120) NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `producto_categorias`
--

INSERT INTO `producto_categorias` (`id`, `familia_id`, `nombre`, `estado`, `created_at`) VALUES
(1, 2, 'Panes', 'activo', '2026-03-18 10:01:07'),
(2, 2, 'Materias primas', 'activo', '2026-03-18 10:01:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_codigos`
--

CREATE TABLE `producto_codigos` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `codigo` varchar(80) NOT NULL,
  `tipo_codigo` varchar(30) DEFAULT 'EAN-13',
  `observacion` varchar(180) DEFAULT '',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `producto_codigos`
--

INSERT INTO `producto_codigos` (`id`, `producto_id`, `codigo`, `tipo_codigo`, `observacion`, `created_at`) VALUES
(3, 1, '17700000000008', 'EAN-14', 'Caja de empaque', '2026-03-18 21:55:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_familias`
--

CREATE TABLE `producto_familias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `producto_familias`
--

INSERT INTO `producto_familias` (`id`, `nombre`, `estado`, `created_at`) VALUES
(1, 'Abarrotes', 'activo', '2026-03-18 10:01:07'),
(2, 'Panadería', 'activo', '2026-03-18 10:01:07'),
(3, 'Lácteos', 'activo', '2026-03-18 10:01:07'),
(4, 'Gaseosas', 'activo', '2026-03-23 23:41:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_marcas`
--

CREATE TABLE `producto_marcas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `producto_marcas`
--

INSERT INTO `producto_marcas` (`id`, `nombre`, `estado`, `created_at`) VALUES
(1, 'Dagva Demo', 'activo', '2026-03-18 10:01:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_subcategorias`
--

CREATE TABLE `producto_subcategorias` (
  `id` int(11) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `nombre` varchar(120) NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `producto_subcategorias`
--

INSERT INTO `producto_subcategorias` (`id`, `categoria_id`, `nombre`, `estado`, `created_at`) VALUES
(1, 1, 'Blanditos', 'activo', '2026-03-18 10:01:07'),
(2, 2, 'Harinas', 'activo', '2026-03-18 10:01:07'),
(3, 1, 'Pan Aliñado', 'activo', '2026-03-23 23:42:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `empresa_id` int(11) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `tipo_documento` varchar(20) NOT NULL DEFAULT 'NIT',
  `numero_documento` varchar(40) NOT NULL,
  `dv` varchar(10) DEFAULT '',
  `nombre_comercial` varchar(180) NOT NULL,
  `razon_social` varchar(180) NOT NULL,
  `contacto_principal` varchar(150) DEFAULT '',
  `telefono` varchar(50) DEFAULT '',
  `celular` varchar(50) DEFAULT '',
  `correo` varchar(150) DEFAULT '',
  `direccion` varchar(200) DEFAULT '',
  `ciudad` varchar(100) DEFAULT '',
  `departamento` varchar(100) DEFAULT '',
  `pais` varchar(100) DEFAULT 'Colombia',
  `condicion_pago` varchar(50) NOT NULL DEFAULT 'Contado',
  `dias_credito` int(11) NOT NULL DEFAULT 0,
  `cupo_credito` decimal(14,2) NOT NULL DEFAULT 0.00,
  `lead_time_dias` int(11) NOT NULL DEFAULT 0,
  `maneja_perecederos` tinyint(1) NOT NULL DEFAULT 0,
  `requiere_control_calidad` tinyint(1) NOT NULL DEFAULT 0,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `observaciones` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `empresa_id`, `categoria_id`, `tipo_documento`, `numero_documento`, `dv`, `nombre_comercial`, `razon_social`, `contacto_principal`, `telefono`, `celular`, `correo`, `direccion`, `ciudad`, `departamento`, `pais`, `condicion_pago`, `dias_credito`, `cupo_credito`, `lead_time_dias`, `maneja_perecederos`, `requiere_control_calidad`, `estado`, `observaciones`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'NIT', '900123456', '1', 'Insumos Pan Valle', 'Insumos Pan Valle SAS', 'Carlos Mendoza', '3001234567', '3001234567', 'compras@insumospanvalle.com', 'Cra 10 # 20-30', 'Cali', 'Valle del Cauca', 'Colombia', '15 días', 15, 5000000.00, 2, 0, 0, 'activo', 'Proveedor base de ejemplo para compras e insumos.', '2026-03-18 00:47:10', '2026-03-18 02:09:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor_categorias`
--

CREATE TABLE `proveedor_categorias` (
  `id` int(11) NOT NULL,
  `empresa_id` int(11) NOT NULL DEFAULT 1,
  `nombre` varchar(120) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proveedor_categorias`
--

INSERT INTO `proveedor_categorias` (`id`, `empresa_id`, `nombre`, `descripcion`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 'Materia prima panadería', 'Harinas, levaduras, grasas y demás insumos de producción', 'activo', '2026-03-18 02:04:14', '2026-03-18 02:04:14'),
(2, 1, 'Abarrotes', 'Productos secos y de despensa', 'activo', '2026-03-18 02:04:14', '2026-03-18 02:04:14'),
(3, 1, 'Lácteos', 'Proveedores de leche, queso y derivados', 'activo', '2026-03-18 02:04:14', '2026-03-18 02:04:14'),
(4, 1, 'Aseo', 'Proveedores de productos de limpieza e higiene', 'activo', '2026-03-18 02:04:14', '2026-03-18 02:04:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor_contactos`
--

CREATE TABLE `proveedor_contactos` (
  `id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `cargo` varchar(120) DEFAULT '',
  `area` varchar(80) DEFAULT '',
  `telefono` varchar(50) DEFAULT '',
  `celular` varchar(50) DEFAULT '',
  `correo` varchar(150) DEFAULT '',
  `es_principal` tinyint(1) NOT NULL DEFAULT 0,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proveedor_contactos`
--

INSERT INTO `proveedor_contactos` (`id`, `proveedor_id`, `nombre`, `cargo`, `area`, `telefono`, `celular`, `correo`, `es_principal`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 'Carlos Mendoza', 'Ejecutivo comercial', 'Ventas', '6025551000', '3001234567', 'carlos.mendoza@insumospanvalle.com', 1, 'activo', '2026-03-18 02:09:10', '2026-03-18 02:09:10'),
(2, 1, 'Laura Pérez', 'Analista de cartera', 'Cartera', '6025551099', '3018887766', 'cartera@insumospanvalle.com', 0, 'activo', '2026-03-18 02:09:10', '2026-03-18 02:09:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resoluciones_facturacion`
--

CREATE TABLE `resoluciones_facturacion` (
  `id` int(11) NOT NULL,
  `tipo_documento` enum('ticket_pos','factura_electronica','documento_pos') NOT NULL,
  `prefijo` varchar(20) NOT NULL,
  `rango_desde` int(11) NOT NULL DEFAULT 1,
  `rango_hasta` int(11) NOT NULL DEFAULT 999999,
  `actual` int(11) NOT NULL DEFAULT 1,
  `vigencia_desde` date DEFAULT NULL,
  `vigencia_hasta` date DEFAULT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `resoluciones_facturacion`
--

INSERT INTO `resoluciones_facturacion` (`id`, `tipo_documento`, `prefijo`, `rango_desde`, `rango_hasta`, `actual`, `vigencia_desde`, `vigencia_hasta`, `estado`, `created_at`) VALUES
(1, 'ticket_pos', 'POS', 1, 999999, 20, '2026-03-18', '2027-03-18', 'activo', '2026-03-18 11:19:21'),
(2, 'factura_electronica', 'FEV', 1, 999999, 4, '2026-03-18', '2027-03-18', 'activo', '2026-03-18 11:19:21'),
(3, 'documento_pos', 'DPO', 1, 999999, 4, '2026-03-18', '2027-03-18', 'activo', '2026-03-18 11:19:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `nombre` varchar(80) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `empresa_id`, `nombre`, `descripcion`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 'Superadmin', 'Control total del sistema', 'activo', '2026-03-17 20:38:23', '2026-03-17 20:38:23'),
(2, 1, 'Administrador empresa', 'Administración general de la empresa', 'activo', '2026-03-17 20:38:23', '2026-03-17 20:38:23'),
(3, 1, 'Consulta', 'Solo lectura', 'activo', '2026-03-17 20:38:23', '2026-03-17 20:38:23'),
(4, 1, 'Supervisor POS', 'Supervisa caja, ventas, auditoría y autorizaciones en el punto de venta', 'activo', '2026-03-18 23:10:23', '2026-03-18 23:10:23'),
(5, 1, 'Cajero', 'Opera POS, clientes básicos y caja diaria', 'activo', '2026-03-18 23:10:23', '2026-03-18 23:10:23'),
(6, 1, 'Bodega', 'Opera compras, proveedores, productos e inventario base', 'activo', '2026-03-18 23:10:23', '2026-03-18 23:10:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_permiso`
--

CREATE TABLE `rol_permiso` (
  `id` int(10) UNSIGNED NOT NULL,
  `rol_id` int(10) UNSIGNED NOT NULL,
  `permiso_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `rol_permiso`
--

INSERT INTO `rol_permiso` (`id`, `rol_id`, `permiso_id`) VALUES
(12, 1, 1),
(13, 1, 2),
(3, 1, 3),
(7, 1, 4),
(17, 1, 5),
(6, 1, 6),
(11, 1, 7),
(2, 1, 8),
(16, 1, 9),
(5, 1, 10),
(10, 1, 11),
(1, 1, 12),
(14, 1, 13),
(4, 1, 14),
(8, 1, 15),
(15, 1, 16),
(9, 1, 17),
(40, 2, 1),
(45, 2, 5),
(35, 2, 6),
(39, 2, 7),
(33, 2, 8),
(44, 2, 9),
(34, 2, 10),
(38, 2, 11),
(32, 2, 12),
(43, 2, 16),
(37, 2, 17),
(54, 2, 18),
(55, 2, 19),
(56, 2, 20),
(57, 2, 21),
(58, 2, 22),
(59, 2, 23),
(60, 2, 24),
(61, 2, 25),
(62, 2, 26),
(63, 2, 27),
(64, 2, 28),
(65, 2, 29),
(66, 2, 30),
(67, 2, 31),
(68, 2, 32),
(69, 2, 33),
(70, 2, 34),
(71, 2, 35),
(72, 2, 36),
(73, 2, 37),
(74, 2, 38),
(146, 2, 39),
(47, 3, 1),
(52, 3, 5),
(51, 3, 9),
(50, 3, 16),
(95, 4, 1),
(100, 4, 5),
(99, 4, 9),
(97, 4, 16),
(90, 4, 17),
(93, 4, 18),
(88, 4, 19),
(89, 4, 20),
(98, 4, 21),
(101, 4, 30),
(92, 4, 31),
(86, 4, 32),
(85, 4, 33),
(87, 4, 34),
(91, 4, 35),
(94, 4, 36),
(96, 4, 38),
(149, 4, 39),
(122, 5, 1),
(123, 5, 16),
(119, 5, 17),
(121, 5, 18),
(118, 5, 19),
(124, 5, 21),
(125, 5, 30),
(120, 5, 31),
(116, 5, 33),
(117, 5, 34),
(152, 5, 35),
(153, 5, 38),
(139, 6, 1),
(140, 6, 16),
(135, 6, 17),
(141, 6, 21),
(132, 6, 22),
(136, 6, 23),
(142, 6, 24),
(133, 6, 25),
(137, 6, 26),
(138, 6, 27),
(131, 6, 28),
(134, 6, 29);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `direccion` varchar(180) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `principal` tinyint(1) NOT NULL DEFAULT 0,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`id`, `empresa_id`, `nombre`, `direccion`, `telefono`, `principal`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 'Principal', 'Dagua, Valle', '3000000000', 1, 'activo', '2026-03-17 20:38:23', '2026-03-17 20:38:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades_medida`
--

CREATE TABLE `unidades_medida` (
  `id` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `abreviatura` varchar(30) DEFAULT '',
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `unidades_medida`
--

INSERT INTO `unidades_medida` (`id`, `nombre`, `abreviatura`, `estado`, `created_at`) VALUES
(1, 'Unidad', 'Und', 'activo', '2026-03-18 10:01:07'),
(2, 'Kilogramo', 'Kg', 'activo', '2026-03-18 10:01:07'),
(3, 'Gramo', 'g', 'activo', '2026-03-18 10:01:07'),
(4, 'Bulto', 'Bto', 'activo', '2026-03-18 10:01:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `rol_id` int(10) UNSIGNED NOT NULL,
  `sede_id` int(10) UNSIGNED DEFAULT NULL,
  `nombres` varchar(120) NOT NULL,
  `apellidos` varchar(120) DEFAULT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `numero_documento` varchar(30) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `correo` varchar(120) DEFAULT NULL,
  `usuario` varchar(60) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `session_token` varchar(64) DEFAULT NULL,
  `session_updated_at` datetime DEFAULT NULL,
  `ultimo_login` datetime DEFAULT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `active_session_token` varchar(64) DEFAULT NULL,
  `active_session_at` datetime DEFAULT NULL,
  `ultimo_login_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `empresa_id`, `rol_id`, `sede_id`, `nombres`, `apellidos`, `tipo_documento`, `numero_documento`, `telefono`, `correo`, `usuario`, `clave`, `session_token`, `session_updated_at`, `ultimo_login`, `estado`, `created_at`, `updated_at`, `active_session_token`, `active_session_at`, `ultimo_login_at`) VALUES
(1, 1, 1, 1, 'Super', 'Admin', 'CC', '123456789', '3103094786', 'admin@dagva.com.co', 'superadmin', '$2y$12$PmQ8TeBi9EiLE32ckDrTpeRon9dH6SKP3JjEgzIV.M5lopPB4qQoK', '0c9d5baf4a61f4e13ee043a99dc936dced58d722633cfa3598602790585431b3', '2026-03-24 00:18:44', '2026-03-23 23:02:22', 'activo', '2026-03-17 20:38:23', '2026-03-24 00:18:44', '0c9d5baf4a61f4e13ee043a99dc936dced58d722633cfa3598602790585431b3', '2026-03-24 00:18:44', '2026-03-23 23:02:22'),
(2, 1, 2, 1, 'Yor', 'Gonzalez', 'CC', '94421326', '3103094786', 'jonjer33@gmail.com', 'jerbert', '$2y$10$Z1Ips5Cg2InVbInZH4M2reprbp9qOTwPGuBm27HGl0CX/xorAzpCC', NULL, NULL, NULL, 'activo', '2026-03-18 22:23:49', '2026-03-18 22:23:49', NULL, NULL, NULL),
(3, 1, 5, 1, 'sulay', 'gomez', 'CC', '37398785', '3217878107', 'lensuy@hotmail.com', 'sulay', '$2y$10$cf7VzbvYZTUzHaRW81AKxulYgjJWj.xez2.eT.ZAw7u1ByAAGsMXi', NULL, NULL, '2026-03-22 11:49:21', 'activo', '2026-03-21 14:33:42', '2026-03-22 14:14:17', NULL, NULL, '2026-03-22 11:49:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `numero` varchar(40) NOT NULL,
  `tipo_documento` enum('ticket_pos','factura_electronica','documento_pos','proforma') NOT NULL DEFAULT 'ticket_pos',
  `apertura_id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL DEFAULT 0,
  `subtotal` decimal(14,2) NOT NULL DEFAULT 0.00,
  `descuento` decimal(14,2) NOT NULL DEFAULT 0.00,
  `impuestos` decimal(14,2) NOT NULL DEFAULT 0.00,
  `total` decimal(14,2) NOT NULL DEFAULT 0.00,
  `cambio` decimal(14,2) NOT NULL DEFAULT 0.00,
  `estado` enum('emitida','proforma','pendiente_fe','anulada') NOT NULL DEFAULT 'emitida',
  `observaciones` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `numero`, `tipo_documento`, `apertura_id`, `cliente_id`, `usuario_id`, `subtotal`, `descuento`, `impuestos`, `total`, `cambio`, `estado`, `observaciones`, `created_at`) VALUES
(1, 'FEV000001', 'factura_electronica', 3, NULL, 1, 700.00, 0.00, 0.00, 700.00, 300.00, 'pendiente_fe', NULL, '2026-03-18 17:56:47'),
(2, 'POS000001', 'ticket_pos', 3, NULL, 1, 1400.00, 0.00, 0.00, 1400.00, 600.00, 'emitida', NULL, '2026-03-18 17:59:15'),
(3, 'POS000002', 'ticket_pos', 3, NULL, 1, 2100.00, 0.00, 0.00, 2100.00, 0.00, 'emitida', NULL, '2026-03-18 18:00:14'),
(4, 'POS000003', 'ticket_pos', 3, NULL, 1, 2800.00, 0.00, 0.00, 2800.00, 1000.00, 'emitida', NULL, '2026-03-18 18:34:09'),
(5, 'POS000004', 'ticket_pos', 3, NULL, 1, 2100.00, 0.00, 0.00, 2100.00, 900.00, 'emitida', NULL, '2026-03-18 20:16:02'),
(6, 'POS000005', 'ticket_pos', 3, NULL, 1, 4200.00, 0.00, 0.00, 4200.00, 5800.00, 'emitida', NULL, '2026-03-18 20:34:12'),
(7, 'FEV000002', 'factura_electronica', 3, 1, 1, 6000.00, 0.00, 0.00, 6000.00, 0.00, 'pendiente_fe', NULL, '2026-03-18 20:36:40'),
(8, 'POS000006', 'ticket_pos', 5, NULL, 1, 700.00, 0.00, 0.00, 700.00, 0.00, 'emitida', NULL, '2026-03-21 17:52:55'),
(9, 'POS000007', 'ticket_pos', 6, NULL, 3, 2800.00, 700.00, 0.00, 2100.00, 0.00, 'emitida', NULL, '2026-03-21 19:52:26'),
(10, 'DPO000001', 'documento_pos', 7, 2, 1, 1400.00, 0.00, 0.00, 1400.00, 0.00, 'pendiente_fe', NULL, '2026-03-21 23:15:34'),
(11, 'DPO000002', 'documento_pos', 7, 2, 1, 1400.00, 0.00, 0.00, 1400.00, 0.00, 'pendiente_fe', NULL, '2026-03-21 23:16:30'),
(12, 'DPO000003', 'documento_pos', 7, 2, 1, 1400.00, 0.00, 0.00, 1400.00, 0.00, 'pendiente_fe', NULL, '2026-03-21 23:16:52'),
(13, 'POS000008', 'ticket_pos', 7, 2, 1, 700.00, 0.00, 0.00, 700.00, 0.00, 'emitida', NULL, '2026-03-21 23:41:34'),
(16, 'POS000011', 'ticket_pos', 7, 2, 1, 1400.00, 0.00, 0.00, 1400.00, 0.00, 'emitida', NULL, '2026-03-22 00:24:31'),
(17, 'POS000012', 'ticket_pos', 7, NULL, 1, 1400.00, 0.00, 0.00, 1400.00, 0.00, 'emitida', NULL, '2026-03-22 00:28:30'),
(18, 'POS000013', 'ticket_pos', 8, 2, 3, 2100.00, 700.00, 0.00, 1400.00, 0.00, 'emitida', NULL, '2026-03-22 11:08:07'),
(19, 'POS000014', 'ticket_pos', 9, 2, 3, 1400.00, 0.00, 0.00, 1400.00, 0.00, 'emitida', NULL, '2026-03-22 11:27:41'),
(20, 'POS000015', 'ticket_pos', 9, 1, 3, 2800.00, 700.00, 0.00, 2100.00, 0.00, 'emitida', NULL, '2026-03-22 11:34:05'),
(21, 'POS000016', 'ticket_pos', 9, 1, 3, 2800.00, 0.00, 0.00, 2800.00, 0.00, 'emitida', NULL, '2026-03-22 11:47:05'),
(22, 'POS000017', 'ticket_pos', 12, NULL, 3, 700.00, 0.00, 0.00, 700.00, 0.00, 'emitida', NULL, '2026-03-22 12:06:32'),
(23, 'POS000018', 'ticket_pos', 12, NULL, 3, 2100.00, 0.00, 0.00, 2100.00, 0.00, 'emitida', NULL, '2026-03-22 12:07:03'),
(24, 'POS000019', 'ticket_pos', 13, NULL, 1, 5400.00, 0.00, 0.00, 5400.00, 600.00, 'emitida', NULL, '2026-03-23 23:47:29'),
(25, 'FEV000003', 'factura_electronica', 13, 2, 1, 4700.00, 2700.00, 0.00, 2000.00, 0.00, 'pendiente_fe', NULL, '2026-03-24 00:18:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_auditoria`
--

CREATE TABLE `ventas_auditoria` (
  `id` int(11) NOT NULL,
  `apertura_id` int(11) NOT NULL DEFAULT 0,
  `usuario_id` int(11) NOT NULL DEFAULT 0,
  `tipo_evento` varchar(80) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `referencia` varchar(120) DEFAULT '',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ventas_auditoria`
--

INSERT INTO `ventas_auditoria` (`id`, `apertura_id`, `usuario_id`, `tipo_evento`, `descripcion`, `referencia`, `created_at`) VALUES
(1, 1, 1, 'apertura_caja', 'Apertura de caja registrada', 'Apertura 1', '2026-03-18 11:22:23'),
(2, 1, 1, 'ticket_espera', 'Venta guardada en espera', 'Ticket 1', '2026-03-18 14:37:14'),
(3, 1, 1, 'ticket_anulado', 'Ticket en espera anulado', 'Ticket 1', '2026-03-18 16:11:05'),
(4, 1, 1, 'cierre_caja', 'Cierre de caja registrado', 'Diferencia 0', '2026-03-18 16:11:52'),
(5, 2, 1, 'apertura_caja', 'Apertura de caja registrada', 'Apertura 2', '2026-03-18 16:45:42'),
(6, 2, 1, 'ticket_espera', 'Venta guardada en espera', 'Ticket 2', '2026-03-18 17:53:24'),
(7, 2, 1, 'ticket_anulado', 'Ticket en espera anulado', 'Ticket 2', '2026-03-18 17:54:37'),
(8, 2, 1, 'cierre_caja', 'Cierre de caja registrado', 'Diferencia 0', '2026-03-18 17:55:31'),
(9, 3, 1, 'apertura_caja', 'Apertura de caja registrada', 'Apertura 3', '2026-03-18 17:56:01'),
(10, 3, 1, 'venta_emitida', 'Venta registrada en POS', 'FEV000001', '2026-03-18 17:56:47'),
(11, 3, 1, 'venta_emitida', 'Venta registrada en POS', 'POS000001', '2026-03-18 17:59:15'),
(12, 3, 1, 'venta_emitida', 'Venta registrada en POS', 'POS000002', '2026-03-18 18:00:14'),
(13, 3, 1, 'venta_emitida', 'Venta registrada en POS', 'POS000003', '2026-03-18 18:34:09'),
(14, 3, 1, 'venta_emitida', 'Venta registrada en POS', 'POS000004', '2026-03-18 20:16:02'),
(15, 3, 1, 'venta_emitida', 'Venta registrada en POS', 'POS000005', '2026-03-18 20:34:12'),
(16, 3, 1, 'venta_emitida', 'Venta registrada en POS', 'FEV000002', '2026-03-18 20:36:40'),
(17, 3, 2, 'cierre_caja', 'Cierre de caja registrado', 'Diferencia 1800', '2026-03-18 22:26:26'),
(18, 4, 1, 'apertura_caja', 'Apertura de caja registrada', 'Apertura 4', '2026-03-19 18:26:14'),
(19, 4, 1, 'cierre_caja', 'Cierre de caja registrado', 'Diferencia 0', '2026-03-21 14:34:21'),
(20, 5, 1, 'apertura_caja', 'Apertura de caja registrada', 'Apertura 5', '2026-03-21 14:35:39'),
(21, 5, 1, 'venta_emitida', 'Venta registrada en POS', 'POS000006', '2026-03-21 17:52:55'),
(22, 5, 1, 'cierre_caja', 'Cierre de caja registrado', 'Diferencia -10700', '2026-03-21 17:55:11'),
(23, 6, 3, 'apertura_caja', 'Apertura de caja registrada', 'Apertura 6', '2026-03-21 19:50:18'),
(24, 6, 3, 'venta_emitida', 'Venta registrada', 'Venta POS000007', '2026-03-21 19:52:26'),
(25, 6, 3, 'cierre_caja', 'Cierre de caja registrado', 'Diferencia 0', '2026-03-21 19:57:50'),
(26, 7, 1, 'apertura_caja', 'Apertura de caja registrada', 'Apertura 7', '2026-03-21 20:05:17'),
(27, 7, 1, 'venta_emitida', 'Venta registrada', 'Venta POS000011', '2026-03-22 00:24:31'),
(28, 7, 1, 'venta_emitida', 'Venta registrada', 'Venta POS000012', '2026-03-22 00:28:30'),
(29, 8, 3, 'apertura_caja', 'Apertura de caja registrada', 'Apertura 8', '2026-03-22 10:58:54'),
(30, 8, 3, 'venta_emitida', 'Venta registrada', 'Venta POS000013', '2026-03-22 11:08:07'),
(31, 8, 3, 'cierre_caja', 'Cierre de caja registrado', 'Diferencia -10000', '2026-03-22 11:16:46'),
(32, 9, 3, 'apertura_caja', 'Apertura de caja registrada', 'Apertura 9', '2026-03-22 11:25:58'),
(33, 9, 3, 'venta_emitida', 'Venta registrada', 'Venta POS000014', '2026-03-22 11:27:41'),
(34, 9, 3, 'venta_emitida', 'Venta registrada', 'Venta POS000015', '2026-03-22 11:34:05'),
(35, 9, 3, 'venta_emitida', 'Venta registrada', 'Venta POS000016', '2026-03-22 11:47:05'),
(36, 9, 3, 'cierre_caja', 'Cierre de caja registrado', 'Diferencia 0', '2026-03-22 11:47:58'),
(37, 10, 3, 'apertura_caja', 'Apertura de caja registrada', 'Apertura 10', '2026-03-22 11:57:33'),
(38, 10, 3, 'cierre_caja', 'Cierre de caja registrado', 'Diferencia 0', '2026-03-22 11:59:01'),
(39, 11, 3, 'apertura_caja', 'Apertura de caja registrada', 'Apertura 11', '2026-03-22 12:05:47'),
(40, 11, 3, 'cierre_caja', 'Cierre de caja registrado', 'Diferencia 0', '2026-03-22 12:06:00'),
(41, 12, 3, 'apertura_caja', 'Apertura de caja registrada', 'Apertura 12', '2026-03-22 12:06:13'),
(42, 12, 3, 'venta_emitida', 'Venta registrada', 'Venta POS000017', '2026-03-22 12:06:32'),
(43, 12, 3, 'venta_emitida', 'Venta registrada', 'Venta POS000018', '2026-03-22 12:07:03'),
(44, 12, 3, 'cierre_caja', 'Cierre de caja registrado', 'Diferencia 0', '2026-03-22 12:07:27'),
(45, 7, 1, 'cierre_caja', 'Cierre de caja registrado', 'Diferencia 0', '2026-03-23 23:46:33'),
(46, 13, 1, 'apertura_caja', 'Apertura de caja registrada', 'Apertura 13', '2026-03-23 23:46:50'),
(47, 13, 1, 'venta_emitida', 'Venta registrada', 'Venta POS000019', '2026-03-23 23:47:29'),
(48, 13, 1, 'venta_emitida', 'Venta registrada', 'Venta FEV000003', '2026-03-24 00:18:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_detalle`
--

CREATE TABLE `venta_detalle` (
  `id` int(11) NOT NULL,
  `venta_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `descripcion` varchar(220) NOT NULL,
  `cantidad` decimal(14,2) NOT NULL DEFAULT 0.00,
  `precio_unitario` decimal(14,2) NOT NULL DEFAULT 0.00,
  `descuento` decimal(14,2) NOT NULL DEFAULT 0.00,
  `impuesto_tasa` decimal(8,2) NOT NULL DEFAULT 0.00,
  `impuesto_valor` decimal(14,2) NOT NULL DEFAULT 0.00,
  `subtotal` decimal(14,2) NOT NULL DEFAULT 0.00,
  `es_obsequio` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `venta_detalle`
--

INSERT INTO `venta_detalle` (`id`, `venta_id`, `producto_id`, `descripcion`, `cantidad`, `precio_unitario`, `descuento`, `impuesto_tasa`, `impuesto_valor`, `subtotal`, `es_obsequio`, `created_at`) VALUES
(1, 1, 1, 'Pan blandito 50g', 1.00, 700.00, 0.00, 0.00, 0.00, 700.00, 0, '2026-03-18 17:56:47'),
(2, 2, 1, 'Pan blandito 50g', 2.00, 700.00, 0.00, 0.00, 0.00, 1400.00, 0, '2026-03-18 17:59:15'),
(3, 3, 1, 'Pan blandito 50g', 3.00, 700.00, 0.00, 0.00, 0.00, 2100.00, 0, '2026-03-18 18:00:14'),
(4, 4, 1, 'Pan blandito 50g', 4.00, 700.00, 0.00, 0.00, 0.00, 2800.00, 0, '2026-03-18 18:34:09'),
(5, 5, 1, 'Pan blandito 50g', 3.00, 700.00, 0.00, 0.00, 0.00, 2100.00, 0, '2026-03-18 20:16:02'),
(6, 6, 1, 'Pan blandito 50g', 6.00, 700.00, 0.00, 0.00, 0.00, 4200.00, 0, '2026-03-18 20:34:12'),
(7, 7, 1, 'Pan blandito 50g', 10.00, 600.00, 0.00, 0.00, 0.00, 6000.00, 0, '2026-03-18 20:36:40'),
(8, 8, 1, 'Pan blandito 50g', 1.00, 700.00, 0.00, 0.00, 0.00, 700.00, 0, '2026-03-21 17:52:55'),
(9, 9, 1, 'Pan blandito 50g', 4.00, 700.00, 700.00, 0.00, 0.00, 2100.00, 0, '2026-03-21 19:52:26'),
(10, 10, 1, 'Pan blandito 50g', 2.00, 700.00, 0.00, 0.00, 0.00, 1400.00, 0, '2026-03-21 23:15:34'),
(11, 11, 1, 'Pan blandito 50g', 2.00, 700.00, 0.00, 0.00, 0.00, 1400.00, 0, '2026-03-21 23:16:30'),
(12, 12, 1, 'Pan blandito 50g', 2.00, 700.00, 0.00, 0.00, 0.00, 1400.00, 0, '2026-03-21 23:16:52'),
(13, 13, 1, 'Pan blandito 50g', 1.00, 700.00, 0.00, 0.00, 0.00, 700.00, 0, '2026-03-21 23:41:34'),
(16, 16, 1, 'Pan blandito 50g', 2.00, 700.00, 0.00, 0.00, 0.00, 1400.00, 0, '2026-03-22 00:24:31'),
(17, 17, 1, 'Pan blandito 50g', 2.00, 700.00, 0.00, 0.00, 0.00, 1400.00, 0, '2026-03-22 00:28:30'),
(18, 18, 1, 'Pan blandito 50g', 3.00, 700.00, 0.00, 0.00, 0.00, 1400.00, 1, '2026-03-22 11:08:07'),
(19, 19, 1, 'Pan blandito 50g', 2.00, 700.00, 0.00, 0.00, 0.00, 1400.00, 0, '2026-03-22 11:27:41'),
(20, 20, 1, 'Pan blandito 50g', 4.00, 700.00, 0.00, 0.00, 0.00, 2100.00, 1, '2026-03-22 11:34:05'),
(21, 21, 1, 'Pan blandito 50g', 4.00, 700.00, 0.00, 0.00, 0.00, 2800.00, 0, '2026-03-22 11:47:05'),
(22, 22, 1, 'Pan blandito 50g', 1.00, 700.00, 0.00, 0.00, 0.00, 700.00, 0, '2026-03-22 12:06:32'),
(23, 23, 1, 'Pan blandito 50g', 3.00, 700.00, 0.00, 0.00, 0.00, 2100.00, 0, '2026-03-22 12:07:03'),
(24, 24, 2, 'Pan Aliñado De 2000', 2.00, 2000.00, 0.00, 0.00, 0.00, 4000.00, 0, '2026-03-23 23:47:29'),
(25, 24, 1, 'Pan blandito 50g', 2.00, 700.00, 0.00, 0.00, 0.00, 1400.00, 0, '2026-03-23 23:47:29'),
(26, 25, 2, 'Pan Aliñado De 2000', 2.00, 2000.00, 0.00, 0.00, 0.00, 2000.00, 1, '2026-03-24 00:18:32'),
(27, 25, 1, 'Pan blandito 50g', 1.00, 700.00, 0.00, 0.00, 0.00, 0.00, 1, '2026-03-24 00:18:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_pagos`
--

CREATE TABLE `venta_pagos` (
  `id` int(11) NOT NULL,
  `venta_id` int(11) NOT NULL,
  `medio_pago_id` int(11) NOT NULL,
  `codigo_medio` varchar(40) NOT NULL,
  `nombre_medio` varchar(120) NOT NULL,
  `valor` decimal(14,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `venta_pagos`
--

INSERT INTO `venta_pagos` (`id`, `venta_id`, `medio_pago_id`, `codigo_medio`, `nombre_medio`, `valor`, `created_at`) VALUES
(1, 1, 1, 'EFECTIVO', 'Efectivo', 1000.00, '2026-03-18 17:56:47'),
(2, 2, 1, 'EFECTIVO', 'Efectivo', 2000.00, '2026-03-18 17:59:15'),
(3, 3, 1, 'EFECTIVO', 'Efectivo', 2100.00, '2026-03-18 18:00:14'),
(4, 4, 1, 'EFECTIVO', 'Efectivo', 2000.00, '2026-03-18 18:34:09'),
(5, 4, 3, 'TRANSFERENCIA', 'Transferencia', 1800.00, '2026-03-18 18:34:09'),
(6, 5, 1, 'EFECTIVO', 'Efectivo', 3000.00, '2026-03-18 20:16:02'),
(7, 6, 1, 'EFECTIVO', 'Efectivo', 10000.00, '2026-03-18 20:34:12'),
(8, 7, 1, 'EFECTIVO', 'Efectivo', 6000.00, '2026-03-18 20:36:40'),
(9, 8, 1, 'EFECTIVO', 'Efectivo', 700.00, '2026-03-21 17:52:55'),
(10, 9, 1, 'EFECTIVO', 'Efectivo', 2100.00, '2026-03-21 19:52:26'),
(11, 10, 7, 'CREDITO', 'Crédito cliente', 1400.00, '2026-03-21 23:15:34'),
(12, 11, 7, 'CREDITO', 'Crédito cliente', 1400.00, '2026-03-21 23:16:30'),
(13, 12, 2, 'TARJETA', 'Tarjeta', 1400.00, '2026-03-21 23:16:52'),
(14, 13, 7, 'CREDITO', 'Crédito cliente', 700.00, '2026-03-21 23:41:34'),
(17, 16, 7, 'CREDITO', 'Crédito cliente', 1400.00, '2026-03-22 00:24:31'),
(18, 17, 1, 'EFECTIVO', 'Efectivo', 1400.00, '2026-03-22 00:28:30'),
(19, 18, 7, 'CREDITO', 'Crédito cliente', 1400.00, '2026-03-22 11:08:07'),
(20, 19, 1, 'EFECTIVO', 'Efectivo', 1400.00, '2026-03-22 11:27:41'),
(21, 20, 7, 'CREDITO', 'Crédito cliente', 2100.00, '2026-03-22 11:34:05'),
(22, 21, 1, 'EFECTIVO', 'Efectivo', 1000.00, '2026-03-22 11:47:05'),
(23, 21, 4, 'NEQUI', 'Nequi', 1800.00, '2026-03-22 11:47:05'),
(24, 22, 1, 'EFECTIVO', 'Efectivo', 700.00, '2026-03-22 12:06:32'),
(25, 23, 1, 'EFECTIVO', 'Efectivo', 2100.00, '2026-03-22 12:07:03'),
(26, 24, 1, 'EFECTIVO', 'Efectivo', 6000.00, '2026-03-23 23:47:29'),
(27, 25, 2, 'TARJETA', 'Tarjeta', 2000.00, '2026-03-24 00:18:32');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_cajas_nombre` (`nombre`);

--
-- Indices de la tabla `caja_aperturas`
--
ALTER TABLE `caja_aperturas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_caja_aperturas_caja` (`caja_id`),
  ADD KEY `idx_caja_aperturas_estado` (`estado`);

--
-- Indices de la tabla `caja_arqueos`
--
ALTER TABLE `caja_arqueos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_caja_arqueos_apertura` (`apertura_id`);

--
-- Indices de la tabla `caja_movimientos`
--
ALTER TABLE `caja_movimientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_caja_movimientos_apertura` (`apertura_id`);

--
-- Indices de la tabla `cartera_abonos`
--
ALTER TABLE `cartera_abonos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cartera_abonos_cliente` (`cliente_id`),
  ADD KEY `idx_cartera_abonos_apertura` (`apertura_id`),
  ADD KEY `idx_cartera_abonos_numero` (`numero_recibo`),
  ADD KEY `idx_cartera_abonos_fecha` (`created_at`),
  ADD KEY `idx_cartera_abonos_created_at` (`created_at`),
  ADD KEY `idx_cartera_abonos_numero_recibo` (`numero_recibo`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_clientes_documento` (`numero_documento`),
  ADD KEY `idx_clientes_segmento` (`segmento_id`),
  ADD KEY `idx_clientes_nombre` (`nombres`),
  ADD KEY `idx_clientes_razon_social` (`razon_social`);

--
-- Indices de la tabla `cliente_abonos`
--
ALTER TABLE `cliente_abonos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cliente_abonos_cliente` (`cliente_id`),
  ADD KEY `idx_cliente_abonos_apertura` (`apertura_id`),
  ADD KEY `idx_cliente_abonos_numero` (`numero_recibo`),
  ADD KEY `idx_cliente_abonos_fecha` (`created_at`),
  ADD KEY `idx_cliente_abonos_created_at` (`created_at`);

--
-- Indices de la tabla `cliente_puntos_movimientos`
--
ALTER TABLE `cliente_puntos_movimientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cliente_puntos_cliente` (`cliente_id`),
  ADD KEY `idx_cliente_puntos_fecha` (`fecha_movimiento`);

--
-- Indices de la tabla `cliente_segmentos`
--
ALTER TABLE `cliente_segmentos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_cliente_segmentos_nombre` (`nombre`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_compras_proveedor` (`proveedor_id`),
  ADD KEY `idx_compras_factura` (`numero_factura`),
  ADD KEY `idx_compras_fecha` (`fecha_factura`);

--
-- Indices de la tabla `compra_detalle`
--
ALTER TABLE `compra_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_compra_detalle_compra` (`compra_id`),
  ADD KEY `idx_compra_detalle_producto` (`producto_id`);

--
-- Indices de la tabla `compra_recepciones`
--
ALTER TABLE `compra_recepciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_compra_recepciones_orden` (`orden_id`),
  ADD KEY `idx_compra_recepciones_numero` (`numero`);

--
-- Indices de la tabla `compra_recepcion_detalle`
--
ALTER TABLE `compra_recepcion_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_compra_recepcion_detalle_recepcion` (`recepcion_id`),
  ADD KEY `idx_compra_recepcion_detalle_orden` (`orden_detalle_id`),
  ADD KEY `idx_compra_recepcion_detalle_producto` (`producto_id`);

--
-- Indices de la tabla `configuracion_backup_log`
--
ALTER TABLE `configuracion_backup_log`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracion_balanzas`
--
ALTER TABLE `configuracion_balanzas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracion_general`
--
ALTER TABLE `configuracion_general`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clave` (`clave`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `fe_envios_log`
--
ALTER TABLE `fe_envios_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fe_envios_venta` (`venta_id`);

--
-- Indices de la tabla `impuestos`
--
ALTER TABLE `impuestos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_impuestos_nombre` (`nombre`);

--
-- Indices de la tabla `inventario_movimientos`
--
ALTER TABLE `inventario_movimientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_inventario_movimientos_producto` (`producto_id`),
  ADD KEY `idx_inventario_movimientos_documento` (`documento_tipo`,`documento_id`),
  ADD KEY `idx_inventario_movimientos_fecha` (`created_at`);

--
-- Indices de la tabla `licencias`
--
ALTER TABLE `licencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_licencias_empresa` (`empresa_id`);

--
-- Indices de la tabla `medios_pago`
--
ALTER TABLE `medios_pago`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_medios_pago_codigo` (`codigo`);

--
-- Indices de la tabla `ordenes_compra`
--
ALTER TABLE `ordenes_compra`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_orden_compra_numero` (`numero`),
  ADD KEY `idx_oc_empresa` (`empresa_id`),
  ADD KEY `idx_oc_proveedor` (`proveedor_id`),
  ADD KEY `idx_oc_estado` (`estado`);

--
-- Indices de la tabla `orden_compra_detalle`
--
ALTER TABLE `orden_compra_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ocd_orden` (`orden_id`),
  ADD KEY `idx_ocd_producto` (`producto_id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_permisos_codigo` (`codigo`);

--
-- Indices de la tabla `pos_tickets_espera`
--
ALTER TABLE `pos_tickets_espera`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pos_tickets_estado` (`estado`);

--
-- Indices de la tabla `pos_tickets_espera_detalle`
--
ALTER TABLE `pos_tickets_espera_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pos_tickets_detalle_ticket` (`ticket_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_productos_codigo_interno` (`codigo_interno`),
  ADD KEY `idx_productos_sku` (`sku`),
  ADD KEY `idx_productos_barcode` (`barcode_principal`),
  ADD KEY `idx_productos_nombre` (`nombre`);

--
-- Indices de la tabla `producto_categorias`
--
ALTER TABLE `producto_categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_producto_categorias_nombre` (`nombre`),
  ADD KEY `idx_producto_categorias_familia` (`familia_id`);

--
-- Indices de la tabla `producto_codigos`
--
ALTER TABLE `producto_codigos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_producto_codigos_producto` (`producto_id`),
  ADD KEY `idx_producto_codigos_codigo` (`codigo`);

--
-- Indices de la tabla `producto_familias`
--
ALTER TABLE `producto_familias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_producto_familias_nombre` (`nombre`);

--
-- Indices de la tabla `producto_marcas`
--
ALTER TABLE `producto_marcas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_producto_marcas_nombre` (`nombre`);

--
-- Indices de la tabla `producto_subcategorias`
--
ALTER TABLE `producto_subcategorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_producto_subcategorias_nombre` (`nombre`),
  ADD KEY `idx_producto_subcategorias_categoria` (`categoria_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_proveedor_empresa_documento` (`empresa_id`,`numero_documento`),
  ADD KEY `idx_proveedor_empresa` (`empresa_id`),
  ADD KEY `idx_proveedor_categoria` (`categoria_id`);

--
-- Indices de la tabla `proveedor_categorias`
--
ALTER TABLE `proveedor_categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_proveedor_categoria_empresa_nombre` (`empresa_id`,`nombre`);

--
-- Indices de la tabla `proveedor_contactos`
--
ALTER TABLE `proveedor_contactos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_proveedor_contacto_proveedor` (`proveedor_id`);

--
-- Indices de la tabla `resoluciones_facturacion`
--
ALTER TABLE `resoluciones_facturacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_roles_empresa_nombre` (`empresa_id`,`nombre`);

--
-- Indices de la tabla `rol_permiso`
--
ALTER TABLE `rol_permiso`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_rol_permiso` (`rol_id`,`permiso_id`),
  ADD KEY `idx_rp_permiso` (`permiso_id`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sedes_empresa` (`empresa_id`);

--
-- Indices de la tabla `unidades_medida`
--
ALTER TABLE `unidades_medida`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_unidades_medida_nombre` (`nombre`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_usuarios_usuario` (`usuario`),
  ADD KEY `idx_usuarios_empresa` (`empresa_id`),
  ADD KEY `idx_usuarios_rol` (`rol_id`),
  ADD KEY `idx_usuarios_sede` (`sede_id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_ventas_numero` (`numero`),
  ADD KEY `idx_ventas_apertura` (`apertura_id`),
  ADD KEY `idx_ventas_cliente` (`cliente_id`);

--
-- Indices de la tabla `ventas_auditoria`
--
ALTER TABLE `ventas_auditoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ventas_auditoria_apertura` (`apertura_id`);

--
-- Indices de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_venta_detalle_venta` (`venta_id`);

--
-- Indices de la tabla `venta_pagos`
--
ALTER TABLE `venta_pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_venta_pagos_venta` (`venta_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cajas`
--
ALTER TABLE `cajas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `caja_aperturas`
--
ALTER TABLE `caja_aperturas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `caja_arqueos`
--
ALTER TABLE `caja_arqueos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `caja_movimientos`
--
ALTER TABLE `caja_movimientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cartera_abonos`
--
ALTER TABLE `cartera_abonos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cliente_abonos`
--
ALTER TABLE `cliente_abonos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente_puntos_movimientos`
--
ALTER TABLE `cliente_puntos_movimientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `cliente_segmentos`
--
ALTER TABLE `cliente_segmentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compra_detalle`
--
ALTER TABLE `compra_detalle`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compra_recepciones`
--
ALTER TABLE `compra_recepciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compra_recepcion_detalle`
--
ALTER TABLE `compra_recepcion_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `configuracion_backup_log`
--
ALTER TABLE `configuracion_backup_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `configuracion_balanzas`
--
ALTER TABLE `configuracion_balanzas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `configuracion_general`
--
ALTER TABLE `configuracion_general`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `fe_envios_log`
--
ALTER TABLE `fe_envios_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `impuestos`
--
ALTER TABLE `impuestos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `inventario_movimientos`
--
ALTER TABLE `inventario_movimientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `licencias`
--
ALTER TABLE `licencias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `medios_pago`
--
ALTER TABLE `medios_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `ordenes_compra`
--
ALTER TABLE `ordenes_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orden_compra_detalle`
--
ALTER TABLE `orden_compra_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `pos_tickets_espera`
--
ALTER TABLE `pos_tickets_espera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pos_tickets_espera_detalle`
--
ALTER TABLE `pos_tickets_espera_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `producto_categorias`
--
ALTER TABLE `producto_categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `producto_codigos`
--
ALTER TABLE `producto_codigos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `producto_familias`
--
ALTER TABLE `producto_familias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `producto_marcas`
--
ALTER TABLE `producto_marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto_subcategorias`
--
ALTER TABLE `producto_subcategorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `proveedor_categorias`
--
ALTER TABLE `proveedor_categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `proveedor_contactos`
--
ALTER TABLE `proveedor_contactos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `resoluciones_facturacion`
--
ALTER TABLE `resoluciones_facturacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `rol_permiso`
--
ALTER TABLE `rol_permiso`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT de la tabla `sedes`
--
ALTER TABLE `sedes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `unidades_medida`
--
ALTER TABLE `unidades_medida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `ventas_auditoria`
--
ALTER TABLE `ventas_auditoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `venta_pagos`
--
ALTER TABLE `venta_pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `licencias`
--
ALTER TABLE `licencias`
  ADD CONSTRAINT `fk_licencias_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`);

--
-- Filtros para la tabla `rol_permiso`
--
ALTER TABLE `rol_permiso`
  ADD CONSTRAINT `fk_rp_permiso` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_rp_rol` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD CONSTRAINT `fk_sedes_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  ADD CONSTRAINT `fk_usuarios_rol` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `fk_usuarios_sede` FOREIGN KEY (`sede_id`) REFERENCES `sedes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
