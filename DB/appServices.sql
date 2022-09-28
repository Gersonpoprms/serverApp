-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 25-07-2022 a las 20:44:54
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `appServices`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calendar`
--

CREATE TABLE `calendar` (
  `IdCalendar` int(11) NOT NULL,
  `title` varchar(70) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `IdUser_FK` varchar(50) NOT NULL,
  `Tipo_Documento` varchar(50) NOT NULL,
  `id_documento` int(11) DEFAULT NULL,
  `estado` varchar(50) NOT NULL,
  `className` varchar(20) NOT NULL,
  `url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `calendar`
--

INSERT INTO `calendar` (`IdCalendar`, `title`, `start`, `end`, `IdUser_FK`, `Tipo_Documento`, `id_documento`, `estado`, `className`, `url`) VALUES
(1, 'realizar inspeccion a generadores de la cira', '2021-10-18 00:00:00', '2021-10-20 00:00:00', '80200972', 'requerimiento', 1, 'Solicitado', 'Solicitado', 'Request.jsp?Id=1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company`
--

CREATE TABLE `company` (
  `IdCompany_PK` varchar(20) NOT NULL,
  `MainCompany` tinyint(1) NOT NULL DEFAULT 0,
  `SocialName` varchar(50) NOT NULL,
  `IdCompanyType_FK` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `Conuntry` varchar(50) NOT NULL,
  `Industry` varchar(50) DEFAULT NULL,
  `BornDate` varchar(50) NOT NULL DEFAULT 'active',
  `LegalForm_FK` varchar(10) NOT NULL,
  `CIIU_FK` varchar(100) NOT NULL,
  `ContactPerson` varchar(60) NOT NULL,
  `PhoneContact` varchar(60) NOT NULL,
  `Status` varchar(60) NOT NULL,
  `LegalRepresentative` varchar(100) NOT NULL,
  `DNILegalRep` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `company`
--

INSERT INTO `company` (`IdCompany_PK`, `MainCompany`, `SocialName`, `IdCompanyType_FK`, `url`, `Conuntry`, `Industry`, `BornDate`, `LegalForm_FK`, `CIIU_FK`, `ContactPerson`, `PhoneContact`, `Status`, `LegalRepresentative`, `DNILegalRep`) VALUES
('12334534', 0, 'Cocacola', 'Don Coca  colo', 'Bebidas Azucaradas', 'Sr Canasta', '3123456789', 'delete', '', '', '', '', 'active', '0', ''),
('80200972', 0, 'Ejemplo Empresa', 'NIT', 'www.prueba.com', 'CO', '01', '38718', 'SAS', '0145', 'Gerson porras', '3102776565', 'active', 'Charles Ibarrar', '123456789'),
('812512275', 1, 'RMS SAS - Reliability Maintenance Servie', 'NIT', 'http://rms.com.co', 'CO', '01', '38718', 'SAS', '0145', 'Gerson Porras', '3102776565', 'active', 'Charles Ibarras', '2343543'),
('899999068', 0, 'Ecopetrol SA', 'Alguien Desconocido', 'Minas y Energia', 'Sergio Pinilla', '3123456789', 'active', '', '', '', '', 'active', '0', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companybranches`
--

CREATE TABLE `companybranches` (
  `IdBranch_PK` int(12) NOT NULL,
  `branch_id` varchar(11) DEFAULT NULL,
  `IdCompany_FK` varchar(16) NOT NULL,
  `BranchName` varchar(100) DEFAULT NULL,
  `country_FK` varchar(40) DEFAULT NULL,
  `state_FK` varchar(40) DEFAULT NULL,
  `city_FK` varchar(40) DEFAULT NULL,
  `address` varchar(300) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `config_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `ContactPerson` varchar(64) DEFAULT NULL,
  `GeoLocation` varchar(100) DEFAULT NULL,
  `PhoneContactP` varchar(64) DEFAULT NULL,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companyeq`
--

CREATE TABLE `companyeq` (
  `IdEQ_PK` int(12) NOT NULL,
  `IdSystem_FK` varchar(12) DEFAULT NULL,
  `EqManufacturer` varchar(100) DEFAULT NULL,
  `EqModel` varchar(40) DEFAULT NULL,
  `EqType_FK` varchar(40) DEFAULT NULL,
  `InitServieDate` varchar(40) DEFAULT NULL,
  `EqSerialNumber` varchar(40) DEFAULT NULL,
  `Criticality` varchar(40) DEFAULT NULL,
  `IdFuncianalUnitSAP` varchar(40) DEFAULT NULL,
  `IdEqSAP` varchar(40) DEFAULT NULL,
  `EqTAG` varchar(40) DEFAULT NULL,
  `Status` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companyfacilities`
--

CREATE TABLE `companyfacilities` (
  `IdBranch_FK` int(12) NOT NULL,
  `IdFacility_PK` int(12) NOT NULL,
  `IdCompany_FK` varchar(16) NOT NULL,
  `FacilityName` varchar(100) DEFAULT NULL,
  `FacilityInitials` varchar(40) DEFAULT NULL,
  `FacilityType_FK` varchar(40) DEFAULT NULL,
  `ContactPerson` varchar(64) DEFAULT NULL,
  `GeoLocation` varchar(100) DEFAULT NULL,
  `PhoneContactP` varchar(64) DEFAULT NULL,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companysystems`
--

CREATE TABLE `companysystems` (
  `IdSystem_PK` int(12) NOT NULL,
  `IdFacility_FK` varchar(12) DEFAULT NULL,
  `SystemName` varchar(100) DEFAULT NULL,
  `SystemInitials` varchar(40) DEFAULT NULL,
  `Status` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contract`
--

CREATE TABLE `contract` (
  `IdContract_PK` int(10) NOT NULL,
  `IdCompany_FK` varchar(20) NOT NULL,
  `ContractNumber` varchar(30) NOT NULL,
  `ObjectContract` varchar(600) NOT NULL,
  `DateInitContract` varchar(20) NOT NULL,
  `TotalValue` bigint(20) NOT NULL,
  `ServiceTypeContract_PK` varchar(20) NOT NULL,
  `ManagerContract` varchar(109) NOT NULL,
  `PhoneNumberManager` varchar(12) NOT NULL,
  `EmailManager` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_rq`
--

CREATE TABLE `detalle_rq` (
  `IdDeralleRQ_PK` int(11) NOT NULL,
  `IdRequerimiento_FK` int(11) DEFAULT NULL,
  `IdSucursal_FK` int(11) NOT NULL,
  `IdEquipo_FK` int(11) DEFAULT NULL,
  `Descripcion_RQ` varchar(50) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_rq`
--

INSERT INTO `detalle_rq` (`IdDeralleRQ_PK`, `IdRequerimiento_FK`, `IdSucursal_FK`, `IdEquipo_FK`, `Descripcion_RQ`, `Estado`) VALUES
(6, 1, 1, 4, 'arar', 'Solicitado'),
(7, 1, 1, 5, 'vibraciones', 'Solicitado'),
(8, 1, 1, 6, 'termografia', 'Solicitado'),
(9, 1, 1, 7, 'vibraciones', 'Solicitado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employeefamilyinfo`
--

CREATE TABLE `employeefamilyinfo` (
  `IdEmpFamilyInfo_PK` int(11) NOT NULL,
  `IdEmployee_FK` int(11) NOT NULL,
  `FamilyName_Lastname` varchar(40) NOT NULL,
  `FamilyBornDate` varchar(10) NOT NULL,
  `IdFamilyGender_FK` int(11) NOT NULL,
  `FamilyPhone` int(11) NOT NULL,
  `IdFamilyParent_FK` int(11) NOT NULL,
  `FamilyIsEmergency` int(11) NOT NULL,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `employeefamilyinfo`
--

INSERT INTO `employeefamilyinfo` (`IdEmpFamilyInfo_PK`, `IdEmployee_FK`, `FamilyName_Lastname`, `FamilyBornDate`, `IdFamilyGender_FK`, `FamilyPhone`, `IdFamilyParent_FK`, `FamilyIsEmergency`, `Status`) VALUES
(1, 5617522, 'richin', '2022-07-22', 8, 123, 49, 0, ''),
(2, 5617522, 'Matinillo', '2022-07-27', 8, 123, 49, 0, ''),
(3, 12541342, 'Matinillo', '2022-08-04', 8, 23123, 49, 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employeepersonalinfo`
--

CREATE TABLE `employeepersonalinfo` (
  `IdEmployee_PK` bigint(20) NOT NULL,
  `IdTypeDNI_FK` varchar(10) NOT NULL,
  `EmpDni` bigint(20) NOT NULL,
  `IdEmpDniExpCity_FK` int(10) NOT NULL,
  `EmpLastName` varchar(100) NOT NULL,
  `EmpName` varchar(100) NOT NULL,
  `IdEmpHomeCity_FK` int(10) NOT NULL,
  `EmpAddress` varchar(100) NOT NULL,
  `EmpNeighborhood` varchar(100) NOT NULL,
  `EmpPhoneNumber` varchar(20) NOT NULL,
  `EmpEmail` varchar(50) NOT NULL,
  `EmpBornDate` varchar(10) NOT NULL,
  `IdEmpBornCity_FK` int(10) NOT NULL,
  `IdEmpGender_FK` varchar(10) NOT NULL,
  `EmpRH` varchar(10) NOT NULL,
  `EmpSocialStratum` varchar(10) NOT NULL,
  `IdEmpCivilState_FK` varchar(10) NOT NULL,
  `EmpAvatar` varchar(100) DEFAULT NULL,
  `hasUser` tinyint(1) DEFAULT NULL,
  `Status` varchar(10) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `employeepersonalinfo`
--

INSERT INTO `employeepersonalinfo` (`IdEmployee_PK`, `IdTypeDNI_FK`, `EmpDni`, `IdEmpDniExpCity_FK`, `EmpLastName`, `EmpName`, `IdEmpHomeCity_FK`, `EmpAddress`, `EmpNeighborhood`, `EmpPhoneNumber`, `EmpEmail`, `EmpBornDate`, `IdEmpBornCity_FK`, `IdEmpGender_FK`, `EmpRH`, `EmpSocialStratum`, `IdEmpCivilState_FK`, `EmpAvatar`, `hasUser`, `Status`) VALUES
(80200973, '1', 80255151, 1095, 'Saldaña Osorio', 'Edwin Ferney', 107, 'Carrera 13A 148 71', 'Cedritos', '3102776565', 'edwin_ait@hotmail.com', '1981/05/13', 1095, '8', 'A+', '4', '1', NULL, 1, 'delete'),
(80255170, 'CC', 35456, 131, 'Shari', 'Pocoyo', 285, 'Pocoyo', 'Pocoyo', '3627191618', 'Pocoyo@Pocoyo.com', '2020-07-06', 131, 'H', 'OP', '5', 'SOLTER@', NULL, NULL, 'delete'),
(80255171, 'CC', 2, 17, 'test', 'test', 18, '234234234', '234234', '234234234234', 'test@test.com', '2022-07-04', 17, 'H', 'OP', '3', 'SOLTER@', NULL, 1, 'delete'),
(80255172, 'CE', 23456, 17, 'Garra', 'Nico', 11, '56789122', '2323232', '3152846789', 'Garra@Nico.com', '2022-06-29', 18, 'H', 'OP', '2', 'SOLTER@', NULL, NULL, 'delete'),
(80255173, 'CC', 5617522, 14, 'Ferro2', 'Carlos', 12, 'Calle 45 #3-18', 'Sancocho', '3245678902', 'carlos.prentt@hotmail.com', '2022-07-06', 9, 'H', 'GAA', '3', 'SOLTER@', NULL, 1, 'active'),
(80255174, 'CC', 16292538282, 14, 'tqshnsd', 'carlos', 15, 'gsuigswuish', 'gugkj', '34657834567', 'gsjd@dsjda.com', '2022-07-26', 14, 'H', 'GAA', '2', 'SOLTER@', NULL, 1, 'delete'),
(80255175, 'NIP', 214323421, 16, '2', 'Carlos', 18, 'j', 'ertrt3', '213451431421', '2@2.com', '2022-07-27', 17, 'H', 'GBB', '2', 'SOLTER@', NULL, NULL, 'delete'),
(80255176, 'CE', 21321, 17, 'f', 'Carlos', 15, '213124dwq', 'asdwq2', '3131231331', '2@2.com', '2022-07-20', 16, 'H', 'RH', '2', 'CASAD@', NULL, NULL, 'delete'),
(80255177, 'CE', 212312, 15, 'wwqq', 'qwwqw', 4, '2131232', '2312323', '2323321313', '2313@1231.com', '2022-06-29', 16, 'H', 'GAA', '3', 'CASAD@', NULL, NULL, 'delete'),
(80255178, 'CC', 34534534, 16, 'nuevo', 'nuevos', 15, '234234', '2', '3102006653', 'nuevo@nuevo.com', '2022-07-05', 17, 'H', 'OP', '1', 'CASAD@', NULL, 0, 'active'),
(80255179, 'CC', 12541342, 12, 'Vaca', 'Lola', 1, 'asdfrewfd', 'drwefds', '3678234563', 'vaca@lola.com', '2022-07-19', 17, 'M', 'GAB', '2', 'SOLTER@', NULL, NULL, 'active');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employeestudyinfo`
--

CREATE TABLE `employeestudyinfo` (
  `IdEmpStudyInfo_PK` int(11) NOT NULL,
  `IdEmployee_FK` int(11) NOT NULL,
  `IdStudyLevel_FK` int(11) NOT NULL,
  `StudyInstitute` varchar(50) NOT NULL,
  `StudyTitle` varchar(50) NOT NULL,
  `StudyYear` int(11) NOT NULL,
  `StudyRegister` int(11) NOT NULL,
  `Status` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `employeestudyinfo`
--

INSERT INTO `employeestudyinfo` (`IdEmpStudyInfo_PK`, `IdEmployee_FK`, `IdStudyLevel_FK`, `StudyInstitute`, `StudyTitle`, `StudyYear`, `StudyRegister`, `Status`) VALUES
(5, 5617522, 22, 'facaschool', 'inge', 2022, 21, ''),
(6, 12541342, 2, 'Universidad Nacional', 'inge', 2022, 21, ''),
(7, 5617522, 22, 'facaschool', 'inge', 2022, 21, ''),
(8, 12541342, 2, 'Universidad Nacional', 'inge', 2022, 21, ''),
(9, 5617522, 22, 'facaschool', 'inge', 2022, 21, ''),
(10, 12541342, 2, 'Universidad Nacional', 'inge', 2022, 21, ''),
(11, 5617522, 22, 'facaschool', 'inge', 2022, 21, ''),
(12, 12541342, 2, 'Universidad Nacional', 'inge', 2022, 21, ''),
(13, 5617522, 22, 'facaschool', 'inge', 2022, 21, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employeeworkinfo`
--

CREATE TABLE `employeeworkinfo` (
  `IdEmpWorkInfo_PK` int(11) NOT NULL,
  `IdEmployee_FK` bigint(20) NOT NULL,
  `IdEPS_FK` varchar(10) NOT NULL,
  `IdARL_FK` varchar(10) NOT NULL,
  `IdCCF_FK` varchar(10) NOT NULL,
  `IdAFP_FK` varchar(10) NOT NULL,
  `IdAFC_FK` varchar(10) NOT NULL,
  `ShirtSize` varchar(5) NOT NULL,
  `PantSize` varchar(5) NOT NULL,
  `ShoesSize` varchar(5) NOT NULL,
  `IdContract_FK` int(10) NOT NULL,
  `IdPosition_FK` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `employeeworkinfo`
--

INSERT INTO `employeeworkinfo` (`IdEmpWorkInfo_PK`, `IdEmployee_FK`, `IdEPS_FK`, `IdARL_FK`, `IdCCF_FK`, `IdAFP_FK`, `IdAFC_FK`, `ShirtSize`, `PantSize`, `ShoesSize`, `IdContract_FK`, `IdPosition_FK`) VALUES
(1, 0, 'CLS', 'SURA', 'CFRN', 'CFDS', 'POR', '432', '1234', '3', 0, 0),
(2, 2, 'CLS', 'SURA', 'CLSD', 'CFDS', 'COL', '432', '1234', '321', 0, 0),
(3, 45456, 'CLS', 'SBLV', 'CNFN', 'CPSN', 'POR', 'moe', 'moe', 'moe', 0, 0),
(4, 234234, 'FMS', 'SURA', 'CNFN', 'CPSN', 'COL', '432', '23324', '23423', 0, 0),
(5, 2, 'FMS', 'SBLV', 'CNFN', 'CFDS', 'COL', '432', '1234', '321', 0, 0),
(6, 234234234, 'FMS', 'SBLV', 'CFRN', 'CFDS', 'COL', '432', '1234', '321', 0, 0),
(7, 2234234, 'FMS', 'SBLV', 'CFRN', 'CFDS', 'COL', '432', '1234', '321', 0, 0),
(8, 1234, 'FMS', 'SCPT', 'CFRN', 'PRVN', 'COL', '432', '1234', '321', 0, 0),
(9, 3582, 'CLS', 'SBLV', 'CNFN', 'CFDS', 'COL', '124', '34', '23', 0, 0),
(10, 35456, 'FMS', 'SBLV', 'CNFN', 'CPSN', 'COL', '432', '1234', '321', 0, 0),
(11, 2, 'FMS', 'SBLV', 'CNFN', 'CPSN', 'POR', '432', '1234', '321', 0, 0),
(12, 23456, 'CLS', 'SBLV', 'CFRN', 'CFDS', 'COL', '432', '1234', '321', 0, 0),
(13, 5617522, 'FMS', 'SBLV', 'CNFN', 'CFDS', 'COL', 'M', '38', '24', 0, 0),
(14, 16292538282, 'FMS', 'SBLV', 'CFRN', 'PRVN', 'POR', '23', '1234', '321', 0, 0),
(15, 214323421, 'CLS', 'SCPT', 'CFM', 'PRTC', 'PRO', '432', '1234', '321', 0, 0),
(16, 21243131, 'CLS', 'SPST', 'CFRN', 'CPSN', 'COL', '432', '21412', '321', 0, 0),
(17, 21321, 'CLS', 'SURA', 'CNFN', 'CPSN', 'POR', '432', '213', '213', 0, 0),
(18, 212312, 'CLS', 'SURA', 'CNFN', 'CPSN', 'POR', '212', '1', '21', 0, 0),
(19, 34534534, 'FMS', 'SBLV', 'CNFN', 'CFDS', 'COL', '432', '3434', '3434', 0, 0),
(20, 12541342, 'CLS', 'SURA', 'CFRN', 'CPSN', 'COL', '123', '213', '123', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `GTHFOR069`
--

CREATE TABLE `GTHFOR069` (
  `IdContract_PK` int(11) NOT NULL,
  `empleadorId_FK` varchar(50) NOT NULL,
  `DomicilioEmpleador` varchar(100) NOT NULL,
  `NombreTrabajador` varchar(50) NOT NULL,
  `ApellidoTrabajador` varchar(50) NOT NULL,
  `cedulaId_FK` varchar(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `nacionalidad` varchar(20) NOT NULL,
  `telefonoTrabajador` varchar(20) NOT NULL,
  `emailTrabajador` varchar(50) NOT NULL,
  `fechaContratacion` varchar(20) NOT NULL,
  `sitioContratacion` varchar(50) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `fechaInicioContrato` varchar(15) NOT NULL,
  `fechaFinContrato` varchar(15) NOT NULL,
  `lugarBase` varchar(50) NOT NULL,
  `lugarDesempenhoLabores` varchar(100) NOT NULL,
  `duracionContrato` varchar(20) NOT NULL,
  `periodoPrueba` varchar(20) NOT NULL,
  `periodoPago` varchar(20) NOT NULL,
  `salario` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `jefeInmediatoId_FK` varchar(20) NOT NULL,
  `areaTrabajo` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `GTHFOR069`
--

INSERT INTO `GTHFOR069` (`IdContract_PK`, `empleadorId_FK`, `DomicilioEmpleador`, `NombreTrabajador`, `ApellidoTrabajador`, `cedulaId_FK`, `direccion`, `nacionalidad`, `telefonoTrabajador`, `emailTrabajador`, `fechaContratacion`, `sitioContratacion`, `cargo`, `fechaInicioContrato`, `fechaFinContrato`, `lugarBase`, `lugarDesempenhoLabores`, `duracionContrato`, `periodoPrueba`, `periodoPago`, `salario`, `status`, `jefeInmediatoId_FK`, `areaTrabajo`) VALUES
(1, '812512275', 'CARRERA 14 109 21', 'Gerson Rodrigo', 'Porras Pinzon', '80200972', 'cra 13A 148 71 apto 203', 'Colombiano', '3102776565', 'gersonpop@hotmail.com', '2022/07/08', 'Bogota', 'Lider Confiabilidad y Contratos', '2022/07/08', '', 'Bogota', 'Bogota', '999999', '40', 'mensual', '4200000', 'activo', '80255173', 'Operaciones'),
(4, '812512275', 'CARRERA 14 109 21', 'Charles ', 'Ibarra Fernandez', '2343543', 'cra 13A 148 71 apto 203', 'Colombiano', '3102345678', 'chibarrar@hotmail.com', '2017/07/08', 'Bogota', 'Gerente General', '2022/07/08', '', 'Bogota', 'Bogota', '999999', '40', 'mensual', '4200000', 'activo', '80255173', 'Gerencia'),
(5, '812512275', 'CARRERA 14 109 21', 'Katherine', 'Reyes', '1234567890', 'cra 13A 148 71 apto 203', 'Colombiano', '3102345678', 'katerinesre@hotmail.com', '2019/07/08', 'Bogota', 'Gerente Recursos Humanos', '2022/07/08', '', 'Bogota', 'Bogota', '999999', '40', 'mensual', '4200000', 'activo', '80255173', 'Gestion Recursos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gthfor070`
--

CREATE TABLE `gthfor070` (
  `IdFormat_PK` int(20) NOT NULL,
  `fechaSolicitud` varchar(10) NOT NULL,
  `cargoSolicitante` varchar(50) NOT NULL,
  `IdUser_FK` int(20) NOT NULL,
  `areaSolicitante` varchar(20) NOT NULL,
  `areaRequerido` varchar(20) NOT NULL,
  `cargoRequerido` varchar(20) NOT NULL,
  `lugarTrabajoReq` varchar(20) NOT NULL,
  `fechaProgIngreso` varchar(10) NOT NULL,
  `Contrato` varchar(50) NOT NULL,
  `ECM` tinyint(1) NOT NULL DEFAULT 0,
  `tipoVacante` varchar(40) NOT NULL,
  `personaReemplazar` varchar(20) NOT NULL,
  `metodoReclutamiento` varchar(20) NOT NULL,
  `metodoReclutamientoOtro` varchar(40) NOT NULL,
  `manualFunciones` varchar(20) NOT NULL,
  `tipoContrato` varchar(20) NOT NULL,
  `terminoInicial` varchar(20) NOT NULL,
  `tiempoAdaptacion` varchar(20) NOT NULL,
  `turno` varchar(20) NOT NULL,
  `funcionConductor` tinyint(1) NOT NULL,
  `tipoRiesgoARL` int(20) NOT NULL,
  `medicinaPrepagada` tinyint(1) NOT NULL,
  `seguroExequial` tinyint(1) NOT NULL,
  `seguroVIda` tinyint(1) NOT NULL,
  `desayuno` tinyint(1) NOT NULL,
  `almuerzo` tinyint(1) NOT NULL,
  `cena` tinyint(1) NOT NULL,
  `noAplicaAlimentacion` tinyint(1) NOT NULL,
  `computadorDesktop` tinyint(1) NOT NULL,
  `telefonoMovil` tinyint(1) NOT NULL,
  `eMail` tinyint(1) NOT NULL,
  `modem` tinyint(1) NOT NULL,
  `computadorLaptop` tinyint(1) NOT NULL,
  `avantel` tinyint(1) NOT NULL,
  `puestoTrabajo` tinyint(1) NOT NULL,
  `elementosOficina` tinyint(1) NOT NULL,
  `OtroRecurso` varchar(60) NOT NULL,
  `nombreSolicitante` varchar(20) NOT NULL,
  `firmaSolicitante` varchar(20) NOT NULL,
  `nombreRevision` varchar(20) NOT NULL,
  `cargoRevision` varchar(20) NOT NULL,
  `firmaRevision` varchar(20) NOT NULL,
  `fechaRevision` varchar(20) NOT NULL,
  `nombreAprobador` varchar(20) NOT NULL,
  `cargoAprobador` varchar(20) NOT NULL,
  `firmaAprobador` varchar(20) NOT NULL,
  `fechaAprobador` varchar(20) NOT NULL,
  `salario` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Status` varchar(20) NOT NULL,
  `fechaGestion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gthfor070`
--

INSERT INTO `gthfor070` (`IdFormat_PK`, `fechaSolicitud`, `cargoSolicitante`, `IdUser_FK`, `areaSolicitante`, `areaRequerido`, `cargoRequerido`, `lugarTrabajoReq`, `fechaProgIngreso`, `Contrato`, `ECM`, `tipoVacante`, `personaReemplazar`, `metodoReclutamiento`, `metodoReclutamientoOtro`, `manualFunciones`, `tipoContrato`, `terminoInicial`, `tiempoAdaptacion`, `turno`, `funcionConductor`, `tipoRiesgoARL`, `medicinaPrepagada`, `seguroExequial`, `seguroVIda`, `desayuno`, `almuerzo`, `cena`, `noAplicaAlimentacion`, `computadorDesktop`, `telefonoMovil`, `eMail`, `modem`, `computadorLaptop`, `avantel`, `puestoTrabajo`, `elementosOficina`, `OtroRecurso`, `nombreSolicitante`, `firmaSolicitante`, `nombreRevision`, `cargoRevision`, `firmaRevision`, `fechaRevision`, `nombreAprobador`, `cargoAprobador`, `firmaAprobador`, `fechaAprobador`, `salario`, `Status`, `fechaGestion`) VALUES
(1, '16/6/2022', 'Lide', 80200972, 'operaciones', 'operaciones', 'ing confiabilidad', 'campo jobo', '2022-06-22', '110110', 0, 'Reemplazo', 'marlon mosquera', 'MercadoLaboral', '', '1', 'TerminoFijo', '6 meses', '31 dias', '14/7', 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 'escritorio', 'gerson', 'wewe', '', '', '', '', '', '', '', '', '{\"tipo\":\"Integral\",\"valor\":\"\",\"primaAlimentacion\":0,\"primaMovilizacion\":0,\"primaLocalizacion\":0,\"otroSalario\":\"\"}', 'solicitado', '16/6/2022'),
(2, '16/6/2022', 'Lide', 80200972, 'operaciones', 'operaciones', 'ing confiabilidad', 'campo jobo', '2022-06-22', '110110', 0, 'Reemplazo', 'marlon mosquera', 'MercadoLaboral', '', '1', 'TerminoFijo', '6 meses', '31 dias', '14/7', 1, 4, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, '', 'gerson', 'wewe', '', '', '', '', '', '', '', '', '{\"tipo\":\"Integral\",\"valor\":\"13900000\",\"primaAlimentacion\":\"\",\"primaMovilizacion\":\"\",\"primaLocalizacion\":\"\",\"otroSalario\":\"\"}', 'solicitado', '16/6/2022'),
(3, '16/6/2022', 'jkb', 80200972, 'jbk', 'Operaciones', 'kjsbdjk', 'Base Cartagen', '0012-12-12', 'HOCOL C21-0107 Ceco 101804', 0, 'Reemplazo', 'd', 'otro', 'd ', '1', 'Indefinido', 'dds', 'sdsd', 'sd', 0, 2, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, '', 'jkjbkj', 'wewe', '', '', '', '', '', '', '', '', '{\"tipo\":\"Basico\",\"valor\":\"4800000\",\"primaAlimentacion\":0,\"primaMovilizacion\":0,\"primaLocalizacion\":0,\"otroSalario\":\"\"}', 'solicitado', '16/6/2022'),
(4, '16/6/2022', 'Lide', 80200972, 'operaciones', 'operaciones', 'ing confiabilidad', 'campo jobo', '2022-06-22', '110110', 0, 'Reemplazo', 'marlon mosquera', 'MercadoLaboral', '', '1', 'TerminoFijo', '6 meses', '31 dias', '14/7', 1, 4, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, '', 'gerson', 'wewe', '', '', '', '', '', '', '', '', '{\"tipo\":\"Integral\",\"valor\":\"13900000\",\"primaAlimentacion\":\"\",\"primaMovilizacion\":\"\",\"primaLocalizacion\":\"\",\"otroSalario\":\"\"}', 'solicitado', '16/6/2022'),
(5, '16/6/2022', 'Lide', 80200972, 'operaciones', 'operaciones', 'ing confiabilidad', 'campo jobo', '2022-06-22', '110110', 0, 'Reemplazo', 'marlon mosquera', 'MercadoLaboral', '', '1', 'TerminoFijo', '6 meses', '31 dias', '14/7', 1, 4, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, '', 'gerson', 'wewe', '', '', '', '', '', '', '', '', '{\"tipo\":\"Integral\",\"valor\":\"35646687\",\"primaAlimentacion\":\"\",\"primaMovilizacion\":\"\",\"primaLocalizacion\":\"\",\"otroSalario\":\"\"}', 'solicitado', '16/6/2022'),
(6, '16/6/2022', 'Lide', 80200972, 'operaciones', 'operaciones', 'ing confiabilidad', 'campo jobo', '2022-06-22', 'Canacol - 105501', 0, 'Reemplazo', 'marlon mosquera', 'MercadoLaboral', '', '1', 'TerminoFijo', '6 meses', '31 dias', '14/7', 1, 4, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, '', 'gerson', 'wewe', '', '', '', '', '', '', '', '', '{\"tipo\":\"Integral\",\"valor\":\"134567\",\"primaAlimentacion\":\"\",\"primaMovilizacion\":\"\",\"primaLocalizacion\":\"\",\"otroSalario\":\"\"}', 'solicitado', '16/6/2022');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `image`
--

CREATE TABLE `image` (
  `Id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `link` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requerimiento`
--

CREATE TABLE `requerimiento` (
  `IdRequerimiento_PK` int(11) NOT NULL,
  `Fecha_Solicitud` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_inicio_req` date DEFAULT NULL,
  `fecha_fin_req` date DEFAULT NULL,
  `IdCotizacion` int(11) DEFAULT NULL,
  `Fecha_Cotizacion` date DEFAULT NULL,
  `Fecha_Aprov_Cot` date DEFAULT NULL,
  `IdOrdenServicio` int(11) DEFAULT NULL,
  `Fecha_Ejec_Ord_Serv` date DEFAULT NULL,
  `IdInforme` int(11) DEFAULT NULL,
  `Fecha_Informe` date DEFAULT NULL,
  `IdEncuestasSatisf` int(11) DEFAULT NULL,
  `Fecha_Encuesta` date DEFAULT NULL,
  `Estado` varchar(50) NOT NULL DEFAULT 'temp',
  `IdUser_FK` varchar(20) NOT NULL,
  `IdCompany_FK` varchar(20) NOT NULL,
  `RQDescripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `requerimiento`
--

INSERT INTO `requerimiento` (`IdRequerimiento_PK`, `Fecha_Solicitud`, `fecha_inicio_req`, `fecha_fin_req`, `IdCotizacion`, `Fecha_Cotizacion`, `Fecha_Aprov_Cot`, `IdOrdenServicio`, `Fecha_Ejec_Ord_Serv`, `IdInforme`, `Fecha_Informe`, `IdEncuestasSatisf`, `Fecha_Encuesta`, `Estado`, `IdUser_FK`, `IdCompany_FK`, `RQDescripcion`) VALUES
(1, '2021-10-12 00:25:48', '2021-10-18', '2021-10-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Solicitado', '80200972', '812512275', 'realizar inspeccion a generadores de la cira'),
(6, '2021-10-12 02:02:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'temp', '80200972', '812512275', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `IdRol_PK` int(11) NOT NULL,
  `RolName` varchar(50) NOT NULL,
  `route` varchar(400) NOT NULL,
  `RolDescription` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`IdRol_PK`, `RolName`, `route`, `RolDescription`) VALUES
(0, 'Basico ', 'default', 'Acceso plataforma'),
(10, 'cliente ', 'client', 'Acceso requerimiento'),
(20, 'comercial', ' companies users', 'Control requerimiento'),
(30, 'logistica ', 'logistic', 'a equipos'),
(40, 'tecnico', 'technical', 'ordenes'),
(50, 'lider ', 'leader users', 'control Ordenes'),
(60, 'talentoHumano ', 'humanTalent employes users', 'Acceso Personal'),
(80, 'gerente', 'manager', 'Acceso Total Lectura'),
(90, 'admin ', 'client humanTalent employes users logistic technical leader commercial companies manager', 'Maximo'),
(100, 'superAdmin', 'superAdmin client humanTalent employes users logistic technical leader commercial companies manager admin', 'Acceso total');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `st_ciiu`
--

CREATE TABLE `st_ciiu` (
  `Id` int(12) NOT NULL,
  `section` varchar(30) NOT NULL,
  `section_desc` varchar(200) NOT NULL,
  `CIIU` varchar(10) NOT NULL,
  `CIIU_desc` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `st_ciiu`
--

INSERT INTO `st_ciiu` (`Id`, `section`, `section_desc`, `CIIU`, `CIIU_desc`) VALUES
(2, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '01', 'Agricultura, ganadería, caza y actividades de servicios conexas '),
(3, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '011', 'Cultivos agrícolas transitorios '),
(4, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0111', 'Cultivo de cereales (excepto arroz), legumbres y semillas oleaginosas '),
(5, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0112', 'Cultivo de arroz '),
(6, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0113', 'Cultivo de hortalizas, raíces y tubérculos '),
(7, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0114', 'Cultivo de tabaco '),
(8, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0115', 'Cultivo de plantas textiles '),
(9, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0119', 'Otros cultivos transitorios n.c.p.'),
(10, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '012', 'Cultivos agrícolas permanentes '),
(11, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0121', 'Cultivo de frutas tropicales y subtropicales'),
(12, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0122', 'Cultivo de plátano y banano'),
(13, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0123', 'Cultivo de café'),
(14, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0124', 'Cultivo de caña de azúcar'),
(15, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0125', 'Cultivo de flor de corte'),
(16, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0126', 'Cultivo de palma para aceite (palma africana) y otros frutos oleaginosos'),
(17, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0127', 'Cultivo de plantas con las que se preparan bebidas'),
(18, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0128', 'Cultivo de especias y de plantas aromáticas y medicinales '),
(19, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0129', 'Otros cultivos permanentes n.c.p.'),
(20, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0130', 'Propagación de plantas (actividades de los viveros, excepto viveros forestales) '),
(21, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '014', 'Ganadería '),
(22, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0141', 'Cría de ganado bovino y bufalino'),
(23, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0142', 'Cría de caballos y otros equinos '),
(24, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0143', 'Cría de ovejas y cabras '),
(25, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0144', 'Cría de ganado porcino'),
(26, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0145', 'Cría de aves de corral'),
(27, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0149', 'Cría de otros animales n.c.p.'),
(28, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0150', 'Explotación mixta (agrícola y pecuaria) '),
(29, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '016', 'Actividades de apoyo a la agricultura y la ganadería, y actividades posteriores a la cosecha '),
(30, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0161', 'Actividades de apoyo a la agricultura '),
(31, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0162', 'Actividades de apoyo a la ganadería'),
(32, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0163', 'Actividades posteriores a la cosecha '),
(33, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0164', 'Tratamiento de semillas para propagación '),
(34, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0170', 'Caza ordinaria y mediante trampas y actividades de servicios conexas '),
(35, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '02', 'Silvicultura y extracción de madera'),
(36, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0210', 'Silvicultura y otras actividades forestales'),
(37, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0220', 'Extracción de madera '),
(38, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0230', 'Recolección de productos forestales diferentes a la madera'),
(39, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0240', 'Servicios de apoyo a la silvicultura '),
(40, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '03', 'Pesca y acuicultura'),
(41, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '031', 'Pesca '),
(42, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0311', 'Pesca marítima '),
(43, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0312', 'Pesca de agua dulce '),
(44, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '032', 'Acuicultura '),
(45, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0321', 'Acuicultura marítima '),
(46, 'SECCIÓN A', 'AGRICULTURA, GANADERÍA, CAZA, SILVICULTURA Y PESCA', '0322', 'Acuicultura de agua dulce'),
(47, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '05', 'Extracción de carbón de piedra y lignito'),
(48, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '0510', 'Extracción de hulla (carbón de piedra)'),
(49, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '0520', 'Extracción de carbón lignito'),
(50, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '06', 'Extracción de petróleo crudo y gas natural'),
(51, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '0610', 'Extracción de petróleo crudo'),
(52, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '0620', 'Extracción de gas natural'),
(53, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '07', 'Extracción de minerales metalíferos'),
(54, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '0710', 'Extracción de minerales de hierro'),
(55, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '072', 'Extracción de minerales metalíferos no ferrosos'),
(56, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '0721', 'Extracción de minerales de uranio y de torio'),
(57, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '0722', 'Extracción de oro y otros metales preciosos'),
(58, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '0723', 'Extracción de minerales de níquel'),
(59, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '0729', 'Extracción de otros minerales metalíferos no ferrosos n.c.p.'),
(60, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '08', 'Extracción de otras minas y canteras'),
(61, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '081', 'Extracción de piedra, arena, arcillas, cal, yeso, caolín, bentonitas y similares'),
(62, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '0811', 'Extracción de piedra, arena, arcillas comunes, yeso y anhidrita'),
(63, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '0812', 'Extracción de arcillas de uso industrial, caliza, caolín y bentonitas'),
(64, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '0820', 'Extracción de esmeraldas, piedras preciosas y semipreciosas'),
(65, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '089', 'Extracción de otros minerales no metálicos n.c.p.'),
(66, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '0891', 'Extracción de minerales para la fabricación de abonos y productos químicos'),
(67, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '0892', 'Extracción de halita (sal)'),
(68, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '0899', 'Extracción de otros minerales no metálicos n.c.p.'),
(69, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '09', 'Actividades de servicios de apoyo para la explotación de minas '),
(70, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '0910', 'Actividades de apoyo para la extracción de petróleo y de gas natural'),
(71, 'SECCIÓN B', 'EXPLOTACIÓN DE MINAS Y CANTERAS', '0990', 'Actividades de apoyo para otras actividades de explotación de minas y canteras'),
(72, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '10', 'Elaboración de productos alimenticios'),
(73, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '101', 'Procesamiento y conservación de carne, pescado, crustáceos y moluscos '),
(74, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1011', 'Procesamiento y conservación de carne y productos cárnicos'),
(75, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1012', 'Procesamiento y conservación de pescados, crustáceos y moluscos'),
(76, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1020', 'Procesamiento y conservación de frutas, legumbres, hortalizas y tubérculos'),
(77, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1030', 'Elaboración de aceites y grasas de origen vegetal y animal'),
(78, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1040', 'Elaboración de productos lácteos'),
(79, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '105', 'Elaboración de productos de molinería, almidones y productos derivados del almidón'),
(80, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1051', 'Elaboración de productos de molinería'),
(81, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1052', 'Elaboración de almidones y productos derivados del almidón'),
(82, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '106', 'Elaboración de productos de café'),
(83, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1061', 'Trilla de café'),
(84, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1062', 'Descafeinado, tostión y molienda del café'),
(85, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1063', 'Otros derivados del café'),
(86, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '107', 'Elaboración de azúcar y panela'),
(87, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1071', 'Elaboración y refinación de azúcar'),
(88, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1072', 'Elaboración de panela'),
(89, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '108', 'Elaboración de otros productos alimenticios'),
(90, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1081', 'Elaboración de productos de panadería'),
(91, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1082', 'Elaboración de cacao, chocolate y productos de confitería'),
(92, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1083', 'Elaboración de macarrones, fideos, alcuzcuz y productos farináceos similares'),
(93, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1084', 'Elaboración de comidas y platos preparados'),
(94, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1089', 'Elaboración de otros productos alimenticios n.c.p.'),
(95, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1090', 'Elaboración de alimentos preparados para animales'),
(96, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '11', 'Elaboración de bebidas'),
(97, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '110', 'Elaboración de bebidas'),
(98, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1101', 'Destilación, rectificación y mezcla de bebidas alcohólicas'),
(99, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1102', 'Elaboración de bebidas fermentadas no destiladas'),
(100, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1103', 'Producción de malta, elaboración de cervezas y otras bebidas malteadas'),
(101, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1104', 'Elaboración de bebidas no alcohólicas, producción de aguas minerales y de otras aguas embotelladas'),
(102, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '12', 'Elaboración de productos de tabaco'),
(103, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1200', 'Elaboración de productos de tabaco'),
(104, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '13', 'Fabricación de productos textiles'),
(105, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '131', 'Preparación, hilatura, tejeduría y acabado de productos textiles'),
(106, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1311', 'Preparación e hilatura de fibras textiles'),
(107, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1312', 'Tejeduría de productos textiles'),
(108, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1313', 'Acabado de productos textiles'),
(109, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '139', 'Fabricación de otros productos textiles'),
(110, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1391', 'Fabricación de tejidos de punto y ganchillo'),
(111, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1392', 'Confección de artículos con materiales textiles, excepto prendas de vestir'),
(112, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1393', 'Fabricación de tapetes y alfombras para pisos'),
(113, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1394', 'Fabricación de cuerdas, cordeles, cables, bramantes y redes'),
(114, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1399', 'Fabricación de otros artículos textiles n.c.p.'),
(115, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '14', 'Confección de prendas de vestir'),
(116, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1410', 'Confección de prendas de vestir, excepto prendas de piel'),
(117, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1420', 'Fabricación de artículos de piel'),
(118, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1430', 'Fabricación de artículos de punto y ganchillo'),
(119, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '151', 'Curtido y recurtido de cueros; fabricación de artículos de viaje, bolsos de mano y artículos similares, y fabricación de artículos de talabartería y guarnicionería, adobo y teñido de pieles'),
(120, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1511', 'Curtido y recurtido de cueros; recurtido y teñido de pieles'),
(121, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1512', 'Fabricación de artículos de viaje, bolsos de mano y artículos similares elaborados en cuero, y fabricación de artículos de talabartería y guarnicionería'),
(122, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1513', 'Fabricación de artículos de viaje, bolsos de mano y artículos similares; artículos de talabartería y guarnicionería elaborados en otros materiales'),
(123, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '152', 'Fabricación de calzado'),
(124, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1521', 'Fabricación de calzado de cuero y piel, con cualquier tipo de suela'),
(125, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1522', 'Fabricación de otros tipos de calzado, excepto calzado de cuero y piel'),
(126, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1523', 'Fabricación de partes del calzado'),
(127, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '16', 'Transformación de la madera y fabricación de productos de madera y de corcho, excepto muebles; fabricación de artículos de cestería y espartería'),
(128, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1610', 'Aserrado, acepillado e impregnación de la madera'),
(129, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1620', 'Fabricación de hojas de madera para enchapado; fabricación de tableros contrachapados, tableros laminados, tableros de partículas y otros tableros y paneles'),
(130, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1630', 'Fabricación de partes y piezas de madera, de carpintería y ebanistería para la construcción'),
(131, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1640', 'Fabricación de recipientes de madera'),
(132, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1690', 'Fabricación de otros productos de madera; fabricación de artículos de corcho, cestería y espartería'),
(133, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '17', 'Fabricación de papel, cartón y productos de papel y cartón'),
(134, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '170', 'Fabricación de papel, cartón y productos de papel y cartón'),
(135, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1701', 'Fabricación de pulpas (pastas) celulósicas; papel y cartón'),
(136, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1702', 'Fabricación de papel y cartón ondulado (corrugado); fabricación de envases, empaques y de embalajes de papel y cartón.'),
(137, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1709', 'Fabricación de otros artículos de papel y cartón'),
(138, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '18', 'Actividades de impresión y de producción de copias a partir de grabaciones originales '),
(139, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '181', 'Actividades de impresión y actividades de servicios relacionados con la impresión'),
(140, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1811', 'Actividades de impresión'),
(141, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1812', 'Actividades de servicios relacionados con la impresión'),
(142, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1820', 'Producción de copias a partir de grabaciones originales '),
(143, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '19', 'Coquización, fabricación de productos de la refinación del petróleo y actividad de mezcla de combustibles '),
(144, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1910', 'Fabricación de productos de hornos de coque'),
(145, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '192', 'Fabricación de productos de la refinación del petróleo'),
(146, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1921', 'Fabricación de productos de la refinación del petróleo'),
(147, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '1922', 'Actividad de mezcla de combustibles'),
(148, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '20', 'Fabricación de sustancias y productos químicos'),
(149, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '201', 'Fabricación de sustancias químicas básicas, abonos y compuestos inorgánicos nitrogenados, plásticos y caucho sintético en formas primarias'),
(150, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2011', 'Fabricación de sustancias y productos químicos básicos'),
(151, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2012', 'Fabricación de abonos y compuestos inorgánicos nitrogenados'),
(152, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2013', 'Fabricación de plásticos en formas primarias'),
(153, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2014', 'Fabricación de caucho sintético en formas primarias'),
(154, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '202', 'Fabricación de otros productos químicos'),
(155, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2021', 'Fabricación de plaguicidas y otros productos químicos de uso agropecuario'),
(156, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2022', 'Fabricación de pinturas, barnices y revestimientos similares, tintas para impresión y masillas'),
(157, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2023', 'Fabricación de jabones y detergentes, preparados para limpiar y pulir; perfumes y preparados de tocador'),
(158, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2029', 'Fabricación de otros productos químicos n.c.p.'),
(159, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2030', 'Fabricación de fibras sintéticas y artificiales'),
(160, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '21', 'Fabricación de productos farmacéuticos, sustancias químicas medicinales y productos botánicos de uso farmacéutico'),
(161, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2100', 'Fabricación de productos farmacéuticos, sustancias químicas medicinales y productos botánicos de uso farmacéutico'),
(162, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '22', 'Fabricación de productos de caucho y de plástico'),
(163, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '221', 'Fabricación de productos de caucho'),
(164, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2211', 'Fabricación de llantas y neumáticos de caucho'),
(165, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2212', 'Reencauche de llantas usadas'),
(166, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2219', 'Fabricación de formas básicas de caucho y otros productos de caucho n.c.p.'),
(167, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '222', 'Fabricación de productos de plástico'),
(168, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2221', 'Fabricación de formas básicas de plástico'),
(169, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2229', 'Fabricación de artículos de plástico n.c.p.'),
(170, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '23', 'Fabricación de otros productos minerales no metálicos'),
(171, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2310', 'Fabricación de vidrio y productos de vidrio'),
(172, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '239', 'Fabricación de productos minerales no metálicos n.c.p.'),
(173, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2391', 'Fabricación de productos refractarios'),
(174, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2392', 'Fabricación de materiales de arcilla para la construcción'),
(175, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2393', 'Fabricación de otros productos de cerámica y porcelana'),
(176, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2394', 'Fabricación de cemento, cal y yeso'),
(177, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2395', 'Fabricación de artículos de hormigón, cemento y yeso'),
(178, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2396', 'Corte, tallado y acabado de la piedra'),
(179, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2399', 'Fabricación de otros productos minerales no metálicos n.c.p.'),
(180, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '24', 'Fabricación de productos metalúrgicos básicos'),
(181, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2410', 'Industrias básicas de hierro y de acero'),
(182, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '242', 'Industrias básicas de metales preciosos y de metales no ferrosos'),
(183, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2421', 'Industrias básicas de metales preciosos'),
(184, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2429', 'Industrias básicas de otros metales no ferrosos'),
(185, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '243', 'Fundición de metales'),
(186, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2431', 'Fundición de hierro y de acero'),
(187, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2432', 'Fundición de metales no ferrosos '),
(188, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '25', 'Fabricación de productos elaborados de metal, excepto maquinaria y equipo'),
(189, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '251', 'Fabricación de productos metálicos para uso estructural, tanques, depósitos y generadores de vapor'),
(190, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2511', 'Fabricación de productos metálicos para uso estructural'),
(191, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2512', 'Fabricación de tanques, depósitos y recipientes de metal, excepto los utilizados para el envase o transporte de mercancías'),
(192, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2513', 'Fabricación de generadores de vapor, excepto calderas de agua caliente para calefacción central'),
(193, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2520', 'Fabricación de armas y municiones'),
(194, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '259', 'Fabricación de otros productos elaborados de metal y actividades de servicios relacionadas con el trabajo de metales'),
(195, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2591', 'Forja, prensado, estampado y laminado de metal; pulvimetalurgia'),
(196, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2592', 'Tratamiento y revestimiento de metales; mecanizado'),
(197, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2593', 'Fabricación de artículos de cuchillería, herramientas de mano y artículos de ferretería'),
(198, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2599', 'Fabricación de otros productos elaborados de metal n.c.p.'),
(199, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '26', 'Fabricación de productos informáticos, electrónicos y ópticos'),
(200, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2610', 'Fabricación de componentes y tableros electrónicos'),
(201, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2620', 'Fabricación de computadoras y de equipo periférico'),
(202, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2630', 'Fabricación de equipos de comunicación'),
(203, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2640', 'Fabricación de aparatos electrónicos de consumo'),
(204, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '265', 'Fabricación de equipo de medición, prueba, navegación y control; fabricación de relojes'),
(205, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2651', 'Fabricación de equipo de medición, prueba, navegación y control'),
(206, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2652', 'Fabricación de relojes'),
(207, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2660', 'Fabricación de equipo de irradiación y equipo electrónico de uso médico y terapéutico'),
(208, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2670', 'Fabricación de instrumentos ópticos y equipo fotográfico'),
(209, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2680', 'Fabricación de medios magnéticos y ópticos para almacenamiento de datos'),
(210, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '27', 'Fabricación de aparatos y equipo eléctrico'),
(211, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '271', 'Fabricación de motores, generadores y transformadores eléctricos y de aparatos de distribución y control de la energía eléctrica'),
(212, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2711', 'Fabricación de motores, generadores y transformadores eléctricos'),
(213, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2712', 'Fabricación de aparatos de distribución y control de la energía eléctrica'),
(214, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2720', 'Fabricación de pilas, baterías y acumuladores eléctricos'),
(215, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '273', 'Fabricación de hilos y cables aislados y sus dispositivos'),
(216, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2731', 'Fabricación de hilos y cables eléctricos y de fibra óptica'),
(217, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2732', 'Fabricación de dispositivos de cableado'),
(218, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2740', 'Fabricación de equipos eléctricos de iluminación'),
(219, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2750', 'Fabricación de aparatos de uso doméstico'),
(220, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2790', 'Fabricación de otros tipos de equipo eléctrico n.c.p.'),
(221, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '28', 'Fabricación de maquinaria y equipo n.c.p.'),
(222, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '281', 'Fabricación de maquinaria y equipo de uso general'),
(223, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2811', 'Fabricación de motores, turbinas, y partes para motores de combustión interna'),
(224, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2812', 'Fabricación de equipos de potencia hidráulica y neumática'),
(225, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2813', 'Fabricación de otras bombas, compresores, grifos y válvulas'),
(226, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2814', 'Fabricación de cojinetes, engranajes, trenes de engranajes y piezas de transmisión'),
(227, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2815', 'Fabricación de hornos, hogares y quemadores industriales'),
(228, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2816', 'Fabricación de equipo de elevación y manipulación'),
(229, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2817', 'Fabricación de maquinaria y equipo de oficina (excepto computadoras y equipo periférico)'),
(230, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2818', 'Fabricación de herramientas manuales con motor'),
(231, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2819', 'Fabricación de otros tipos de maquinaria y equipo de uso general n.c.p.'),
(232, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '282', 'Fabricación de maquinaria y equipo de uso especial'),
(233, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2821', 'Fabricación de maquinaria agropecuaria y forestal'),
(234, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2822', 'Fabricación de máquinas formadoras de metal y de máquinas herramienta'),
(235, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2823', 'Fabricación de maquinaria para la metalurgia'),
(236, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2824', 'Fabricación de maquinaria para explotación de minas y canteras y para obras de construcción'),
(237, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2825', 'Fabricación de maquinaria para la elaboración de alimentos, bebidas y tabaco'),
(238, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2826', 'Fabricación de maquinaria para la elaboración de productos textiles, prendas de vestir y cueros'),
(239, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2829', 'Fabricación de otros tipos de maquinaria y equipo de uso especial n.c.p.'),
(240, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '29', 'Fabricación de vehículos automotores, remolques y semirremolques'),
(241, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2910', 'Fabricación de vehículos automotores y sus motores'),
(242, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2920', 'Fabricación de carrocerías para vehículos automotores; fabricación de remolques y semirremolques '),
(243, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '2930', 'Fabricación de partes, piezas (autopartes) y accesorios (lujos) para vehículos automotores'),
(244, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '30', 'Fabricación de otros tipos de equipo de transporte'),
(245, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '301', 'Construcción de barcos y otras embarcaciones'),
(246, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '3011', 'Construcción de barcos y de estructuras flotantes'),
(247, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '3012', 'Construcción de embarcaciones de recreo y deporte'),
(248, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '3020', 'Fabricación de locomotoras y de material rodante para ferrocarriles'),
(249, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '3030', 'Fabricación de aeronaves, naves espaciales y de maquinaria conexa'),
(250, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '3040', 'Fabricación de vehículos militares de combate'),
(251, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '309', 'Fabricación de otros tipos de equipo de transporte n.c.p.'),
(252, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '3091', 'Fabricación de motocicletas'),
(253, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '3092', 'Fabricación de bicicletas y de sillas de ruedas para personas con discapacidad'),
(254, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '3099', 'Fabricación de otros tipos de equipo de transporte n.c.p.'),
(255, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '31', 'Fabricación de muebles, colchones y somieres'),
(256, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '3110', 'Fabricación de muebles '),
(257, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '3120', 'Fabricación de colchones y somieres'),
(258, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '32', 'Otras industrias manufactureras'),
(259, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '3210', 'Fabricación de joyas, bisutería y artículos conexos'),
(260, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '3220', 'Fabricación de instrumentos musicales'),
(261, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '3230', 'Fabricación de artículos y equipo para la práctica del deporte'),
(262, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '3240', 'Fabricación de juegos, juguetes y rompecabezas'),
(263, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '3250', 'Fabricación de instrumentos, aparatos y materiales médicos y odontológicos (incluido mobiliario)'),
(264, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '3290', 'Otras industrias manufactureras n.c.p.'),
(265, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '33', 'Instalación, mantenimiento y reparación especializado de maquinaria y equipo'),
(266, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '331', 'Mantenimiento y reparación especializado de productos elaborados en metal y de maquinaria y equipo'),
(267, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '3311', 'Mantenimiento y reparación especializado de productos elaborados en metal'),
(268, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '3312', 'Mantenimiento y reparación especializado de maquinaria y equipo'),
(269, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '3313', 'Mantenimiento y reparación especializado de equipo electrónico y óptico'),
(270, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '3314', 'Mantenimiento y reparación especializado de equipo eléctrico'),
(271, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '3315', 'Mantenimiento y reparación especializado de equipo de transporte, excepto los vehículos automotores, motocicletas y bicicletas'),
(272, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '3319', 'Mantenimiento y reparación de otros tipos de equipos y sus componentes n.c.p.'),
(273, 'SECCIÓN C', 'INDUSTRIAS MANUFACTURERAS', '3320', 'Instalación especializada de maquinaria y equipo industrial '),
(274, 'SECCIÓN D', 'SUMINISTRO DE ELECTRICIDAD, GAS, VAPOR Y AIRE ACONDICIONADO', '35', 'Suministro de electricidad, gas, vapor y aire acondicionado '),
(275, 'SECCIÓN D', 'SUMINISTRO DE ELECTRICIDAD, GAS, VAPOR Y AIRE ACONDICIONADO', '351', 'Generación, transmisión, distribución y comercialización de energía eléctrica'),
(276, 'SECCIÓN D', 'SUMINISTRO DE ELECTRICIDAD, GAS, VAPOR Y AIRE ACONDICIONADO', '3511', 'Generación de energía eléctrica'),
(277, 'SECCIÓN D', 'SUMINISTRO DE ELECTRICIDAD, GAS, VAPOR Y AIRE ACONDICIONADO', '3512', 'Transmisión de energía eléctrica'),
(278, 'SECCIÓN D', 'SUMINISTRO DE ELECTRICIDAD, GAS, VAPOR Y AIRE ACONDICIONADO', '3513', 'Distribución de energía eléctrica'),
(279, 'SECCIÓN D', 'SUMINISTRO DE ELECTRICIDAD, GAS, VAPOR Y AIRE ACONDICIONADO', '3514', 'Comercialización de energía eléctrica'),
(280, 'SECCIÓN D', 'SUMINISTRO DE ELECTRICIDAD, GAS, VAPOR Y AIRE ACONDICIONADO', '3520', 'Producción de gas; distribución de combustibles gaseosos por tuberías'),
(281, 'SECCIÓN D', 'SUMINISTRO DE ELECTRICIDAD, GAS, VAPOR Y AIRE ACONDICIONADO', '3530', 'Suministro de vapor y aire acondicionado'),
(282, 'SECCIÓN E', 'DISTRIBUCIÓN DE AGUA; EVACUACIÓN Y TRATAMIENTO DE AGUAS RESIDUALES, GESTIÓN DE DESECHOS Y ACTIVIDADES DE SANEAMIENTO AMBIENTAL', '36', 'Captación, tratamiento y distribución de agua'),
(283, 'SECCIÓN E', 'DISTRIBUCIÓN DE AGUA; EVACUACIÓN Y TRATAMIENTO DE AGUAS RESIDUALES, GESTIÓN DE DESECHOS Y ACTIVIDADES DE SANEAMIENTO AMBIENTAL', '3600', 'Captación, tratamiento y distribución de agua'),
(284, 'SECCIÓN E', 'DISTRIBUCIÓN DE AGUA; EVACUACIÓN Y TRATAMIENTO DE AGUAS RESIDUALES, GESTIÓN DE DESECHOS Y ACTIVIDADES DE SANEAMIENTO AMBIENTAL', '37', 'Evacuación y tratamiento de aguas residuales'),
(285, 'SECCIÓN E', 'DISTRIBUCIÓN DE AGUA; EVACUACIÓN Y TRATAMIENTO DE AGUAS RESIDUALES, GESTIÓN DE DESECHOS Y ACTIVIDADES DE SANEAMIENTO AMBIENTAL', '3700', 'Evacuación y tratamiento de aguas residuales'),
(286, 'SECCIÓN E', 'DISTRIBUCIÓN DE AGUA; EVACUACIÓN Y TRATAMIENTO DE AGUAS RESIDUALES, GESTIÓN DE DESECHOS Y ACTIVIDADES DE SANEAMIENTO AMBIENTAL', '38', 'Recolección, tratamiento y disposición de desechos, recuperación de materiales'),
(287, 'SECCIÓN E', 'DISTRIBUCIÓN DE AGUA; EVACUACIÓN Y TRATAMIENTO DE AGUAS RESIDUALES, GESTIÓN DE DESECHOS Y ACTIVIDADES DE SANEAMIENTO AMBIENTAL', '381', 'Recolección de desechos'),
(288, 'SECCIÓN E', 'DISTRIBUCIÓN DE AGUA; EVACUACIÓN Y TRATAMIENTO DE AGUAS RESIDUALES, GESTIÓN DE DESECHOS Y ACTIVIDADES DE SANEAMIENTO AMBIENTAL', '3811', 'Recolección de desechos no peligrosos'),
(289, 'SECCIÓN E', 'DISTRIBUCIÓN DE AGUA; EVACUACIÓN Y TRATAMIENTO DE AGUAS RESIDUALES, GESTIÓN DE DESECHOS Y ACTIVIDADES DE SANEAMIENTO AMBIENTAL', '3812', 'Recolección de desechos peligrosos'),
(290, 'SECCIÓN E', 'DISTRIBUCIÓN DE AGUA; EVACUACIÓN Y TRATAMIENTO DE AGUAS RESIDUALES, GESTIÓN DE DESECHOS Y ACTIVIDADES DE SANEAMIENTO AMBIENTAL', '382', 'Tratamiento y disposición de desechos'),
(291, 'SECCIÓN E', 'DISTRIBUCIÓN DE AGUA; EVACUACIÓN Y TRATAMIENTO DE AGUAS RESIDUALES, GESTIÓN DE DESECHOS Y ACTIVIDADES DE SANEAMIENTO AMBIENTAL', '3821', 'Tratamiento y disposición de desechos no peligrosos'),
(292, 'SECCIÓN E', 'DISTRIBUCIÓN DE AGUA; EVACUACIÓN Y TRATAMIENTO DE AGUAS RESIDUALES, GESTIÓN DE DESECHOS Y ACTIVIDADES DE SANEAMIENTO AMBIENTAL', '3822', 'Tratamiento y disposición de desechos peligrosos'),
(293, 'SECCIÓN E', 'DISTRIBUCIÓN DE AGUA; EVACUACIÓN Y TRATAMIENTO DE AGUAS RESIDUALES, GESTIÓN DE DESECHOS Y ACTIVIDADES DE SANEAMIENTO AMBIENTAL', '3830', 'Recuperación de materiales'),
(294, 'SECCIÓN E', 'DISTRIBUCIÓN DE AGUA; EVACUACIÓN Y TRATAMIENTO DE AGUAS RESIDUALES, GESTIÓN DE DESECHOS Y ACTIVIDADES DE SANEAMIENTO AMBIENTAL', '39', 'Actividades de saneamiento ambiental y otros servicios de gestión de desechos'),
(295, 'SECCIÓN E', 'DISTRIBUCIÓN DE AGUA; EVACUACIÓN Y TRATAMIENTO DE AGUAS RESIDUALES, GESTIÓN DE DESECHOS Y ACTIVIDADES DE SANEAMIENTO AMBIENTAL', '3900', 'Actividades de saneamiento ambiental y otros servicios de gestión de desechos'),
(296, 'SECCIÓN F', 'CONSTRUCCIÓN', '41', 'Construcción de edificios'),
(297, 'SECCIÓN F', 'CONSTRUCCIÓN', '411', 'Construcción de edificios'),
(298, 'SECCIÓN F', 'CONSTRUCCIÓN', '4111', 'Construcción de edificios residenciales'),
(299, 'SECCIÓN F', 'CONSTRUCCIÓN', '4112', 'Construcción de edificios no residenciales'),
(300, 'SECCIÓN F', 'CONSTRUCCIÓN', '42', 'Obras de ingeniería civil'),
(301, 'SECCIÓN F', 'CONSTRUCCIÓN', '4210', 'Construcción de carreteras y vías de ferrocarril'),
(302, 'SECCIÓN F', 'CONSTRUCCIÓN', '4220', 'Construcción de proyectos de servicio público'),
(303, 'SECCIÓN F', 'CONSTRUCCIÓN', '4290', 'Construcción de otras obras de ingeniería civil'),
(304, 'SECCIÓN F', 'CONSTRUCCIÓN', '43', 'Actividades especializadas para la construcción de edificios y obras de ingeniería civil'),
(305, 'SECCIÓN F', 'CONSTRUCCIÓN', '431', 'Demolición y preparación del terreno'),
(306, 'SECCIÓN F', 'CONSTRUCCIÓN', '4311', 'Demolición'),
(307, 'SECCIÓN F', 'CONSTRUCCIÓN', '4312', 'Preparación del terreno'),
(308, 'SECCIÓN F', 'CONSTRUCCIÓN', '432', 'Instalaciones eléctricas, de fontanería y otras instalaciones especializadas'),
(309, 'SECCIÓN F', 'CONSTRUCCIÓN', '4321', 'Instalaciones eléctricas'),
(310, 'SECCIÓN F', 'CONSTRUCCIÓN', '4322', 'Instalaciones de fontanería, calefacción y aire acondicionado'),
(311, 'SECCIÓN F', 'CONSTRUCCIÓN', '4329', 'Otras instalaciones especializadas'),
(312, 'SECCIÓN F', 'CONSTRUCCIÓN', '4330', 'Terminación y acabado de edificios y obras de ingeniería civil'),
(313, 'SECCIÓN F', 'CONSTRUCCIÓN', '4390', 'Otras actividades especializadas para la construcción de edificios y obras de ingeniería civil'),
(314, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '45', 'Comercio, mantenimiento y reparación de vehículos automotores y motocicletas, sus partes, piezas y accesorios'),
(315, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '451', 'Comercio de vehículos automotores'),
(316, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4511', 'Comercio de vehículos automotores nuevos'),
(317, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4512', 'Comercio de vehículos automotores usados'),
(318, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4520', 'Mantenimiento y reparación de vehículos automotores'),
(319, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4530', 'Comercio de partes, piezas (autopartes) y accesorios (lujos) para vehículos automotores'),
(320, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '454', 'Comercio, mantenimiento y reparación de motocicletas y de sus partes, piezas y accesorios'),
(321, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4541', 'Comercio de motocicletas y de sus partes, piezas y accesorios'),
(322, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4542', 'Mantenimiento y reparación de motocicletas y de sus partes y piezas'),
(323, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '46', 'Comercio al por mayor y en comisión o por contrata, excepto el comercio de vehículos automotores y motocicletas'),
(324, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4610', 'Comercio al por mayor a cambio de una retribución o por contrata'),
(325, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4620', 'Comercio al por mayor de materias primas agropecuarias; animales vivos'),
(326, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '463', 'Comercio al por mayor de alimentos, bebidas y tabaco'),
(327, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4631', 'Comercio al por mayor de productos alimenticios'),
(328, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4632', 'Comercio al por mayor de bebidas y tabaco'),
(329, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '464', 'Comercio al por mayor de artículos y enseres domésticos (incluidas prendas de vestir)'),
(330, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4641', 'Comercio al por mayor de productos textiles, productos confeccionados para uso doméstico'),
(331, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4642', 'Comercio al por mayor de prendas de vestir'),
(332, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4643', 'Comercio al por mayor de calzado'),
(333, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4644', 'Comercio al por mayor de aparatos y equipo de uso doméstico'),
(334, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4645', 'Comercio al por mayor de productos farmacéuticos, medicinales, cosméticos y de tocador'),
(335, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4649', 'Comercio al por mayor de otros utensilios domésticos n.c.p.'),
(336, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '465', 'Comercio al por mayor de maquinaria y equipo '),
(337, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4651', 'Comercio al por mayor de computadores, equipo periférico y programas de informática'),
(338, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4652', 'Comercio al por mayor de equipo, partes y piezas electrónicos y de telecomunicaciones'),
(339, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4653', 'Comercio al por mayor de maquinaria y equipo agropecuarios'),
(340, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4659', 'Comercio al por mayor de otros tipos de maquinaria y equipo n.c.p.'),
(341, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '466', 'Comercio al por mayor especializado de otros productos'),
(342, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4661', 'Comercio al por mayor de combustibles sólidos, líquidos, gaseosos y productos conexos'),
(343, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4662', 'Comercio al por mayor de metales y productos metalíferos'),
(344, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4663', 'Comercio al por mayor de materiales de construcción, artículos de ferretería, pinturas, productos de vidrio, equipo y materiales de fontanería y calefacción'),
(345, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4664', 'Comercio al por mayor de productos químicos básicos, cauchos y plásticos en formas primarias y productos químicos de uso agropecuario'),
(346, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4665', 'Comercio al por mayor de desperdicios, desechos y chatarra'),
(347, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4669', 'Comercio al por mayor de otros productos n.c.p.'),
(348, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4690', 'Comercio al por mayor no especializado'),
(349, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '47', 'Comercio al por menor (incluso el comercio al por menor de combustibles), excepto el de vehículos automotores y motocicletas'),
(350, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '471', 'Comercio al por menor en establecimientos no especializados'),
(351, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4711', 'Comercio al por menor en establecimientos no especializados con surtido compuesto principalmente por alimentos, bebidas o tabaco'),
(352, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4719', 'Comercio al por menor en establecimientos no especializados, con surtido compuesto principalmente por productos diferentes de alimentos (víveres en general), bebidas y tabaco'),
(353, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '472', 'Comercio al por menor de alimentos (víveres en general), bebidas y tabaco, en establecimientos especializados'),
(354, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4721', 'Comercio al por menor de productos agrícolas para el consumo en establecimientos especializados'),
(355, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4722', 'Comercio al por menor de leche, productos lácteos y huevos, en establecimientos especializados'),
(356, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4723', 'Comercio al por menor de carnes (incluye aves de corral), productos cárnicos, pescados y productos de mar, en establecimientos especializados'),
(357, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4724', 'Comercio al por menor de bebidas y productos del tabaco, en establecimientos especializados'),
(358, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4729', 'Comercio al por menor de otros productos alimenticios n.c.p., en establecimientos especializados'),
(359, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '473', 'Comercio al por menor de combustible, lubricantes, aditivos y productos de limpieza para automotores, en establecimientos especializados'),
(360, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4731', 'Comercio al por menor de combustible para automotores'),
(361, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4732', 'Comercio al por menor de lubricantes (aceites, grasas), aditivos y productos de limpieza para vehículos automotores'),
(362, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '474', 'Comercio al por menor de equipos de informática y de comunicaciones, en establecimientos especializados'),
(363, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4741', 'Comercio al por menor de computadores, equipos periféricos, programas de informática y equipos de telecomunicaciones en establecimientos especializados'),
(364, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4742', 'Comercio al por menor de equipos y aparatos de sonido y de video, en establecimientos especializados'),
(365, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '475', 'Comercio al por menor de otros enseres domésticos en establecimientos especializados'),
(366, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4751', 'Comercio al por menor de productos textiles en establecimientos especializados'),
(367, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4752', 'Comercio al por menor de artículos de ferretería, pinturas y productos de vidrio en establecimientos especializados'),
(368, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4753', 'Comercio al por menor de tapices, alfombras y cubrimientos para paredes y pisos en establecimientos especializados'),
(369, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4754', 'Comercio al por menor de electrodomésticos y gasodomésticos de uso doméstico, muebles y equipos de iluminación'),
(370, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4755', 'Comercio al por menor de artículos y utensilios de uso doméstico'),
(371, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4759', 'Comercio al por menor de otros artículos domésticos en establecimientos especializados'),
(372, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '476', 'Comercio al por menor de artículos culturales y de entretenimiento, en establecimientos especializados'),
(373, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4761', 'Comercio al por menor de libros, periódicos, materiales y artículos de papelería y escritorio, en establecimientos especializados');
INSERT INTO `st_ciiu` (`Id`, `section`, `section_desc`, `CIIU`, `CIIU_desc`) VALUES
(374, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4762', 'Comercio al por menor de artículos deportivos, en establecimientos especializados '),
(375, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4769', 'Comercio al por menor de otros artículos culturales y de entretenimiento n.c.p. en establecimientos especializados'),
(376, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '477', 'Comercio al por menor de otros productos en establecimientos especializados'),
(377, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4771', 'Comercio al por menor de prendas de vestir y sus accesorios (incluye artículos de piel) en establecimientos especializados'),
(378, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4772', 'Comercio al por menor de todo tipo de calzado y artículos de cuero y sucedáneos del cuero en establecimientos especializados.'),
(379, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4773', 'Comercio al por menor de productos farmacéuticos y medicinales, cosméticos y artículos de tocador en establecimientos especializados'),
(380, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4774', 'Comercio al por menor de otros productos nuevos en establecimientos especializados'),
(381, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4775', 'Comercio al por menor de artículos de segunda mano'),
(382, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '478', 'Comercio al por menor en puestos de venta móviles'),
(383, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4781', 'Comercio al por menor de alimentos, bebidas y tabaco, en puestos de venta móviles'),
(384, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4782', 'Comercio al por menor de productos textiles, prendas de vestir y calzado, en puestos de venta móviles'),
(385, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4789', 'Comercio al por menor de otros productos en puestos de venta móviles'),
(386, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '479', 'Comercio al por menor no realizado en establecimientos, puestos de venta o mercados'),
(387, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4791', 'Comercio al por menor realizado a través de Internet'),
(388, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4792', 'Comercio al por menor realizado a través de casas de venta o por correo'),
(389, 'SECCIÓN G', 'COMERCIO AL POR MAYOR Y AL POR MENOR; REPARACIÓN DE VEHÍCULOS AUTOMOTORES Y MOTOCICLETAS', '4799', 'Otros tipos de comercio al por menor no realizado en establecimientos, puestos de venta o mercados.'),
(390, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '49', 'Transporte terrestre; transporte por tuberías'),
(391, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '491', 'Transporte férreo'),
(392, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '4911', 'Transporte férreo de pasajeros'),
(393, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '4912', 'Transporte férreo de carga '),
(394, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '492', 'Transporte terrestre público automotor'),
(395, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '4921', 'Transporte de pasajeros'),
(396, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '4922', 'Transporte mixto'),
(397, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '4923', 'Transporte de carga por carretera'),
(398, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '4930', 'Transporte por tuberías'),
(399, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '50', 'Transporte acuático'),
(400, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '501', 'Transporte marítimo y de cabotaje'),
(401, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '5011', 'Transporte de pasajeros marítimo y de cabotaje '),
(402, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '5012', 'Transporte de carga marítimo y de cabotaje '),
(403, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '502', 'Transporte fluvial'),
(404, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '5021', 'Transporte fluvial de pasajeros'),
(405, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '5022', 'Transporte fluvial de carga'),
(406, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '51', 'Transporte aéreo'),
(407, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '511', 'Transporte aéreo de pasajeros '),
(408, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '5111', 'Transporte aéreo nacional de pasajeros '),
(409, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '5112', 'Transporte aéreo internacional de pasajeros '),
(410, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '512', 'Transporte aéreo de carga '),
(411, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '5121', 'Transporte aéreo nacional de carga '),
(412, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '5122', 'Transporte aéreo internacional de carga '),
(413, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '52', 'Almacenamiento y actividades complementarias al transporte'),
(414, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '5210', 'Almacenamiento y depósito'),
(415, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '522', 'Actividades de las estaciones, vías y servicios complementarios para el transporte'),
(416, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '5221', 'Actividades de estaciones, vías y servicios complementarios para el transporte terrestre'),
(417, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '5222', 'Actividades de puertos y servicios complementarios para el transporte acuático'),
(418, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '5223', 'Actividades de aeropuertos, servicios de navegación aérea y demás actividades conexas al transporte aéreo'),
(419, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '5224', 'Manipulación de carga'),
(420, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '5229', 'Otras actividades complementarias al transporte'),
(421, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '53', 'Correo y servicios de mensajería'),
(422, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '5310', 'Actividades postales nacionales'),
(423, 'SECCIÓN H', 'TRANSPORTE Y ALMACENAMIENTO', '5320', 'Actividades de mensajería'),
(424, 'SECCIÓN I', 'ALOJAMIENTO Y SERVICIOS DE COMIDA', '55', 'Alojamiento'),
(425, 'SECCIÓN I', 'ALOJAMIENTO Y SERVICIOS DE COMIDA', '551', 'Actividades de alojamiento de estancias cortas'),
(426, 'SECCIÓN I', 'ALOJAMIENTO Y SERVICIOS DE COMIDA', '5511', 'Alojamiento en hoteles '),
(427, 'SECCIÓN I', 'ALOJAMIENTO Y SERVICIOS DE COMIDA', '5512', 'Alojamiento en apartahoteles'),
(428, 'SECCIÓN I', 'ALOJAMIENTO Y SERVICIOS DE COMIDA', '5513', 'Alojamiento en centros vacacionales '),
(429, 'SECCIÓN I', 'ALOJAMIENTO Y SERVICIOS DE COMIDA', '5514', 'Alojamiento rural'),
(430, 'SECCIÓN I', 'ALOJAMIENTO Y SERVICIOS DE COMIDA', '5519', 'Otros tipos de alojamientos para visitantes'),
(431, 'SECCIÓN I', 'ALOJAMIENTO Y SERVICIOS DE COMIDA', '5520', 'Actividades de zonas de camping y parques para vehículos recreacionales'),
(432, 'SECCIÓN I', 'ALOJAMIENTO Y SERVICIOS DE COMIDA', '5530', 'Servicio por horas '),
(433, 'SECCIÓN I', 'ALOJAMIENTO Y SERVICIOS DE COMIDA', '5590', 'Otros tipos de alojamiento n.c.p.'),
(434, 'SECCIÓN I', 'ALOJAMIENTO Y SERVICIOS DE COMIDA', '56', 'Actividades de servicios de comidas y bebidas'),
(435, 'SECCIÓN I', 'ALOJAMIENTO Y SERVICIOS DE COMIDA', '561', 'Actividades de restaurantes, cafeterías y servicio móvil de comidas'),
(436, 'SECCIÓN I', 'ALOJAMIENTO Y SERVICIOS DE COMIDA', '5611', 'Expendio a la mesa de comidas preparadas'),
(437, 'SECCIÓN I', 'ALOJAMIENTO Y SERVICIOS DE COMIDA', '5612', 'Expendio por autoservicio de comidas preparadas'),
(438, 'SECCIÓN I', 'ALOJAMIENTO Y SERVICIOS DE COMIDA', '5613', 'Expendio de comidas preparadas en cafeterías'),
(439, 'SECCIÓN I', 'ALOJAMIENTO Y SERVICIOS DE COMIDA', '5619', 'Otros tipos de expendio de comidas preparadas n.c.p.'),
(440, 'SECCIÓN I', 'ALOJAMIENTO Y SERVICIOS DE COMIDA', '562', 'Actividades de catering para eventos y otros servicios de comidas'),
(441, 'SECCIÓN I', 'ALOJAMIENTO Y SERVICIOS DE COMIDA', '5621', 'Catering para eventos'),
(442, 'SECCIÓN I', 'ALOJAMIENTO Y SERVICIOS DE COMIDA', '5629', 'Actividades de otros servicios de comidas'),
(443, 'SECCIÓN I', 'ALOJAMIENTO Y SERVICIOS DE COMIDA', '5630', 'Expendio de bebidas alcohólicas para el consumo dentro del establecimiento'),
(444, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '58', 'Actividades de edición'),
(445, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '581', 'Edición de libros, publicaciones periódicas y otras actividades de edición'),
(446, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '5811', 'Edición de libros'),
(447, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '5812', 'Edición de directorios y listas de correo'),
(448, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '5813', 'Edición de periódicos, revistas y otras publicaciones periódicas'),
(449, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '5819', 'Otros trabajos de edición'),
(450, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '5820', 'Edición de programas de informática (software)'),
(451, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '59', 'Actividades cinematográficas, de video y producción de programas de televisión, grabación de sonido y edición de música'),
(452, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '591', 'Actividades de producción de películas cinematográficas, video y producción de programas, anuncios y comerciales de televisión'),
(453, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '5911', 'Actividades de producción de películas cinematográficas, videos, programas, anuncios y comerciales de televisión'),
(454, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '5912', 'Actividades de posproducción de películas cinematográficas, videos, programas, anuncios y comerciales de televisión'),
(455, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '5913', 'Actividades de distribución de películas cinematográficas, videos, programas, anuncios y comerciales de televisión'),
(456, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '5914', 'Actividades de exhibición de películas cinematográficas y videos'),
(457, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '5920', 'Actividades de grabación de sonido y edición de música'),
(458, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '60', 'Actividades de programación, transmisión y/o difusión'),
(459, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '6010', 'Actividades de programación y transmisión en el servicio de radiodifusión sonora'),
(460, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '6020', 'Actividades de programación y transmisión de televisión'),
(461, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '61', 'Telecomunicaciones'),
(462, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '6110', 'Actividades de telecomunicaciones alámbricas'),
(463, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '6120', 'Actividades de telecomunicaciones inalámbricas'),
(464, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '6130', 'Actividades de telecomunicación satelital'),
(465, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '6190', 'Otras actividades de telecomunicaciones'),
(466, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '62', 'Desarrollo de sistemas informáticos (planificación, análisis, diseño, programación, pruebas), consultoría informática y actividades relacionadas'),
(467, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '620', 'Desarrollo de sistemas informáticos (planificación, análisis, diseño, programación, pruebas), consultoría informática y actividades relacionadas'),
(468, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '6201', 'Actividades de desarrollo de sistemas informáticos (planificación, análisis, diseño, programación, pruebas)'),
(469, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '6202', 'Actividades de consultoría informática y actividades de administración de instalaciones informáticas'),
(470, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '6209', 'Otras actividades de tecnologías de información y actividades de servicios informáticos'),
(471, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '63', 'Actividades de servicios de información'),
(472, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '631', 'Procesamiento de datos, alojamiento (hosting) y actividades relacionadas; portales web'),
(473, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '6311', 'Procesamiento de datos, alojamiento (hosting) y actividades relacionadas'),
(474, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '6312', 'Portales web'),
(475, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '639', 'Otras actividades de servicio de información'),
(476, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '6391', 'Actividades de agencias de noticias'),
(477, 'SECCIÓN J', 'INFORMACIÓN Y COMUNICACIONES', '6399', 'Otras actividades de servicio de información n.c.p.'),
(478, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '64', 'Actividades de servicios financieros, excepto las de seguros y de pensiones'),
(479, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '641', 'Intermediación monetaria'),
(480, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6411', 'Banco Central'),
(481, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6412', 'Bancos comerciales'),
(482, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '642', 'Otros tipos de intermediación monetaria'),
(483, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6421', 'Actividades de las corporaciones financieras'),
(484, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6422', 'Actividades de las compañías de financiamiento'),
(485, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6423', 'Banca de segundo piso'),
(486, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6424', 'Actividades de las cooperativas financieras'),
(487, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '643', 'Fideicomisos, fondos (incluye fondos de cesantías) y entidades financieras similares'),
(488, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6431', 'Fideicomisos, fondos y entidades financieras similares'),
(489, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6432', 'Fondos de cesantías'),
(490, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '649', 'Otras actividades de servicio financiero, excepto las de seguros y pensiones'),
(491, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6491', 'Leasing financiero (arrendamiento financiero)'),
(492, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6492', 'Actividades financieras de fondos de empleados y otras formas asociativas del sector solidario'),
(493, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6493', 'Actividades de compra de cartera o factoring'),
(494, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6494', 'Otras actividades de distribución de fondos'),
(495, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6495', 'Instituciones especiales oficiales'),
(496, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6496', 'Capitalización'),
(497, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6499', 'Otras actividades de servicio financiero, excepto las de seguros y pensiones n.c.p.'),
(498, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '65', 'Seguros (incluso el reaseguro), seguros sociales y fondos de pensiones, excepto la seguridad social'),
(499, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '651', 'Seguros y capitalización'),
(500, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6511', 'Seguros generales '),
(501, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6512', 'Seguros de vida'),
(502, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6513', 'Reaseguros'),
(503, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6515', 'Seguros de salud'),
(504, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '652', 'Servicios de seguros sociales de salud y riesgos profesionales'),
(505, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6521', 'Servicios de seguros sociales de salud'),
(506, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6522', 'Servicios de seguros sociales de riesgos laborales'),
(507, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6523', 'Servicios de seguros sociales en riesgos de familia'),
(508, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '653', 'Servicios de seguros sociales de pensiones'),
(509, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6531', 'Régimen de prima media con prestación definida (RPM)'),
(510, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6532', 'Régimen de ahorro con solidaridad (RAIS).'),
(511, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '66', 'Actividades auxiliares de las actividades de servicios financieros'),
(512, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '661', 'Actividades auxiliares de las actividades de servicios financieros, excepto las de seguros y pensiones'),
(513, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6611', 'Administración de mercados financieros'),
(514, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6612', 'Corretaje de valores y de contratos de productos básicos'),
(515, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6613', 'Otras actividades relacionadas con el mercado de valores'),
(516, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6614', 'Actividades de las sociedades de intermediación cambiaria y de servicios financieros especiales'),
(517, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6615', 'Actividades de los profesionales de compra y venta de divisas'),
(518, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6619', 'Otras actividades auxiliares de las actividades de servicios financieros n.c.p.'),
(519, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '662', 'Actividades de servicios auxiliares de los servicios de seguros y pensiones'),
(520, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6621', 'Actividades de agentes y corredores de seguros'),
(521, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6629', 'Evaluación de riesgos y daños, y otras actividades de servicios auxiliares'),
(522, 'SECCIÓN K', 'ACTIVIDADES FINANCIERAS Y DE SEGUROS', '6630', 'Actividades de administración de fondos'),
(523, 'SECCIÓN L', 'ACTIVIDADES INMOBILIARIAS', '68', 'Actividades inmobiliarias'),
(524, 'SECCIÓN L', 'ACTIVIDADES INMOBILIARIAS', '6810', 'Actividades inmobiliarias realizadas con bienes propios o arrendados'),
(525, 'SECCIÓN L', 'ACTIVIDADES INMOBILIARIAS', '6820', 'Actividades inmobiliarias realizadas a cambio de una retribución o por contrata'),
(526, 'SECCIÓN M', 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', '69', 'Actividades jurídicas y de contabilidad'),
(527, 'SECCIÓN M', 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', '6910', 'Actividades jurídicas'),
(528, 'SECCIÓN M', 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', '6920', 'Actividades de contabilidad, teneduría de libros, auditoría financiera y asesoría tributaria'),
(529, 'SECCIÓN M', 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', '70', 'Actividades de administración empresarial; actividades de consultoría de gestión'),
(530, 'SECCIÓN M', 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', '7010', 'Actividades de administración empresarial'),
(531, 'SECCIÓN M', 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', '7020', 'Actividades de consultoría de gestión'),
(532, 'SECCIÓN M', 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', '71', 'Actividades de arquitectura e ingeniería; ensayos y análisis técnicos'),
(533, 'SECCIÓN M', 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', '711', 'Actividades de arquitectura e ingeniería y otras actividades conexas de consultoría técnica'),
(534, 'SECCIÓN M', 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', '7111', 'Actividades de arquitectura'),
(535, 'SECCIÓN M', 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', '7112', 'Actividades de ingeniería y otras actividades conexas de consultoría técnica'),
(536, 'SECCIÓN M', 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', '7120', 'Ensayos y análisis técnicos'),
(537, 'SECCIÓN M', 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', '72', 'Investigación científica y desarrollo'),
(538, 'SECCIÓN M', 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', '7210', 'Investigaciones y desarrollo experimental en el campo de las ciencias naturales y la ingeniería '),
(539, 'SECCIÓN M', 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', '7220', 'Investigaciones y desarrollo experimental en el campo de las ciencias sociales y las humanidades'),
(540, 'SECCIÓN M', 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', '73', 'Publicidad y estudios de mercado'),
(541, 'SECCIÓN M', 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', '7310', 'Publicidad'),
(542, 'SECCIÓN M', 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', '7320', 'Estudios de mercado y realización de encuestas de opinión pública'),
(543, 'SECCIÓN M', 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', '74', 'Otras actividades profesionales, científicas y técnicas'),
(544, 'SECCIÓN M', 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', '7410', 'Actividades especializadas de diseño '),
(545, 'SECCIÓN M', 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', '7420', 'Actividades de fotografía'),
(546, 'SECCIÓN M', 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', '7490', 'Otras actividades profesionales, científicas y técnicas n.c.p.'),
(547, 'SECCIÓN M', 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', '75', 'Actividades veterinarias'),
(548, 'SECCIÓN M', 'ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS', '7500', 'Actividades veterinarias'),
(549, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '77', 'Actividades de alquiler y arrendamiento'),
(550, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '7710', 'Alquiler y arrendamiento de vehículos automotores'),
(551, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '772', 'Alquiler y arrendamiento de efectos personales y enseres domésticos'),
(552, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '7721', 'Alquiler y arrendamiento de equipo recreativo y deportivo'),
(553, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '7722', 'Alquiler de videos y discos '),
(554, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '7729', 'Alquiler y arrendamiento de otros efectos personales y enseres domésticos n.c.p.'),
(555, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '7730', 'Alquiler y arrendamiento de otros tipos de maquinaria, equipo y bienes tangibles n.c.p.'),
(556, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '7740', 'Arrendamiento de propiedad intelectual y productos similares, excepto obras protegidas por derechos de autor'),
(557, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '78', 'Actividades de empleo'),
(558, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '7810', 'Actividades de agencias de gestión y colocación de empleo'),
(559, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '7820', 'Actividades de empresas de servicios temporales'),
(560, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '7830', 'Otras actividades de provisión de talento humano'),
(561, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '79', 'Actividades de las agencias de viajes, operadores turísticos, servicios de reserva y actividades relacionadas'),
(562, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '791', 'Actividades de las agencias de viajes y operadores turísticos'),
(563, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '7911', 'Actividades de las agencias de viaje'),
(564, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '7912', 'Actividades de operadores turísticos'),
(565, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '7990', 'Otros servicios de reserva y actividades relacionadas'),
(566, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '80', 'Actividades de seguridad e investigación privada'),
(567, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '8010', 'Actividades de seguridad privada'),
(568, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '8020', 'Actividades de servicios de sistemas de seguridad'),
(569, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '8030', 'Actividades de detectives e investigadores privados'),
(570, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '81', 'Actividades de servicios a edificios y paisajismo (jardines, zonas verdes)'),
(571, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '8110', 'Actividades combinadas de apoyo a instalaciones'),
(572, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '812', 'Actividades de limpieza'),
(573, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '8121', 'Limpieza general interior de edificios'),
(574, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '8129', 'Otras actividades de limpieza de edificios e instalaciones industriales'),
(575, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '8130', 'Actividades de paisajismo y servicios de mantenimiento conexos'),
(576, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '82', 'Actividades administrativas y de apoyo de oficina y otras actividades de apoyo a las empresas'),
(577, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '821', 'Actividades administrativas y de apoyo de oficina'),
(578, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '8211', 'Actividades combinadas de servicios administrativos de oficina'),
(579, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '8219', 'Fotocopiado, preparación de documentos y otras actividades especializadas de apoyo a oficina'),
(580, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '8220', 'Actividades de centros de llamadas (Call center)'),
(581, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '8230', 'Organización de convenciones y eventos comerciales'),
(582, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '829', 'Actividades de servicios de apoyo a las empresas n.c.p.'),
(583, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '8291', 'Actividades de agencias de cobranza y oficinas de calificación crediticia'),
(584, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '8292', 'Actividades de envase y empaque'),
(585, 'SECCIÓN N', 'ACTIVIDADES DE SERVICIOS ADMINISTRATIVOS Y DE APOYO', '8299', 'Otras actividades de servicio de apoyo a las empresas n.c.p.'),
(586, 'SECCIÓN O', 'ADMINISTRACIÓN PÚBLICA Y DEFENSA; PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA', '84', 'Administración pública y defensa; planes de seguridad social de afiliación obligatoria'),
(587, 'SECCIÓN O', 'ADMINISTRACIÓN PÚBLICA Y DEFENSA; PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA', '841', 'Administración del Estado y aplicación de la política económica y social de la comunidad'),
(588, 'SECCIÓN O', 'ADMINISTRACIÓN PÚBLICA Y DEFENSA; PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA', '8411', 'Actividades legislativas de la administración pública'),
(589, 'SECCIÓN O', 'ADMINISTRACIÓN PÚBLICA Y DEFENSA; PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA', '8412', 'Actividades ejecutivas de la administración pública'),
(590, 'SECCIÓN O', 'ADMINISTRACIÓN PÚBLICA Y DEFENSA; PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA', '8413', 'Regulación de las actividades de organismos que prestan servicios de salud, educativos, culturales y otros servicios sociales, excepto servicios de seguridad social '),
(591, 'SECCIÓN O', 'ADMINISTRACIÓN PÚBLICA Y DEFENSA; PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA', '8414', 'Actividades reguladoras y facilitadoras de la actividad económica'),
(592, 'SECCIÓN O', 'ADMINISTRACIÓN PÚBLICA Y DEFENSA; PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA', '8415', 'Actividades de los otros órganos de control y otras instituciones'),
(593, 'SECCIÓN O', 'ADMINISTRACIÓN PÚBLICA Y DEFENSA; PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA', '842', 'Prestación de servicios a la comunidad en general'),
(594, 'SECCIÓN O', 'ADMINISTRACIÓN PÚBLICA Y DEFENSA; PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA', '8421', 'Relaciones exteriores '),
(595, 'SECCIÓN O', 'ADMINISTRACIÓN PÚBLICA Y DEFENSA; PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA', '8422', 'Actividades de defensa'),
(596, 'SECCIÓN O', 'ADMINISTRACIÓN PÚBLICA Y DEFENSA; PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA', '8423', 'Orden público y actividades de seguridad'),
(597, 'SECCIÓN O', 'ADMINISTRACIÓN PÚBLICA Y DEFENSA; PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA', '8424', 'Administración de justicia'),
(598, 'SECCIÓN O', 'ADMINISTRACIÓN PÚBLICA Y DEFENSA; PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA', '8430', 'Actividades de planes de seguridad social de afiliación obligatoria'),
(599, 'SECCIÓN P', 'EDUCACIÓN', '85', 'Educación'),
(600, 'SECCIÓN P', 'EDUCACIÓN', '851', 'Educación de la primera infancia, preescolar y básica primaria'),
(601, 'SECCIÓN P', 'EDUCACIÓN', '8511', 'Educación de la primera infancia'),
(602, 'SECCIÓN P', 'EDUCACIÓN', '8512', 'Educación preescolar'),
(603, 'SECCIÓN P', 'EDUCACIÓN', '8513', 'Educación básica primaria'),
(604, 'SECCIÓN P', 'EDUCACIÓN', '852', 'Educación secundaria y de formación laboral'),
(605, 'SECCIÓN P', 'EDUCACIÓN', '8521', 'Educación básica secundaria '),
(606, 'SECCIÓN P', 'EDUCACIÓN', '8522', 'Educación media académica'),
(607, 'SECCIÓN P', 'EDUCACIÓN', '8523', 'Educación media técnica '),
(608, 'SECCIÓN P', 'EDUCACIÓN', '8530', 'Establecimientos que combinan diferentes niveles de educación '),
(609, 'SECCIÓN P', 'EDUCACIÓN', '854', 'Educación superior'),
(610, 'SECCIÓN P', 'EDUCACIÓN', '8541', 'Educación técnica profesional'),
(611, 'SECCIÓN P', 'EDUCACIÓN', '8542', 'Educación tecnológica'),
(612, 'SECCIÓN P', 'EDUCACIÓN', '8543', 'Educación de instituciones universitarias o de escuelas tecnológicas'),
(613, 'SECCIÓN P', 'EDUCACIÓN', '8544', 'Educación de universidades'),
(614, 'SECCIÓN P', 'EDUCACIÓN', '855', 'Otros tipos de educación'),
(615, 'SECCIÓN P', 'EDUCACIÓN', '8551', 'Formación para el trabajo'),
(616, 'SECCIÓN P', 'EDUCACIÓN', '8552', 'Enseñanza deportiva y recreativa'),
(617, 'SECCIÓN P', 'EDUCACIÓN', '8553', 'Enseñanza cultural'),
(618, 'SECCIÓN P', 'EDUCACIÓN', '8559', 'Otros tipos de educación n.c.p.'),
(619, 'SECCIÓN P', 'EDUCACIÓN', '8560', 'Actividades de apoyo a la educación'),
(620, 'SECCIÓN Q', 'ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA Y DE ASISTENCIA SOCIAL', '86', 'Actividades de atención de la salud humana'),
(621, 'SECCIÓN Q', 'ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA Y DE ASISTENCIA SOCIAL', '8610', 'Actividades de hospitales y clínicas, con internación'),
(622, 'SECCIÓN Q', 'ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA Y DE ASISTENCIA SOCIAL', '862', 'Actividades de práctica médica y odontológica, sin internación '),
(623, 'SECCIÓN Q', 'ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA Y DE ASISTENCIA SOCIAL', '8621', 'Actividades de la práctica médica, sin internación'),
(624, 'SECCIÓN Q', 'ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA Y DE ASISTENCIA SOCIAL', '8622', 'Actividades de la práctica odontológica'),
(625, 'SECCIÓN Q', 'ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA Y DE ASISTENCIA SOCIAL', '869', 'Otras actividades de atención relacionadas con la salud humana'),
(626, 'SECCIÓN Q', 'ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA Y DE ASISTENCIA SOCIAL', '8691', 'Actividades de apoyo diagnóstico'),
(627, 'SECCIÓN Q', 'ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA Y DE ASISTENCIA SOCIAL', '8692', 'Actividades de apoyo terapéutico'),
(628, 'SECCIÓN Q', 'ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA Y DE ASISTENCIA SOCIAL', '8699', 'Otras actividades de atención de la salud humana'),
(629, 'SECCIÓN Q', 'ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA Y DE ASISTENCIA SOCIAL', '87', 'Actividades de atención residencial medicalizada'),
(630, 'SECCIÓN Q', 'ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA Y DE ASISTENCIA SOCIAL', '8710', 'Actividades de atención residencial medicalizada de tipo general'),
(631, 'SECCIÓN Q', 'ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA Y DE ASISTENCIA SOCIAL', '8720', 'Actividades de atención residencial, para el cuidado de pacientes con retardo mental, enfermedad mental y consumo de sustancias psicoactivas'),
(632, 'SECCIÓN Q', 'ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA Y DE ASISTENCIA SOCIAL', '8730', 'Actividades de atención en instituciones para el cuidado de personas mayores y/o discapacitadas'),
(633, 'SECCIÓN Q', 'ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA Y DE ASISTENCIA SOCIAL', '8790', 'Otras actividades de atención en instituciones con alojamiento'),
(634, 'SECCIÓN Q', 'ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA Y DE ASISTENCIA SOCIAL', '88', 'Actividades de asistencia social sin alojamiento'),
(635, 'SECCIÓN Q', 'ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA Y DE ASISTENCIA SOCIAL', '8810', 'Actividades de asistencia social sin alojamiento para personas mayores y discapacitadas'),
(636, 'SECCIÓN Q', 'ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA Y DE ASISTENCIA SOCIAL', '889', 'Otras actividades de asistencia social sin alojamiento'),
(637, 'SECCIÓN Q', 'ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA Y DE ASISTENCIA SOCIAL', '8891', 'Actividades de guarderías para niños y niñas'),
(638, 'SECCIÓN Q', 'ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA Y DE ASISTENCIA SOCIAL', '8899', 'Otras actividades de asistencia social n.c.p.'),
(639, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '90', 'Actividades creativas, artísticas y de entretenimiento'),
(640, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '900', 'Actividades creativas, artísticas y de entretenimiento '),
(641, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '9001', 'Creación literaria'),
(642, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '9002', 'Creación musical'),
(643, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '9003', 'Creación teatral'),
(644, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '9004', 'Creación audiovisual'),
(645, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '9005', 'Artes plásticas y visuales'),
(646, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '9006', 'Actividades teatrales'),
(647, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '9007', 'Actividades de espectáculos musicales en vivo'),
(648, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '9008', 'Otras actividades de espectáculos en vivo n.c.p.'),
(649, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '91', 'Actividades de bibliotecas, archivos, museos y otras actividades culturales'),
(650, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '910', 'Actividades de bibliotecas, archivos, museos y otras actividades culturales'),
(651, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '9101', 'Actividades de bibliotecas y archivos'),
(652, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '9102', 'Actividades y funcionamiento de museos, conservación de edificios y sitios históricos'),
(653, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '9103', 'Actividades de jardines botánicos, zoológicos y reservas naturales'),
(654, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '92', 'Actividades de juegos de azar y apuestas'),
(655, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '9200', 'Actividades de juegos de azar y apuestas'),
(656, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '93', 'Actividades deportivas y actividades recreativas y de esparcimiento'),
(657, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '931', 'Actividades deportivas'),
(658, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '9311', 'Gestión de instalaciones deportivas'),
(659, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '9312', 'Actividades de clubes deportivos'),
(660, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '9319', 'Otras actividades deportivas'),
(661, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '932', 'Otras actividades recreativas y de esparcimiento'),
(662, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '9321', 'Actividades de parques de atracciones y parques temáticos'),
(663, 'SECCIÓN R ', 'ACTIVIDADES ARTÍSTICAS, DE ENTRETENIMIENTO Y RECREACIÓN', '9329', 'Otras actividades recreativas y de esparcimiento n.c.p.'),
(664, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '94', 'Actividades de asociaciones'),
(665, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '941', 'Actividades de asociaciones empresariales y de empleadores, y asociaciones profesionales'),
(666, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '9411', 'Actividades de asociaciones empresariales y de empleadores'),
(667, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '9412', 'Actividades de asociaciones profesionales'),
(668, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '9420', 'Actividades de sindicatos de empleados'),
(669, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '949', 'Actividades de otras asociaciones'),
(670, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '9491', 'Actividades de asociaciones religiosas'),
(671, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '9492', 'Actividades de asociaciones políticas'),
(672, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '9499', 'Actividades de otras asociaciones n.c.p.'),
(673, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '95', 'Mantenimiento y reparación de computadores, efectos personales y enseres domésticos'),
(674, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '951', 'Mantenimiento y reparación de computadores y equipo de comunicaciones'),
(675, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '9511', 'Mantenimiento y reparación de computadores y de equipo periférico'),
(676, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '9512', 'Mantenimiento y reparación de equipos de comunicación'),
(677, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '952', 'Mantenimiento y reparación de efectos personales y enseres domésticos'),
(678, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '9521', 'Mantenimiento y reparación de aparatos electrónicos de consumo'),
(679, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '9522', 'Mantenimiento y reparación de aparatos y equipos domésticos y de jardinería '),
(680, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '9523', 'Reparación de calzado y artículos de cuero'),
(681, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '9524', 'Reparación de muebles y accesorios para el hogar'),
(682, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '9529', 'Mantenimiento y reparación de otros efectos personales y enseres domésticos'),
(683, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '96', 'Otras actividades de servicios personales'),
(684, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '960', 'Otras actividades de servicios personales'),
(685, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '9601', 'Lavado y limpieza, incluso la limpieza en seco, de productos textiles y de piel'),
(686, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '9602', 'Peluquería y otros tratamientos de belleza'),
(687, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '9603', 'Pompas fúnebres y actividades relacionadas'),
(688, 'SECCIÓN S', 'OTRAS ACTIVIDADES DE SERVICIOS', '9609', 'Otras actividades de servicios personales n.c.p.'),
(689, 'SECCIÓN T ', 'ACTIVIDADES DE LOS HOGARES INDIVIDUALES EN CALIDAD DE EMPLEADORES; ACTIVIDADES NO DIFERENCIADAS DE LOS HOGARES INDIVIDUALES COMO PRODUCTORES DE BIENES Y SERVICIOS PARA USO PROPIO', '97', 'Actividades de los hogares individuales como empleadores de personal doméstico'),
(690, 'SECCIÓN T ', 'ACTIVIDADES DE LOS HOGARES INDIVIDUALES EN CALIDAD DE EMPLEADORES; ACTIVIDADES NO DIFERENCIADAS DE LOS HOGARES INDIVIDUALES COMO PRODUCTORES DE BIENES Y SERVICIOS PARA USO PROPIO', '9700', 'Actividades de los hogares individuales como empleadores de personal doméstico'),
(691, 'SECCIÓN T ', 'ACTIVIDADES DE LOS HOGARES INDIVIDUALES EN CALIDAD DE EMPLEADORES; ACTIVIDADES NO DIFERENCIADAS DE LOS HOGARES INDIVIDUALES COMO PRODUCTORES DE BIENES Y SERVICIOS PARA USO PROPIO', '98', 'Actividades no diferenciadas de los hogares individuales como productores de bienes y servicios para uso propio'),
(692, 'SECCIÓN T ', 'ACTIVIDADES DE LOS HOGARES INDIVIDUALES EN CALIDAD DE EMPLEADORES; ACTIVIDADES NO DIFERENCIADAS DE LOS HOGARES INDIVIDUALES COMO PRODUCTORES DE BIENES Y SERVICIOS PARA USO PROPIO', '9810', 'Actividades no diferenciadas de los hogares individuales como productores de bienes para uso propio'),
(693, 'SECCIÓN T ', 'ACTIVIDADES DE LOS HOGARES INDIVIDUALES EN CALIDAD DE EMPLEADORES; ACTIVIDADES NO DIFERENCIADAS DE LOS HOGARES INDIVIDUALES COMO PRODUCTORES DE BIENES Y SERVICIOS PARA USO PROPIO', '9820', 'Actividades no diferenciadas de los hogares individuales como productores de servicios para uso propio'),
(694, 'SECCIÓN U', 'ACTIVIDADES DE ORGANIZACIONES Y ENTIDADES EXTRATERRITORIALES ', '99', 'Actividades de organizaciones y entidades extraterritoriales'),
(695, 'SECCIÓN U', 'ACTIVIDADES DE ORGANIZACIONES Y ENTIDADES EXTRATERRITORIALES ', '9900', 'Actividades de organizaciones y entidades extraterritoriales'),
(696, 'SECCIÓN Dian', 'OTRAS CLASIFICACIONES ', '0010', 'Asalariados'),
(697, 'SECCIÓN Dian', 'OTRAS CLASIFICACIONES ', '0020', 'Pensionados'),
(698, 'SECCIÓN Dian', 'OTRAS CLASIFICACIONES ', '0081', 'Personas naturales y sucesiones ilíquidas sin actividad económica'),
(699, 'SECCIÓN Dian', 'OTRAS CLASIFICACIONES ', '0082', 'Personas naturales subsidiadas por terceros'),
(700, 'SECCIÓN Dian', 'OTRAS CLASIFICACIONES ', '0090', 'Rentistas de capital, solo para personas naturales y sucesiones ilíquidas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `st_cities`
--

CREATE TABLE `st_cities` (
  `id_city` int(6) UNSIGNED NOT NULL,
  `city` varchar(255) NOT NULL DEFAULT '',
  `iso_country` varchar(3) NOT NULL,
  `state_id` int(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `st_cities`
--

INSERT INTO `st_cities` (`id_city`, `city`, `iso_country`, `state_id`) VALUES
(1, 'Abriaquí', 'CO', 5),
(2, 'Acacías', 'CO', 50),
(3, 'Acandí', 'CO', 27),
(4, 'Acevedo', 'CO', 41),
(5, 'Achí', 'CO', 13),
(6, 'Agrado', 'CO', 41),
(7, 'Agua de Dios', 'CO', 25),
(8, 'Aguachica', 'CO', 20),
(9, 'Aguada', 'CO', 68),
(10, 'Aguadas', 'CO', 17),
(11, 'Aguazul', 'CO', 85),
(12, 'Agustín Codazzi', 'CO', 20),
(13, 'Aipe', 'CO', 41),
(14, 'Albania', 'CO', 18),
(15, 'Albania', 'CO', 44),
(16, 'Albania', 'CO', 68),
(17, 'Albán', 'CO', 25),
(18, 'Albán (San José)', 'CO', 52),
(19, 'Alcalá', 'CO', 76),
(20, 'Alejandria', 'CO', 5),
(21, 'Algarrobo', 'CO', 47),
(22, 'Algeciras', 'CO', 41),
(23, 'Almaguer', 'CO', 19),
(24, 'Almeida', 'CO', 15),
(25, 'Alpujarra', 'CO', 73),
(26, 'Altamira', 'CO', 41),
(27, 'Alto Baudó (Pie de Pato)', 'CO', 27),
(28, 'Altos del Rosario', 'CO', 13),
(29, 'Alvarado', 'CO', 73),
(30, 'Amagá', 'CO', 5),
(31, 'Amalfi', 'CO', 5),
(32, 'Ambalema', 'CO', 73),
(33, 'Anapoima', 'CO', 25),
(34, 'Ancuya', 'CO', 52),
(35, 'Andalucía', 'CO', 76),
(36, 'Andes', 'CO', 5),
(37, 'Angelópolis', 'CO', 5),
(38, 'Angostura', 'CO', 5),
(39, 'Anolaima', 'CO', 25),
(40, 'Anorí', 'CO', 5),
(41, 'Anserma', 'CO', 17),
(42, 'Ansermanuevo', 'CO', 76),
(43, 'Anzoátegui', 'CO', 73),
(44, 'Anzá', 'CO', 5),
(45, 'Apartadó', 'CO', 5),
(46, 'Apulo', 'CO', 25),
(47, 'Apía', 'CO', 66),
(48, 'Aquitania', 'CO', 15),
(49, 'Aracataca', 'CO', 47),
(50, 'Aranzazu', 'CO', 17),
(51, 'Aratoca', 'CO', 68),
(52, 'Arauca', 'CO', 81),
(53, 'Arauquita', 'CO', 81),
(54, 'Arbeláez', 'CO', 25),
(55, 'Arboleda (Berruecos)', 'CO', 52),
(56, 'Arboledas', 'CO', 54),
(57, 'Arboletes', 'CO', 5),
(58, 'Arcabuco', 'CO', 15),
(59, 'Arenal', 'CO', 13),
(60, 'Argelia', 'CO', 5),
(61, 'Argelia', 'CO', 19),
(62, 'Argelia', 'CO', 76),
(63, 'Ariguaní (El Difícil)', 'CO', 47),
(64, 'Arjona', 'CO', 13),
(65, 'Armenia', 'CO', 5),
(66, 'Armenia', 'CO', 63),
(67, 'Armero (Guayabal)', 'CO', 73),
(68, 'Arroyohondo', 'CO', 13),
(69, 'Astrea', 'CO', 20),
(70, 'Ataco', 'CO', 73),
(71, 'Atrato (Yuto)', 'CO', 27),
(72, 'Ayapel', 'CO', 23),
(73, 'Bagadó', 'CO', 27),
(74, 'Bahía Solano (Mútis)', 'CO', 27),
(75, 'Bajo Baudó (Pizarro)', 'CO', 27),
(76, 'Balboa', 'CO', 19),
(77, 'Balboa', 'CO', 66),
(78, 'Baranoa', 'CO', 8),
(79, 'Baraya', 'CO', 41),
(80, 'Barbacoas', 'CO', 52),
(81, 'Barbosa', 'CO', 5),
(82, 'Barbosa', 'CO', 68),
(83, 'Barichara', 'CO', 68),
(84, 'Barranca de Upía', 'CO', 50),
(85, 'Barrancabermeja', 'CO', 68),
(86, 'Barrancas', 'CO', 44),
(87, 'Barranco de Loba', 'CO', 13),
(88, 'Barranquilla', 'CO', 8),
(89, 'Becerríl', 'CO', 20),
(90, 'Belalcázar', 'CO', 17),
(91, 'Bello', 'CO', 5),
(92, 'Belmira', 'CO', 5),
(93, 'Beltrán', 'CO', 25),
(94, 'Belén', 'CO', 15),
(95, 'Belén', 'CO', 52),
(96, 'Belén de Bajirá', 'CO', 27),
(97, 'Belén de Umbría', 'CO', 66),
(98, 'Belén de los Andaquíes', 'CO', 18),
(99, 'Berbeo', 'CO', 15),
(100, 'Betania', 'CO', 5),
(101, 'Beteitiva', 'CO', 15),
(102, 'Betulia', 'CO', 5),
(103, 'Betulia', 'CO', 68),
(104, 'Bituima', 'CO', 25),
(105, 'Boavita', 'CO', 15),
(106, 'Bochalema', 'CO', 54),
(107, 'Bogotá D.C.', 'CO', 11),
(108, 'Bojacá', 'CO', 25),
(109, 'Bojayá (Bellavista)', 'CO', 27),
(110, 'Bolívar', 'CO', 5),
(111, 'Bolívar', 'CO', 19),
(112, 'Bolívar', 'CO', 68),
(113, 'Bolívar', 'CO', 76),
(114, 'Bosconia', 'CO', 20),
(115, 'Boyacá', 'CO', 15),
(116, 'Briceño', 'CO', 5),
(117, 'Briceño', 'CO', 15),
(118, 'Bucaramanga', 'CO', 68),
(119, 'Bucarasica', 'CO', 54),
(120, 'Buenaventura', 'CO', 76),
(121, 'Buenavista', 'CO', 15),
(122, 'Buenavista', 'CO', 23),
(123, 'Buenavista', 'CO', 63),
(124, 'Buenavista', 'CO', 70),
(125, 'Buenos Aires', 'CO', 19),
(126, 'Buesaco', 'CO', 52),
(127, 'Buga', 'CO', 76),
(128, 'Bugalagrande', 'CO', 76),
(129, 'Burítica', 'CO', 5),
(130, 'Busbanza', 'CO', 15),
(131, 'Cabrera', 'CO', 25),
(132, 'Cabrera', 'CO', 68),
(133, 'Cabuyaro', 'CO', 50),
(134, 'Cachipay', 'CO', 25),
(135, 'Caicedo', 'CO', 5),
(136, 'Caicedonia', 'CO', 76),
(137, 'Caimito', 'CO', 70),
(138, 'Cajamarca', 'CO', 73),
(139, 'Cajibío', 'CO', 19),
(140, 'Cajicá', 'CO', 25),
(141, 'Calamar', 'CO', 13),
(142, 'Calamar', 'CO', 95),
(143, 'Calarcá', 'CO', 63),
(144, 'Caldas', 'CO', 5),
(145, 'Caldas', 'CO', 15),
(146, 'Caldono', 'CO', 19),
(147, 'California', 'CO', 68),
(148, 'Calima (Darién)', 'CO', 76),
(149, 'Caloto', 'CO', 19),
(150, 'Calí', 'CO', 76),
(151, 'Campamento', 'CO', 5),
(152, 'Campo de la Cruz', 'CO', 8),
(153, 'Campoalegre', 'CO', 41),
(154, 'Campohermoso', 'CO', 15),
(155, 'Canalete', 'CO', 23),
(156, 'Candelaria', 'CO', 8),
(157, 'Candelaria', 'CO', 76),
(158, 'Cantagallo', 'CO', 13),
(159, 'Cantón de San Pablo', 'CO', 27),
(160, 'Caparrapí', 'CO', 25),
(161, 'Capitanejo', 'CO', 68),
(162, 'Caracolí', 'CO', 5),
(163, 'Caramanta', 'CO', 5),
(164, 'Carcasí', 'CO', 68),
(165, 'Carepa', 'CO', 5),
(166, 'Carmen de Apicalá', 'CO', 73),
(167, 'Carmen de Carupa', 'CO', 25),
(168, 'Carmen de Viboral', 'CO', 5),
(169, 'Carmen del Darién (CURBARADÓ)', 'CO', 27),
(170, 'Carolina', 'CO', 5),
(171, 'Cartagena', 'CO', 13),
(172, 'Cartagena del Chairá', 'CO', 18),
(173, 'Cartago', 'CO', 76),
(174, 'Carurú', 'CO', 97),
(175, 'Casabianca', 'CO', 73),
(176, 'Castilla la Nueva', 'CO', 50),
(177, 'Caucasia', 'CO', 5),
(178, 'Cañasgordas', 'CO', 5),
(179, 'Cepita', 'CO', 68),
(180, 'Cereté', 'CO', 23),
(181, 'Cerinza', 'CO', 15),
(182, 'Cerrito', 'CO', 68),
(183, 'Cerro San Antonio', 'CO', 47),
(184, 'Chachaguí', 'CO', 52),
(185, 'Chaguaní', 'CO', 25),
(186, 'Chalán', 'CO', 70),
(187, 'Chaparral', 'CO', 73),
(188, 'Charalá', 'CO', 68),
(189, 'Charta', 'CO', 68),
(190, 'Chigorodó', 'CO', 5),
(191, 'Chima', 'CO', 68),
(192, 'Chimichagua', 'CO', 20),
(193, 'Chimá', 'CO', 23),
(194, 'Chinavita', 'CO', 15),
(195, 'Chinchiná', 'CO', 17),
(196, 'Chinácota', 'CO', 54),
(197, 'Chinú', 'CO', 23),
(198, 'Chipaque', 'CO', 25),
(199, 'Chipatá', 'CO', 68),
(200, 'Chiquinquirá', 'CO', 15),
(201, 'Chiriguaná', 'CO', 20),
(202, 'Chiscas', 'CO', 15),
(203, 'Chita', 'CO', 15),
(204, 'Chitagá', 'CO', 54),
(205, 'Chitaraque', 'CO', 15),
(206, 'Chivatá', 'CO', 15),
(207, 'Chivolo', 'CO', 47),
(208, 'Choachí', 'CO', 25),
(209, 'Chocontá', 'CO', 25),
(210, 'Chámeza', 'CO', 85),
(211, 'Chía', 'CO', 25),
(212, 'Chíquiza', 'CO', 15),
(213, 'Chívor', 'CO', 15),
(214, 'Cicuco', 'CO', 13),
(215, 'Cimitarra', 'CO', 68),
(216, 'Circasia', 'CO', 63),
(217, 'Cisneros', 'CO', 5),
(218, 'Ciénaga', 'CO', 15),
(219, 'Ciénaga', 'CO', 47),
(220, 'Ciénaga de Oro', 'CO', 23),
(221, 'Clemencia', 'CO', 13),
(222, 'Cocorná', 'CO', 5),
(223, 'Coello', 'CO', 73),
(224, 'Cogua', 'CO', 25),
(225, 'Colombia', 'CO', 41),
(226, 'Colosó (Ricaurte)', 'CO', 70),
(227, 'Colón', 'CO', 86),
(228, 'Colón (Génova)', 'CO', 52),
(229, 'Concepción', 'CO', 5),
(230, 'Concepción', 'CO', 68),
(231, 'Concordia', 'CO', 5),
(232, 'Concordia', 'CO', 47),
(233, 'Condoto', 'CO', 27),
(234, 'Confines', 'CO', 68),
(235, 'Consaca', 'CO', 52),
(236, 'Contadero', 'CO', 52),
(237, 'Contratación', 'CO', 68),
(238, 'Convención', 'CO', 54),
(239, 'Copacabana', 'CO', 5),
(240, 'Coper', 'CO', 15),
(241, 'Cordobá', 'CO', 63),
(242, 'Corinto', 'CO', 19),
(243, 'Coromoro', 'CO', 68),
(244, 'Corozal', 'CO', 70),
(245, 'Corrales', 'CO', 15),
(246, 'Cota', 'CO', 25),
(247, 'Cotorra', 'CO', 23),
(248, 'Covarachía', 'CO', 15),
(249, 'Coveñas', 'CO', 70),
(250, 'Coyaima', 'CO', 73),
(251, 'Cravo Norte', 'CO', 81),
(252, 'Cuaspud (Carlosama)', 'CO', 52),
(253, 'Cubarral', 'CO', 50),
(254, 'Cubará', 'CO', 15),
(255, 'Cucaita', 'CO', 15),
(256, 'Cucunubá', 'CO', 25),
(257, 'Cucutilla', 'CO', 54),
(258, 'Cuitiva', 'CO', 15),
(259, 'Cumaral', 'CO', 50),
(260, 'Cumaribo', 'CO', 99),
(261, 'Cumbal', 'CO', 52),
(262, 'Cumbitara', 'CO', 52),
(263, 'Cunday', 'CO', 73),
(264, 'Curillo', 'CO', 18),
(265, 'Curití', 'CO', 68),
(266, 'Curumaní', 'CO', 20),
(267, 'Cáceres', 'CO', 5),
(268, 'Cáchira', 'CO', 54),
(269, 'Cácota', 'CO', 54),
(270, 'Cáqueza', 'CO', 25),
(271, 'Cértegui', 'CO', 27),
(272, 'Cómbita', 'CO', 15),
(273, 'Córdoba', 'CO', 13),
(274, 'Córdoba', 'CO', 52),
(275, 'Cúcuta', 'CO', 54),
(276, 'Dabeiba', 'CO', 5),
(277, 'Dagua', 'CO', 76),
(278, 'Dibulla', 'CO', 44),
(279, 'Distracción', 'CO', 44),
(280, 'Dolores', 'CO', 73),
(281, 'Don Matías', 'CO', 5),
(282, 'Dos Quebradas', 'CO', 66),
(283, 'Duitama', 'CO', 15),
(284, 'Durania', 'CO', 54),
(285, 'Ebéjico', 'CO', 5),
(286, 'El Bagre', 'CO', 5),
(287, 'El Banco', 'CO', 47),
(288, 'El Cairo', 'CO', 76),
(289, 'El Calvario', 'CO', 50),
(290, 'El Carmen', 'CO', 54),
(291, 'El Carmen', 'CO', 68),
(292, 'El Carmen de Atrato', 'CO', 27),
(293, 'El Carmen de Bolívar', 'CO', 13),
(294, 'El Castillo', 'CO', 50),
(295, 'El Cerrito', 'CO', 76),
(296, 'El Charco', 'CO', 52),
(297, 'El Cocuy', 'CO', 15),
(298, 'El Colegio', 'CO', 25),
(299, 'El Copey', 'CO', 20),
(300, 'El Doncello', 'CO', 18),
(301, 'El Dorado', 'CO', 50),
(302, 'El Dovio', 'CO', 76),
(303, 'El Espino', 'CO', 15),
(304, 'El Guacamayo', 'CO', 68),
(305, 'El Guamo', 'CO', 13),
(306, 'El Molino', 'CO', 44),
(307, 'El Paso', 'CO', 20),
(308, 'El Paujil', 'CO', 18),
(309, 'El Peñol', 'CO', 52),
(310, 'El Peñon', 'CO', 13),
(311, 'El Peñon', 'CO', 68),
(312, 'El Peñón', 'CO', 25),
(313, 'El Piñon', 'CO', 47),
(314, 'El Playón', 'CO', 68),
(315, 'El Retorno', 'CO', 95),
(316, 'El Retén', 'CO', 47),
(317, 'El Roble', 'CO', 70),
(318, 'El Rosal', 'CO', 25),
(319, 'El Rosario', 'CO', 52),
(320, 'El Tablón de Gómez', 'CO', 52),
(321, 'El Tambo', 'CO', 19),
(322, 'El Tambo', 'CO', 52),
(323, 'El Tarra', 'CO', 54),
(324, 'El Zulia', 'CO', 54),
(325, 'El Águila', 'CO', 76),
(326, 'Elías', 'CO', 41),
(327, 'Encino', 'CO', 68),
(328, 'Enciso', 'CO', 68),
(329, 'Entrerríos', 'CO', 5),
(330, 'Envigado', 'CO', 5),
(331, 'Espinal', 'CO', 73),
(332, 'Facatativá', 'CO', 25),
(333, 'Falan', 'CO', 73),
(334, 'Filadelfia', 'CO', 17),
(335, 'Filandia', 'CO', 63),
(336, 'Firavitoba', 'CO', 15),
(337, 'Flandes', 'CO', 73),
(338, 'Florencia', 'CO', 18),
(339, 'Florencia', 'CO', 19),
(340, 'Floresta', 'CO', 15),
(341, 'Florida', 'CO', 76),
(342, 'Floridablanca', 'CO', 68),
(343, 'Florián', 'CO', 68),
(344, 'Fonseca', 'CO', 44),
(345, 'Fortúl', 'CO', 81),
(346, 'Fosca', 'CO', 25),
(347, 'Francisco Pizarro', 'CO', 52),
(348, 'Fredonia', 'CO', 5),
(349, 'Fresno', 'CO', 73),
(350, 'Frontino', 'CO', 5),
(351, 'Fuente de Oro', 'CO', 50),
(352, 'Fundación', 'CO', 47),
(353, 'Funes', 'CO', 52),
(354, 'Funza', 'CO', 25),
(355, 'Fusagasugá', 'CO', 25),
(356, 'Fómeque', 'CO', 25),
(357, 'Fúquene', 'CO', 25),
(358, 'Gachalá', 'CO', 25),
(359, 'Gachancipá', 'CO', 25),
(360, 'Gachantivá', 'CO', 15),
(361, 'Gachetá', 'CO', 25),
(362, 'Galapa', 'CO', 8),
(363, 'Galeras (Nueva Granada)', 'CO', 70),
(364, 'Galán', 'CO', 68),
(365, 'Gama', 'CO', 25),
(366, 'Gamarra', 'CO', 20),
(367, 'Garagoa', 'CO', 15),
(368, 'Garzón', 'CO', 41),
(369, 'Gigante', 'CO', 41),
(370, 'Ginebra', 'CO', 76),
(371, 'Giraldo', 'CO', 5),
(372, 'Girardot', 'CO', 25),
(373, 'Girardota', 'CO', 5),
(374, 'Girón', 'CO', 68),
(375, 'Gonzalez', 'CO', 20),
(376, 'Gramalote', 'CO', 54),
(377, 'Granada', 'CO', 5),
(378, 'Granada', 'CO', 25),
(379, 'Granada', 'CO', 50),
(380, 'Guaca', 'CO', 68),
(381, 'Guacamayas', 'CO', 15),
(382, 'Guacarí', 'CO', 76),
(383, 'Guachavés', 'CO', 52),
(384, 'Guachené', 'CO', 19),
(385, 'Guachetá', 'CO', 25),
(386, 'Guachucal', 'CO', 52),
(387, 'Guadalupe', 'CO', 5),
(388, 'Guadalupe', 'CO', 41),
(389, 'Guadalupe', 'CO', 68),
(390, 'Guaduas', 'CO', 25),
(391, 'Guaitarilla', 'CO', 52),
(392, 'Gualmatán', 'CO', 52),
(393, 'Guamal', 'CO', 47),
(394, 'Guamal', 'CO', 50),
(395, 'Guamo', 'CO', 73),
(396, 'Guapota', 'CO', 68),
(397, 'Guapí', 'CO', 19),
(398, 'Guaranda', 'CO', 70),
(399, 'Guarne', 'CO', 5),
(400, 'Guasca', 'CO', 25),
(401, 'Guatapé', 'CO', 5),
(402, 'Guataquí', 'CO', 25),
(403, 'Guatavita', 'CO', 25),
(404, 'Guateque', 'CO', 15),
(405, 'Guavatá', 'CO', 68),
(406, 'Guayabal de Siquima', 'CO', 25),
(407, 'Guayabetal', 'CO', 25),
(408, 'Guayatá', 'CO', 15),
(409, 'Guepsa', 'CO', 68),
(410, 'Guicán', 'CO', 15),
(411, 'Gutiérrez', 'CO', 25),
(412, 'Guática', 'CO', 66),
(413, 'Gámbita', 'CO', 68),
(414, 'Gámeza', 'CO', 15),
(415, 'Génova', 'CO', 63),
(416, 'Gómez Plata', 'CO', 5),
(417, 'Hacarí', 'CO', 54),
(418, 'Hatillo de Loba', 'CO', 13),
(419, 'Hato', 'CO', 68),
(420, 'Hato Corozal', 'CO', 85),
(421, 'Hatonuevo', 'CO', 44),
(422, 'Heliconia', 'CO', 5),
(423, 'Herrán', 'CO', 54),
(424, 'Herveo', 'CO', 73),
(425, 'Hispania', 'CO', 5),
(426, 'Hobo', 'CO', 41),
(427, 'Honda', 'CO', 73),
(428, 'Ibagué', 'CO', 73),
(429, 'Icononzo', 'CO', 73),
(430, 'Iles', 'CO', 52),
(431, 'Imúes', 'CO', 52),
(432, 'Inzá', 'CO', 19),
(433, 'Inírida', 'CO', 94),
(434, 'Ipiales', 'CO', 52),
(435, 'Isnos', 'CO', 41),
(436, 'Istmina', 'CO', 27),
(437, 'Itagüí', 'CO', 5),
(438, 'Ituango', 'CO', 5),
(439, 'Izá', 'CO', 15),
(440, 'Jambaló', 'CO', 19),
(441, 'Jamundí', 'CO', 76),
(442, 'Jardín', 'CO', 5),
(443, 'Jenesano', 'CO', 15),
(444, 'Jericó', 'CO', 5),
(445, 'Jericó', 'CO', 15),
(446, 'Jerusalén', 'CO', 25),
(447, 'Jesús María', 'CO', 68),
(448, 'Jordán', 'CO', 68),
(449, 'Juan de Acosta', 'CO', 8),
(450, 'Junín', 'CO', 25),
(451, 'Juradó', 'CO', 27),
(452, 'La Apartada y La Frontera', 'CO', 23),
(453, 'La Argentina', 'CO', 41),
(454, 'La Belleza', 'CO', 68),
(455, 'La Calera', 'CO', 25),
(456, 'La Capilla', 'CO', 15),
(457, 'La Ceja', 'CO', 5),
(458, 'La Celia', 'CO', 66),
(459, 'La Cruz', 'CO', 52),
(460, 'La Cumbre', 'CO', 76),
(461, 'La Dorada', 'CO', 17),
(462, 'La Esperanza', 'CO', 54),
(463, 'La Estrella', 'CO', 5),
(464, 'La Florida', 'CO', 52),
(465, 'La Gloria', 'CO', 20),
(466, 'La Jagua de Ibirico', 'CO', 20),
(467, 'La Jagua del Pilar', 'CO', 44),
(468, 'La Llanada', 'CO', 52),
(469, 'La Macarena', 'CO', 50),
(470, 'La Merced', 'CO', 17),
(471, 'La Mesa', 'CO', 25),
(472, 'La Montañita', 'CO', 18),
(473, 'La Palma', 'CO', 25),
(474, 'La Paz', 'CO', 68),
(475, 'La Paz (Robles)', 'CO', 20),
(476, 'La Peña', 'CO', 25),
(477, 'La Pintada', 'CO', 5),
(478, 'La Plata', 'CO', 41),
(479, 'La Playa', 'CO', 54),
(480, 'La Primavera', 'CO', 99),
(481, 'La Salina', 'CO', 85),
(482, 'La Sierra', 'CO', 19),
(483, 'La Tebaida', 'CO', 63),
(484, 'La Tola', 'CO', 52),
(485, 'La Unión', 'CO', 5),
(486, 'La Unión', 'CO', 52),
(487, 'La Unión', 'CO', 70),
(488, 'La Unión', 'CO', 76),
(489, 'La Uvita', 'CO', 15),
(490, 'La Vega', 'CO', 19),
(491, 'La Vega', 'CO', 25),
(492, 'La Victoria', 'CO', 15),
(493, 'La Victoria', 'CO', 17),
(494, 'La Victoria', 'CO', 76),
(495, 'La Virginia', 'CO', 66),
(496, 'Labateca', 'CO', 54),
(497, 'Labranzagrande', 'CO', 15),
(498, 'Landázuri', 'CO', 68),
(499, 'Lebrija', 'CO', 68),
(500, 'Leiva', 'CO', 52),
(501, 'Lejanías', 'CO', 50),
(502, 'Lenguazaque', 'CO', 25),
(503, 'Leticia', 'CO', 91),
(504, 'Liborina', 'CO', 5),
(505, 'Linares', 'CO', 52),
(506, 'Lloró', 'CO', 27),
(507, 'Lorica', 'CO', 23),
(508, 'Los Córdobas', 'CO', 23),
(509, 'Los Palmitos', 'CO', 70),
(510, 'Los Patios', 'CO', 54),
(511, 'Los Santos', 'CO', 68),
(512, 'Lourdes', 'CO', 54),
(513, 'Luruaco', 'CO', 8),
(514, 'Lérida', 'CO', 73),
(515, 'Líbano', 'CO', 73),
(516, 'López (Micay)', 'CO', 19),
(517, 'Macanal', 'CO', 15),
(518, 'Macaravita', 'CO', 68),
(519, 'Maceo', 'CO', 5),
(520, 'Machetá', 'CO', 25),
(521, 'Madrid', 'CO', 25),
(522, 'Magangué', 'CO', 13),
(523, 'Magüi (Payán)', 'CO', 52),
(524, 'Mahates', 'CO', 13),
(525, 'Maicao', 'CO', 44),
(526, 'Majagual', 'CO', 70),
(527, 'Malambo', 'CO', 8),
(528, 'Mallama (Piedrancha)', 'CO', 52),
(529, 'Manatí', 'CO', 8),
(530, 'Manaure', 'CO', 44),
(531, 'Manaure Balcón del Cesar', 'CO', 20),
(532, 'Manizales', 'CO', 17),
(533, 'Manta', 'CO', 25),
(534, 'Manzanares', 'CO', 17),
(535, 'Maní', 'CO', 85),
(536, 'Mapiripan', 'CO', 50),
(537, 'Margarita', 'CO', 13),
(538, 'Marinilla', 'CO', 5),
(539, 'Maripí', 'CO', 15),
(540, 'Mariquita', 'CO', 73),
(541, 'Marmato', 'CO', 17),
(542, 'Marquetalia', 'CO', 17),
(543, 'Marsella', 'CO', 66),
(544, 'Marulanda', 'CO', 17),
(545, 'María la Baja', 'CO', 13),
(546, 'Matanza', 'CO', 68),
(547, 'Medellín', 'CO', 5),
(548, 'Medina', 'CO', 25),
(549, 'Medio Atrato', 'CO', 27),
(550, 'Medio Baudó', 'CO', 27),
(551, 'Medio San Juan (ANDAGOYA)', 'CO', 27),
(552, 'Melgar', 'CO', 73),
(553, 'Mercaderes', 'CO', 19),
(554, 'Mesetas', 'CO', 50),
(555, 'Milán', 'CO', 18),
(556, 'Miraflores', 'CO', 15),
(557, 'Miraflores', 'CO', 95),
(558, 'Miranda', 'CO', 19),
(559, 'Mistrató', 'CO', 66),
(560, 'Mitú', 'CO', 97),
(561, 'Mocoa', 'CO', 86),
(562, 'Mogotes', 'CO', 68),
(563, 'Molagavita', 'CO', 68),
(564, 'Momil', 'CO', 23),
(565, 'Mompós', 'CO', 13),
(566, 'Mongua', 'CO', 15),
(567, 'Monguí', 'CO', 15),
(568, 'Moniquirá', 'CO', 15),
(569, 'Montebello', 'CO', 5),
(570, 'Montecristo', 'CO', 13),
(571, 'Montelíbano', 'CO', 23),
(572, 'Montenegro', 'CO', 63),
(573, 'Monteria', 'CO', 23),
(574, 'Monterrey', 'CO', 85),
(575, 'Morales', 'CO', 13),
(576, 'Morales', 'CO', 19),
(577, 'Morelia', 'CO', 18),
(578, 'Morroa', 'CO', 70),
(579, 'Mosquera', 'CO', 25),
(580, 'Mosquera', 'CO', 52),
(581, 'Motavita', 'CO', 15),
(582, 'Moñitos', 'CO', 23),
(583, 'Murillo', 'CO', 73),
(584, 'Murindó', 'CO', 5),
(585, 'Mutatá', 'CO', 5),
(586, 'Mutiscua', 'CO', 54),
(587, 'Muzo', 'CO', 15),
(588, 'Málaga', 'CO', 68),
(589, 'Nariño', 'CO', 5),
(590, 'Nariño', 'CO', 25),
(591, 'Nariño', 'CO', 52),
(592, 'Natagaima', 'CO', 73),
(593, 'Nechí', 'CO', 5),
(594, 'Necoclí', 'CO', 5),
(595, 'Neira', 'CO', 17),
(596, 'Neiva', 'CO', 41),
(597, 'Nemocón', 'CO', 25),
(598, 'Nilo', 'CO', 25),
(599, 'Nimaima', 'CO', 25),
(600, 'Nobsa', 'CO', 15),
(601, 'Nocaima', 'CO', 25),
(602, 'Norcasia', 'CO', 17),
(603, 'Norosí', 'CO', 13),
(604, 'Novita', 'CO', 27),
(605, 'Nueva Granada', 'CO', 47),
(606, 'Nuevo Colón', 'CO', 15),
(607, 'Nunchía', 'CO', 85),
(608, 'Nuquí', 'CO', 27),
(609, 'Nátaga', 'CO', 41),
(610, 'Obando', 'CO', 76),
(611, 'Ocamonte', 'CO', 68),
(612, 'Ocaña', 'CO', 54),
(613, 'Oiba', 'CO', 68),
(614, 'Oicatá', 'CO', 15),
(615, 'Olaya', 'CO', 5),
(616, 'Olaya Herrera', 'CO', 52),
(617, 'Onzaga', 'CO', 68),
(618, 'Oporapa', 'CO', 41),
(619, 'Orito', 'CO', 86),
(620, 'Orocué', 'CO', 85),
(621, 'Ortega', 'CO', 73),
(622, 'Ospina', 'CO', 52),
(623, 'Otanche', 'CO', 15),
(624, 'Ovejas', 'CO', 70),
(625, 'Pachavita', 'CO', 15),
(626, 'Pacho', 'CO', 25),
(627, 'Padilla', 'CO', 19),
(628, 'Paicol', 'CO', 41),
(629, 'Pailitas', 'CO', 20),
(630, 'Paime', 'CO', 25),
(631, 'Paipa', 'CO', 15),
(632, 'Pajarito', 'CO', 15),
(633, 'Palermo', 'CO', 41),
(634, 'Palestina', 'CO', 17),
(635, 'Palestina', 'CO', 41),
(636, 'Palmar', 'CO', 68),
(637, 'Palmar de Varela', 'CO', 8),
(638, 'Palmas del Socorro', 'CO', 68),
(639, 'Palmira', 'CO', 76),
(640, 'Palmito', 'CO', 70),
(641, 'Palocabildo', 'CO', 73),
(642, 'Pamplona', 'CO', 54),
(643, 'Pamplonita', 'CO', 54),
(644, 'Pandi', 'CO', 25),
(645, 'Panqueba', 'CO', 15),
(646, 'Paratebueno', 'CO', 25),
(647, 'Pasca', 'CO', 25),
(648, 'Patía (El Bordo)', 'CO', 19),
(649, 'Pauna', 'CO', 15),
(650, 'Paya', 'CO', 15),
(651, 'Paz de Ariporo', 'CO', 85),
(652, 'Paz de Río', 'CO', 15),
(653, 'Pedraza', 'CO', 47),
(654, 'Pelaya', 'CO', 20),
(655, 'Pensilvania', 'CO', 17),
(656, 'Peque', 'CO', 5),
(657, 'Pereira', 'CO', 66),
(658, 'Pesca', 'CO', 15),
(659, 'Peñol', 'CO', 5),
(660, 'Piamonte', 'CO', 19),
(661, 'Pie de Cuesta', 'CO', 68),
(662, 'Piedras', 'CO', 73),
(663, 'Piendamó', 'CO', 19),
(664, 'Pijao', 'CO', 63),
(665, 'Pijiño', 'CO', 47),
(666, 'Pinchote', 'CO', 68),
(667, 'Pinillos', 'CO', 13),
(668, 'Piojo', 'CO', 8),
(669, 'Pisva', 'CO', 15),
(670, 'Pital', 'CO', 41),
(671, 'Pitalito', 'CO', 41),
(672, 'Pivijay', 'CO', 47),
(673, 'Planadas', 'CO', 73),
(674, 'Planeta Rica', 'CO', 23),
(675, 'Plato', 'CO', 47),
(676, 'Policarpa', 'CO', 52),
(677, 'Polonuevo', 'CO', 8),
(678, 'Ponedera', 'CO', 8),
(679, 'Popayán', 'CO', 19),
(680, 'Pore', 'CO', 85),
(681, 'Potosí', 'CO', 52),
(682, 'Pradera', 'CO', 76),
(683, 'Prado', 'CO', 73),
(684, 'Providencia', 'CO', 52),
(685, 'Providencia', 'CO', 88),
(686, 'Pueblo Bello', 'CO', 20),
(687, 'Pueblo Nuevo', 'CO', 23),
(688, 'Pueblo Rico', 'CO', 66),
(689, 'Pueblorrico', 'CO', 5),
(690, 'Puebloviejo', 'CO', 47),
(691, 'Puente Nacional', 'CO', 68),
(692, 'Puerres', 'CO', 52),
(693, 'Puerto Asís', 'CO', 86),
(694, 'Puerto Berrío', 'CO', 5),
(695, 'Puerto Boyacá', 'CO', 15),
(696, 'Puerto Caicedo', 'CO', 86),
(697, 'Puerto Carreño', 'CO', 99),
(698, 'Puerto Colombia', 'CO', 8),
(699, 'Puerto Concordia', 'CO', 50),
(700, 'Puerto Escondido', 'CO', 23),
(701, 'Puerto Gaitán', 'CO', 50),
(702, 'Puerto Guzmán', 'CO', 86),
(703, 'Puerto Leguízamo', 'CO', 86),
(704, 'Puerto Libertador', 'CO', 23),
(705, 'Puerto Lleras', 'CO', 50),
(706, 'Puerto López', 'CO', 50),
(707, 'Puerto Nare', 'CO', 5),
(708, 'Puerto Nariño', 'CO', 91),
(709, 'Puerto Parra', 'CO', 68),
(710, 'Puerto Rico', 'CO', 18),
(711, 'Puerto Rico', 'CO', 50),
(712, 'Puerto Rondón', 'CO', 81),
(713, 'Puerto Salgar', 'CO', 25),
(714, 'Puerto Santander', 'CO', 54),
(715, 'Puerto Tejada', 'CO', 19),
(716, 'Puerto Triunfo', 'CO', 5),
(717, 'Puerto Wilches', 'CO', 68),
(718, 'Pulí', 'CO', 25),
(719, 'Pupiales', 'CO', 52),
(720, 'Puracé (Coconuco)', 'CO', 19),
(721, 'Purificación', 'CO', 73),
(722, 'Purísima', 'CO', 23),
(723, 'Pácora', 'CO', 17),
(724, 'Páez', 'CO', 15),
(725, 'Páez (Belalcazar)', 'CO', 19),
(726, 'Páramo', 'CO', 68),
(727, 'Quebradanegra', 'CO', 25),
(728, 'Quetame', 'CO', 25),
(729, 'Quibdó', 'CO', 27),
(730, 'Quimbaya', 'CO', 63),
(731, 'Quinchía', 'CO', 66),
(732, 'Quipama', 'CO', 15),
(733, 'Quipile', 'CO', 25),
(734, 'Ragonvalia', 'CO', 54),
(735, 'Ramiriquí', 'CO', 15),
(736, 'Recetor', 'CO', 85),
(737, 'Regidor', 'CO', 13),
(738, 'Remedios', 'CO', 5),
(739, 'Remolino', 'CO', 47),
(740, 'Repelón', 'CO', 8),
(741, 'Restrepo', 'CO', 50),
(742, 'Restrepo', 'CO', 76),
(743, 'Retiro', 'CO', 5),
(744, 'Ricaurte', 'CO', 25),
(745, 'Ricaurte', 'CO', 52),
(746, 'Rio Negro', 'CO', 68),
(747, 'Rioblanco', 'CO', 73),
(748, 'Riofrío', 'CO', 76),
(749, 'Riohacha', 'CO', 44),
(750, 'Risaralda', 'CO', 17),
(751, 'Rivera', 'CO', 41),
(752, 'Roberto Payán (San José)', 'CO', 52),
(753, 'Roldanillo', 'CO', 76),
(754, 'Roncesvalles', 'CO', 73),
(755, 'Rondón', 'CO', 15),
(756, 'Rosas', 'CO', 19),
(757, 'Rovira', 'CO', 73),
(758, 'Ráquira', 'CO', 15),
(759, 'Río Iró', 'CO', 27),
(760, 'Río Quito', 'CO', 27),
(761, 'Río Sucio', 'CO', 17),
(762, 'Río Viejo', 'CO', 13),
(763, 'Río de oro', 'CO', 20),
(764, 'Ríonegro', 'CO', 5),
(765, 'Ríosucio', 'CO', 27),
(766, 'Sabana de Torres', 'CO', 68),
(767, 'Sabanagrande', 'CO', 8),
(768, 'Sabanalarga', 'CO', 5),
(769, 'Sabanalarga', 'CO', 8),
(770, 'Sabanalarga', 'CO', 85),
(771, 'Sabanas de San Angel (SAN ANGEL)', 'CO', 47),
(772, 'Sabaneta', 'CO', 5),
(773, 'Saboyá', 'CO', 15),
(774, 'Sahagún', 'CO', 23),
(775, 'Saladoblanco', 'CO', 41),
(776, 'Salamina', 'CO', 17),
(777, 'Salamina', 'CO', 47),
(778, 'Salazar', 'CO', 54),
(779, 'Saldaña', 'CO', 73),
(780, 'Salento', 'CO', 63),
(781, 'Salgar', 'CO', 5),
(782, 'Samacá', 'CO', 15),
(783, 'Samaniego', 'CO', 52),
(784, 'Samaná', 'CO', 17),
(785, 'Sampués', 'CO', 70),
(786, 'San Agustín', 'CO', 41),
(787, 'San Alberto', 'CO', 20),
(788, 'San Andrés', 'CO', 68),
(789, 'San Andrés Sotavento', 'CO', 23),
(790, 'San Andrés de Cuerquía', 'CO', 5),
(791, 'San Antero', 'CO', 23),
(792, 'San Antonio', 'CO', 73),
(793, 'San Antonio de Tequendama', 'CO', 25),
(794, 'San Benito', 'CO', 68),
(795, 'San Benito Abad', 'CO', 70),
(796, 'San Bernardo', 'CO', 25),
(797, 'San Bernardo', 'CO', 52),
(798, 'San Bernardo del Viento', 'CO', 23),
(799, 'San Calixto', 'CO', 54),
(800, 'San Carlos', 'CO', 5),
(801, 'San Carlos', 'CO', 23),
(802, 'San Carlos de Guaroa', 'CO', 50),
(803, 'San Cayetano', 'CO', 25),
(804, 'San Cayetano', 'CO', 54),
(805, 'San Cristobal', 'CO', 13),
(806, 'San Diego', 'CO', 20),
(807, 'San Eduardo', 'CO', 15),
(808, 'San Estanislao', 'CO', 13),
(809, 'San Fernando', 'CO', 13),
(810, 'San Francisco', 'CO', 5),
(811, 'San Francisco', 'CO', 25),
(812, 'San Francisco', 'CO', 86),
(813, 'San Gíl', 'CO', 68),
(814, 'San Jacinto', 'CO', 13),
(815, 'San Jacinto del Cauca', 'CO', 13),
(816, 'San Jerónimo', 'CO', 5),
(817, 'San Joaquín', 'CO', 68),
(818, 'San José', 'CO', 17),
(819, 'San José de Miranda', 'CO', 68),
(820, 'San José de Montaña', 'CO', 5),
(821, 'San José de Pare', 'CO', 15),
(822, 'San José de Uré', 'CO', 23),
(823, 'San José del Fragua', 'CO', 18),
(824, 'San José del Guaviare', 'CO', 95),
(825, 'San José del Palmar', 'CO', 27),
(826, 'San Juan de Arama', 'CO', 50),
(827, 'San Juan de Betulia', 'CO', 70),
(828, 'San Juan de Nepomuceno', 'CO', 13),
(829, 'San Juan de Pasto', 'CO', 52),
(830, 'San Juan de Río Seco', 'CO', 25),
(831, 'San Juan de Urabá', 'CO', 5),
(832, 'San Juan del Cesar', 'CO', 44),
(833, 'San Juanito', 'CO', 50),
(834, 'San Lorenzo', 'CO', 52),
(835, 'San Luis', 'CO', 73),
(836, 'San Luís', 'CO', 5),
(837, 'San Luís de Gaceno', 'CO', 15),
(838, 'San Luís de Palenque', 'CO', 85),
(839, 'San Marcos', 'CO', 70),
(840, 'San Martín', 'CO', 20),
(841, 'San Martín', 'CO', 50),
(842, 'San Martín de Loba', 'CO', 13),
(843, 'San Mateo', 'CO', 15),
(844, 'San Miguel', 'CO', 68),
(845, 'San Miguel', 'CO', 86),
(846, 'San Miguel de Sema', 'CO', 15),
(847, 'San Onofre', 'CO', 70),
(848, 'San Pablo', 'CO', 13),
(849, 'San Pablo', 'CO', 52),
(850, 'San Pablo de Borbur', 'CO', 15),
(851, 'San Pedro', 'CO', 5),
(852, 'San Pedro', 'CO', 70),
(853, 'San Pedro', 'CO', 76),
(854, 'San Pedro de Cartago', 'CO', 52),
(855, 'San Pedro de Urabá', 'CO', 5),
(856, 'San Pelayo', 'CO', 23),
(857, 'San Rafael', 'CO', 5),
(858, 'San Roque', 'CO', 5),
(859, 'San Sebastián', 'CO', 19),
(860, 'San Sebastián de Buenavista', 'CO', 47),
(861, 'San Vicente', 'CO', 5),
(862, 'San Vicente del Caguán', 'CO', 18),
(863, 'San Vicente del Chucurí', 'CO', 68),
(864, 'San Zenón', 'CO', 47),
(865, 'Sandoná', 'CO', 52),
(866, 'Santa Ana', 'CO', 47),
(867, 'Santa Bárbara', 'CO', 5),
(868, 'Santa Bárbara', 'CO', 68),
(869, 'Santa Bárbara (Iscuandé)', 'CO', 52),
(870, 'Santa Bárbara de Pinto', 'CO', 47),
(871, 'Santa Catalina', 'CO', 13),
(872, 'Santa Fé de Antioquia', 'CO', 5),
(873, 'Santa Genoveva de Docorodó', 'CO', 27),
(874, 'Santa Helena del Opón', 'CO', 68),
(875, 'Santa Isabel', 'CO', 73),
(876, 'Santa Lucía', 'CO', 8),
(877, 'Santa Marta', 'CO', 47),
(878, 'Santa María', 'CO', 15),
(879, 'Santa María', 'CO', 41),
(880, 'Santa Rosa', 'CO', 13),
(881, 'Santa Rosa', 'CO', 19),
(882, 'Santa Rosa de Cabal', 'CO', 66),
(883, 'Santa Rosa de Osos', 'CO', 5),
(884, 'Santa Rosa de Viterbo', 'CO', 15),
(885, 'Santa Rosa del Sur', 'CO', 13),
(886, 'Santa Rosalía', 'CO', 99),
(887, 'Santa Sofía', 'CO', 15),
(888, 'Santana', 'CO', 15),
(889, 'Santander de Quilichao', 'CO', 19),
(890, 'Santiago', 'CO', 54),
(891, 'Santiago', 'CO', 86),
(892, 'Santo Domingo', 'CO', 5),
(893, 'Santo Tomás', 'CO', 8),
(894, 'Santuario', 'CO', 5),
(895, 'Santuario', 'CO', 66),
(896, 'Sapuyes', 'CO', 52),
(897, 'Saravena', 'CO', 81),
(898, 'Sardinata', 'CO', 54),
(899, 'Sasaima', 'CO', 25),
(900, 'Sativanorte', 'CO', 15),
(901, 'Sativasur', 'CO', 15),
(902, 'Segovia', 'CO', 5),
(903, 'Sesquilé', 'CO', 25),
(904, 'Sevilla', 'CO', 76),
(905, 'Siachoque', 'CO', 15),
(906, 'Sibaté', 'CO', 25),
(907, 'Sibundoy', 'CO', 86),
(908, 'Silos', 'CO', 54),
(909, 'Silvania', 'CO', 25),
(910, 'Silvia', 'CO', 19),
(911, 'Simacota', 'CO', 68),
(912, 'Simijaca', 'CO', 25),
(913, 'Simití', 'CO', 13),
(914, 'Sincelejo', 'CO', 70),
(915, 'Sincé', 'CO', 70),
(916, 'Sipí', 'CO', 27),
(917, 'Sitionuevo', 'CO', 47),
(918, 'Soacha', 'CO', 25),
(919, 'Soatá', 'CO', 15),
(920, 'Socha', 'CO', 15),
(921, 'Socorro', 'CO', 68),
(922, 'Socotá', 'CO', 15),
(923, 'Sogamoso', 'CO', 15),
(924, 'Solano', 'CO', 18),
(925, 'Soledad', 'CO', 8),
(926, 'Solita', 'CO', 18),
(927, 'Somondoco', 'CO', 15),
(928, 'Sonsón', 'CO', 5),
(929, 'Sopetrán', 'CO', 5),
(930, 'Soplaviento', 'CO', 13),
(931, 'Sopó', 'CO', 25),
(932, 'Sora', 'CO', 15),
(933, 'Soracá', 'CO', 15),
(934, 'Sotaquirá', 'CO', 15),
(935, 'Sotara (Paispamba)', 'CO', 19),
(936, 'Sotomayor (Los Andes)', 'CO', 52),
(937, 'Suaita', 'CO', 68),
(938, 'Suan', 'CO', 8),
(939, 'Suaza', 'CO', 41),
(940, 'Subachoque', 'CO', 25),
(941, 'Sucre', 'CO', 19),
(942, 'Sucre', 'CO', 68),
(943, 'Sucre', 'CO', 70),
(944, 'Suesca', 'CO', 25),
(945, 'Supatá', 'CO', 25),
(946, 'Supía', 'CO', 17),
(947, 'Suratá', 'CO', 68),
(948, 'Susa', 'CO', 25),
(949, 'Susacón', 'CO', 15),
(950, 'Sutamarchán', 'CO', 15),
(951, 'Sutatausa', 'CO', 25),
(952, 'Sutatenza', 'CO', 15),
(953, 'Suárez', 'CO', 19),
(954, 'Suárez', 'CO', 73),
(955, 'Sácama', 'CO', 85),
(956, 'Sáchica', 'CO', 15),
(957, 'Tabio', 'CO', 25),
(958, 'Tadó', 'CO', 27),
(959, 'Talaigua Nuevo', 'CO', 13),
(960, 'Tamalameque', 'CO', 20),
(961, 'Tame', 'CO', 81),
(962, 'Taminango', 'CO', 52),
(963, 'Tangua', 'CO', 52),
(964, 'Taraira', 'CO', 97),
(965, 'Tarazá', 'CO', 5),
(966, 'Tarqui', 'CO', 41),
(967, 'Tarso', 'CO', 5),
(968, 'Tasco', 'CO', 15),
(969, 'Tauramena', 'CO', 85),
(970, 'Tausa', 'CO', 25),
(971, 'Tello', 'CO', 41),
(972, 'Tena', 'CO', 25),
(973, 'Tenerife', 'CO', 47),
(974, 'Tenjo', 'CO', 25),
(975, 'Tenza', 'CO', 15),
(976, 'Teorama', 'CO', 54),
(977, 'Teruel', 'CO', 41),
(978, 'Tesalia', 'CO', 41),
(979, 'Tibacuy', 'CO', 25),
(980, 'Tibaná', 'CO', 15),
(981, 'Tibasosa', 'CO', 15),
(982, 'Tibirita', 'CO', 25),
(983, 'Tibú', 'CO', 54),
(984, 'Tierralta', 'CO', 23),
(985, 'Timaná', 'CO', 41),
(986, 'Timbiquí', 'CO', 19),
(987, 'Timbío', 'CO', 19),
(988, 'Tinjacá', 'CO', 15),
(989, 'Tipacoque', 'CO', 15),
(990, 'Tiquisio (Puerto Rico)', 'CO', 13),
(991, 'Titiribí', 'CO', 5),
(992, 'Toca', 'CO', 15),
(993, 'Tocaima', 'CO', 25),
(994, 'Tocancipá', 'CO', 25),
(995, 'Toguí', 'CO', 15),
(996, 'Toledo', 'CO', 5),
(997, 'Toledo', 'CO', 54),
(998, 'Tolú', 'CO', 70),
(999, 'Tolú Viejo', 'CO', 70),
(1000, 'Tona', 'CO', 68),
(1001, 'Topagá', 'CO', 15),
(1002, 'Topaipí', 'CO', 25),
(1003, 'Toribío', 'CO', 19),
(1004, 'Toro', 'CO', 76),
(1005, 'Tota', 'CO', 15),
(1006, 'Totoró', 'CO', 19),
(1007, 'Trinidad', 'CO', 85),
(1008, 'Trujillo', 'CO', 76),
(1009, 'Tubará', 'CO', 8),
(1010, 'Tuchín', 'CO', 23),
(1011, 'Tulúa', 'CO', 76),
(1012, 'Tumaco', 'CO', 52),
(1013, 'Tunja', 'CO', 15),
(1014, 'Tunungua', 'CO', 15),
(1015, 'Turbaco', 'CO', 13),
(1016, 'Turbaná', 'CO', 13),
(1017, 'Turbo', 'CO', 5),
(1018, 'Turmequé', 'CO', 15),
(1019, 'Tuta', 'CO', 15),
(1020, 'Tutasá', 'CO', 15),
(1021, 'Támara', 'CO', 85),
(1022, 'Támesis', 'CO', 5),
(1023, 'Túquerres', 'CO', 52),
(1024, 'Ubalá', 'CO', 25),
(1025, 'Ubaque', 'CO', 25),
(1026, 'Ubaté', 'CO', 25),
(1027, 'Ulloa', 'CO', 76),
(1028, 'Une', 'CO', 25),
(1029, 'Unguía', 'CO', 27),
(1030, 'Unión Panamericana (ÁNIMAS)', 'CO', 27),
(1031, 'Uramita', 'CO', 5),
(1032, 'Uribe', 'CO', 50),
(1033, 'Uribia', 'CO', 44),
(1034, 'Urrao', 'CO', 5),
(1035, 'Urumita', 'CO', 44),
(1036, 'Usiacuri', 'CO', 8),
(1037, 'Valdivia', 'CO', 5),
(1038, 'Valencia', 'CO', 23),
(1039, 'Valle de San José', 'CO', 68),
(1040, 'Valle de San Juan', 'CO', 73),
(1041, 'Valle del Guamuez', 'CO', 86),
(1042, 'Valledupar', 'CO', 20),
(1043, 'Valparaiso', 'CO', 5),
(1044, 'Valparaiso', 'CO', 18),
(1045, 'Vegachí', 'CO', 5),
(1046, 'Venadillo', 'CO', 73),
(1047, 'Venecia', 'CO', 5),
(1048, 'Venecia (Ospina Pérez)', 'CO', 25),
(1049, 'Ventaquemada', 'CO', 15),
(1050, 'Vergara', 'CO', 25),
(1051, 'Versalles', 'CO', 76),
(1052, 'Vetas', 'CO', 68),
(1053, 'Viani', 'CO', 25),
(1054, 'Vigía del Fuerte', 'CO', 5),
(1055, 'Vijes', 'CO', 76),
(1056, 'Villa Caro', 'CO', 54),
(1057, 'Villa Rica', 'CO', 19),
(1058, 'Villa de Leiva', 'CO', 15),
(1059, 'Villa del Rosario', 'CO', 54),
(1060, 'Villagarzón', 'CO', 86),
(1061, 'Villagómez', 'CO', 25),
(1062, 'Villahermosa', 'CO', 73),
(1063, 'Villamaría', 'CO', 17),
(1064, 'Villanueva', 'CO', 13),
(1065, 'Villanueva', 'CO', 44),
(1066, 'Villanueva', 'CO', 68),
(1067, 'Villanueva', 'CO', 85),
(1068, 'Villapinzón', 'CO', 25),
(1069, 'Villarrica', 'CO', 73),
(1070, 'Villavicencio', 'CO', 50),
(1071, 'Villavieja', 'CO', 41),
(1072, 'Villeta', 'CO', 25),
(1073, 'Viotá', 'CO', 25),
(1074, 'Viracachá', 'CO', 15),
(1075, 'Vista Hermosa', 'CO', 50),
(1076, 'Viterbo', 'CO', 17),
(1077, 'Vélez', 'CO', 68),
(1078, 'Yacopí', 'CO', 25),
(1079, 'Yacuanquer', 'CO', 52),
(1080, 'Yaguará', 'CO', 41),
(1081, 'Yalí', 'CO', 5),
(1082, 'Yarumal', 'CO', 5),
(1083, 'Yolombó', 'CO', 5),
(1084, 'Yondó (Casabe)', 'CO', 5),
(1085, 'Yopal', 'CO', 85),
(1086, 'Yotoco', 'CO', 76),
(1087, 'Yumbo', 'CO', 76),
(1088, 'Zambrano', 'CO', 13),
(1089, 'Zapatoca', 'CO', 68),
(1090, 'Zapayán (PUNTA DE PIEDRAS)', 'CO', 47),
(1091, 'Zaragoza', 'CO', 5),
(1092, 'Zarzal', 'CO', 76),
(1093, 'Zetaquirá', 'CO', 15),
(1094, 'Zipacón', 'CO', 25),
(1095, 'Zipaquirá', 'CO', 25),
(1096, 'Zona Bananera (PRADO - SEVILLA)', 'CO', 47),
(1097, 'Ábrego', 'CO', 54),
(1098, 'Íquira', 'CO', 41),
(1099, 'Úmbita', 'CO', 15),
(1100, 'Útica', 'CO', 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `st_countries`
--

CREATE TABLE `st_countries` (
  `id` int(11) NOT NULL,
  `iso` char(2) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `st_countries`
--

INSERT INTO `st_countries` (`id`, `iso`, `nombre`) VALUES
(1, 'AF', 'Afganistán'),
(2, 'AX', 'Islas Gland'),
(3, 'AL', 'Albania'),
(4, 'DE', 'Alemania'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antártida'),
(9, 'AG', 'Antigua y Barbuda'),
(10, 'AN', 'Antillas Holandesas'),
(11, 'SA', 'Arabia Saudí'),
(12, 'DZ', 'Argelia'),
(13, 'AR', 'Argentina'),
(14, 'AM', 'Armenia'),
(15, 'AW', 'Aruba'),
(16, 'AU', 'Australia'),
(17, 'AT', 'Austria'),
(18, 'AZ', 'Azerbaiyán'),
(19, 'BS', 'Bahamas'),
(20, 'BH', 'Bahréin'),
(21, 'BD', 'Bangladesh'),
(22, 'BB', 'Barbados'),
(23, 'BY', 'Bielorrusia'),
(24, 'BE', 'Bélgica'),
(25, 'BZ', 'Belice'),
(26, 'BJ', 'Benin'),
(27, 'BM', 'Bermudas'),
(28, 'BT', 'Bhután'),
(29, 'BO', 'Bolivia'),
(30, 'BA', 'Bosnia y Herzegovina'),
(31, 'BW', 'Botsuana'),
(32, 'BV', 'Isla Bouvet'),
(33, 'BR', 'Brasil'),
(34, 'BN', 'Brunéi'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'CV', 'Cabo Verde'),
(39, 'KY', 'Islas Caimán'),
(40, 'KH', 'Camboya'),
(41, 'CM', 'Camerún'),
(42, 'CA', 'Canadá'),
(43, 'CF', 'República Centroafricana'),
(44, 'TD', 'Chad'),
(45, 'CZ', 'República Checa'),
(46, 'CL', 'Chile'),
(47, 'CN', 'China'),
(48, 'CY', 'Chipre'),
(49, 'CX', 'Isla de Navidad'),
(50, 'VA', 'Ciudad del Vaticano'),
(51, 'CC', 'Islas Cocos'),
(52, 'CO', 'Colombia'),
(53, 'KM', 'Comoras'),
(54, 'CD', 'República Democrática del Congo'),
(55, 'CG', 'Congo'),
(56, 'CK', 'Islas Cook'),
(57, 'KP', 'Corea del Norte'),
(58, 'KR', 'Corea del Sur'),
(59, 'CI', 'Costa de Marfil'),
(60, 'CR', 'Costa Rica'),
(61, 'HR', 'Croacia'),
(62, 'CU', 'Cuba'),
(63, 'DK', 'Dinamarca'),
(64, 'DM', 'Dominica'),
(65, 'DO', 'República Dominicana'),
(66, 'EC', 'Ecuador'),
(67, 'EG', 'Egipto'),
(68, 'SV', 'El Salvador'),
(69, 'AE', 'Emiratos Árabes Unidos'),
(70, 'ER', 'Eritrea'),
(71, 'SK', 'Eslovaquia'),
(72, 'SI', 'Eslovenia'),
(73, 'ES', 'España'),
(74, 'UM', 'Islas ultramarinas de Estados Unidos'),
(75, 'US', 'Estados Unidos'),
(76, 'EE', 'Estonia'),
(77, 'ET', 'Etiopía'),
(78, 'FO', 'Islas Feroe'),
(79, 'PH', 'Filipinas'),
(80, 'FI', 'Finlandia'),
(81, 'FJ', 'Fiyi'),
(82, 'FR', 'Francia'),
(83, 'GA', 'Gabón'),
(84, 'GM', 'Gambia'),
(85, 'GE', 'Georgia'),
(86, 'GS', 'Islas Georgias del Sur y Sandwich del Sur'),
(87, 'GH', 'Ghana'),
(88, 'GI', 'Gibraltar'),
(89, 'GD', 'Granada'),
(90, 'GR', 'Grecia'),
(91, 'GL', 'Groenlandia'),
(92, 'GP', 'Guadalupe'),
(93, 'GU', 'Guam'),
(94, 'GT', 'Guatemala'),
(95, 'GF', 'Guayana Francesa'),
(96, 'GN', 'Guinea'),
(97, 'GQ', 'Guinea Ecuatorial'),
(98, 'GW', 'Guinea-Bissau'),
(99, 'GY', 'Guyana'),
(100, 'HT', 'Haití'),
(101, 'HM', 'Islas Heard y McDonald'),
(102, 'HN', 'Honduras'),
(103, 'HK', 'Hong Kong'),
(104, 'HU', 'Hungría'),
(105, 'IN', 'India'),
(106, 'ID', 'Indonesia'),
(107, 'IR', 'Irán'),
(108, 'IQ', 'Iraq'),
(109, 'IE', 'Irlanda'),
(110, 'IS', 'Islandia'),
(111, 'IL', 'Israel'),
(112, 'IT', 'Italia'),
(113, 'JM', 'Jamaica'),
(114, 'JP', 'Japón'),
(115, 'JO', 'Jordania'),
(116, 'KZ', 'Kazajstán'),
(117, 'KE', 'Kenia'),
(118, 'KG', 'Kirguistán'),
(119, 'KI', 'Kiribati'),
(120, 'KW', 'Kuwait'),
(121, 'LA', 'Laos'),
(122, 'LS', 'Lesotho'),
(123, 'LV', 'Letonia'),
(124, 'LB', 'Líbano'),
(125, 'LR', 'Liberia'),
(126, 'LY', 'Libia'),
(127, 'LI', 'Liechtenstein'),
(128, 'LT', 'Lituania'),
(129, 'LU', 'Luxemburgo'),
(130, 'MO', 'Macao'),
(131, 'MK', 'ARY Macedonia'),
(132, 'MG', 'Madagascar'),
(133, 'MY', 'Malasia'),
(134, 'MW', 'Malawi'),
(135, 'MV', 'Maldivas'),
(136, 'ML', 'Malí'),
(137, 'MT', 'Malta'),
(138, 'FK', 'Islas Malvinas'),
(139, 'MP', 'Islas Marianas del Norte'),
(140, 'MA', 'Marruecos'),
(141, 'MH', 'Islas Marshall'),
(142, 'MQ', 'Martinica'),
(143, 'MU', 'Mauricio'),
(144, 'MR', 'Mauritania'),
(145, 'YT', 'Mayotte'),
(146, 'MX', 'México'),
(147, 'FM', 'Micronesia'),
(148, 'MD', 'Moldavia'),
(149, 'MC', 'Mónaco'),
(150, 'MN', 'Mongolia'),
(151, 'MS', 'Montserrat'),
(152, 'MZ', 'Mozambique'),
(153, 'MM', 'Myanmar'),
(154, 'NA', 'Namibia'),
(155, 'NR', 'Nauru'),
(156, 'NP', 'Nepal'),
(157, 'NI', 'Nicaragua'),
(158, 'NE', 'Níger'),
(159, 'NG', 'Nigeria'),
(160, 'NU', 'Niue'),
(161, 'NF', 'Isla Norfolk'),
(162, 'NO', 'Noruega'),
(163, 'NC', 'Nueva Caledonia'),
(164, 'NZ', 'Nueva Zelanda'),
(165, 'OM', 'Omán'),
(166, 'NL', 'Países Bajos'),
(167, 'PK', 'Pakistán'),
(168, 'PW', 'Palau'),
(169, 'PS', 'Palestina'),
(170, 'PA', 'Panamá'),
(171, 'PG', 'Papúa Nueva Guinea'),
(172, 'PY', 'Paraguay'),
(173, 'PE', 'Perú'),
(174, 'PN', 'Islas Pitcairn'),
(175, 'PF', 'Polinesia Francesa'),
(176, 'PL', 'Polonia'),
(177, 'PT', 'Portugal'),
(178, 'PR', 'Puerto Rico'),
(179, 'QA', 'Qatar'),
(180, 'GB', 'Reino Unido'),
(181, 'RE', 'Reunión'),
(182, 'RW', 'Ruanda'),
(183, 'RO', 'Rumania'),
(184, 'RU', 'Rusia'),
(185, 'EH', 'Sahara Occidental'),
(186, 'SB', 'Islas Salomón'),
(187, 'WS', 'Samoa'),
(188, 'AS', 'Samoa Americana'),
(189, 'KN', 'San Cristóbal y Nevis'),
(190, 'SM', 'San Marino'),
(191, 'PM', 'San Pedro y Miquelón'),
(192, 'VC', 'San Vicente y las Granadinas'),
(193, 'SH', 'Santa Helena'),
(194, 'LC', 'Santa Lucía'),
(195, 'ST', 'Santo Tomé y Príncipe'),
(196, 'SN', 'Senegal'),
(197, 'CS', 'Serbia y Montenegro'),
(198, 'SC', 'Seychelles'),
(199, 'SL', 'Sierra Leona'),
(200, 'SG', 'Singapur'),
(201, 'SY', 'Siria'),
(202, 'SO', 'Somalia'),
(203, 'LK', 'Sri Lanka'),
(204, 'SZ', 'Suazilandia'),
(205, 'ZA', 'Sudáfrica'),
(206, 'SD', 'Sudán'),
(207, 'SE', 'Suecia'),
(208, 'CH', 'Suiza'),
(209, 'SR', 'Surinam'),
(210, 'SJ', 'Svalbard y Jan Mayen'),
(211, 'TH', 'Tailandia'),
(212, 'TW', 'Taiwán'),
(213, 'TZ', 'Tanzania'),
(214, 'TJ', 'Tayikistán'),
(215, 'IO', 'Territorio Británico del Océano Índico'),
(216, 'TF', 'Territorios Australes Franceses'),
(217, 'TL', 'Timor Oriental'),
(218, 'TG', 'Togo'),
(219, 'TK', 'Tokelau'),
(220, 'TO', 'Tonga'),
(221, 'TT', 'Trinidad y Tobago'),
(222, 'TN', 'Túnez'),
(223, 'TC', 'Islas Turcas y Caicos'),
(224, 'TM', 'Turkmenistán'),
(225, 'TR', 'Turquía'),
(226, 'TV', 'Tuvalu'),
(227, 'UA', 'Ucrania'),
(228, 'UG', 'Uganda'),
(229, 'UY', 'Uruguay'),
(230, 'UZ', 'Uzbekistán'),
(231, 'VU', 'Vanuatu'),
(232, 'VE', 'Venezuela'),
(233, 'VN', 'Vietnam'),
(234, 'VG', 'Islas Vírgenes Británicas'),
(235, 'VI', 'Islas Vírgenes de los Estados Unidos'),
(236, 'WF', 'Wallis y Futuna'),
(237, 'YE', 'Yemen'),
(238, 'DJ', 'Yibuti'),
(239, 'ZM', 'Zambia'),
(240, 'ZW', 'Zimbabue');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `st_multidata`
--

CREATE TABLE `st_multidata` (
  `id` int(12) NOT NULL,
  `Initials_PK` varchar(10) NOT NULL,
  `names` varchar(100) NOT NULL,
  `region` varchar(40) NOT NULL,
  `type` varchar(30) NOT NULL,
  `country_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `st_multidata`
--

INSERT INTO `st_multidata` (`id`, `Initials_PK`, `names`, `region`, `type`, `country_id`) VALUES
(1, 'CC', 'CEDULA DE CIUDADANIA', 'Nacional', 'DNI_type', 'CO'),
(2, 'CE', 'CEDULA DE EXTRANJERIA', 'Nacional', 'DNI_type', 'CO'),
(3, 'NIP', 'NUMERO DE IDENTIFICACION PERSONAL', 'Nacional', 'DNI_type', 'CO'),
(4, 'NIT', 'NUMERO DE IDENTIFICACION TRIBUTARIA', 'Nacional', 'DNI_type', 'CO'),
(5, 'TI', 'TARJETA DE IDENTIDAD', 'Nacional', 'DNI_type', 'CO'),
(6, 'PAP', 'PASAPORTE', 'Nacional', 'DNI_type', 'CO'),
(7, 'PEP', 'PERMISO ESPECIAL PERMEMANENCIA', 'Nacional', 'DNI_type', 'CO'),
(8, 'H', 'Hombre', 'Nacional', 'gender', 'CO'),
(9, 'M', 'Mujer', 'Nacional', 'gender', 'CO'),
(10, 'O', 'otro', 'Nacional', 'gender', 'CO'),
(11, 'FMS', 'Famisanar', 'Nacional', 'EPS', 'CO'),
(12, 'CLS', 'Colsanitas', 'Nacional', 'EPS', 'CO'),
(13, 'SNT', 'Sanitas EPS', 'Nacional', 'EPS', 'CO'),
(14, 'CMV', 'Coomeva EPS', 'Nacional', 'EPS', 'CO'),
(15, 'NEPS', 'Nueva EPS', 'Nacional', 'EPS', 'CO'),
(16, 'MDM', 'Medimas EPS', 'Nacional', 'EPS', 'CO'),
(17, 'CSLD', 'Capital Salud EPS', 'Nacional', 'EPS', 'CO'),
(18, 'SBLV', 'Seguros Bolívar', 'Nacional', 'ARL', 'CO'),
(19, 'SURA', 'Sura', 'Nacional', 'ARL', 'CO'),
(20, 'SPST', 'Seguros Positiva', 'Nacional', 'ARL', 'CO'),
(21, 'SCPT', 'Seguros Colpatria', 'Nacional', 'ARL', 'CO'),
(22, 'ACLM', 'ARL Colmena', 'Nacional', 'ARL', 'CO'),
(23, 'CNFN', 'Confenalco', 'nacional', 'CCF', 'CO'),
(24, 'CFRN', 'Cofren', 'Meta', 'CCF', 'CO'),
(25, 'CLSD', 'Colsubsidio', 'nacional', 'CCF', 'CO'),
(26, 'CFM', 'Cafam', 'nacional', 'CCF', 'CO'),
(27, 'CFML', 'Confamiliar', 'nacional', 'CCF', 'CO'),
(28, 'CFDS', 'Colfondos', 'Meta', 'FPO', 'CO'),
(29, 'CPSN', 'Colpresiones', 'nacional', 'FPO', 'CO'),
(30, 'PRVN', 'Porvenir', 'nacional', 'FPO', 'CO'),
(31, 'PRTC', 'Proteccion', 'nacional', 'FPO', 'CO'),
(32, 'SKND', 'Skandia', 'nacional', 'FPO', 'CO'),
(35, 'SA', 'Sociedad Anonima', 'Nacional', 'legal_form', 'CO'),
(36, 'SAS', 'Sociedad de Acciones Simplificada', 'Nacional', 'legal_form', 'CO'),
(42, 'SC', 'Sociedad Colectiva', 'Nacional', 'legal_form', 'CO'),
(43, 'SCA', 'Sociedad en Comandita por Acciones', 'Nacional', 'legal_form', 'CO'),
(44, 'SCS', 'Sociedad en Comandita Simple', 'Nacional', 'legal_form', 'CO'),
(45, 'CBM', 'Servicio de Monitoreo', 'Nacional', 'ServiceTypeContract', 'CO'),
(46, 'TS', 'Soporte Tecnico Tickets', 'Nacional', 'ServiceTypeContract', 'CO'),
(47, 'DOC', 'Documentacion Online', 'Nacional', 'ServiceTypeContract', 'CO'),
(48, 'CNY', 'Conyuge', 'Nacional', 'family', 'CO'),
(49, 'HIJO', 'Hijos', 'Nacional', 'family', 'CO'),
(50, 'PDR', 'Padres', 'Nacional', 'family', 'CO'),
(51, 'HRM', 'Hermanos', 'Nacional', 'family', 'CO'),
(52, 'TIO', 'Tios', 'Nacional', 'family', 'CO'),
(53, 'ABU', 'Abuelos', 'Nacional', 'family', 'CO'),
(54, 'CND', 'Cuñados', 'Nacional', 'family', 'CO'),
(55, 'AMG', 'Amigos', 'Nacional', 'family', 'CO'),
(56, 'OP', 'O+', 'Nacional', 'RH', 'CO'),
(57, 'RH', 'A+', 'Nacional', 'RH', 'CO'),
(58, 'GB', 'B+', 'Nacional', 'RH', 'CO'),
(59, 'GAB', 'AB+', 'Nacional', 'RH', 'CO'),
(60, 'GAA', 'A-', 'Nacional', 'RH', 'CO'),
(61, 'GOO', 'O-', 'Nacional', 'RH', 'CO'),
(62, 'GBB', 'B-', 'Nacional', 'RH', 'CO'),
(63, 'GABB', 'AB-', 'Nacional', 'RH', 'CO'),
(64, 'SOLTER@', 'Solter@', 'Nacional', 'CivilState', 'CO'),
(65, 'CASAD@', 'Casad@', 'Nacional', 'CivilState', 'CO'),
(66, 'UNIONL', 'Union Libre', 'Nacional', 'CivilState', 'CO'),
(67, 'DIVORCIAD@', 'Divorciad@', 'Nacional', 'CivilState', 'CO'),
(68, 'VIUD@', 'Viud@', 'Nacional', 'CivilState', 'CO'),
(69, '1', '1', 'Nacional', 'Stratum', 'CO'),
(70, '2', '2', 'Nacional', 'Stratum', 'CO'),
(71, '3', '3', 'Nacional', 'Stratum', 'CO'),
(72, '4', '4', 'Nacional', 'Stratum', 'CO'),
(73, '5', '5', 'Nacional', 'Stratum', 'CO'),
(74, '6', '6', 'Nacional', 'Stratum', 'CO'),
(75, 'COL', 'Colfondos', 'Nacional', 'AFC', 'CO'),
(77, 'POR', 'Porvenir', 'Nacional', 'AFC', 'CO'),
(78, 'PRO', 'Proteccion', 'Nacional', 'AFC', 'CO'),
(79, 'SKA', 'Skandia', 'Nacional', 'AFC', 'CO'),
(80, 'FNA', 'Fondo Nacional del Ahorro', 'Nacional', 'AFC', 'CO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `st_states`
--

CREATE TABLE `st_states` (
  `id_state` int(2) UNSIGNED NOT NULL,
  `state` varchar(255) NOT NULL DEFAULT '',
  `iso_country` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `st_states`
--

INSERT INTO `st_states` (`id_state`, `state`, `iso_country`) VALUES
(5, 'ANTIOQUIA', 'CO'),
(8, 'ATLÁNTICO', 'CO'),
(11, 'Bogotá D.C.', 'CO'),
(13, 'BOLÍVAR', 'CO'),
(15, 'BOYACÁ', 'CO'),
(17, 'CALDAS', 'CO'),
(18, 'CAQUETÁ', 'CO'),
(19, 'CAUCA', 'CO'),
(20, 'CESAR', 'CO'),
(23, 'CÓRDOBA', 'CO'),
(25, 'CUNDINAMARCA', 'CO'),
(27, 'CHOCÓ', 'CO'),
(41, 'HUILA', 'CO'),
(44, 'LA GUAJIRA', 'CO'),
(47, 'MAGDALENA', 'CO'),
(50, 'META', 'CO'),
(52, 'NARIÑO', 'CO'),
(54, 'NORTE DE SANTANDER', 'CO'),
(63, 'QUINDIO', 'CO'),
(66, 'RISARALDA', 'CO'),
(68, 'SANTANDER', 'CO'),
(70, 'SUCRE', 'CO'),
(73, 'TOLIMA', 'CO'),
(76, 'VALLE DEL CAUCA', 'CO'),
(81, 'ARAUCA', 'CO'),
(85, 'CASANARE', 'CO'),
(86, 'PUTUMAYO', 'CO'),
(88, 'ARCHIPIÉLAGO DE SAN ANDRÉS, PROVIDENCIA Y SANTA CATALINA', 'CO'),
(91, 'AMAZONAS', 'CO'),
(94, 'GUAINÍA', 'CO'),
(95, 'GUAVIARE', 'CO'),
(97, 'VAUPÉS', 'CO'),
(99, 'VICHADA', 'CO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `IdUser_PK` varchar(20) NOT NULL,
  `UserEmail` varchar(100) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `UserLastName` varchar(50) NOT NULL,
  `IdCompany_FK` varchar(20) NOT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `userPermission` varchar(1200) NOT NULL,
  `maxRoll` varchar(1200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `Status` varchar(20) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`IdUser_PK`, `UserEmail`, `Password`, `UserName`, `UserLastName`, `IdCompany_FK`, `avatar`, `userPermission`, `maxRoll`, `Status`) VALUES
('1072747213', 'd.alvarado@rms.net.co', '$2a$10$l6sOP1D.vEpCafKudao2E.PIdDeGmt/gFncCyLHpSu7GYtd.x5jou', 'Didier', 'Alvarado', '812512275', '', 'U2FsdGVkX1+mK5uUU1E7Bcd3pX5mvLPi3n4X0zeDNAIGed1damjhtXb2S2hKhdesY3AWEo1hFMpt/APTrO+jAZf82J91Q1Kfrf3OM6xm1i+36QboQTdY/TeK6dRGw2sBzNpXTq/yiY0LSPIXe9AptNwq6iIMJ919NqLQZcRMWiTWAdsvTI3f6dtUoRVou8p9EYucS8Pp7PYWDyinwkrdNE2FNP+TfoAlizxFzgQXETPUVUvqKGgMG8wTSgFeWSsvJwGGnRn2zWDh2s3kglI6IlSSk0tg3lHHzY+osHQiPeqdCoUCszWT3AvUw3I9qTxDQkcP0TsOyT1czza+GWcy62NDtsH+5HTGE0ViM6I4vhCkhonkGH3jYXZ3tf4gJqMbpwLwAXqchtktAJHrElR78dIjwTAZKAKtfj4vLdKhh3tkGm4G/w6Wa8WiRjVJA52VfqS4t2lmOEZB6r/82VJIwIrmigy8lN1GWGVOJUl16bcH9ENVQrLQiRCS+T9b9VDLgKxq6mGOzBS9tsG5YsRq4Esu7BhqrjsBueHZw9+yu9FJZgsb2nBBvs9rKButCjnCNjf+uiA/QbiqMasBT39SdlIgx14D5/+O21ElphjOKy6QE2b6JxzXJmM+zVvFLz4tnzaAoCRoPW94I6RbeWiqfMIa1jBaotHzY5ZGKTJFks3T0/HBbUTHayUmpc3a3B/oEQWXLFutB4GjlCWCHgRSMENRf5AP0Y+JMF9wq/kMnodwQK8JWAIRKsC863pejW/59sZnkNATfgLx1G0ACrUTn48dXXRAKd/ox2uy/xZuL/petZhlSWKfiGwVA7e4V1+Vj+mDFEL/IkrUvW4YVmmnx7NiuUZYTTp3zYWh/oMDwetrOdXlVewnWxPPuml2il5wxxW/Tr+XOt8YNz7ctGkgSJt41V6U4y83HIc5tDtiomfJQ/OMv9kei2FPyInWr8H8Os32InWPE+kRcdKKCpBISSzM2tdvYc+OEsHAxSvuX/6MVl5oLaG3BnaBCpyvdMfys7ypYKh4lGi0ANhqXkEIDBUj+ibuRS0AntTuqWdjcT2ax1Uq99O0o9lTs8AcMQciSXQneWOb/AcONtfXF2TvAg==', 'U2FsdGVkX1+TNP8OVrj9Js7xxhW0ygLH9hYiUU5mJxRDZdqWAAsY1BMFv06XR7Zv', 'active'),
('1100975690', 'jenifertatianagalvis@gmail.com', '$2a$10$BRJJupotUINWFEfUc89BJOtPU8Dr0x3F0OPBsd6fd0/.p1DL3a4Gu', 'Jenifer', 'Castro', '812512275', 'women', 'U2FsdGVkX19rT/uOpFZSoZYa+MV9z3ssDRvDQnMFkJ/C/oiiP3RMKxE0QRIcKHGeSs2d9L0DrsWcAzUqYKDZsOjkj6UpRbvjhj5n+w0EvBCeBgeri/gcZFlNLWBgmmrcRHRy9j+FIBr9yMbhBbVITvmVQTU34LNpiqGCEuQsvrLnhQ43UGWNJBWbd9IbZi/JAVDBpQITTK964mniT6PVDks4aZOTQhq84yVKjCuAt+UGbmIaxdlkCjZpHOaQW3XVxWKQqkcKKSAbCFVqe9dRXYSV4HE27dOeNLPdumsH8fmQ+VZBdvsI788SlZz7jqBnKdpQ5IBOeaBI3ZL4Vfxz4OdoWEuYXHsSvj6n0VnqDFSXiidZ2rtXUQv+Ltvu3CZRJwK+sDxf/IkHgV62r0uW5BT6Smyx1REc292e/chYZacG2juwb4J2J8YYnZtpdB0iMlGyHQsJhXZqcgU4qm3BNeFSzfPy5FaaKXco4zwNlCfbQaCM33F3hz3+rHYZ6DVv7KI2TANSU3PU8r9bowL+o1w6/Bgk9+sU8w2Gme1iIebYfKGnDQUUS+xoDOOj3QMjpGnpWfy0R30Jw7Fy8EjuAh8uPx5NXwE7YT5/L3o69f+B4hcKBzBsDNnwOjKLy5q2m8zvmt4JI6O/MeCSUYEUTZOTA6DC6s9kR8rWdBe8slFuGyivXSXWlwPNlb9rfnhQfiSWaagd5XCZ0I7VF4+fQwrdEl7tDHX3SL2YV9qX1zlu8mNogLEEkzXeX5RPA1gAcmUVkvLBVJHOo3jEdlBnIZcajteUmnsqUTKodT3laYsslRxbCeCAul7PiKo1lbheScH2zg6qUkWLMEWoLUbXoJlryoQ7uhmWkteJhr9nbDYQa81rzUAItOEmHhbjjNNBTGDDAnun/7PmgR9N8amqQ5Xr3KZN/Qe+5qzdr3YN/FNN0QNDbHGnJywD76DcK1I4Ys5K3n2TYs3f5QiOz1DW8bfAu71qMTRBMInpZn6gVy0Q+RjDYWpXrUK/die/DZbuEzSBc4WWcFmhys+ukToLkgpDvh+O3Rimpzwje6U7wgzB0Dd0i5SyU3khaWD6LNicp8k39wIe5080HkSenc059g==', 'U2FsdGVkX18+X57UQ2ciBsTgbiPBiQ3mvZZ4UIVtPs/g3EPMDblMjFz/rx//ZaTNIXXjCX2Fl39p2qChRg8E9A==', 'active'),
('1234567890', 'pepeperez@hotmail.com', '$2a$10$G0ICC65fsUc5wvHJxPHJjeoQFHRQfryNIccgKiCyovRlprxoTuoUG', 'pepe', 'Peres', '812512275', '', 'U2FsdGVkX1+jNY9SI10u3NosRtIpzVFqZEt+UzZVU6JX9YSm7JauDZDCXA83elr7IrB4vwzLTBb19uqJaa6+Znlt0tWq5hdQZ0v7tFmeHSVeTeMM9FZD4AvMNuMzzBhLgEyzRLAyP7uqB47FpquiJrF1o7qB9xMe2YdEXvoen5fYgQ3XSxYmibma3nkNwXNA0JcoeUXWsO8GXj8jtxhzkkcg5xW6fVm/6WHDHoTMMOuczbRpCPF+QMiSy/i121oS1/3eAC+uRdvt72kN5nSAdztJmD2Doh4kbP2FNgntNlryMri4mE6Il3GnApES3+Ez+BWrjI0e5qCG/Onxb5cRfOzz1ZoIViFraqgixmllDfBvE/bNM2TtuonyWf5DnHqXgEV8XeFwzoW33/I+BqYUwetvZQ3ll0JNRImHeSfIQFsBvppJBwoL1cUN9NEdYZ5vBQRm9UNlvkMzncenfwFk34EmITpWbv2LLYMAfeLh237S534jIJx/brOBP9v/g+hFSdcQiI4GCymjzZ2d1tq6v3TZidj43mnwiAMiRjwufPb0W6KK7haRkLUlKdJ7U2ThMyvliMpKN/o2kanHYZ7rlygeBgnBh3aOt7BpSZUjWPyu5Vzr1Z5G+uXxuoNXR3pMsQy2PlBPLGfEM8ysX8QndUycSxhIs271SeNkix8Km54/PGMLwSV5ss4zh0MQKShctWeC4hMB+opR7c/A0GcH+slnMXu2XBhrhYT6TzDJ+GKo0OLQDk6KaFOsT2sC/TxHaQf1eZTPePrqeNbeZ7H+c6OylMjOPVCykpoYsmN1u5PRnI5gQdO/AkQSniOWWechaAioGALcf34am00WGXWzOE0BhVuCGp8FR/5evZNWtayoD2ua1jFCGmi9ItOGCp0FdLS2qtcWqJMlLr2/NVSA1/8TO6SvmhXobgQY/dxojOKUSDTk2fnPyHAQ4F5F4VsM5PMTFyDtPpdtsDG6qLpwYOBKs7aleESY9SP1+KhnS3XiLlNXH9JDxHJY07qrq13QOlFAAoFF+ivi7onteQK40iHIRCrnKhUbN8urXudmQzwYtoq2iHE5lBhTCapl1C2f5YKH/RXonAun/m20z0NorQ==', 'U2FsdGVkX18vovsy7dmcIZG1lkNguuS+rkw+OUS0T31C6QUXJaCW4j+IhaId/5gPwhsofPGbO6hUjv2rNTkQ8g==', 'delete'),
('5678912343', 'kdkdk@lkdlf.com', '$2a$10$8J37LEdn8DD5zrbLpBEH7.Aedx7o5hWYf0gCmCyBGcFxh.bEK6xeu', 'tintin', 'tonton', '812512275', '', 'U2FsdGVkX18PyPE3lXhk0D6VvIVpP3898V+OWkuWCc7n6lHPMYENCzoePFfNufSPlRSFrA21nyLVbaWPW6z1aQwm5/ube1jlR16H7Td0LCwp/Cjjc/whCxd3nQIdJUtIwbf7Z3yr0tj3N5H2+dhYn+NSQKjRZEiHxxrjPRgQBj/o9uHCozMTSLzTDowq21QFH1SSBVvG/JrGZFL+WrnbkxmGaLCBGBSYC+6NDyzIBWNSHPc7+Y9ffhFrNJH0xDgF1hTxF97p0TsVYPvnvEpEATStjQoM+qtBsKPkeFOCBA7c41XP/og9zppb4SCrTz0XHTYqg2mT/PdtDRqMnlJmi0LUerWzWcKypZvZ9Xi3gXaQG3ejeIxyA+q6qJt8qneb2jnWc+OeOybauIFQCKHnYpRrrUnjV4xfCGWiDgZntriqrrJXuthI+mRHnCkn8KeKvHGvu6fYZZ3bC8/i4XvLVJU1mCcobTgmaSe6qsNWA2L7p/miW7zw8xMVbQMW8wnn4io8ZkNeJEwtLN++53++xhDlaO3dHHGJV/fdqJZZLpzBKx/gJeQxYV73KPADXxF+DRTJuD0WeE7tyIvCQFIz5GR6vV0z6RvAzfKkdtG/N7ewxMqqiLedwdJ5zeXMNs2456XkFcatqRSBghUWy4bN3DU4pKldbHI+yDIrgde7G/mRFKRy220ysnet4VpN2diq4iBmnar5Y62wODRqcGb19SIHZEVpwjt5Wb2kI4mWxrnF8LNASd3GRFyp+dbgD1a57ihayuFcXAbGaTdKOrQXkhmQ6SJG+k7vsgHdMQI36Q0V1iATdE5ateGq/brrq3/BKs4PQU0+0zJqMFx0wwnOXJ+/M0cIHENDVsJfpTFDTDDZBQ1SimgqeRCccnAOK6Dk6i0jT7htsfhoHCvT+Pi6WAw4oqrSPPCO2tLjXXA8M2AW8SAOKlqoeu4JR6E7JAGwWy1c03sQ66EoPhuUZddMWqIdyx27vVLBNJ5NmB1u6emWMbrwBOkj0mCYXxx/iOr/u2ay3GQi+E4NjK5bc6sKJgdh/JaDM985mNbGGtSJsngcVZPlC/L3NJJQ+R9PAFmCbmQIJKth9hy0DwAUV/NPQg==', 'U2FsdGVkX1+3q5wbmSt8k6blcIvAqvEciiaDxrTaSs1iSf9rRONtBSllwYcZc9Sw', 'active'),
('80200972', 'gersonpop@hotmail.com', '$2a$10$lWISZo4BtNAcE6baZb8xw.WsHVlFbdPq/xclMPu52bSXRTN13sxJ.', 'Gerson', 'Porras', '812512275', 'default', 'U2FsdGVkX1/PI3IYGQyyBEeViT7ynuilBIXjMj/RWk5Hp2rtjaJThlo6Zyuoo+zusf/QSgkew10saRH9gbNyUlG9GTigO/VtjIBs5GhMD6jeXdunvJcVqTlZ1krwBBtjlhHdRpna5HXy8djKssTNpGe7oPUO7MoNmCh+KGgh7lb2QYE9heSi6XIl0H920z+va+TIbeewyrxByL6KMnYRLn6N/Cx6ArnA500w3akdAhT342o+4k1/MHhYLBEdkCGJOtSCViW++mxkTPTCSfg8/T21WaVNPfkrYcz1exVcGdpqd7tPjBY/lL6fKGupAiuPhUZpcfncTyAF4JKsJZUL04jKdzbot5FCD4mOF7R6CqwMLeAVPTQ748O4pVBrV34NuTC1zql5sp9IvryW3w8rjjocer/zP0NoFbQiSzP4ZfSLBXM5XUcDXx3vc4bwyZOrC5iH0Fa4jlSGllnG5i86sxddCINyXYFY7nh59YoVW/hkEz24rewmxQuxvqQ82FvC5skiuuLJi4ZO4nfMdiVKN9LNyd68ld7Z5b/r3qJ+z4Qnj2ErFIHOw8hBJewIEWUZ6H3sxVI3Sk8ciJtUkblAZW31HI1gsBMeMRQ/MJ24bTCSz4QytcuHvgoG4ZU5zUuqH9E0f1O8pkDj5+1a74AOu1O1WYmqwjfUwXHWa1/RLalO8WF0LzPOp+l7MTzNLL3zt+44/r2/9FW5srsiMncfd3T7yjKW1ZC1uXKr8kMafffXQjzqfZSrKdVVvQM8J6aEb2sBDYhlCfQ1cFaV4RAZ3trvxFzAbbXaqUmRQokdeTDxkXqct1UK2d+nyS56LiyFrV+az3G/pYZQ/bDPINKsZHR4LE3ULS6K68jng07jOxEfKUAe4/H/h9U7WyNHzRhy4T2FsG7Cptl5ify6p62yG7S8Vpwla4V0wucyDI93TyD3z6jrhqbiooql27eLmGV8JpYxXxLwlLBXdBy3GkdXWZHsE56NRGq1DL9dTpmdNgmtqOeB+CmNsCrEXAN76VEf00brqlPun/7d8pX230t/bSZXcEYKoZQ9D1QEqusxMIU=', 'U2FsdGVkX19OdgvSScGKSBI6fI+Hd7g/JfGrc45gVl340R7dG8N3Gs9HqR4NtFj/DYk/5rl0eRXgOVdBUYlGrw==', 'active'),
('80255151', 'edwin@hotmail.com', '$2a$10$RBptJZlNXNqdP1/FDo8mruQXbnScVuZkhALI8E4ff8ZDXQE6UkcTO', 'Edwin', 'Saldaña', '812512275', '', 'U2FsdGVkX190mvMZaggzHuC51Y/OV6JORW2tnLbWdgdg88FKlgA7o8p5Oo4dRty5o5Lk/4qvG6gUoWUomM1qEVFcTO5mUV2QQ6mFsSG7vOVfBoApl+fPXgHrsZmrCAYQF3lvn1aDRQU3GS1no/i3ezu4G325jf3Zmd5jD6xdKILLK6Uer+acLZLPMgQlTwW6yR6ZsIHjXNqmJfsnAQZG/9PvuzFZesJD9o9o4a+blrYA0IIcumIpgGmPXX668GPM87Es7SXWWTdPVsQV0vI4xuj/Z817pk5v2MWnxI2B/iryZcxYhrM8/2H0YLfenlF6DHiX+H/oEn+rakrWiUWLpYIbdivrNPkyQjSnTtmOwSJ4/RlidJ+9INQhOIHq3MYhGKJ0/VMkItRdEees10EbGKeR4bV7AahtDmPaZHpAI+Q+8FpgpWdb5rBujWnxEHneAslQ+kwot3J+MNEprIDcuydJu5iimMQ0q8wHoynBCzY0Mf6toDS94yd9y0j1gpO5T5QXseLWgqaGNI/W/5HWHrDk4a/almorzr/w8UC/1fc2x5+D04ulzpuHIhMYRBzBIWcH3R27rfYOpTnDjpoyLPEXBxp9Vt0EGqMXiRztsXFivjDkhUzyGci29lS01WiUVS6USJmjO3JMAz81+S0IiRbviOTh08IkxrwsAk2w/suikYu2LZ1JiyNaxLpsdcYVKWEhUUQKrQ2eTx1enFpX9xM4l55v7BbMzBeERcsb7SAdWnTgdGZ6OywkR62uHMPlE/0FuKqTPA7aFk+zmyTx86UMCEjexvpUk9JiU4HdrnQdLWRdMpneO2Q8i7Zak0cplsBsIEupLOkt4qOCyTd1zIwaPDBXc+Gj/Ly9SUGphix86mD5wn2gY3sXgXigbNfTasKbKOu54x6TGYh8+cKl4dbXZ6KBI/apHQfks60yS9RlzUYP5gHXEiPzZ0w5cz94CU93hFenp71USi1kEGqR41lFqekS0UTemgwP6o1dyiW0Zx0es3gYbt9uo+GvAx02PaXnFL3IeCTh2q/sg23RdDfG2B4NRh07ENCB6azjnphZmgIPBmIT56A7pVfd8c1EejJa8X6fk/sO5cy1Y9oIHg==', 'U2FsdGVkX1+OghBFv34dSfWsYg20Wg9k342QHGWZ8rF5ZuTRJvuXotcMA7s/bfsGHKCuU88jaT7vihKNt4R3aA==', 'active'),
('987654321', 'juan@sinmiedo.com', '$2a$10$BSPCta2Cv5TYpwsEwVijjee/3jMKgpIvlRphSkRgzROR21O.Tv4em', 'Juan', 'Sin Miedo', '812512275', '', 'U2FsdGVkX18HytRYE7bdIIcOp8Jab35g7P/qzJHwzSb9g1fprW30D3er1xpQzNwF5fZ9XAfsHcUYDhRAC83eAlJg0wb/gA2gn81VQJ7vnqPdWxPm0CCw4fdOG/cK2uW0fYu6DLDVg9mP8wHix+RMl3On2eAU0adj2f5+0IL3C1V2XY/6wlIvgs61NEpnoWISrWvxJiBP/dMtMT9rwjU4rOFaxhhRTEJXHogyAv6xqAR+9KdWBumNozm8eWgJ/DgR83dwcTFN05nZp+ONFBvuYOhtF2hpRS8PPYy0H8Td5XL94K/GNIV7H++4p7epCB5NRD1ofJ+6TNXCbvnn5rk/6DwBaX8W+Kcq65UA1VfE//HStpS08LfpHdqnQ+hX4K61icSGVPkw1cTj8HcIaVHc/0rJpXCB8yyXlWsXUaS7RBbACbDUDnqcecE7UfokyX2iOUoT8CKvJjl6uo24W2uZ8tE8PEPIYqI3RZLIGBqmRnpuIMYMFgGYKX8WV+WWygPWMWSVPmSrYyGPcSapWepq0Oj+K+a8J5NV2kakL+B6FC24JLBdykegcUDYV3SLkaHZrBWqFNGV3lbEyVUk8Ew+Gj1LJ59Sj5IizO0oBU13180MB5SmEdJGvpFIpHq9beADQapLloFW6/SQZgqj/xsnX21Bj8hKeMb3T3OHmqxInEG/409UfBLRnHXWyi4uEHO2XFCUYuaLXibekfwVHP5SIcepPD+jpkOEUg8GbpW5ghFmU2WdUpDL0A+fMyyqih8SekPxV7bvgRJymr44Wa0I96ZtIZNveZhQKO+tJ8t+lY6/nudLNHfe3yzHOLRqT7aIYkPuanBWeaJIFiug9OzrbXD0q8xvlsj33UtQGSewaSHMmfeDsZYThWz816+e8p0/Cgda/qjK5TspG4Keqgch1Ty4IRV5pUd90GzkUGZm2Zy723ddh6YTDpf6KVyfX3WriWfWQxpg/W/F8zudYybwed4TI+a3uBIaDBiU1dZNEduTejmyrn8CU9SmtQARDtl82HzjmN3oB1VgKuV/vQIiZr4Hz2w7hdJw68wjQRYRiL8N5hNYuap6nq0Wnw7+RPXlDFodyxnxkUuVkhDSPUWo+A==', 'U2FsdGVkX18usvjVjB4OGoScvv+C9NPv04xgO8F39RjGNqyVXEnzebzHvDVKDTJB', 'active');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calendar`
--
ALTER TABLE `calendar`
  ADD PRIMARY KEY (`IdCalendar`),
  ADD KEY `IdUser_FK` (`IdUser_FK`);

--
-- Indices de la tabla `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`IdCompany_PK`);

--
-- Indices de la tabla `companybranches`
--
ALTER TABLE `companybranches`
  ADD PRIMARY KEY (`IdBranch_PK`);

--
-- Indices de la tabla `companyeq`
--
ALTER TABLE `companyeq`
  ADD PRIMARY KEY (`IdEQ_PK`);

--
-- Indices de la tabla `companyfacilities`
--
ALTER TABLE `companyfacilities`
  ADD PRIMARY KEY (`IdFacility_PK`);

--
-- Indices de la tabla `companysystems`
--
ALTER TABLE `companysystems`
  ADD PRIMARY KEY (`IdSystem_PK`);

--
-- Indices de la tabla `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`IdContract_PK`);

--
-- Indices de la tabla `detalle_rq`
--
ALTER TABLE `detalle_rq`
  ADD PRIMARY KEY (`IdDeralleRQ_PK`),
  ADD KEY `IdEquipo_FK` (`IdEquipo_FK`),
  ADD KEY `IdRequerimiento_FK` (`IdRequerimiento_FK`);

--
-- Indices de la tabla `employeefamilyinfo`
--
ALTER TABLE `employeefamilyinfo`
  ADD PRIMARY KEY (`IdEmpFamilyInfo_PK`);

--
-- Indices de la tabla `employeepersonalinfo`
--
ALTER TABLE `employeepersonalinfo`
  ADD PRIMARY KEY (`IdEmployee_PK`),
  ADD UNIQUE KEY `EmpDni` (`EmpDni`);

--
-- Indices de la tabla `employeestudyinfo`
--
ALTER TABLE `employeestudyinfo`
  ADD PRIMARY KEY (`IdEmpStudyInfo_PK`);

--
-- Indices de la tabla `employeeworkinfo`
--
ALTER TABLE `employeeworkinfo`
  ADD PRIMARY KEY (`IdEmpWorkInfo_PK`);

--
-- Indices de la tabla `GTHFOR069`
--
ALTER TABLE `GTHFOR069`
  ADD PRIMARY KEY (`IdContract_PK`);

--
-- Indices de la tabla `gthfor070`
--
ALTER TABLE `gthfor070`
  ADD PRIMARY KEY (`IdFormat_PK`),
  ADD UNIQUE KEY `otroSalario` (`IdFormat_PK`);

--
-- Indices de la tabla `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `requerimiento`
--
ALTER TABLE `requerimiento`
  ADD PRIMARY KEY (`IdRequerimiento_PK`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`IdRol_PK`);

--
-- Indices de la tabla `st_ciiu`
--
ALTER TABLE `st_ciiu`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `st_cities`
--
ALTER TABLE `st_cities`
  ADD PRIMARY KEY (`id_city`),
  ADD KEY `departamento_id` (`state_id`);

--
-- Indices de la tabla `st_countries`
--
ALTER TABLE `st_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `st_multidata`
--
ALTER TABLE `st_multidata`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Initials` (`Initials_PK`);

--
-- Indices de la tabla `st_states`
--
ALTER TABLE `st_states`
  ADD PRIMARY KEY (`id_state`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`IdUser_PK`),
  ADD UNIQUE KEY `UserEmail` (`UserEmail`),
  ADD KEY `IdCompany_FK` (`IdCompany_FK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calendar`
--
ALTER TABLE `calendar`
  MODIFY `IdCalendar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `companybranches`
--
ALTER TABLE `companybranches`
  MODIFY `IdBranch_PK` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `companyeq`
--
ALTER TABLE `companyeq`
  MODIFY `IdEQ_PK` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `companyfacilities`
--
ALTER TABLE `companyfacilities`
  MODIFY `IdFacility_PK` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `companysystems`
--
ALTER TABLE `companysystems`
  MODIFY `IdSystem_PK` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contract`
--
ALTER TABLE `contract`
  MODIFY `IdContract_PK` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_rq`
--
ALTER TABLE `detalle_rq`
  MODIFY `IdDeralleRQ_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `employeefamilyinfo`
--
ALTER TABLE `employeefamilyinfo`
  MODIFY `IdEmpFamilyInfo_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `employeepersonalinfo`
--
ALTER TABLE `employeepersonalinfo`
  MODIFY `IdEmployee_PK` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80255180;

--
-- AUTO_INCREMENT de la tabla `employeestudyinfo`
--
ALTER TABLE `employeestudyinfo`
  MODIFY `IdEmpStudyInfo_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `employeeworkinfo`
--
ALTER TABLE `employeeworkinfo`
  MODIFY `IdEmpWorkInfo_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `GTHFOR069`
--
ALTER TABLE `GTHFOR069`
  MODIFY `IdContract_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `gthfor070`
--
ALTER TABLE `gthfor070`
  MODIFY `IdFormat_PK` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `image`
--
ALTER TABLE `image`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `requerimiento`
--
ALTER TABLE `requerimiento`
  MODIFY `IdRequerimiento_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `st_ciiu`
--
ALTER TABLE `st_ciiu`
  MODIFY `Id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=701;

--
-- AUTO_INCREMENT de la tabla `st_cities`
--
ALTER TABLE `st_cities`
  MODIFY `id_city` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1101;

--
-- AUTO_INCREMENT de la tabla `st_countries`
--
ALTER TABLE `st_countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT de la tabla `st_multidata`
--
ALTER TABLE `st_multidata`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `st_states`
--
ALTER TABLE `st_states`
  MODIFY `id_state` int(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calendar`
--
ALTER TABLE `calendar`
  ADD CONSTRAINT `calendar_ibfk_1` FOREIGN KEY (`IdUser_FK`) REFERENCES `users` (`IdUser_PK`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
