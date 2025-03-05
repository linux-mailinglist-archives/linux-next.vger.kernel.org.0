Return-Path: <linux-next+bounces-5663-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 172A1A50D8A
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 22:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 326FD3AF1E3
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 21:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7FE1FF611;
	Wed,  5 Mar 2025 21:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="Jzk9LxTP"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDC42E336F;
	Wed,  5 Mar 2025 21:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741210464; cv=fail; b=Vz9ijSPlk/wFzMmB+DfTYcXMXP793IjcxHZEFpqVP+RVTbvuyoZsIa6GHHQ079qe6yGxbEJAbaENwf5vBia+xMzNCP+bUqmvj8e7aAS4aU9T9F7ULFoOT4Usm95qzm2f2EVQ89tl51+DgkQ039763yA/oOL+CKL8eS9FZkLEgnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741210464; c=relaxed/simple;
	bh=06xihHgNLBL7iqQPJN+ioiA7RR5vvZ/25mjmDYdfyAQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sMib83R7vQ3hM2BWgqsqCnCTHA3B3OUc8YSwfl9+7Y5RFMShunn6By/VaR+wEb17rpPd5SFoEKkviFEx8owzg71DlSOZtviDhYsjBtXoniK90qokl+WzeOQ7qQSaPT4IjX2becmt8tROpB17SKpHaqyksBr0dcgv7uXNtM1qKAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=Jzk9LxTP; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.2/8.18.1.2) with ESMTP id 525KkvNT015213;
	Wed, 5 Mar 2025 13:34:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	s2048-2021-q4; bh=06xihHgNLBL7iqQPJN+ioiA7RR5vvZ/25mjmDYdfyAQ=; b=
	Jzk9LxTPRjXoqV3d9h7nDKSqdwu2/v+4Vx0ecEa7934WDtLswgjHD1uec5XBobD5
	a1bHB/F6VsWhfKyBGMR0TmTQ6vA2wovACeQ/iJo1BVk1dc3+7JftuKL04KYajEUw
	XGFWcsHxbSDdBnemfx3YN8nHsWnZLGWqvGon6dWwPwxmNhhd3xyjxo8anJoD36vS
	cU/oA9eeOV0TzNOjTEJs1s2C3iw2siammgg6i+goPyAXY8oPC3iRVXihnVo5BGqJ
	NqqXMcbhDlTVWhHmxwLhGXR8vRrfS1d6Nt51jh2LDGlvkBnrJ/NBa21tO7lDH8CC
	g5UrgPMD7VDLQCEMnzM7bw==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by m0089730.ppops.net (PPS) with ESMTPS id 456rxsk9p3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 13:34:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c1IiIybkeF5ZLFNbTkkuD4feA+vttj1uQ1mfrnEwRK1IHQBWQXhQ2cPcqg+50JyaBVYusGwoylxp+1UiKWYuASbbULGNNuvHAuW3jwb3slTrjj7BPaN+Crlwr45T1H7ZdE+M4lohdCuq2V+23aOUfxVjVljxfMYUUBAJi3YGQgncLJZA22AtBnpmKy1p5DwnvEEE0qdmsLV+EDlG529U22kpYE4M+ogvc5sGn8QK8Esk6q2Rn3At0KVx4FumBpwJygoT2zZq3BZ4vfSM+XoeNbVW7SeZRuoRM/Dc7isNcqMDgQK46QGqta+gnG0ZfB2naT0MmXfdfoRtyiP1Fsjkdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06xihHgNLBL7iqQPJN+ioiA7RR5vvZ/25mjmDYdfyAQ=;
 b=CLv68QwWD5ISzjd7uC8baQGEH665IKfbrdFBtE9xMxVbWI1WNlUq6bcUy/T3s6AxJqhv2SXG/7xsSCCLXD0/+aJuuTSRIIsTHfU2ONiZafWGtcZESJzmzPQj8iVabVcbXL6BYckul1RhywkOCHLnuY++zTiHgcR37LWOlqmwQGOUeCFA7Ui4qdLk9soK0lKomLm1m2a4bZAlF/Vrf6S2UZDLYB5obpUhUQBYRNqtKh7nxOmo3479QNXEHBPjWWiOe3IB+NTAEOWRSVu68J+pS+FZhV7KGh6o7IZHo0Qygs0fwjRJ2wEfSNMJmwRV7LuAPfolE/r1S7PUdKJgOu19LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from MW4PR15MB4732.namprd15.prod.outlook.com (2603:10b6:303:10d::15)
 by SJ0PR15MB4677.namprd15.prod.outlook.com (2603:10b6:a03:37a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 21:34:18 +0000
Received: from MW4PR15MB4732.namprd15.prod.outlook.com
 ([fe80::f3ab:533:bb24:3981]) by MW4PR15MB4732.namprd15.prod.outlook.com
 ([fe80::f3ab:533:bb24:3981%4]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 21:34:18 +0000
From: Nick Terrell <terrelln@meta.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Jeff Layton
	<jlayton@kernel.org>, Jeremy Kerr <jk@ozlabs.org>,
        Joel Stanley
	<joel@jms.id.au>,
        Kent Overstreet <kent.overstreet@linux.dev>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Nick Terrell <terrelln@meta.com>, Vineet Gupta
	<vgupta@kernel.org>,
        David Sterba <dsterba@suse.com>
Subject: Re: linux-next: trees being removed
Thread-Topic: linux-next: trees being removed
Thread-Index: AQHbfNhR38G9bVXKfku+oDD9YeEZRrNJ1eMAgBtdEoA=
Date: Wed, 5 Mar 2025 21:34:18 +0000
Message-ID: <0765D5CA-A67C-42F0-AFFC-9E9A3B3D0804@meta.com>
References: <20250212095632.6bdd50d7@canb.auug.org.au>
 <20250216224200.50b9dd6a@canb.auug.org.au>
In-Reply-To: <20250216224200.50b9dd6a@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR15MB4732:EE_|SJ0PR15MB4677:EE_
x-ms-office365-filtering-correlation-id: b6cd13b9-1c6e-44d5-0337-08dd5c2d7c32
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?alhUYjVtRm5hTCtwbWdQT2g0VDJsd3hsWVpGeFVNNjB4bldwelZ3MS80c0lZ?=
 =?utf-8?B?VzcvaHBuTGhVR3ZaOTJma3NJRVZQL2FpdjE1aDNJMkJpTDlERkE0Unkwb05u?=
 =?utf-8?B?aUNGM25GOEZ5K0JkZ3dIYzMyYUNsT1R1dTdtYUlMVHl1WE9rdEVPMkdwbW1s?=
 =?utf-8?B?ZFgyT0pBa0tJVTczSGZZUFFJbkd5Wm11UkgrL05IYkltUTh0Y2tuVGlwSFVM?=
 =?utf-8?B?RG9TZWtLdnFGL2VaYmt5Z0ZJTEI3MFNRbkh6THdaSGdITDJnVEFmNlkyNkh0?=
 =?utf-8?B?KzZFaERXRFB6R3NRTTJ2cnVMT2ZGR3MvSGk0TTVhbVJYNXM5SlJYM0MvTHlT?=
 =?utf-8?B?VXRFUGpkOTI1bFpWMm05eXpOd052Znh2dnQrdDRmWnFQVWlxbndyUGRyU2VH?=
 =?utf-8?B?U2tSUzdZSzNGSWtyeWFOeUJRUmw0UytyZVNBaSs1bmFNbFd4Mnd0S2ZIS2Fw?=
 =?utf-8?B?M1lSR2ZrOG1ML3p6amtYYmFadmN5MXZFRURVTUZPN0RiV2NubmRwVzdyZGlt?=
 =?utf-8?B?Tmo4YmJUajFLeVJLMHdnZUJ0TUMrRXFheDJuUi9HWVJHMHArdE1uZGU2dUpZ?=
 =?utf-8?B?QUJac3p3OG5LMzZ6OW9IMThyejZtUEUrZmxnazIxK21GQzREaE5mejUyRkZL?=
 =?utf-8?B?ZUwxNkNnbTNiTWpIQkd1UWVqR0Q3ZEVRUFVSSlE3emdKWGwyQmNROEJNUWFy?=
 =?utf-8?B?YUwwR1NkcFcxN0p0TmRBaVNkMVVLTXNYalpEc2ZzTlFnVythcnQvM0g4a0Jj?=
 =?utf-8?B?MVVtbTBqOHJxR3U1SFRsTCs5NmcyY3RjaDlDbkNyM1QveXlxYU4xNWVmdUtj?=
 =?utf-8?B?azdnaFlJRzRnemtJRmhLZG1QY2tSSjVQcmYwS1NUZ0Q1MGtTbmdDMzdnZUZF?=
 =?utf-8?B?b2lwVnlZbzIwbTgzN0pwMTZZMDJJcWVKcmdLZWU2bkUySFlvSlRFOXRvN2w2?=
 =?utf-8?B?eXhTRGlQUjlTNFZEcWpYd2IwcXJTZXA2VmxMREtDVUJLMnpMK3gwMUhuRGUw?=
 =?utf-8?B?RHB3enB0Ky82ZFR5YURvblovTUs1Ly9IZzdTbFByN1RHbWZJTU9nNi92MHRt?=
 =?utf-8?B?OWwzTG52dlVrT2tKN2RUOThxN0ZNYUxXR2ZNQTI5dENRM04zU2NmOUVlWFEw?=
 =?utf-8?B?N25GVDZYT1JJQ0loQ09pdUJWRHBwQ2FGUVBUYTFhcXBsN2tZaUpEOW82QVdX?=
 =?utf-8?B?Zjdra2FQa3Arb01HSUZmSkFwRTlscW95SzRiUHpLZTRINytSdVRCRllnZ2Vx?=
 =?utf-8?B?RzBzdUcwd3pyQlkxLzdha0FhRXVxZ085bVlBYitPU3l3SXVETTFhRjlZQXR5?=
 =?utf-8?B?QTRURDM0a3BnczZwaUloR1pLdGFtdDBrdnd5ZzNmK2xUc0NBRHBaTjN0YVZq?=
 =?utf-8?B?OVVjSDJrMlcwWjdBQjg5ZFZJY3JCZmQ5NmVOZ21ZVE1BUFlUcFNSNHRxQUdF?=
 =?utf-8?B?RzB1TXdWVFo1anhadGpFbEVqUHRwQStqN2FVcTg2SjRjTWQxUEw5c1E0MEZT?=
 =?utf-8?B?cHhmV0lpYXRHZmc1UWhHSEN3cE56dUl3QXcyZnk0bTFDWHdtNVpEZW1kYXVX?=
 =?utf-8?B?RnJWZE5jU0JGZWlVVjNkMU9ZZUVjaGwzZ29ieVlZeUhwSUcwWVl3a3Z4YzM5?=
 =?utf-8?B?c0daRHNRejhIV3pHaWJGQmR3WU8xQU5ZdlVYelA5S2V6V3NIVzNDVDdsMXZW?=
 =?utf-8?B?MnZ6TFA1cktRWTZETzkvWHBhc3FJTUQ3dnk0K1ZSTVozVTRnek9GL2lJQ3BF?=
 =?utf-8?B?Q00wa1UwOTl0UUFrc1lxc0tqOHU0MDNTS1JoZllkKzFJOUlibXRVMTZ1cGRp?=
 =?utf-8?B?SDFoZUplRm1MMEF3VTVPUDNmOG9zczNJUlFjTXY4R3VyRnpIZDFkWVo3TjVK?=
 =?utf-8?B?SGRxWHllR1F0VlExUklXdmNIekhoNkZ3NEpvbDFaNG1iYnZrNVhwUi9tajBQ?=
 =?utf-8?Q?7YGctSTdzrr0B0HEcVKnpRIYLIjbkEu8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR15MB4732.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U3NTdG9TckhlRWt0Z05LeElGeUZuYjYwUFJMSWI4VXhQSXlUUEFQWUxvTnlk?=
 =?utf-8?B?Qkk1ZjZMMmYrNTJTNmhjYkQxRStOWnFES2RuYjlqcXgwb1YzQVNVYklQWWY0?=
 =?utf-8?B?YUVQS0E2Z3Z3WWZFamJRR0Nla1dHaE5GT2lFNkxScEZrTE5lM2hiVE9rbWtZ?=
 =?utf-8?B?eHZZY0ZBVzVSQVJwU2tpeXphSUN3Sk9wNDV0VzlIVll4N25qcXhVWjBsRDNF?=
 =?utf-8?B?WEd1d1QzVnRyOTl4dTRaVERRajgzRS96S21jamxKQ2FoT1FvNGlJeWQyZGRQ?=
 =?utf-8?B?eFkvWnJhWnZmcGdIK3BDWFYydGtrcThrNG9mSUIxK1I1MkYwVVZSMHJvb3do?=
 =?utf-8?B?YkpIYmJHeC9Kbis0RHZEUU8xY0QwaGhPS21jMEFIcmxYdXA0c0RPbWdTR1hC?=
 =?utf-8?B?QVpZenUrM2JOeXppNzE2MTNKenFWSVZCTFppSDAxbTRmdlN0VWlhc0pMRWpL?=
 =?utf-8?B?QWJ5SVNHU1d6QXUxb3B1eHJQUlRET21wL2UybDR2UkpjRzhPN0N0M0E1L1V5?=
 =?utf-8?B?VzE3M0RJSlBxUVpKeFZBL09yUVZmT2lBMDdyZnN3UGNLTi84blJwNWEvNEtY?=
 =?utf-8?B?QXVLK2xoYWlXSG5udnJRUHhxQnVXRkNpOTF3cUlEbHdCTExHa1dtRDZlenVT?=
 =?utf-8?B?RnhjT2FJY2JXeTV1TnBtdzNtdmZGc1dva0ExQlk5L01mZjRyRVRjOTJULzh1?=
 =?utf-8?B?OVZ5Z0R4K1BiRGZBNHZzS3A2cWM0QVF0eituNGc5eTJHSm81djdNSmRRdWt4?=
 =?utf-8?B?Qm50UnEveGFUSDdsdTFLb21zV05teDZxTkF1dXBzYWQxcU9JL3l4bkxnWGFK?=
 =?utf-8?B?Y3BKWDloUWp3SlNBKzdQUHZlWGFaMlpUREc4VStXRThBUzlzSG5SUFM3ODVH?=
 =?utf-8?B?OWk5aHRINkdmZHYyQ1JUUEcwVlMwaVZ4NHFwRlpMQlhBb2tqdVZwckRLbUVQ?=
 =?utf-8?B?MFBtYlhIR1d2TDJrY1RWWm1IZnQ3M1NhWDlrcytRSmw0Z2YrWjlqRENXS3lw?=
 =?utf-8?B?c29sUko3Wjk0NExpK1ZFVWtUZUxRYlZBeE5Lc0ZKaEYrTFE3VExUM0lNMXlR?=
 =?utf-8?B?L2QrS0pVVVZwZ1AyaElCSW1FdVdSQ1l2eVM3WHl3QTJkSndONU5icVlHZy83?=
 =?utf-8?B?WXpVQURua1k0OWRwVTdWRUlEVDRkODFTeDhvRTNVcm42TlFybUtUZWF6TTMx?=
 =?utf-8?B?aDdIM01qWXZqb2grZFFLamthNDNkMHVMYWpWd0JYWjI2SElVc2pHdzFjNzdq?=
 =?utf-8?B?a2lDZUp2dVR0Vm5CdndvcEx4TUF4cUpURkl6R3JtVkx2Q1V2UzRieEtNbzkx?=
 =?utf-8?B?aWxLb1c3M1JKWXRwUVNYVUdKdC8zR09ISThiS1UxUjRWeUY0ZVpENVBKNjRM?=
 =?utf-8?B?WGVZeWVBSUNhWjZnU0x1QWMxWTRTUlZUZTlmNXJFbDVWYXRIQkF5NG9DUlFX?=
 =?utf-8?B?KzZTd3BiWUtHZFpBcWFzZTJaK0NZZ25jTTA4d3lBVlJTZCs4TUNiSzJBdzNM?=
 =?utf-8?B?OEt0OEc3VzR1RGVwQU9FQjdOUVA2Y3pYTVZnYTc5R1kra1d4ZkNUenNPa3l5?=
 =?utf-8?B?Mmk2b2JaTCt1a3hxOG4xZ0hrRU1MallNMnJXK3BCa1VFT2hpZGtkb1FjODRy?=
 =?utf-8?B?dTRKUkFvcmdzUnovMHV0bk5SZlJ0Y00zS2o5UTdXMHp2WVV0Zm9KOVZ1dGRP?=
 =?utf-8?B?dWtKcmpQaTF4THdHZE1pUU5qTDRXZXBSWENrWXJXenBPcHErMTlkbWduYlV2?=
 =?utf-8?B?czFiWER2Umsyb1dPTWl2QnZJQ2NBbDRkb01FYTN2OGdWU3VzY2RsdHp6QmJp?=
 =?utf-8?B?TVhETDBOQ0UvUHZkUk9OcWdyQ3k5TjNOTkVUejRmOGc1eVlCWndxM2FBMEI1?=
 =?utf-8?B?MS8vUjNPVk1QM2hrN0JqL2xkUmNyNm9ZZ3Q1RGt3dytzaVBtVzRlZzF6QmZh?=
 =?utf-8?B?Q21iZ3FlQm9ST1FscXZlZU81N2diOGhBaXB3WEE3bUlHM3h3RHl1b2ljMm0z?=
 =?utf-8?B?dWExTG9xcmtCMzA1UEJtSDc3VjZsYnFTMzVianh3UXNRTjZGc0N4UFNuMWhD?=
 =?utf-8?B?UldNdTU5VDR1Mnk5bndFR29RZFFxMms1RnlBRVNnamYrTDEzK0tianJXS2lv?=
 =?utf-8?B?MW40MGZyeGpNOXZxeFVRZy91L3cya1FlSk5IZjR0aFJqZFJvUmYwMThnaXVr?=
 =?utf-8?Q?zG40XOMBVIxx04iEBJ1TMXI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E494913BC173414FB58DB373504DDD5D@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR15MB4732.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6cd13b9-1c6e-44d5-0337-08dd5c2d7c32
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 21:34:18.2794
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UwQlq8zluZMWI+AtVc/AiDfuSMu7AU8lyMUNv7UU4htG09wZJMtGoutvkp1xn3o3nXdPkgaGNEtpS+LEAAom/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4677
X-Proofpoint-ORIG-GUID: H3149Y2GRBuQe-brG-QO6VDL2_O7kcQL
X-Proofpoint-GUID: H3149Y2GRBuQe-brG-QO6VDL2_O7kcQL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_09,2025-03-05_01,2024-11-22_01

SGkgU3RlcGhlbiwNCg0KPiBPbiBGZWIgMTYsIDIwMjUsIGF0IDY6NDLigK9BTSwgU3RlcGhlbiBS
b3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+IHdyb3RlOg0KPiANCj4gSGkgYWxsLA0KPiAN
Cj4gT24gV2VkLCAxMiBGZWIgMjAyNSAwOTo1NjozMiArMTEwMCBTdGVwaGVuIFJvdGh3ZWxsIDxz
ZnJAY2FuYi5hdXVnLm9yZy5hdT4gd3JvdGU6DQo+PiANCj4+IFRyZWUgTGFzdCBjb21taXQgZGF0
ZQ0KPj4gIFVSTA0KPj4gIGNvbWl0cyAoaWYgYW55KQ0KPj4gLS0tLSAtLS0tLS0tLS0tLS0tLS0t
DQo+PiBmaWxlLWxvY2tzIDIwMjMtMDktMDEgMDg6MDk6NDggLTA3MDANCj4+ICBnaXQ6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvamxheXRvbi9saW51eC5naXQjbG9j
a3MtbmV4dA0KPj4gZnNpIDIwMjMtMTItMTQgMTk6NDQ6MTEgKzEwMzANCj4+ICBnaXQ6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvam9lbC9mc2kuZ2l0I25leHQNCj4+
ICBlYzA4NGU0ZWMzMTQgKCJmc2k6IHNiZWZpZm86IEJ1bXAgdXAgdXNlciB3cml0ZSBjbWQgbGVu
Z3RoIikNCj4+ICBmNzIzNmEwYzkxOWUgKCJmc2k6IHNiZWZpZm86IEhhbmRsZSBwZW5kaW5nIHdy
aXRlIGNvbW1hbmQiKQ0KPj4gIGM1ZWViNjNlZGFjOSAoImZzaTogRml4IHBhbmljIG9uIHNjb20g
ZmlsZSByZWFkIikNCj4+IGdwaW8gMjAyMy0wOS0xMCAxNjoyODo0MSAtMDcwMA0KPj4gIGdpdDov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9saW51c3cvbGludXgtZ3Bp
by5naXQjZm9yLW5leHQNCj4+IGhlYWRlcl9jbGVhbnVwIDIwMjQtMDEtMTUgMTU6NTI6MTIgLTA1
MDANCj4+ICBnaXQ6Ly9ldmlscGllcGlyYXRlLm9yZy9iY2FjaGVmcy5naXQjaGVhZGVyX2NsZWFu
dXANCj4+IGtzcHAtZ3VzdGF2byAyMDI0LTAxLTIxIDE0OjExOjMyIC0wODAwDQo+PiAgZ2l0Oi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2d1c3Rhdm9hcnMvbGludXgu
Z2l0I2Zvci1uZXh0L2tzcHANCj4+IHRzbSAyMDIzLTEwLTE5IDE4OjEyOjAwIC0wNzAwDQo+PiAg
Z2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2RqYncvbGludXgj
dHNtLW5leHQNCj4+IHpzdGQgMjAyMy0xMS0yMCAxNDo0OTozNCAtMDgwMA0KPj4gIGh0dHBzOi8v
Z2l0aHViLmNvbS90ZXJyZWxsbi9saW51eC5naXQjenN0ZC1uZXh0DQoNCkNvdWxkIEkgZ2V0IHRo
ZSAoYHpzdGRgLCBgaHR0cHM6Ly9naXRodWIuY29tL3RlcnJlbGxuL2xpbnV4LmdpdCN6c3RkLW5l
eHRgKSB0cmVlIGJhY2sgcGxlYXNlPw0KDQpXZSBqdXN0IHJlbGVhc2VkIHpzdGQtMS41LjcgdXBz
dHJlYW0sIGFuZCBJJ20gd29ya2luZyBvbiB1cGRhdGluZyB0aGUga2VybmVsIHRvIHRoaXMNCnZl
cnNpb24uIERhdmlkIFN0ZXJiYSBhbGVydGVkIG1lIHRvIHRoaXMgWzFdLg0KDQpUaGFua3MgJiBz
b3JyeSBmb3IgdGhlIGNodXJuLA0KTmljayBUZXJyZWxsDQoNClsxXSBodHRwczovL2dpdGh1Yi5j
b20vZmFjZWJvb2svenN0ZC9pc3N1ZXMvNDI2Mg0KDQo+PiAgOTg5ODhmYzhlOWVkICgienN0ZDog
aW1wb3J0IHVwc3RyZWFtIHYxLjUuNSIpDQo+PiAgNDBlYjBlOTE1ZGViICgienN0ZDogQmFja3Bv
cnQgSHVmZm1hbiBzcGVlZCBpbXByb3ZlbWVudCBmcm9tIHVwc3RyZWFtIikNCj4+ICAzZjgzMmRm
YjhhOGUgKCJ6c3RkOiBmaXggZ19kZWJ1Z2xldmVsIGV4cG9ydCB3YXJuaW5nIikNCj4+IHpzdGQt
Zml4ZXMgMjAyMy0xMS0xNCAxNzoxMjo1MiAtMDgwMA0KPj4gIGh0dHBzOi8vZ2l0aHViLmNvbS90
ZXJyZWxsbi9saW51eC5naXQjenN0ZC1saW51cw0KPiANCj4gQWxsIHRoZSBhYm92ZSB0cmVlcyBo
YXZlIGJlZW4gcmVtb3ZlZC4gIEdpdmUgbWUgYSB5ZWxsIGlmIHlvdSB3YW50IG9uZQ0KPiBiYWNr
Lg0KPiANCj4+IGFyYyAyMDIzLTA5LTEwIDE2OjI4OjQxIC0wNzAwDQo+PiAgZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3ZndXB0YS9hcmMuZ2l0I2Zvci1uZXh0
DQo+IA0KPiBUaGlzIG9uZSBpcyBzdGlsbCBwZW5kaW5nLg0KPiANCj4gLS0gDQo+IENoZWVycywN
Cj4gU3RlcGhlbiBSb3Rod2VsbA0KDQoNCg==

