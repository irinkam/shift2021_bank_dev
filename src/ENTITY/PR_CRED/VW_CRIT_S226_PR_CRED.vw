class PR_CRED;


@access_attribute(C_DEPART)
@access_attribute(C_FILIAL)
@access_collections(check:=false)
@name('S226. Список всех кредитов')
view VW_CRIT_S226_PR_CRED {
type main is
	select cred(
				cred.[CLIENT]->(true, [CLIENT])[NAME] : C_NAME
				, cred.[CLIENT] : REF$C_NAME
				, cred.[CLIENT].[PN] : C_PN
				, cred.[NUM_DOG] : C_NUM_DOG_MAIN
				, cred.[ACCOUNT]->(true, [AC_FIN])[MAIN_V_ID] : C_MAIN_V_ID
				, cred.[ACCOUNT] : REF$C_MAIN_V_ID
				, cred.[SUMMA_DOG] : C_SUMMA_DOG
				, cred.[FT_CREDIT]->(true, [FT_MONEY])[CUR_SHORT] : C_CUR_SHORT
				, cred.[FT_CREDIT] : REF$C_CUR_SHORT
				, cred.[DATE_BEGIN] : C_DATE_BEGIN
				, cred.[DATE_ENDING] : C_DATE_ENDING
				, cred.[KIND_CREDIT]->(true, [KIND_CREDITS])[NAME] : C_NAME_1
				, cred.[KIND_CREDIT] : REF$C_NAME_1
				, cred.[LIST_PLAN_PAY] : C_LIST_PLAN_PAY
				, cred.[LIST_PAY] : C_LIST_PAY
				, (::[CRED_INTERFACE].[PRX_PRC_SCHEME].GetPrcRate(commiss.[PRC_SCHEME], ::[RUNTIME].[VIEWFUN].GetOpDate())) : C_PRC_RATE
				, commiss->(true, [DEBT_COMISS_PRC])[JOURNAL_PRC] : C_J_CALC_PRC
				, commiss->(true, [DEBT_COMISS_PRC])[PRC_SCHEME] : C_PRC_CREDIT
				, cred.[COMISS_ARR] : C_COMISS_ARR
				, (	select x(case when count(1) > 0 then '{***}' else '{...}' end)
					in ::[IFRS_STRING_PRC] all 
					where	x.[PN] = cred.[CLIENT].[PN]
							and x.[OBJ_REF] = cred%id
							and x.[DATE_BEG] >= cred.[DATE_BEGIN]
							and rownum = 1
					) : C_IFRS_JOUR
				, (	select x(case when count(1) > 0 then '{***}' else '{...}' end)
					in ::[IFRS_FAIR_COST] all 
					where	x.[PN] = cred.[CLIENT].[PN]
							and x.[OBJ_REF] = cred%id
							and x.[DATE_BEG] >= cred.[DATE_BEGIN]
							and rownum = 1
					) : C_IFRS_COST
				, cred.[COM_STATUS]->(true, [COM_STATUS_PRD])[NAME] : C_NAME_2
				, cred.[COM_STATUS] : REF$C_NAME_2
				, cred.[DATE_CLOSE] : C_DATE_CLOSE
				, (	select x(case when count(1) > 0 then '{***}' else '{...}' end)
					in ::[IFRS_INDICATORS] all
					where	x.[PN] = cred.[CLIENT].[PN]
							and x.[OBJ_REF] = cred%id
							and x.[DATE_BEG] >= cred.[DATE_BEGIN]
							and rownum = 1
					) : C_IFRS_INDICATORS
				, (	select x(case when count(1) > 0 then '{***}' else '{...}' end)
					in ::[IFRS_COST_HIST] all
					where	x.[OBJ_REF] = cred%id
							and x.[PN] = cred.[CLIENT].[PN]
							and rownum < 2
					) : C_COST_HIST
				, cred.[GR_RISK_HIST] : C_GR_RISK_HIST
				, (select x(case when count(1) > 0 then '{***}' else '{...}' end) in ::[DEVAL_HIST] all where x.[PRODUCT]%id = cred%id and rownum < 2) : C_DEVALUATION
				, (select x(case when count(1) > 0 then '{***}' else '{...}' end) in ::[DEVAL_RESERV] all where x.[PRODUCT]%id = cred%id and rownum < 2) : C_DEVAL_RESERV
				, (select x(case when count(1) > 0 then '{***}' else '{...}' end) in ::[PRC_DEVAL_HIST] all where x.[PRODUCT]%id = cred%id and rownum < 2) : C_PRC_DEVAL
				, (select x(case when count(1) > 0 then '{***}' else '{...}' end) in ::[DEV_PRC_PAR_HIST] all where x.[PRODUCT]%id = cred%id and x.[PARAM_TYPE] = 'PD' and rownum < 2) : C_PD
				, (select x(case when count(1) > 0 then '{***}' else '{...}' end) in ::[DEV_PRC_PAR_HIST] all where x.[PRODUCT]%id = cred%id and x.[PARAM_TYPE] = 'LGD' and rownum < 2) : C_LGD
				, cred.[LIST_PROL] : C_LIST_PROL
				, cred.[CLIENT] : C_CLIENT_ID
				, cred.[ACCOUNT] : C_ACCOUNT
				, cred.[DATE_BEGINING] : C_DATE_BEGINING
				, cred.[VNB_UNUSED_LINE] : C_VNB_UNUSED_LINE
				, cred.[VNB_EXCEED_PRC] : C_VNB_EXCEED_PRC
				, cred.[ACC_DEBTS_CR] : C_ACC_DEBTS_CR
				, cred.[ACC_DEBTS_PRC] : C_ACC_DEBTS_PRC
				, cred.[ACC_RESERV] : C_ACC_RESERV
				, cred.[ACC_RESERV_DEBTS] : C_ACC_RESERV_DEBTS
				, cred.[ACC_DEMAND_PRC] : C_ACC_DEMAND_PRC
				, cred.[PARAM_FOR_PLAN] : C_PARAM_FOR_PLAN
				, cred.[PLAN_HIST] : C_PLAN_HIST
				, (	select x(case when count(1) > 0 then '{***}' else '{...}' end)
					in ::[IFRS_MF_HIST] all 
					where x.[PN] = cred.[CLIENT].[PN] and x.[OBJ_REF] = cred%id
					) : LIST_MF
				, cred.[PRJ_KIND_CRED]->(true, [KIND_PROJECT])[NAME] : C_PRJ_KIND_NAME
				, cred.[PRJ_KIND_CRED] : REF$C_PRJ_KIND_NAME
				, cred.[DATE_GIVE] : C_DATE_GIVE
				, cred.[DATE_PAYOUT_LTD] : C_DATE_PAYOUT_LTD
				, cred.[DATE_ENDING_MAX] : C_DATE_ENDING_MAX
				, cred.[HIGH_LEVEL_CR]->(true, [PR_CRED])[NUM_DOG] : C_NUM_DOG_2
				, cred.[HIGH_LEVEL_CR] : REF$C_NUM_DOG_2
				, cred.[GEN_AGR]->(true, [GEN_AGREEM_FRAME])[NUM_DOG] : C_NUM_DOG_1
				, cred.[GEN_AGR] : REF$C_NUM_DOG_1
				, cred.[ARRAY_DOG_ACC] : C_ARRAY_DOG_ACC
				, (select acc(case when count(1) > 0 then '{***}' else '{...}' end) in ::[LIST_REQ_CLIENT] all where acc.[PROD]%id = cred%id) : LIST_REQ_CLIENT
				, (select ir(case when count(1) > 0 then '{***}' else '{...}' end) in ::[IND_RATES] where ir.[PROD_REF]%id = cred%id) : C_IND_RATES
				, (select o(case when count(1) > 0 then '{***}' else '{...}' end) in ::[CRED_CARD_DOC] all where o.[FACT_OPER]%collection = cred.[LIST_PAY] and rownum = 1) : C_CCARD_DOC
				, nvl(cred.[DEPART], cred.[CREATE_USER]->(true, [USER])[DEPART]) : C_DEPART
				, cred.[FILIAL] : C_FILIAL
				, cred%class : C_CLASS_ID
				, loanPort->(true, [SIM_LOAN_PORT])[NUM_DOG] : C_NUM_DOG_3
				, cred.[ARRAY_SUM_DOG] : C_ARRAY_SUM_DOG
				, cred.[DEBTORS] : C_DEBTORS
				, cred.[BANK_SWIFT] : C_BANK_SWIFT
				, (	select pl(case when count(1) > 0 then '{***}' else '{...}' end)
					in	::[PART_TO_LOAN]
						, (::[ZALOG] all : z)
						all
					where	z.[PART_TO_LOAN] = pl%collection
							and pl.[PRODUCT]%id = cred%id
							and rownum < 2
					) : C_SECURE
				, (	select mdoc(case when count(1) > 0 then '{***}' else '{...}' end)
					in ::[MAIN_DOCUM]
					where	(	mdoc.[PRODUCT_DT].[ACC_PROD]%id = cred%id
							or	mdoc.[PRODUCT_CT].[ACC_PROD]%id = cred%id
							)
							and rownum < 2
					) : C_DOCS
				, cred.[CAUSE] : C_CAUSE
				, cred : C_ID
				, (select chr(case when count(1) > 0 then '{***}' else '{...}' end) in ::[CHANGE_RULE] where chr.[CRED]%id = cred%id) : CHANGE_RULES
				, (select rlt(case when count(1) > 0 then '{***}' else '{...}' end) in ::[FL_RATE_RELATION] all where rlt.[PRODUCT]%id = cred%id and rownum < 2) : C_FL_RULE
				, cred.[RES_OTHER_FIL] : C_RES_OTHER_FIL
				, (	select prop(case when count(1) > 0 then 'Да' else 'Нет' end)
					in	::[PROPERTY_PROD]
						, (::[KIND_PROP_PROD] : k_pr) 
					where	prop.[PROD]%id = cred%id 
							and prop.[DATE_BEGIN] <= to_date(sys_context(user_context,'SYS_DATE'), 'DD/MM/YYYY') 
							and (	prop.[DATE_END] >= to_date(sys_context(user_context,'SYS_DATE'), 'DD/MM/YYYY')
								or	prop.[DATE_END] is null
								) 
							and prop.[KIND_PROP] = k_pr
							and k_pr.[CODE] = 'REZ_INDIVIDUAL'
							and rownum <= 1
							and prop.[VALUE_PROP] = '1'
					) : C_INDIVID_REZ
				, cred.[EARLY_PAY] : C_EARLY_PAY
				, (select regl(case when count(1) > 0 then '{***}' else '{...}' end) in ::[REGL_OPER] where regl.[PRODUCT]%id = cred%id and rownum < 2) : C_REGL_OPER
				, nvl(cred.[DEPART]->(true, [DEPART])[CODE], cred.[CREATE_USER]->(true, [USER])[DEPART]->(true, [DEPART])[CODE]) : C_DEPART_CODE
				, cred.[CATEGORY_INFO] : C_CATEGORY_INFO
				, (select chr(case when count(1) > 0 then '{***}' else '{...}' end) in ::[DEMAND_PAY] where chr.[CRED]%id = cred%id) : C_DEMAND_PAY
				, cred.[COPY_TO_TRANSH] : C_COPY_TO_TRANSH
				, cred.[INVOICE] : C_INVOICE
				, cred.[LIMIT_SALDO] : C_LIMIT_SALDO
				, cred.[PROPERTIES] : C_PROPERTIES
				, (select uid(uid.[UID]) in ::[UID] all where uid.[PRODUCT] = cred%id and rownum<2) : UID
			)
	in	::[PR_CRED]
		,(::[SIM_LOAN_PORT] : loanPort)
		,(::[DEBT_COMISS_PRC] all : commiss)
		all
	where	::[SIM_LOAN_PORT].[LIB].GETPORTBYCRED(cred, null, null, cred.[HIGH_LEVEL_CR]) = loanPort%id(true)
			and (	commiss%collection(true) = cred.[COMISS_ARR]
				and commiss->(true, [DEBT_COMISS_PRC])[DEBT](true) = ::[VID_DEBT]([CODE] = 'НЕУЧТЕН_ПРОЦЕНТЫ' and [TO_PRODUCT] = ::[ACC_PRODUCT]([CODE] = 'PR_CRED'))
				)
;

pragma set_column(C_DEPART, target_class_id, [DEPART]);
pragma set_column(C_DEPART_CODE, target_class_id, [DEPART]);
}