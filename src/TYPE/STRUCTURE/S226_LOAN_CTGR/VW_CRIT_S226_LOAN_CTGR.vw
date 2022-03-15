class S226_LOAN_CTGR;

@name('S226. Список всех кредитов')
view VW_CRIT_S226_LOAN_CTGR {
	type main is
		select a(
					a.[CODE] 					: C_CODE,
					a.[NAME] 					: C_NAME,
					a.[CREDIT_TYPE].[NAME] 		: C_CRED_TYPE,
					a.[COEFFICIENT] 			: C_COEFF
				)
		in ::[S226_LOAN_CTGR];
}
