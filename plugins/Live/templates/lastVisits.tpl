{foreach from=$visitors item=visitor}
	<div id="{$visitor.idVisit}" class="visit{if $visitor.idVisit % 2} alt{/if}">
		<div style="display:none" class="idvisit">{$visitor.idVisit}</div>
			<div class="datetime">
				<span style='display:none' class='serverTimestamp'>{$visitor.serverTimestamp}</span>
				{$visitor.serverDatePretty} - {$visitor.serverTimePretty} ({$visitor.visitDurationPretty})
				&nbsp;<img src="{$visitor.countryFlag}" title="{$visitor.country}, {'Provider_ColumnProvider'|translate} {$visitor.provider}" />
				&nbsp;<img src="{$visitor.browserIcon}" title="{$visitor.browserName}, {'UserSettings_Plugins'|translate}: {$visitor.plugins}" />
				&nbsp;<img src="{$visitor.operatingSystemIcon}" title="{$visitor.operatingSystem}, {$visitor.resolution}" />
				&nbsp;{if $visitor.visitConverted}<img src="{$visitor.goalIcon}" title="{'General_VisitConvertedGoal'|translate} - {'Goals_GoalConversion'|translate} ({$visitor.goalType})" />{/if}
				{if $visitor.visitorType=='returning'}&nbsp;<img src="plugins/Live/templates/images/returningVisitor.gif" title="{'General_ReturningVisitor'|translate}" />{/if}
				{if $visitor.visitIp}IP: {$visitor.visitIp}{/if}
			</div>
			<!--<div class="settings"></div>-->
			<div class="referer">
				{if $visitor.referrerType != 'direct'}from <a href="{$visitor.referrerUrl|escape:'html'}" target="_blank">{if !empty($visitor.searchEngineIcon)}<img src="{$visitor.searchEngineIcon}" /> {/if}{$visitor.referrerName|escape:'html'}</a>
					{if !empty($visitor.referrerKeyword)}"{$visitor.referrerKeyword|escape:'html'}"{/if}
					{capture assign='keyword'}{$visitor.referrerKeyword|escape:'html'}{/capture}
					{capture assign='searchName'}{$visitor.referrerName|escape:"html"}{/capture}
					{capture assign='position'}#{$visitor.referrerKeywordPosition}{/capture}
					{if !empty($visitor.referrerKeywordPosition)}<span title='{'Live_KeywordRankedOnSearchResultForThisVisitor'|translate:$keyword:$position:$searchName}' class='seoRank'><span class='hash'>#</span>{$visitor.referrerKeywordPosition}</span>{/if}
			
				{else}{'Referers_DirectEntry'|translate}{/if}
			</div>
		<div id="{$visitor.idVisit}_actions" class="settings">
			<span class="pagesTitle">{'Actions_SubmenuPages'|translate}:</span>&nbsp;
			{php} $col = 0;	{/php}
			{foreach from=$visitor.actionDetails item=action}
			  {php}
			  	$col++;
		  		if ($col>=9)
		  		{
				  $col=0;
		  		}
				{/php}
				<a href="{$action.pageUrl|escape:'html'}" target="_blank"><img align="middle" src="plugins/Live/templates/images/file{php} echo $col; {/php}.png" title="{$action.pageTitle|escape:'html'} - {$action.serverTimePretty|escape:'html'}" /></a>
			{/foreach}
		</div>
	</div>
{/foreach}
