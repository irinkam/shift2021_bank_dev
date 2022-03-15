class S226_CRED_CATEG;

@name('S226. Кредиты. Принадлежность к категории')
view VW_CRIT_S226_CRED_CATEG_VIEW {
	type main is
		select a (
				prod.[NUM_DOG] 				: c_num_dog
			,	a.[DATE_BEG]				: c_date_begin
			,	a.[DATE_END]				: c_date_end
			,	a.[CRED_CAT].[NAME]			: c_category_name
			,	a.[CRED_CAT].[COEFFICIENT]	: c_coeff
			
		) 
		in ::[S226_CRED_CATEG]
		,(::[PRODUCT] :prod)
		where a.[CREDIT]%id = prod%id;
}
