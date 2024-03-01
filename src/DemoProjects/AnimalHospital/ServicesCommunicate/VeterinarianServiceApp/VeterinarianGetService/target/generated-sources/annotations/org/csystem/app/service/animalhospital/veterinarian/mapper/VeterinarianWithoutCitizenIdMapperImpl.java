package org.csystem.app.service.animalhospital.veterinarian.mapper;

import com.karandev.util.mapstruct.IOptionalMapper;
import com.metemengen.animalhospital.data.entity.jdbc.VeterinarianWithoutCitizenId;
import javax.annotation.processing.Generated;
import org.csystem.app.service.animalhospital.veterinarian.dto.VeterinarianWithoutCitizenIdDTO;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2023-12-08T20:39:05+0300",
    comments = "version: 1.5.3.Final, compiler: javac, environment: Java 17.0.1 (Oracle Corporation)"
)
@Component
public class VeterinarianWithoutCitizenIdMapperImpl implements IVeterinarianWithoutCitizenIdMapper {

    @Override
    public VeterinarianWithoutCitizenIdDTO toVeterinarianWithoutCitizenIdDTO(VeterinarianWithoutCitizenId veterinarian) {
        if ( veterinarian == null ) {
            return null;
        }

        VeterinarianWithoutCitizenIdDTO veterinarianWithoutCitizenIdDTO = new VeterinarianWithoutCitizenIdDTO();

        veterinarianWithoutCitizenIdDTO.middleName = IOptionalMapper.toType( veterinarian.middleName );
        veterinarianWithoutCitizenIdDTO.diplomaNo = veterinarian.diplomaNo;
        veterinarianWithoutCitizenIdDTO.firstName = veterinarian.firstName;
        veterinarianWithoutCitizenIdDTO.lastName = veterinarian.lastName;
        veterinarianWithoutCitizenIdDTO.birthDate = veterinarian.birthDate;
        veterinarianWithoutCitizenIdDTO.registerDate = veterinarian.registerDate;

        return veterinarianWithoutCitizenIdDTO;
    }
}
