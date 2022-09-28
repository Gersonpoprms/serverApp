import bcrypt from "bcryptjs";
import crypto from "crypto-js";

export const encryptPassword = async (password) => {
  const salt = await bcrypt.genSalt(10);
  const hash = await bcrypt.hash(password, salt);
  return hash;
};
export const maxRoll = (userPermission) => {
  if(userPermission.superAdmin.access) return { name: "superAdmin", value: 100 }
  else if(userPermission.admin.access) return { name: "admin", value: 90 }
  else if(userPermission.manager.access) return { name: "gerente", value: 80 }
  else if(userPermission.humanTalent.access) return { name: "talentoHumano", value: 60 }
  else if(userPermission.leader.access) return { name: "lider", value: 50 }
  else if(userPermission.technical.access) return { name: "tecnico", value: 40 }
  else if(userPermission.logistic.access) return { name: "logistica", value: 30 }
  else if(userPermission.commercial.access) return { name: "comercial", value: 20 }
  else if(userPermission.client.access) return { name: "cliente", value: 10 }
  else return { name: "Basico", value: 0 }
  
}


export const setQuery = (type) => {
  if(type === "CC") return { table: "company", field: "IdCompany_PK" }
  else if(type === "CB") return { table: "CompanyBranches", field: "IdBranch_PK" }
  else if(type === "CF") return { table: "CompanyFacilities", field: "IdFacility_PK" }
  else if(type === "CS") return { table: "CompanySystems", field: "IdSystem_PK" }
  else if(type === "CE") return { table: "CompanyEQ", field: "IdEQ_PK" }
  else if(type === "CCT") return { table: "CommercialContracts", field: "IdContract_PK" }
  else if(type === "CSR") return { table: "CommercialServices", field: "IdService_PK" }
  else if(type === "EP") return { table: "EmployeePersonalInfo", field: "IdEmployee_PK" }
  else if(type === "EW") return { table: "EmployeeWorkInfo", field: "IdEmployee_FK" }
  else if(type === "EF") return { table: "EmployeeFamilyInfo", field: "IdEmployee_FK" } 
  else if(type === "EC") return { table: "EmployeeContract", field: "IdContract_PK" }
  else if(type === "ES") return { table: "EmployeeStudyInfo", field: "IdEmployee_FK" }
  else if(type === "EFE") return { table: "EmployeeFamilyInfo", field: "IdEmpFamilyInfo_PK" }
  else if(type === "EC") return { table: "EmployeeContract", field: "IdContract_PK" }
  else if(type === "ESE") return { table: "EmployeeStudyInfo", field: "IdEmpStudyInfo_PK" }
  else if(type === "DCIU") return { table: "st_CIIU", field: "Id" }
  else if(type === "DC") return { table: "st_countries", field: "iso" }
  else if(type === "DS") return { table: "st_states", field: "id_state" }
  else if(type === "DCt") return { table: "st_cities", field: "id_city" }
  else if(type === "DM") return { table: "st_multidata", field: "Initials_PK" }
}
export const matchPassword = async (password, savedPassword) => {
  try {
    return await bcrypt.compare(password, savedPassword);
  } catch (e) {
    console.log(e);
  }
};

export const  permissionInit ={
    user:{ access:false, PUT:false, DELETE:false, POST:false},
    companies:{ access:false, PUT:false, DELETE:false, POST:false},
    employes:{ access:false, PUT:false, DELETE:false, POST:false},
    client:{ access:false, PUT:false, DELETE:false, POST:false}, 
    commercial:{ access:false, PUT:false, DELETE:false, POST:false},
    logistic:{ access:false, PUT:false, DELETE:false, POST:false},
    technical:{ access:false, PUT:false, DELETE:false, POST:false},
    leader:{ access:false, PUT:false, DELETE:false, POST:false},
    humanTalent: { access:false, PUT:false, DELETE:false, POST:false},
    manager:{ access:false, PUT:false, DELETE:false, POST:false},
    admin:{ access:false, PUT:false, DELETE:false, POST:false},
    superAdmin: { access:false, PUT:false, DELETE:false, POST:false}
   
}  

export const encodeUserPermission =  (JSONRoles, key) => {
  return crypto.AES.encrypt(JSON.stringify(JSONRoles), key).toString();

};

export const decodeUserPermission =  (encryptedRoles, key) => {
  return  JSON.parse(crypto.AES.decrypt(encryptedRoles.toString(), key).toString(crypto.enc.Utf8));
};
