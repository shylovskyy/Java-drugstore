package ua.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;




import ua.entity.MeasuringSystem;
import ua.service.MeasuringSystemService;



public class MeasuringsystemsValidator   implements Validator{

	private final MeasuringSystemService mssystemsService;
	
	public MeasuringsystemsValidator(MeasuringSystemService mssystemsService) {
		
		this.mssystemsService = mssystemsService;
		
	}
	
	@Override
	public boolean supports(Class<?> clazz) {
		return MeasuringSystem.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MeasuringSystem mssystem = (MeasuringSystem) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name","","Can`t be empty");
		if(mssystemsService.findByName(mssystem.getName())!=null){
			errors.rejectValue("name","","Alredy exist");
		}
	}

	
	
	
}
