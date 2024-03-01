package org.csystem.app.service.animalhospital.veterinarian.mapper;

import com.metemengen.animalhospital.data.entity.jdbc.VeterinarianSave;
import javax.annotation.processing.Generated;
import org.csystem.app.service.animalhospital.veterinarian.dto.VeterinarianSaveDTO;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2023-12-08T20:41:18+0300",
    comments = "version: 1.5.3.Final, compiler: javac, environment: Java 17.0.1 (Oracle Corporation)"
)
@Component
public class VeterinarianSaveMapperImpl implements IVeterinarianSaveMapper {

    @Override
    public VeterinarianSave toVeterinarianSave(VeterinarianSaveDTO veterinarianSaveDTO) {
        if ( veterinarianSaveDTO == null ) {
            return null;
        }

        VeterinarianSave veterinarianSave = new VeterinarianSave();

        veterinarianSave.diplomaNo = veterinarianSaveDTO.diplomaNo;
        veterinarianSave.citizenId = veterinarianSaveDTO.citizenId;
        veterinarianSave.firstName = veterinarianSaveDTO.firstName;
        veterinarianSave.middleName = veterinarianSaveDTO.middleName;
        veterinarianSave.lastName = veterinarianSaveDTO.lastName;
        veterinarianSave.birthDate = veterinarianSaveDTO.birthDate;
        veterinarianSave.registerDate = veterinarianSaveDTO.registerDate;

        return veterinarianSave;
    }
}
