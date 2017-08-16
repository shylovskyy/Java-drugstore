package ua.entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "amount")
public class Amount extends AbstractEntity {

	private BigDecimal amount;

	private String name;

	private String recipe;

	@ManyToOne(fetch = FetchType.LAZY)
	private Ingredient ingredient;

	@ManyToOne(fetch = FetchType.LAZY)
	private MeasuringSystem system;

	
	  @ManyToMany(mappedBy = "amounts") private List<Recipe> recipes = new
	  ArrayList<>();
	 
	public Amount() {
		// TODO Auto-generated constructor stub
	}

	public Amount(String name) {
		super();
		this.name = name;
	}

	public String getRecipe() {
		return recipe;
	}

	public void setRecipe(String recipe) {
		this.recipe = recipe;
	}

	private int version;

	@Transient
	private transient MultipartFile file;

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

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
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

	
	  public List<Recipe> getRecipes() { return recipes; }
	  
	  public void setRecipes(List<Recipe> recipes) { this.recipes = recipes; }
	
	public String getPresentation() {
		return String.valueOf(amount) + " " + system.getName() + " "
				+ ingredient.getName();
	}
}
