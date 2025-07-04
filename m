Return-Path: <linux-next+bounces-7350-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C9EAF85C3
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 04:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B34F81C87C7C
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 02:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F511DF756;
	Fri,  4 Jul 2025 02:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="qI4Rx7V0"
X-Original-To: linux-next@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012069.outbound.protection.outlook.com [52.101.126.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20921E2834;
	Fri,  4 Jul 2025 02:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751597432; cv=fail; b=aujZwBrUEmjP1fF3359R790rZVb4mdc+NOii9Rr+F4HxONljPPCP/j+493Y+/T4d7r6WXamIXqenunS5UH4MAn+9CYF72roWnuIaC4nbE+b7MG7EQUYv+EhamaYFcmN2JTL/eKNsEBVI1vAojGQtkhcZ3LslLssVnyxKDqeZvXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751597432; c=relaxed/simple;
	bh=Hhsb/ZeoKiBP4wA2DORWYU+aL/JzqL8757NaMB53Sw4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kZMEI7q1wAneSbB4IhvTNVTSeqkkAAQvolSbCe50s/YOyU71cVxetj7nAvACgUVAy4O5rznQjh9J6+Z3DM5V/87sEJ3/iW1ksn/DIaPIwOCd4JT1nDWCCyJor9hSP6g0NneIqgheCZOghz1T2bGGt95FJvLCj5FpvgBRRaVnYyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=qI4Rx7V0; arc=fail smtp.client-ip=52.101.126.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLuC/zAMNh8IK1/v8FYKllSAEioeqgVVG2YF2q76/5fshUDFpBDnAVqP8IaT3er1u4mtxTwn31khiEE60X/cLWGZ1nvt0j6JWsM3vG3erBnnJFQkRzcJzIXFdMH5+HYzH+bSQ5Jcfyu2IJTlve0UUr4RjPZ4dFvU6GG4kaoTdnyDuOBW7ySw+U2ROXrBXGwjcyuK1uu9VlbfUgztoP7WGk/FXM/xfNfO9g4pXwrxbdN8S6UXi2dsdVFYvLIYQDw5O1ZRcL1ysRNiLrl6cE+Iy813Mt9BuGt9/JYL0bYDs7aMANIy5i47B0c7RoAXA/tOLFCrBSJ9nIV0i76nAAafag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uA4wmyKmaelcY+dfRfm28NitvluuhFSH4QjBvD3Ia/s=;
 b=njhW4+kOOQSySKqT+i0/fDlCZ/8B4r62vjEDd0DIC2haRObf0y901Bvj/l924Rp+G2IeDTP6TULoOIGeIU5ST/pwWASjFi1keobftZAfB+1AgzkDmEfeh1rLMefzqtMy3jV42V+QTTIzS/iOS+fAU9lx1ozmVJbXlCMN0K4WJFA5yyO1kC65tjNjl23ZQBZkbixjE3ZNoRnuP5DMzzDgJ98GYB2WRqFYmxumSj6lxaQ/BWj3tQiM6BAftxE+d9+LcYk77/uU8djWguwd3tVacRmT7jj/kStFk6ffyxZnS5So9b7sh6JHkOecnqnNHE+Ua5slAu1Yi9VTid6IqaQDHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uA4wmyKmaelcY+dfRfm28NitvluuhFSH4QjBvD3Ia/s=;
 b=qI4Rx7V0qJAsKdQ3Nhvw3C0ca28+Q1/6v+GnNNKGVsuBk1DvmGYznBIdx2oZOlT1564j9Ef8ObdjRf38PO+FaQvDvm6qz+BO+zPq1Nk09bvmqGRjTtPVaWsoyTW9tdyzpmQHWiiVXSKHH9vHF/3PTJS+Uhx/82XcBQezgbuwxLAQkEwR+ZY1FbBO39qVCO5j+oJUtYCS2SRH5XwZ0tYHQEHQUHP2cHkjV585LNxjx3nR10CZyrssmTAes2faP9LMgB0MHsue/kIp6BuluZDp3EGzhOA88MhmO86PdYbxNDKxWyrKO6tvynsx9Ri8eKMwJXXq5/ppJ/N9seOIkV/FGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYSPR06MB6608.apcprd06.prod.outlook.com (2603:1096:400:477::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20; Fri, 4 Jul 2025 02:50:26 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.8880.024; Fri, 4 Jul 2025
 02:50:25 +0000
Message-ID: <ffac4324-66f3-4621-9300-a09ca8045bab@vivo.com>
Date: Fri, 4 Jul 2025 10:50:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the i2c-host tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250704120207.3e7d0d7e@canb.auug.org.au>
 <bd7bf583-5c75-4e73-9672-657749a72b1a@vivo.com>
 <20250704123601.52101f49@canb.auug.org.au>
From: Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <20250704123601.52101f49@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0185.apcprd06.prod.outlook.com (2603:1096:4:1::17)
 To SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TYSPR06MB6608:EE_
X-MS-Office365-Filtering-Correlation-Id: f1a29ec3-4b4d-4125-5455-08ddbaa58741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnhqWjFINUFub0ZKTkpjUGFXVS9Eb1hBQ21mOGZkai8zOHZ6Zk42b0E4TmRY?=
 =?utf-8?B?STBzc09wYy9RYk4vQTFEV0hZSU9TUXdoVmwzaVhDT0Z1bE5XaWI1VjAwWHNO?=
 =?utf-8?B?ck9HREY5UE5XU0Q3SG52d2diSWNTT09HOU92MGkwR0xUSTd4VEtnalFXWXFW?=
 =?utf-8?B?bXplU25OUTQ2Z0g3RmlGNWVoN0s5ZE1ESkIzTTB3U0tXam0yMjlIK0o0ZUxQ?=
 =?utf-8?B?MDZ6RStCVkdRZVREZlFMSEt0MjZwblRubmN2N2lYWTMwZ2EzWFlQa1dYNnZs?=
 =?utf-8?B?V2g3ZkM0NnZRd0ZVaDM1aW1tVkJqejZ6Sk9sK3dEMnVVanNzbzFJRVlsZ3I2?=
 =?utf-8?B?ZDRCQXZWR25jZ2lYSTFsdmRxRkpGeXJNQUxHaGErTDA4Yyt5eU4vcG1GQjJN?=
 =?utf-8?B?TGhKUkZUUnJuWVQ4WVRCV0t6N2pyZTdkNDgyeGg2MlRPV0p5ZG1JZUx2MTJX?=
 =?utf-8?B?V3N1VUJhYTJkemIxcmJlU2wrbGp6N0hkSW13ZTEyMnU4WXhYQ0wxZEVudVQy?=
 =?utf-8?B?c3Y5bnhoYUowc3ZPMmNPTmIrOE5pNTZQdCs2NkFMMTFFMjNlbEJvbUo4MHVQ?=
 =?utf-8?B?bzE5UUJwVHRZREhRVzgxZzZzWi8xaTErRUlIN3VXblR4cnhBTkg3cWpjNDZQ?=
 =?utf-8?B?dmRlaGdtUkV2NFVLOVZNNkRjNW01Q29mRUR3LzB2ZU9qYVFYNHhaUGd5US9T?=
 =?utf-8?B?YlFxd3V2aVZvS29tUUJtVFU0cWVSSVJRMDZ3WC9UWTZKUXVFRWpPTERVOE02?=
 =?utf-8?B?N0xuakdPUzlpSXJFS1UzZEZBdWpjRUhNRU1vM3pJN24rc2F1ZEpmczliU09T?=
 =?utf-8?B?MnVPdG1pb3dhcHJSR1c5Vkt1R2k0YW9USzNTZTl6alIvWmRVMWdRL1NhK0px?=
 =?utf-8?B?akozN1FmWHpLYStCV2lLTVpJcnpnNEgvV0M0clYvWjRqcDBVK2FxRDA0b0gx?=
 =?utf-8?B?UUk4Z1ZZOCtIa0E3M1dzVS9RVmVkMkU2MURtZUdQcmdPTEovSktGdmliL2Vp?=
 =?utf-8?B?RTJndHJodHFaZHYrRHAxT0ljdG95YS9RNHVpV016WTZQRmRIVUtFZTJ4cnpI?=
 =?utf-8?B?K0RhK2xPdHJReGRDWnI3UzJ4QyszS0FGMEJRODA0ZVpjZlQ2dDVhZGVHa3RT?=
 =?utf-8?B?cFVMT3JXaFl4bjJkUGVMOURLcFFLT1dydTlzdmFQZURlWSsvdGlienJ5UzBT?=
 =?utf-8?B?eitLdGlTVnd4ajVUNkNBQ09GR0w3aUl4NzQvUGRwMjh4SVpqc3FiNlUyaUxl?=
 =?utf-8?B?dnVObHhNZXBtbEgyVzhhTlk4MGpNYWdNalc2d2xRTGQ3aWw2ZURDZHUyOTFO?=
 =?utf-8?B?UlU1YVR1ZnVBVXRsMlUrQStpUDdZUGt2OHBlaUlDM3l0cmdFdGx1dnplQzQx?=
 =?utf-8?B?K21VenlhdkwrQWVuSG5MTGp2c3hZNXBJZURkRFdBb0pCUTFKMmpycW96dzN2?=
 =?utf-8?B?ejBoRzFkL0VueWM1ZzRCRjhCWktneXcvRFI2blczUWZBcElwaXlNN1M4dFFI?=
 =?utf-8?B?Y1grRDc3Um4xM1EzY0tYWExER21STWdMRzhvUEx0Q2dsSzVaTU4zYXFrbUtR?=
 =?utf-8?B?dGs4eXIvNkpvQTBNY2czcGVhQ3pzaHhQZTJWQWx1QW1JNS9ObDgzZDFUWG1S?=
 =?utf-8?B?WXd3NFFtdzZaSmFpM3VqVmNGOG1FWGQ1b1FOTmY4S1V0bURyVjhoa0E4blov?=
 =?utf-8?B?Sm9JUnlsMVJMeXA0eENRK2RmenA2REZuMVZjeHRzd1IyOGZldzIzaHRBcFV4?=
 =?utf-8?B?OUgzL2p1ZHhDVDhqUFk2TUNGTDg5WXkrMTh1NkhPRHR5bGc3Zi9mcktMMHQ2?=
 =?utf-8?B?by9BaWwzaUVlK1h3c0hRZ2tocW9wTkdWUDZnYXVFaUhzNGc5L1hqTGQ4U3Ny?=
 =?utf-8?B?cXVycGNQVnFTalRWRVkycTA0VmxXMXpTOTlCZS9ScTFQV0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjB1dWJ0b0lMUWFSUlVDSTQ0WGJsMUFxWGROL0NJWUNRK1JlaUFqOThLVkNx?=
 =?utf-8?B?c05CRHBNRU1FUzFlcWszQU1HNk5WeTBpZ1BlWDl5VFE4VnlXcVJROHhWaGJL?=
 =?utf-8?B?WjZzUklCL1FXMkFyR0R0d0srL1pjWkczSmpjVHdxMkNWS3FCS3hsaVFybDJQ?=
 =?utf-8?B?eUNmOVFSTkc4WTgzZjZpSTFZUG1jejh0NjlUa1V0UVIxVi80QjVUMExpcFlr?=
 =?utf-8?B?V040dk13VkRDMzNDM3ErSi9XWm9saTNscEhMZW1NVXJwWkZhQkFjcVRpc0Fr?=
 =?utf-8?B?b2RoaEZpUkp6UjlGOGdnUWFZRUJrUjJlQWU2bmtxdTB0WStPVmtRUkRzdDRs?=
 =?utf-8?B?MEVUWXREQXQvNXQyNmJJOEczUzMwS09yV0FvTjVCZmJUTXRLMzhNWmVsY3V0?=
 =?utf-8?B?SzVjamwzMVpQYkVydk0vb0huNVdzYUtFSjhneHJLUmtpNFJ0UWNsTE02UHhQ?=
 =?utf-8?B?eFRsTWJsSUVVTVhzbWlEUGNyeXFHRjFLOW5MNkRONGJtc3ptM1dVRC9sWGxl?=
 =?utf-8?B?VTlqbmkrOHpFdVVHeXgzb2ZnWTljT3huOG9XeFZjaCtUYUNmTE1Ja08xWXlC?=
 =?utf-8?B?ZHpXZ0J4RkJqazlCZjc0U2YxNDZxZjBUS0M5Y2pRU2llQUNOcU1MNS9mWWdt?=
 =?utf-8?B?eldMTTJoTWRORmNtSVZPNDViU2xnOHJqNkU3R0lCblpBWS9tdk5yTFc4cXIz?=
 =?utf-8?B?eEZlM3p3L3ltSzhOVjIzVGhlbVNyWVNBejlRUDBHYnVFclJ0VXVjcXVtdks1?=
 =?utf-8?B?dmR2Nm9kd09OVkl1SkY3M0FJMmpaSTRnZmgyN3VKSHRWWmluSGs2RzUvK01x?=
 =?utf-8?B?K1FMVmlwTkpFcHJqbDByVFZWVGQrQlNGUXN5c0lVc2liY0FTWm5maEZ0WkdR?=
 =?utf-8?B?RHhPb04zdzdZelRDZlBETEFkaHR4MVZKdS9UQ2h6RVRlblBjU0d6RUQxR1hB?=
 =?utf-8?B?NkRvMm5EWlhkdTlUN25QQkZIQ3Q2VFlBUmJoMTIyNGQ3MXlXVFZ3R2svNndJ?=
 =?utf-8?B?d2R3d1c2TEpJSFBvNkNKSUw3TUtHK0UwaU5QTVFSNjJPS2N3Q0czVnFwZ29m?=
 =?utf-8?B?dytVRG5vZ2dnRXJha1NDZjRLczRhc3hJT2MvYWk0cndNZXBVRmw5ZGlOTWpU?=
 =?utf-8?B?YU5IS3UrOGZ2a0Z5K1JqdjFIa1EvYkRZMlFmK3BCMEc1ME9mdkFuTjAzYzRo?=
 =?utf-8?B?MUkwd3RkZUpMamkxdjU2Y25YT3U5QkZrMkpmcHpXTVRIWHV4a0FUenZQT0Nt?=
 =?utf-8?B?Zk1FaHBXM2dUTGJnUUo1ZHlSbHNnK0p0RUdoT1BEU2tXdzVhc0F0bkFKK2dG?=
 =?utf-8?B?ZnR4TFRuVUZZUlZUR2pCQWRqbDNBVlNIZ0VqQTRXK3Rib3M5M2kraDJ5VVZq?=
 =?utf-8?B?QkZiS0lBWlpxaEJ3M3k2YnQ0NXlDMm9rc21HLzRoMzdDV3BHSEVwY3Y3VmRW?=
 =?utf-8?B?V1htV3FPSVlJOExxY3JJZXprUXdnTGdkb1NHeGJQVHA4c1F2U2tJbWxRKytP?=
 =?utf-8?B?dndvTjhBOUt3RlQwNWFWKzgwcmoxVkpkRUpWaFN5WmpRNWd3VHBkUkIySjVh?=
 =?utf-8?B?NGFad0VDWFg3dWFRaGNtOWxwK3hhOGlDQmN6THdIQ0dEWGs1QkszanZCY2ZP?=
 =?utf-8?B?YW9ESkZJb01DUm9oQ0J3OWJ2V1pyeEgyaWVXdGtWZ3JtOHgvU24vdjRPbENF?=
 =?utf-8?B?Vzg2cjF3VmVKMUpCbkJhOFBHby9sTEtvUjNtSlJkM3V0K2xnNkN0RHhFZlps?=
 =?utf-8?B?bG5WaTFaRXJZQWFGRG1kbXBHcmRaL1pma3pUNHJNVS9hdFlSWWZkTG5jNi8v?=
 =?utf-8?B?NDNqL3ZMR0xpOWFJS1ZpYjhkVGgwa3QvZmRPM3FQTFBoSVlyTFlTek1KMnk0?=
 =?utf-8?B?UmZxY1YzVDcvOTRXL1AyTGsrUTRVYmF1bXBQdmZRZ2F6a1JRRDR0VEYwdlJm?=
 =?utf-8?B?ZnhaOU9pWXh0OHkyYVZmKy9sc0s2V05YdlBXc0p6a2tWdzhpaFNRMFBDdGZl?=
 =?utf-8?B?Um5rRVFZcUlCaEtBL0xlekRQK3MzSmtXMkNZc3ZGdFN6YlUvNGNhSHFzTGFs?=
 =?utf-8?B?ck1WNXJZWG5GRTY2NllQZnBoNjR0d010S3k0TEJ2amZkMGFKWkZqa3pzYVlE?=
 =?utf-8?Q?PA2cTf9iFzEigKl54+4EOOJs1?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a29ec3-4b4d-4125-5455-08ddbaa58741
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 02:50:25.9338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bmgtKcsSLQz4vvE4gRD5sQw/XzQxS9aXw91dlimcFpgr1JrZpvY1QCo3adxDKy3da83URlD5cXzo6/U0pcYifQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6608

Hi Stephen Rothwell，

在 2025/7/4 10:36, Stephen Rothwell 写道:
> Hi Qianfeng,
>
> On Fri, 4 Jul 2025 10:16:08 +0800 Qianfeng Rong <rongqianfeng@vivo.com> wrote:
>> I'm sorry, I made a mistake,  can anyone help to roll back this patch?
>> But I want to ask if it's because I didn't compile with W=1 and
>> didn't find this compilation error locally？ Anyway, I will learn
>> from this lesson and be more careful in subsequent submissions.
> I just did an arm multi_v7_defconfig build.  Building this file depends
> on CONFIG_I2C_ST which in turn depend on ARCH_STI || COMPILE_TEST.  I
> don't use W=1.
Thank you for your feedback. I did report this problem when I compiled
locally with 'make allyesconfig'.
This was caused by my carelessness and insufficient compilation locally.
I wonder if anyone can roll back this patch in time, or I can send a
'min_t(int, ...' version to fix this compilation error immediately.

Best regards,
Qianfeng

