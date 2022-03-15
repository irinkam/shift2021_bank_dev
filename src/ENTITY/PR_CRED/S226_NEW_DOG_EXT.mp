<?xml version="1.0" encoding="UTF-8"?>
<MethodPresentation classId="PR_CRED" formatVersion="1.2" shortName="S226_NEW_DOG_EXT">
    <Properties>
        <Destructor>PR_CRED.DELETE_DEFAULT</Destructor>
        <Hotkey>Alt+Q</Hotkey>
        <Priority>100</Priority>
    </Properties>
    <Parameters/>
    <Variables>
        <Variable shortName="V_CRED_CAT">
            <ViewClassId>S226_LOAN_CTGR</ViewClassId>
            <ViewFilter>{&amp;C_CRED_TYPE} is null or {&amp;C_CRED_TYPE} = [P_KIND_CREDIT]</ViewFilter>
            <ViewShortName>VW_CRIT_S226_LOAN_CTGR</ViewShortName>
        </Variable>
    </Variables>
    <Controls>
        <Form>
            <Properties>
                <Caption>S226. Категория</Caption>
                <Height>105</Height>
                <ValidateName>Form2</ValidateName>
                <Width>397</Width>
            </Properties>
            <Controls>
                <Object>
                    <Properties>
                        <Caption>S226. Категория</Caption>
                        <ClassId>S226_LOAN_CT_REF</ClassId>
                        <Height>24</Height>
                        <Left>12</Left>
                        <Qualifier>%VAR%.V_CRED_CAT</Qualifier>
                        <TabIndex>0</TabIndex>
                        <Tips>Объект: Категория</Tips>
                        <Top>8</Top>
                        <ValidateName>ObjectExt1</ValidateName>
                        <Width>140</Width>
                    </Properties>
                </Object>
                <Text>
                    <Properties>
                        <ClassId>STRING</ClassId>
                        <Depend>%VAR%.V_CRED_CAT</Depend>
                        <Height>24</Height>
                        <Left>165</Left>
                        <Qualifier>%VAR%.V_CRED_CAT.NAME</Qualifier>
                        <TabIndex>0</TabIndex>
                        <Tips>Наименование</Tips>
                        <Top>8</Top>
                        <ValidateName>TextExt1</ValidateName>
                        <Width>212</Width>
                    </Properties>
                </Text>
                <Label>
                    <Properties>
                        <BevelOuter>0</BevelOuter>
                        <Caption>Коэффициент</Caption>
                        <Depend>%VAR%.V_CRED_CAT</Depend>
                        <Height>24</Height>
                        <Left>12</Left>
                        <Qualifier>%VAR%.V_CRED_CAT.COEFFICIENT</Qualifier>
                        <Tips>Поясняющая надпись (Коэффициент)</Tips>
                        <Top>52</Top>
                        <ValidateName>LabelExt1</ValidateName>
                        <Width>140</Width>
                    </Properties>
                </Label>
                <Number>
                    <Properties>
                        <Caption>Коэффициент</Caption>
                        <ClassId>NUMBER</ClassId>
                        <Depend>%VAR%.V_CRED_CAT</Depend>
                        <Height>24</Height>
                        <Left>164</Left>
                        <Precision>2</Precision>
                        <Qualifier>%VAR%.V_CRED_CAT.COEFFICIENT</Qualifier>
                        <TabIndex>0</TabIndex>
                        <Tips>Коэффициент</Tips>
                        <Top>52</Top>
                        <ValidateName>NumberExt1</ValidateName>
                        <Width>212</Width>
                    </Properties>
                </Number>
            </Controls>
        </Form>
    </Controls>
</MethodPresentation>
