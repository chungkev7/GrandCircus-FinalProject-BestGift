package co.grandcircus.bestgift.search;

import java.util.LinkedList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class SearchExpression {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer searchId;

	@OneToOne
	private Keyword k1;

	@OneToOne
	private SearchExpression baseSE = null;
	@OneToOne
	private Keyword k2 = null;
	@Enumerated(EnumType.ORDINAL)
	private Operator o = null;

	// The following cases give a SearchExpression which can be evaluated.
	// Cases:
	// 1. Only Keyword k1 is set.
	// 2. Only Keyword k2 is set.
	// 3. Only SearchExpression baseSE is set.
	// 4. The Operator is set, and
	// 4.a. Both keywords are set.
	// 4.b. One keyword and the search expression are set.
	//
	// So that the search expression is always evaluatable, we must only allow
	// constructors which build SEs following those cases.
	// Of course, if we only allow a subset of those cases, the results are still
	// going to be evaluatable!!

	/*
	 * -----------------------------------------------------------------------------
	 * Constructors
	 * -----------------------------------------------------------------------------
	 */

	// The default, required if this is to be used as a DB model.
	public SearchExpression() {
		super();
	}

	// Covers case 1.
	public SearchExpression(Keyword k) {
		this();
		this.k1 = k;
	}

	// Not covering case 2.

	// Covers case 3.
	public SearchExpression(SearchExpression se) {
		this();
		baseSE = se;
	}

	// Covers case 4a.
	public SearchExpression(Keyword k1, Operator o, Keyword k2) {
		this.k1 = k1;
		this.k2 = k2;
		this.o = o;
	}

	// Covers case 4b.
	public SearchExpression(Keyword k, Operator o, SearchExpression se) {
		this.k1 = k;
		this.o = o;
		this.baseSE = se;
	}

	/*
	 * -----------------------------------------------------------------------------
	 * Getters/Setters
	 * -----------------------------------------------------------------------------
	 */

	// Allow access to members.
	public Keyword getKeyword1() {
		return k1;
	}

	public SearchExpression getBaseExpression() {
		return baseSE;
	}

	public Keyword getKeyword2() {
		return k2;
	}

	public Operator getOperator() {
		return o;
	}

	public Integer getSearchId() {
		return searchId;
	}

	public void setSearchId(Integer searchId) {
		this.searchId = searchId;
	}

	public Keyword getK1() {
		return k1;
	}

	public void setK1(Keyword k1) {
		this.k1 = k1;
	}

	public SearchExpression getBaseSE() {
		return baseSE;
	}

	public void setBaseSE(SearchExpression baseSE) {
		this.baseSE = baseSE;
	}

	public Keyword getK2() {
		return k2;
	}

	public void setK2(Keyword k2) {
		this.k2 = k2;
	}

	public Operator getO() {
		return o;
	}

	public void setO(Operator o) {
		this.o = o;
	}

	/**
	 * A special method used to obtain all the Keywords belonging to this Search.
	 * 
	 * @return
	 */
	public List<Keyword> getAllKeywords() {
		List<Keyword> kwsToReturn = new LinkedList<>();

		kwsToReturn.add(this.getKeyword1());
		if (k2 != null) {
			kwsToReturn.add(k2);
		} else if (baseSE != null) {
			kwsToReturn.addAll(baseSE.getAllKeywords());
		}

		return kwsToReturn;
	}

	public List<String> getAllKeywordsAsStrings() {
		List<Keyword> kws = getAllKeywords();
		List<String> asStrings = new LinkedList<>();
		for (Keyword k : kws) {
			asStrings.add(k.getValue());
		}
		return asStrings;
	}

	/**
	 * A special method used by an SE to expand an instance from a list of keywords.
	 */
	public static SearchExpression createFromKeywords(List<String> keywords) {
		SearchExpression seToReturn = new SearchExpression();

		// If only one keyword is given, create a one-operand search expression.
		if (keywords.size() == 1) {
			seToReturn.setK1(new Keyword(keywords.get(0)));
		} else if (keywords.size() == 2) {
			// If exactly two keywords are given, create a two-operand search expression.
			seToReturn.setK1(new Keyword(keywords.get(0)));
			seToReturn.setK2(new Keyword(keywords.get(1)));
			// Use the default operand...
			seToReturn.setO(Operator.AND);
		} else if (keywords.size() > 2) {
			// If there are more keywords, recursively add search expressions to handle
			// them.
			seToReturn.setK1(new Keyword(keywords.get(0)));
			// Use the default operand...
			seToReturn.setO(Operator.AND);
			List<String> copyList = new LinkedList<>(keywords);
			copyList.remove(0);
			seToReturn.setBaseSE(SearchExpression.createFromKeywords(copyList));
		}

		return seToReturn;
	}

}
