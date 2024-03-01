package org.csystem.app.service.animalhospital.veterinarian.mapper;

import com.metemengen.animalhospital.data.entity.jdbc.VeterinarianWithFullName;
import javax.annotation.processing.Generated;
import org.csystem.app.service.animalhospital.veterinarian.dto.VeterinarianWithFullNameDTO;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2023-12-08T20:39:04+0300",
    comments = "version: 1.5.3.Final, compiler: javac, environment: Java 17.0.1 (Oracle Corporation)"
)
@Component
public class VeterinarianWithFullNameMapperImpl implements IVeterinarianWithFullNameMapper {

    @Override
    public VeterinarianWithFullNameDTO toVeterinarianWithFullName(VeterinarianWithFullName veterinarianWithFullName) {
        if ( veterinarianWithFullName == null ) {
            return null;
        }

        VeterinarianWithFullNameDTO veterinarianWithFullNameDTO = new VeterinarianWithFullNameDTO();

        veterinarianWithFullNameDTO.diplomaNo = veterinarianWithFullName.diplomaNo;
        veterinarianWithFullNameDTO.fullName = veterinarianWithFullName.fullName;
        veterinarianWithFullNameDTO.birthDate = veterinarianWithFullName.birthDate;
        veterinarianWithFullNameDTO.registerDate = veterinarianWithFullName.registerDate;

        return veterinarianWithFullNameDTO;
    }
}
