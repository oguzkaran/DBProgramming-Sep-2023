package org.csystem.app.service.animalhospital.veterinarian.mapper;

import com.metemengen.animalhospital.data.entity.jdbc.Veterinarian;
import javax.annotation.processing.Generated;
import org.csystem.app.service.animalhospital.veterinarian.dto.VeterinarianDTO;
import org.csystem.app.service.animalhospital.veterinarian.dto.VeterinarianStatusDTO;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2023-12-08T20:39:03+0300",
    comments = "version: 1.5.3.Final, compiler: javac, environment: Java 17.0.1 (Oracle Corporation)"
)
public class VeterinarianMapperImpl implements IVeterinarianMapper {

    @Override
    public VeterinarianDTO toVeterinarianDTO(Veterinarian veterinarian) {
        if ( veterinarian == null ) {
            return null;
        }

        VeterinarianDTO veterinarianDTO = new VeterinarianDTO();

        veterinarianDTO.diplomaNo = veterinarian.getDiplomaNo();
        veterinarianDTO.citizenId = veterinarian.getCitizenId();
        veterinarianDTO.firstName = veterinarian.getFirstName();
        veterinarianDTO.middleName = veterinarian.getMiddleName();
        veterinarianDTO.lastName = veterinarian.getLastName();
        veterinarianDTO.registerDate = veterinarian.getRegisterDate();

        return veterinarianDTO;
    }

    @Override
    public VeterinarianStatusDTO toVeterinarianStatus(VeterinarianDTO veterinarianDTO) {
        if ( veterinarianDTO == null ) {
            return null;
        }

        VeterinarianStatusDTO veterinarianStatusDTO = new VeterinarianStatusDTO();

        veterinarianStatusDTO.diplomaNo = veterinarianDTO.diplomaNo;
        veterinarianStatusDTO.citizenId = veterinarianDTO.citizenId;
        veterinarianStatusDTO.firstName = veterinarianDTO.firstName;
        veterinarianStatusDTO.middleName = veterinarianDTO.middleName;
        veterinarianStatusDTO.lastName = veterinarianDTO.lastName;
        veterinarianStatusDTO.registerDate = veterinarianDTO.registerDate;

        return veterinarianStatusDTO;
    }
}
