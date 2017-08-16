package ua.service.implementation;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import ua.dto.filter.AmountFilter;
import ua.dto.form.AmountForm;
import ua.entity.Amount;
import ua.entity.Ingredient;
import ua.entity.MeasuringSystem;
import ua.repository.AmountRepository;
import ua.service.AmountService;
import ua.specification.AmountSpecification;

@Service
public class AmountServiceImpl implements AmountService{

	@Autowired
	private AmountRepository amountRepository;
	
	@Override
	public AmountForm findForm(Long id) {
		AmountForm form = new AmountForm();
		Amount entity = amountRepository.findOne(id);
		form.setAmount(String.valueOf(entity.getAmount()));
		form.setId(entity.getId());
		form.setName(entity.getName());
		form.setRecipe(entity.getRecipe());
		form.setIngredient(entity.getIngredient());
		form.setSystem(entity.getSystem());
		return form;
	}

	@Override
	public List<Amount> findAll() {
		return amountRepository.findAll();
	}

	@Override
	public void save(AmountForm form) {
		Amount entity = new Amount();
		entity.setAmount(new BigDecimal(form.getAmount().replace(',', '.')));
		entity.setId(form.getId());
		entity.setName(form.getName());
		entity.setRecipe(form.getRecipe());
		entity.setIngredient(form.getIngredient());
		entity.setSystem(form.getSystem());
		amountRepository.save(entity);
	}

	@Override
	public void delete(Long id) {
		amountRepository.delete(id);
	}

	@Override
	public Amount findOne(Long id) {
		return amountRepository.findOne(id);
	}

	@Override
	public Amount findUnique(String amount,String name, String recipe, Ingredient ingredient,
			MeasuringSystem system) {
		return amountRepository.findUnique(new BigDecimal(amount.replace(',', '.')), name ,recipe , ingredient.getId(), system.getId());
	}

	@Override
	public Page<Amount> findAll(Pageable pageable, AmountFilter filter) {
		return amountRepository.findAll(new AmountSpecification(filter), pageable);
	}

}