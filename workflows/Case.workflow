<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Email_Alert_1</fullName>
        <description>Email Alert 1</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SalesNewCustomerEmail</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_Origin</fullName>
        <description>CLI Update</description>
        <field>Origin</field>
        <literalValue>Email</literalValue>
        <name>Update Origin</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Org wide alert</fullName>
        <actions>
            <name>Email_alert_from_wide</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.BusinessHoursId</field>
            <operation>equals</operation>
            <value>Default</value>
        </criteriaItems>
        <description>Description for commit in UI</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update origin</fullName>
        <actions>
            <name>Update_Origin</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <description>CLI Test in Org</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>WF email alert test</fullName>
        <actions>
            <name>Email_Alert_1</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Escalated</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>