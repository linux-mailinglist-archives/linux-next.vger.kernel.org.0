Return-Path: <linux-next+bounces-3639-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C455C96E953
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 07:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 467AC1F21056
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 05:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B937E0E4;
	Fri,  6 Sep 2024 05:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="g33EDe5B"
X-Original-To: linux-next@vger.kernel.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2109.outbound.protection.outlook.com [40.92.102.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100B7433C5;
	Fri,  6 Sep 2024 05:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.102.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725600873; cv=fail; b=Ec67aAraCI8iuWb9AZMTvBIt+fXrFXH/wgBITxLspUADBc4EutOo9oYgC7w+qQyj1LIgrLvf19xj3dRfAtoCYR0vVdacf6g8iInMVOdheSvR7OWFmV8PTBQAsaGhA4ZTytWVAw5EdkTBNqEb+LNKvDHFapxtWKJMTWvBoP3JPSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725600873; c=relaxed/simple;
	bh=ECIf/VVbT/LdHqpanQI+ZPY5sMbWYU1xrEOcFG+6+Ic=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pmEsyOe7zao/CJmV/eYeyJ9w4OSRJTgXs7DXc1UJOMPOUi5S03B4KR0SmhtSMa2y3iNbedv90ziRbX5fvsOwwl4CuQDF3uKZazluxb8ZDNDdiXpC11XeotSWB5QA0/dKLV47QXY0HTT6jarECF6+C1PldTgaERegaOm5cHMaQOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=g33EDe5B; arc=fail smtp.client-ip=40.92.102.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFI6oZTgbs9YxeBLvEVxZgzcW5qqWa7GmNnX/XQT/sZRFpx6YQIcLE40BmoSFm7PUbh4fn0DKk5PAgHh1QHEA7ib5XHJKTcPrMBjZTDus5+De7EVzDEcYNHQkorJrw9jeH8lYr6zHmZ2uHs1HQaJvuB8LfoQaNMJKWK4qMDUMTF0AcOu7YAwlzl/Fq6ywl1vAPg0ZvqdTL3509Dhf8NIxM+AFS7OSAFDmrRCCX3/0Uzn7o9DH6Tv0mMoMxBmmKNYRnFybd5yea7e+XWrviL88zUz9+O09B9HfgqYKbH5hYOCBuOpR0h/V57HGhgTHQFz8BqyH8F6krOWora7J9rS5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aL2NTZIWnJ6Um64pBO4gPbgGCB3FsIElak4LIwKUaNE=;
 b=FTb9scJGHi5XCPHObRzlGv1xx3yzLASSBXokFtIBMPZta04XkYv3euhj+GGiSa24pUA4BjoV7tfUIH1oK2b1CxrF6lOMVJeq/4b2qxIILFm8JKjj877qNxboV3bp/b/gtaMxO/+6aqCwHkprQNweYEx2xn6sF3TY2xImeoBly2K99qFUqmM4WXKLGLNgZXdf6g4U39iUptdyBqPr22pIsR//kVFW39T9KUqpGA3cqGTIbQkHM/yH/TM9OzTC29xt7lIyYwtVba+SjNL+a8vxabRxo9UjPDUPtAO10feAAlxB2hMC8iPoUQCMTAiKgNZiDtSTZHFdPDJ3nC6HJoKtTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aL2NTZIWnJ6Um64pBO4gPbgGCB3FsIElak4LIwKUaNE=;
 b=g33EDe5BrtIAQCnmMNOcp2zf+LIN7pFL0RI0VMHen84watxGvCefyhWEiwT7Lc4G37SkJ5LSeg2dDCD3doJkfXzm6hZODmrvnrhGcKy4PPR/u05HsoCkxwtrN9g+OvvdWpbu3QKb76mSja0LYMjVoFVolmDtrUFcL/fgfkhXpaOQ++0/JGwndq4OaqNITPq467OVSmhmYpqqR44HbCUGMwKVQeiHgzsjOn/l3gLp/PbDG5dKHgJ1N9ZhcXwKn/BUF1vg3C1WlsjGLm42I21w4QCsdibReFKtslyCRbvYN0Fsh+UCiyvPzhdT/LQF97ud/UV0F7anf3XeQJ1yc+1/9A==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN3P287MB1032.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:17c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Fri, 6 Sep
 2024 05:34:27 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%7]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 05:34:27 +0000
Message-ID:
 <MA0P287MB28229FEF2DA245AAA82DF5DBFE9E2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 6 Sep 2024 13:34:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patches in the sophgo tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Inochi Amaoto <inochiama@outlook.com>, Olof Johansson <olof@lixom.net>,
 Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240906120436.74ffdd06@canb.auug.org.au>
 <MA0P287MB282200D15F3A93CE187FA66FFE9E2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240906134030.6c440803@canb.auug.org.au>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20240906134030.6c440803@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [JaT+l/xwnos1wFOuJD3tQ5I4OwoQV9St]
X-ClientProxiedBy: SGAP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::16)
 To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <f2942a48-c37c-470f-96ee-0a1d156734e7@outlook.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN3P287MB1032:EE_
X-MS-Office365-Filtering-Correlation-Id: f1942661-4aee-465b-af35-08dcce35929b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|19110799003|461199028|5072599009|15080799006|6090799003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	SvCoKgCWNpEiwGVKz+xunBpTJSgrYL/M/rG3TpyKSKu7H/954L9rsEivHgq9KBEljYO5oUTjk+ecUoGUFFgSTsNWPlud/+xvesAJoJmQ/Et2NHNDmTOTzdIewXTXTmyocsVWTuwuSjzW4HeMHyRrxYBYzPN9CbbyWKfftDKfc8wp6421ImgX1RcnIptGDrxKiMPNs5QSB9S9rTDIqYfwkkAnOsKcMKBI1hPVUntwxrDoybRNKgJXzlaNAiJQQckXuaqkT/XX3U3zZuYLf6awnFt/e+W5F7mrQcgY7u8/m1Kt/hvQu+QGly3lgSjLGlHXY8RyhdyU+KpTdt+DSG/5wuxD573qk3kYBSdUqIq8EBLwPy9ZF3ujbauxlFyLekf17TFywatMgItWr4YyPZ0wK168U35TCSGLzBbkuISt2XiIr7cqAg/GfAwKnbPJm1zC/EfpCQ9PbIswRXRfaqP/ctvMcyNtHmurI9xLWPTXruG6fflQC2+f84678IWXiyGOlLFQ0RV+iGt/6TKjmRMZJNDEmDGFUAoh3Yyr5rz/+DBVi4lhecEx8rfKgklq28FSiCTNdd45RWTZclwRB5rN0n7JhXyyWaAyWWLyCvbTphguhDT9zX8kqvcy27ZH8zHl53o48Inl0ouw4b5viWz1T0RNpX1xWz27KMc4ZaJCG6Kjy/eZYrLSP9nLDh1T+W68bUh71O45kWA6Zz+oKO5j4l7L9CZX8mYgvQwNgbtPKDI=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEJBVG1hNDI0SUlhazFKOU14Y3U3VUwwYllGZ3JVMExydU1nbS9PTExPbGVO?=
 =?utf-8?B?S08ycTVvQUdMOTlJQmZIVHVRYzBYWWkxZExjSDE1SS91ZGNnMmRPZ3IrNC9z?=
 =?utf-8?B?YnpNa21wamIycjEyUVkwdHd4UTQ5OEhYNjBzUG1BaW1mY2V4dmZoN081Qklz?=
 =?utf-8?B?OU15cE0wMXl3d2dKd2lmN1FLU2ZtVCttMjBZQlVSdzFlTmo3NFhOUENmU2Za?=
 =?utf-8?B?d0V2cVZxQkFKbW8zZkN5MWw1ZEpXUEpLT1RFZVBWN3FoS1I5ck1scjVoQ001?=
 =?utf-8?B?NEdjbnpiNmdSUmhEYnFybE9HVVVFRDJZYm1jNUdGNXhRSlBaU1RFaFRXSE8w?=
 =?utf-8?B?WTMrSEc3dk1CL1N6MmhvTGlNZkFYTUo2ZDZIWWkrRjlxZnBsMm1oSkc1SjNQ?=
 =?utf-8?B?MkVOQ0tlb0ZnZFpxRW9IUGVENG0xRFg0TEdxM0s3dDhORFhFMG9NRG5FWlJ5?=
 =?utf-8?B?bS9relZLVGFtTWlDVEh5TElIZzlYR0RlOSszYWZlajlra01NVmxUcjQwY2ht?=
 =?utf-8?B?eFc4bnBxWHBHTEhUVEtCekU3TmlGNEFhVlhldUNJbmtieDA0U0FzR2Z5Uis2?=
 =?utf-8?B?OFdRVGJqbkZWT0lZWHRRY1ZHNWpJYVh2T1Y4MCttYnBSYUhTT2hneVR0bDlt?=
 =?utf-8?B?ajdDbmxRY1NsN1NvdTkrYlByVEM2QWJNN085SGNDZk9QaWU5aS9ycXl6Mkdp?=
 =?utf-8?B?Q0RFMUJ0NGU4TDlQZVB1VmsxMVpjRElUbmx4aHArYkI2WUU1eFpCN0tZL21i?=
 =?utf-8?B?OExhcCtKS1BHVGI2WjRNNzB2MzR0TlJTRjdNSTdLR2dFRVhocER0cHl0TGw3?=
 =?utf-8?B?YmY4bWtSRytOa1J6VHdSd3crb1VwOWtLZFhEV2UxaGtVQkI0WC9YVW1aQ2lo?=
 =?utf-8?B?TEdqNTRrOFliY1ZBUVpsVytYYnpmN29mZDBRc2M4N3lqdk1tb3duVGtVQlJh?=
 =?utf-8?B?bTkzNXA0QzBjNDJ2MUhBMDUybi9NNFk5cFE2SE9XU0NGVXBQLzF0NG1DSlBw?=
 =?utf-8?B?ZzVBNXZLUGE5KzZjZ2FiT2srbUhva3pORkJ4ZmpoODVPKzBOTGhnayt5Skht?=
 =?utf-8?B?d3l0ejJ1WUIxZ3FndVlCMDNKVFRaSWhEaWg1SjRpaWp2Y3V5a3BieWF4anha?=
 =?utf-8?B?ZlFjaU9UL09WSmpIV0pJOHZ0L2h3cjBBdDJLaHFTdFpDTnRsTHprTUN0TTlN?=
 =?utf-8?B?QnFIWVIyZDBUTHpjN0JvbkxLMU03T0t2T1FNamh3Y1FNOTRRUEVNNnByTERR?=
 =?utf-8?B?dWtPdlpWQTZ4ekZTMWhhTG1idHQ5OFFtN3RDNDBmd256UHJYRXA0YTR4TlJH?=
 =?utf-8?B?alNMclQzN1QrNGtJQzZYRVpETkhQdzU2czNtWU1yK1VJRS92SFBjUWdYeFkw?=
 =?utf-8?B?YUtPN0VKZE5vWUN2a2E2TitsbFlEL1BMQW8yVjZyUGY5TFh6enVJUEw2VVFH?=
 =?utf-8?B?cG5sNjVtL1JoY1E4RjdtTkFvbTJuU1I2U2xhRGNhaXFNWWhXQWhnNHJ5aXFV?=
 =?utf-8?B?eUhpZHNoWWFNVzlrUmVxa09PL0pnbXNaL2pCWTE5T05BUitoM2hBMVUwUGcx?=
 =?utf-8?B?Sm1QUS9UczBXSjJtc3prOWM0bnR0dHA4TWZ3dlBGYm8ydjBuc2VPb2Z2ZGVL?=
 =?utf-8?B?cklBbDdRR3NzSSs4c1Fzcmdwc2dpOC9XckdoaExvb2htVEd3VzNIRUl0Q1ZW?=
 =?utf-8?Q?7VyqnX7ZVYnulhshWyPe?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1942661-4aee-465b-af35-08dcce35929b
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 05:34:27.0441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1032


On 2024/9/6 11:40, Stephen Rothwell wrote:
> Hi Chen,
>
> On Fri, 6 Sep 2024 11:24:14 +0800 Chen Wang <unicorn_wang@outlook.com> wrote:
>> The arm-soc tree contains these patches is due to I submited a PR to
>> Arnd and he merged this today.
>>
>> And for the sophgo/for-next branch, it does contains these patches. I
>> created the PR branch(sophgo/riscv-sophgo-dt-for-next) and
>> cherry-picked these patches from sophgo/for-next and submited the PR.
>> I see the commits in arm-soc are the same as that from
>> sophgo/riscv-sophgo-dt-for-next, but they are different against the
>> commit ids from sophgo/for-next due to cherry-pick operation.
>>
>> So my question is, do we need to make sure commit id the same between
>> PR branch and sophgo/for-next branch?
> If you are submitting everything that is in the for-next branch, you
> should just submit that branch as is, that way you have submitted what
> has been tested and all the commit id's will not change.
>
> However, if you are submitting a subset, you should probably create a
> branch with that subset (as you did) and then rebase the for-next
> branch on top of that and then test the result yourself and then let it
> it in linux-next for a day or 2 (to check for any new conflicts - there
> should be none).  After that, you should submit the subset branch to
> arm-soc.  This way (again) you have submitted what has been tested and
> all the commit id's will not change.
>
> Right now, you should rebase your for-next branch onto your
> riscv-sophgo-dt-for-next branch so that the duplicate patches are
> removed (they will be the same commits in both trees).

Thanks, Stephen. I have updated the sophgo/for-next.

Regards,

Chen



