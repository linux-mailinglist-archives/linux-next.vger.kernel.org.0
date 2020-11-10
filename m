Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2D792ACEB0
	for <lists+linux-next@lfdr.de>; Tue, 10 Nov 2020 05:57:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731115AbgKJE5V (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Nov 2020 23:57:21 -0500
Received: from mail-dm6nam11on2055.outbound.protection.outlook.com ([40.107.223.55]:63841
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731712AbgKJE5U (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Nov 2020 23:57:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXbxBbG/zSjyQWdqIGFcqIDs4kqdIktVkfoYsGKZprLdiBFi8z9+pk97JbKxOeoCLPt8j596h7XC0FE6vNi2SR58wDH4WkrpYSj7rGOjkcXtWGFKL1BAk9YsXLiuI7VV1Z494kZn4LYwNLqtnAq3/OGxcSP9C4Ib2kxpk4VQpOQRKowNfbNFag1Do6b+u8k+BRIaUOX9fOQtf+q3+gyeaQid5pFYXFk+i9MoujmjIfJgNLej0S6XXdkDzKzQKYG43uzJ2pBoyJXaeOsEERaIibnfZlxPO0wR07I9WUf4oMz9RYntLIbyBl96LH3e1g5KyFPuwRbG56MQou3bmpcM/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47EZMDEJMPiITpH/T56uGNlQphdWgwnU3J9rT3oYID4=;
 b=EBrL/DlEaKujll//CTwoO75/q3QSAeHGuJn06VJICSuJYOdLEgKoPc5I2hjGVAlwlb3zOzjCCRORyEVlsQ+mtUP9Harj+enMSw3g5gog34Kp6TTLlTjw+OPlhKOFvdi1mhYfA4Hyf6wOYY8eYR0XR7+R0n/ATZHmhsEA8N2tgOGo3oFp+axyK17l0X0JIZXuiorJOWRwbxdhy2SOI5xDfVtXOhijpGUHDLZP2PiQFQ/a+pNyVCFVIf0Up38oMoaHfmqGZYnQiJHKyiECaXuzc62K0kYi0PzocJuGJtr2ZHDqlDpR+QWwwaW50RbfqekDILWaNEdGmb1tu2U5jLkdDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47EZMDEJMPiITpH/T56uGNlQphdWgwnU3J9rT3oYID4=;
 b=FLWQDlAcc1F+AMn4qJ8V9IHJyKA03VJnGokTV/E0FpXRpOts4kZo4MRvgPpA4K7Rj6tIdmQrngF3eG+BH1v8DU7Ev5Wl3AYmhVLtU2I6vY5zmFNFBSs/a0Vm2F+a7iJgZzMqPwxdWrtyAAICzpDm5YkRCd7SvQXCY7t0k3H12ko=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14)
 by DM6PR11MB2827.namprd11.prod.outlook.com (2603:10b6:5:c8::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 10 Nov
 2020 04:57:17 +0000
Received: from DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::4985:c74a:ffcb:6f40]) by DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::4985:c74a:ffcb:6f40%4]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 04:57:17 +0000
Subject: Re: [PATCH][next] cpumask: allocate enough space for string and
 trailing '\0' char
To:     Qian Cai <cai@redhat.com>, Colin King <colin.king@canonical.com>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201109130447.2080491-1-colin.king@canonical.com>
 <737d5be9eb5af55b1a61bd8bfb49b1829a3ff916.camel@redhat.com>
From:   Paul Gortmaker <paul.gortmaker@windriver.com>
Message-ID: <e0458a3f-7635-bc80-9496-731bdfceed0d@windriver.com>
Date:   Mon, 9 Nov 2020 23:57:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <737d5be9eb5af55b1a61bd8bfb49b1829a3ff916.camel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.212.228.244]
X-ClientProxiedBy: YT1PR01CA0085.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::24) To DM6PR11MB4545.namprd11.prod.outlook.com
 (2603:10b6:5:2ae::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.168.171] (24.212.228.244) by YT1PR01CA0085.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 04:57:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e25e7e3a-795e-4994-e520-08d885351918
X-MS-TrafficTypeDiagnostic: DM6PR11MB2827:
X-Microsoft-Antispam-PRVS: <DM6PR11MB2827B1EC02609683D84E6BF483E90@DM6PR11MB2827.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vSWCLt8g5xLTrs++C4nJAKaUmwkNkaINHwi5goZvyNGdzg6CBxAGJ1MKbNm/3L7o4siNyMO0xg4QOaBJAys/HJmDPTCXEVF2zbMXENxcbSdlZL5dc7ykL/UDqFl4K2rTed5r31aUE8Ijv3C5eHL7EP+nOlM5euJUkuu/ZnGUU01zpiZaGu440W2nKhd1i3HyMl2urC9jr2kh9QEpI1rzqM8EwRZd9x+BB8mdCW8EqALzED8oRcaH7laPelNfJ0PZ5Dfl0aoBxdbdcHMIayN6JxSUAzfhtNH+EQmxHXGYmZC6XT3acgCwD/rotCOp9Hs6e/2+F6JluHq3kLmbX3i9fpDbZnBMnWXxNQB28dAjlF/t/PBW8z58tX3QEpY51YyI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4545.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39850400004)(396003)(366004)(16576012)(2616005)(66946007)(6486002)(956004)(4326008)(86362001)(66476007)(2906002)(8676002)(31696002)(66556008)(5660300002)(478600001)(8936002)(52116002)(186003)(31686004)(316002)(53546011)(110136005)(83380400001)(16526019)(44832011)(36756003)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: G5LVnAGTXRqKCuutnBxVv1u4rhR3UE4o2kBD7uP/097dhM0wrsv5AYJxuuOBZBjJbZ9iz/8h6+r4rYqlNX7NXkmxwY73Q4OcjCA8UIQVkdg9oCH4GSwT5X11JGhcHQp8NPdBs7N5R1rXwgZ1MV9Vcx363g9XjoToh6BBW1oU3GEbUcc+MCgYvc28eRwlAIuQc+imOTnVPfiPWVZhaiTVEcjBwcVSBbvPMHYoC2juYI4YiBn41iMjm+Rq1KjS6bgb82E9yykP9bso6CdJfNgfys6h2oML8s34XKnHT2S5CFezwklWcZfQckWghC5+uLuaa+jVqglvrYacN6aAbf9NGex/x7UWI5BNP3gv5AvWUx8NL01gT3vUliwEXiSS7/F1gJtQ9GpcBnKhD6eDnR6XfG5Mqy18gMLB/31tAzjTpdJ936MWwW5ophRSSVNh3cwaUWlFZWswVGPXHw3mHQTOA0yN7qHwakoJgaU/eF2irBUw7AYztUtSgYiJMfie9RPMBrmBp5y1Ix1U0yLhRk7gS06D0Z6YyqNgTn+n6ncr/pNL96Lr+yG8PJ3UEfaK6KQRyX3R5xM0NIK2R5kAtYmbnd0WIDoSEbzQJO3lYhE7HXKNuL+ztY+yP7APUa80/KldA31bsTz62ccJsze/ttw7gw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e25e7e3a-795e-4994-e520-08d885351918
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 04:57:17.4873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jL3peNmkdb3u9l1Tr5ulez9+MK5pwSEhRP9D/VnRBHC5JgQ/MVhOBjY8pLe14okZOLCs3MzduejftxLTFafOVL/UM6Bp3ZDa7x+ZnKg+HN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2827
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 2020-11-09 8:07 p.m., Qian Cai wrote:
> On Mon, 2020-11-09 at 13:04 +0000, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently the allocation of cpulist is based on the length of buf but does
>> not include the addition end of string '\0' terminator. Static analysis is
>> reporting this as a potential out-of-bounds access on cpulist. Fix this by
>> allocating enough space for the additional '\0' terminator.
>>
>> Addresses-Coverity: ("Out-of-bounds access")
>> Fixes: 65987e67f7ff ("cpumask: add "last" alias for cpu list specifications")
> 
> Yeah, this bad commit also introduced KASAN errors everywhere and then will
> disable lockdep that makes our linux-next CI miserable. Confirmed that this
> patch will fix it.

I appreciate the reports reminding me why I hate touching string handling.

But let us not lose sight of why linux-next exists.  We want to
encourage code to appear there as a sounding board before it goes
mainline, so we can fix things and not pollute mainline git history
with those trivialities.

If you've decided to internalize linux-next as part of your CI, then
great, but do note that does not elevate linux-next to some pristine
status for the world at large.  That only means you have to watch more
closely what is going on.

If you want to declare linux-next unbreakable -- well that would scare
away others to get the multi-arch or multi-config coverage that they may
not be able to do themselves.  We are not going to do that.

I have (hopefully) fixed the "bad commit" in v2 -- as part of the
implicit linux-next rule "you broke it, you better fix it ASAP".

But "bad" and "miserable" can be things that might scare people off of
making use of linux-next for what it is meant to be for.  And I am not
OK with that.

Thanks,
Paul.
--

> 
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>   lib/cpumask.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/lib/cpumask.c b/lib/cpumask.c
>> index 34ecb3005941..cb8a3ef0e73e 100644
>> --- a/lib/cpumask.c
>> +++ b/lib/cpumask.c
>> @@ -185,7 +185,7 @@ int __ref cpulist_parse(const char *buf, struct cpumask
>> *dstp)
>>   {
>>   	int r;
>>   	char *cpulist, last_cpu[5];	/* NR_CPUS <= 9999 */
>> -	size_t len = strlen(buf);
>> +	size_t len = strlen(buf) + 1;
>>   	bool early = !slab_is_available();
>>   
>>   	if (!strcmp(buf, "all")) {
> 
