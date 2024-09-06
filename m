Return-Path: <linux-next+bounces-3642-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7494796ED48
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 10:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB066B21089
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 08:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A473156677;
	Fri,  6 Sep 2024 08:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Qe+aW9WI"
X-Original-To: linux-next@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2102.outbound.protection.outlook.com [40.92.103.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389DD3C463;
	Fri,  6 Sep 2024 08:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.103.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725610356; cv=fail; b=QLzwW/+/OKBt5+efnDFAj0yZRXKwIU0xzOqGptqUhGJUmNNWejvxRPlgBASAUKYdrtwblgl/E/Pqj+9SKCl7OM4SJPY3RVfybL8gmTytGquHoddKRav6yenOeneeG852Dz7it+g7OkX8mfxObq4/l2NOkpq1XVUn0N5KCCeq2oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725610356; c=relaxed/simple;
	bh=LSTeVSV7ICtefU4tq6fb1rMFizBY49Fw3VhA5Hn1w2k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=D+vKDEoBQVECpVugrHn39XPv0khyooGo2QlBUF/JeNa07pObFaEsxT5I/CR1qkPKBP0wKPRmVOOyNjbQ57hYYqB5oaNVyTZ/+y1dZUE+xzvXisYJzBJWoVd8738DjUZfKxbAVuMQak3LPriNCxkmNLQXmEpVkcHNT/pmGHVnV74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Qe+aW9WI; arc=fail smtp.client-ip=40.92.103.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xT4VGEQuVfcS28BjbZqkaXefejPpXFZryA68iv+LbGbouzELM9HYsGGFJ7afov6aZ5DJ9sz+1lEHfGyeJq+3F8Newd5Qb63++v/yN3fTWy/vRhG870YqBJgiJSAHq0SdwV+5bdnlbx++zVqs6ld1H3EvB9VQHjXHVcJOQ6EHXVc52fMhj8ltnYslnVDy+3gfY5qjUNKDdSFqmcWOgys9zmBYHeCN8lCtT3EH2L6frbETmgBEDBVKXIKVR1rK2JHTAZEp6SZ8doqJsJ+JEdatb3fMYK1CU9uZVkJPjVU5O7vhH/1p14b/xv+L+msgUUU1NYJQ2Sh76OLdXBUOqKk4QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8Ok1rLKZXpo19bkgfSFY1tsRe9t1kGf0rJPMAK/En0=;
 b=jbHvHeZDY0tWV56p39aM23KCDqy/L2SMOA9CdkL8Qt0LJ8H1egWXdijUpmTMlfb/mZm7wJvLWtD0gxOnKmooNJuoRmvTF01MbUSC4dZcK7e3nqnrA6ePdVSMJbCLrDFHYKOjAOD/1pi6Qy9TThqRKgCBOyLVTTycU/QsMB7XKPt0pX1nCORWe6aAOyoxF8oP7RpddbkesKpGyqB/R0KWV66EzUVsOY9JE4nXNljz+lwFYJYFHdQ/EYEPlUTRAmgikD4OjtXrD4tP4u30ls8Af/GIgpbvh25aMXuHe2WM+7dCnpUegHcqmB75S1tLgMBvwxUFdqfBJJkVIJTowFZgYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8Ok1rLKZXpo19bkgfSFY1tsRe9t1kGf0rJPMAK/En0=;
 b=Qe+aW9WI8dv6a3ZKUOWbPMIL+90s7aEaoWo9MFMrsssuGsGXdacdsGk30kvmVMjA35JAGUgOFv2GkIFD3QDGkRxJAI5ux/YNU6QcU/BsFvkYZ8wC22cQMR1ZHTXCvdbelauaGDeP5eywaGdiOWMTLnVE8BxR8VkfqDhVvTUMPdearyaijvzgxoPlBeXgmRvy9oY7D5pcgMlUpoKwStzMJb3zHBGN5nDRMPXIzYhtZ+pxCWdU/xq9QTX/S9a88f1P6EWSnLcIDG2Uu1E1WeDEspcPpYvoWjLaOR7s0w5hQIyXUG03FNaI2EHlEJ8zt2C9ZnoxPzC+bZwARCJ1mmB38g==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN2P287MB1081.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:155::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Fri, 6 Sep
 2024 08:12:29 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%7]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 08:12:29 +0000
Message-ID:
 <MA0P287MB28222124EBD67F5B036943EDFE9E2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 6 Sep 2024 16:12:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patches in the sophgo tree
To: Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Inochi Amaoto <inochiama@outlook.com>, Olof Johansson <olof@lixom.net>
Cc: ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
References: <20240906120436.74ffdd06@canb.auug.org.au>
 <MA0P287MB282200D15F3A93CE187FA66FFE9E2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <9b83c044-5f22-499e-94a2-1c81f41cb620@app.fastmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <9b83c044-5f22-499e-94a2-1c81f41cb620@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [QAyg2tZyqY8jseHwIVuvkmpl2i+mbUWK]
X-ClientProxiedBy: SG2P153CA0029.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::16)
 To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <45ab2254-277b-43a8-b39c-ffec4d756cf9@outlook.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN2P287MB1081:EE_
X-MS-Office365-Filtering-Correlation-Id: a666d73e-0435-4633-a07f-08dcce4ba694
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|15080799006|6090799003|19110799003|5072599009|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	vdyOY/sqn5dorcjf/07r8r5uXPMQLW3CjgA9R8OnDoyGCIT5ifTzdOOF1OXZVMOL4x3AG5bK2KrEsEprkHJvZru8BwpbXEPd8oNk46nVBEfMwXH2pT8vnP0h5o0RSSXBDvwNKN7Wd2wClNFdAp8sbC3I/C3f1kMue5UejmUZX39dv7QBr1ed9DntQjFMPsLffThInpZbrYZb4+BUwAJZFHAyLjO3SAGtD1WpjvnN36Y/5/YqzHBVqWhuwMS9d44htkYOulEaQjVepEw6zm1DWrdHbwEksG3ojESxqIuCrIvuHdOR1vTSJw/lVp0b6BvY/6dwUJuhvQY0bvV582VPO6oBp/6J2hmgzKdvhM8sOt6M3v4KHdzAuAlf7hVZtt5VDpv3nT8wXlmIfGH7iC7pA6im+Bn4VRinsoSNEpvOSKby2PDDpOpC6Ae33J5ClxiMnp/oj7akw8arZ/SfGMJ2XtuPy5SwB8QAe7LDtg/ijlWGnRQNwZYyBUD63jAQrulCpLSrkdOnfuSGa+7KUPoDrjivSLwwZWHu/81xbhb60fcwuCFiXd5nkv4/DPac3aPPgqYa3BjxkOvV770/4K5wl2FZvP1Hlx2tjWk2EgPo5XDJtQ4Ujb7Vl59PeOv0mHuuRjVyNVbzin7/p/H4YlYnsocDcXbYVVUBU8e9eL83u25pfBGLKrGpj5nVZc0SaFL+kbW+kWpcAaThVUGlC9strHYravZA3jvWxczsYJ4Pj6c=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tjl0bmJvUGRBb3RBL1hRSmh2Z0pwOGFpenVPQmVrMSs1WUs3VStpejE3VHZ5?=
 =?utf-8?B?cGFnYW1ibmxEMkF0SVZyOFdCTkJKQWpqUGRGVFA1TUNFQThuMG1sajRrQ1pz?=
 =?utf-8?B?S1FHWnhHSkU2Zng0WnhkK0d6VmFvQmVlZUZuSmlpVDFPSnQrQmpVakc3Nmda?=
 =?utf-8?B?NWwvYld0aEo3ZWdMcFk1VjQ5c1ZqVnRIRVpVdWpFbk1NbjR5UDZOSktYMjlw?=
 =?utf-8?B?OCsvelVyN1A4b3RkTnNWZEU4Uy9BSzJLejJ0Yk91bXpEQU96YWdSMC8zaU9n?=
 =?utf-8?B?TGhTcHBZM25icCsxQXZmT0FXMDI1T0xoaXVaek56Y2RYQnpvdDNGc2J4SzhY?=
 =?utf-8?B?MC83L0NRK0NvbzFHR1NFaGxVRmIyZVNNb050bGcxS0gyazdIUEgrNTRZdXdq?=
 =?utf-8?B?UVNNY3d6UmxsSURXZWpmZC9rZEhiRVBMMUhoOUMzU2FKYXpCbTBLVldOaCtT?=
 =?utf-8?B?d0RuU2pCVlRnZ2VqL0t5bUNKc1lxaVNKdjltbFVJaEZLb0NURENFZG5PVzls?=
 =?utf-8?B?cHZOU29lNW0vdVJMVGhWVER4LzR0cTFueHpDaTI2T1dxZkRwOHVKUXI5eDRt?=
 =?utf-8?B?SzVpZzhqY2JabGNMYVhSMk0vUEpGQlZ5d0pVZmZ0M0ZwZkVKK29kOFVTdlJj?=
 =?utf-8?B?dytsQm5pYVRJYytXYWtIOXh4L05nS2lXbFQ1TGlKZVNuTDA1Q2cvaTZ3YklG?=
 =?utf-8?B?OHl4NWlGWksrSzRGVERoMWEvelB0WWJLSERoZkxQek9zMWVyRTcvUncyV2gw?=
 =?utf-8?B?WVVOd3hVd1ZZSmFCUzNjbXJ5N3gwakJzWWtkQ3ZucnRuOHh5REJUQ3crd0RX?=
 =?utf-8?B?UTdtYlhjaDJ5UkIrNHVkN0hITWhNQmRPcEd5NHRqRmhtMkFDRkZqcUM2Tnlr?=
 =?utf-8?B?ZnB2eUYrOHp0K2VTTXBUVER2aitac0NwNjRKYmgxS0hMejdzR2NtcTEwT1hZ?=
 =?utf-8?B?anFldnRDTVpjY1Q1QjA3YW5Xb3d1NlYycEEyOUZGN0xQdlQ0SWJ5Q09NNWIz?=
 =?utf-8?B?Tjg1L3JacTRqeTN5YytUQVIvTUZJbWl3K1hYU3g2QzFVVzh2SkRoMTBGS1VC?=
 =?utf-8?B?cTZGSUFsdVY3VXA5ZHRkVGJiTFJLM0hkd1pPSHorR0Mvd2FSSDFZdUJtTUc1?=
 =?utf-8?B?aU9tMDBZOW5nQ1d1ZnBvb3RCYzhJZFRmRFRrNDViVkhhSTZyVFExbndDT3JM?=
 =?utf-8?B?b2ZwZmxOVHNOY3dYT1RCbkxodTVhU2EwM056QnBzcnZOVFJOS01xdlhUSFJ4?=
 =?utf-8?B?a2xVMm5tbEQydzVFZFhUU1lUOWtxTERvZ3JBOWNTQ0trRkxQQjU2TmgzRWFX?=
 =?utf-8?B?L3hjYmNoWnVnMDRlYjE4OFZ5UnpyWERNbmV4MXY2U1lsOGZ0dXY4aGo5dFNI?=
 =?utf-8?B?aWZsUjBUZ2NmSWU2cE5mL1pUUTQwZjhCMWdLUE1hTVpNOFZoZnBRdTZYSUh6?=
 =?utf-8?B?UnV0ZGpGejZSZFdybkt0NHZJd05PMERadXNCV3A1NlVrSEpHMkVVbU1nbDFy?=
 =?utf-8?B?aHUrRXRFOExHREJyVHkzM0lCTXJwZm9SajBuVkpxbWttdVBSMHVaenhET0F5?=
 =?utf-8?B?bVZqL2xMc3Z4bDkrV1RPR3hoemU2NHVrYXdpY2xxdklSNGdGQXlVYXlWclJ6?=
 =?utf-8?B?YXlmcWxGNStKUnVpdmE0OTNDL0RCN1BVRGI5Vm1DOEVNeWJ0OHNnc2cwc2dh?=
 =?utf-8?Q?z7p0F3stg8SjdNiYRFZY?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a666d73e-0435-4633-a07f-08dcce4ba694
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 08:12:29.4991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1081


On 2024/9/6 14:54, Arnd Bergmann wrote:
> On Fri, Sep 6, 2024, at 03:24, Chen Wang wrote:
>> Hi，Stephen,
>>
>> The arm-soc tree contains these patches is due to I submited a PR to
>> Arnd and he merged this today.
>>
>> And for the sophgo/for-next branch, it does contains these patches. I
>> created the PR branch(sophgo/riscv-sophgo-dt-for-next) and cherry-picked
>> these patches from sophgo/for-next and submited the PR. I see the
>> commits in arm-soc are the same as that from
>> sophgo/riscv-sophgo-dt-for-next, but they are different against the
>> commit ids from sophgo/for-next due to cherry-pick operation.
>>
>> So my question is, do we need to make sure commit id the same between PR
>> branch and sophgo/for-next branch?
> It certainly makes things easier for everyone if you have the
> same commit IDs, yes. Aside from tripping Stephen's sanity checks,
> having rebased commits in your tree also means that the branch that
> gets tested is different from the one that gets merged.
>
> If you have multiple branches that you want to be in linux-next but
> get merged through different upstream trees, your for-next branch
> would normally just be a merge of those rather than a cherry-pick.
>
> [Side note: you should also ensure that each of those branches
> individually works correctly, i.e. it may add features that only work
> when combined with the other branches, but it never introduces
> regressions when merged without the other ones.]
>
>        Arnd

Thank you Arnd for your careful explaination. I will pay attention to 
these issues later.

Regards,

Chen



