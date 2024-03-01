package com.metemengen.animalhospital.data.mapper.jdbc;

import com.karandev.util.mapstruct.IOptionalMapper;
import com.metemengen.animalhospital.data.entity.jdbc.Veterinarian;
import com.metemengen.animalhospital.data.entity.jdbc.VeterinarianSave;
import javax.annotation.processing.Generated;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2023-12-08T20:38:48+0300",
    comments = "version: 1.5.3.Final, compiler: javac, environment: Java 17.0.1 (Oracle Corporation)"
)
public class VeterinarianMapperImpl implements IVeterinarianMapper {

    @Override
    public Veterinarian toVeterinarian(VeterinarianSave veterinarianSave) {
        if ( veterinarianSave == null ) {
            return null;
        }

        Veterinarian veterinarian = new Veterinarian();

        veterinarian.setMiddleNameOpt( IOptionalMapper.toOptional( veterinarianSave.middleName ) );
        veterinarian.setDiplomaNo( veterinarianSave.diplomaNo );
        veterinarian.setCitizenId( veterinarianSave.citizenId );
        veterinarian.setFirstName( veterinarianSave.firstName );
        veterinarian.setLastName( veterinarianSave.lastName );
        veterinarian.setBirthDate( veterinarianSave.birthDate );
        veterinarian.setRegisterDate( veterinarianSave.registerDate );

        return veterinarian;
    }
}
