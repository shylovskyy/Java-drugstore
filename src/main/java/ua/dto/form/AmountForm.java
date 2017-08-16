package ua.dto.form;



import org.springframework.web.multipart.MultipartFile;

import ua.entity.Ingredient;
import ua.entity.MeasuringSystem;

public class AmountForm {

	private Long id;

	private String amount;
	
	private String recipe;

	private String name; // add name and getName Set name

	private Ingredient ingredient;

	private MeasuringSystem system;

	private int version;

	private MultipartFile file;

	
	
	
	public String getRecipe() {
		return recipe;
	}

	public void setRecipe(String recipe) {
		this.recipe = recipe;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public Ingredient getIngredient() {
		return ingredient;
	}

	public void setIngredient(Ingredient ingredient) {
		this.ingredient = ingredient;
	}

	public MeasuringSystem getSystem() {
		return system;
	}

	public void setSystem(MeasuringSystem system) {
		this.system = system;
	}
}