Return-Path: <linux-next+bounces-8221-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8C2B485F8
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 09:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BA3D3421F0
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 07:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9D619D093;
	Mon,  8 Sep 2025 07:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=viavisolutions.com header.i=@viavisolutions.com header.b="hponZfxl"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2093.outbound.protection.outlook.com [40.107.94.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE365296BC8;
	Mon,  8 Sep 2025 07:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757317351; cv=fail; b=Oal7ntMip/YRieOwmJcRS8FZfCyfokEBt8yYHjanpWhEoGdUbwUi6KjMrhjmKoil46FOf1WVwk1YvYIRYqOvuN9qwcGVk/7CHnY91z2jOVEbHaYVjiCbaeTUOYrIHP7vR5SdbYHDEDRLG+KHsS2KuWTYwOk3OjOA7oH9DWjf39Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757317351; c=relaxed/simple;
	bh=kMhtNZsT/OfGqGNbVzn8SxFdbMVoW+yKlygr5Z43HJw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=snXQNVxoymcMIaY1dp6l7LQlGVkgmk45RS3iOerdH59HBdLhD8SL0MPwLwWuz0tNXqIx+cLOixrXBBN2wOVQ7QE+XHajN3Sm8bDEzUcS7MOdj5AMxZoLYxRwDP277hhYOEEKg8Kj2mYKeV09TYYtg89ArNMPVjgM0Ia72hz3FlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=viavisolutions.com; spf=pass smtp.mailfrom=viavisolutions.com; dkim=pass (1024-bit key) header.d=viavisolutions.com header.i=@viavisolutions.com header.b=hponZfxl; arc=fail smtp.client-ip=40.107.94.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=viavisolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=viavisolutions.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBMefAFN2N/XS2mtu407po6er3+5kbq43FltQsAKxw8alSc7TQjl6BOcCmGHHW5jrbMtan5D3vBxEeZMdJHJNjh17umdTg1Ble7paV6u2qKYUbPKLvhvttB1gV6Mkf3WKDIFslxzAAiLSYX2/xpI2z8tSMkuaj/gmtsdqtroSOkupcI7rOJimWwF8zr/r8yVH1TWI+fqKKKTEjJ3w7By+IxJiYWG12W0ECr7cXbPqcUwLcm6lFd9Ykv6YS/jqOlsxKflcHYRURl3+Goo2qYDDYd6pYlAkVLHkK7pr4yGMPSMLiTBAi7H3hysJfYqmFiHU95wgnNwawyRJQXk2RAduA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDdV+PUfWV9pK014NSh7WUSe9JwYuT2TJSr03LYPPwI=;
 b=X6QE8yUgDUfOmAzDpvDDQWlLXT0tcxitw3c1s5ygxVEEhP6QQJZZ5lXTFGfONHCG/OmB2ISv9WGAbY4dcYdM/JTthZPTsu7wI42dsUpts5ZXKOY3Q4iN3A4+ENYPpyGPCcM4lb5LAuHQLHRvh+uC+UtCxEEZIsjBByY4rG5SMgAXjHnLKiVAFUAKLAz43n0XwDJsiHTazw3N791rmkEyB5so6D5nfJV/iI5ei8ea5TNlMwWiwX+IKDcYQaaRAb5NNSikBwzV+kLyNXu6J7QsmZnagvJ8xe/hvF/Q8jo0fR0LMyaKZtuLCl4DZsiU4wtMiLRN5uAj4+w77Xr3xtjkHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=viavisolutions.com; dmarc=pass action=none
 header.from=viavisolutions.com; dkim=pass header.d=viavisolutions.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=viavisolutions.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDdV+PUfWV9pK014NSh7WUSe9JwYuT2TJSr03LYPPwI=;
 b=hponZfxlY8iR7nlu107fM59ac4XXTEjd8vh2hkPz95fKMsYp6Fd/XdOwOWKFARpUCWdm3DjarRVe+clpLA2hqncUk+SZiISvMqXIfvExTgKR6TsK1Wx67gLgfuTVnddjZYe8PIhaHEM/Yv/gjlCXxAiZRIBkWE0G8P3Tv2vMHsU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=viavisolutions.com;
Received: from PH7PR18MB5549.namprd18.prod.outlook.com (2603:10b6:510:2f9::5)
 by BL1PPF2E0F60746.namprd18.prod.outlook.com (2603:10b6:20f:fc04::d8f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 07:42:26 +0000
Received: from PH7PR18MB5549.namprd18.prod.outlook.com
 ([fe80::b355:4e50:c0fa:ae1d]) by PH7PR18MB5549.namprd18.prod.outlook.com
 ([fe80::b355:4e50:c0fa:ae1d%5]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 07:42:26 +0000
Message-ID: <cc37b088-696f-4f91-9159-30e839b7ffb9@viavisolutions.com>
Date: Mon, 8 Sep 2025 09:42:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the battery tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Sebastian Reichel <sre@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 fabien.proriol@kazoe.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250908080739.5f33c79f@canb.auug.org.au>
Content-Language: en-US
From: Fabien Proriol <fabien.proriol@viavisolutions.com>
In-Reply-To: <20250908080739.5f33c79f@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0339.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39a::19) To PH7PR18MB5549.namprd18.prod.outlook.com
 (2603:10b6:510:2f9::5)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR18MB5549:EE_|BL1PPF2E0F60746:EE_
X-MS-Office365-Filtering-Correlation-Id: 907652e7-da9b-4462-c616-08ddeeab4144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFZwc2dPdUVBaUc2UkZyY25uWGtrNGczTS9vNFJ0cnJlVjJiaXFaOFVVeGNB?=
 =?utf-8?B?QTd5RkhKRU9JNkUzekgxSWJFNGRCK0MvU0lZN3ExNDF4UzVSU0JrTkFzNkNm?=
 =?utf-8?B?aXdtU1l6VXF6c3I1K3RjYm4weDJRWnAvcWFxOURJQ3dCR0Jwd2ZucTlUWFR3?=
 =?utf-8?B?ald5R2NDV01aT1A0d21kVlBoYUd1aVZhRDhXV281WkcvbDVJMitNK2JwTUY1?=
 =?utf-8?B?UlJZNE1wYXBpdjdybWpXL3c1YUdaQm0vN213d3ZJQ0tVWVlnanM0eEJ6K1Vq?=
 =?utf-8?B?ckVHRENYRktsUzdQcmNiYUs4RnUvZDNMaFZzOHhvSmFiemdNV3QxRGdnS0hN?=
 =?utf-8?B?MEFHVm1TbjdsU3d2VStBTE5NbFIrSTE1OFhtWFRGQkpySmR3YVNUUVBBblFT?=
 =?utf-8?B?SzNZbHdadWwrcU1HL2s2KzhNZzQrWUNlekZJNGJNZmN5Y1ZLWWpIWHdnSmVE?=
 =?utf-8?B?Y0VoM1RuRnZWZTlNSVFxTnkrc1VDWU5aVkZKN3JYWE93QlBUcXFCYVBJQ0Q0?=
 =?utf-8?B?a3hwbndtNUhJQlJRN2dObHhHQXBUcXpzMFdwRlh0cmxmeDlVYmc1azZheVgz?=
 =?utf-8?B?QVRicU4rSXR6T2REbU9NSmNpcXEwejduVWF3UUp5SVZEbWRnNzl1MjF1MVdD?=
 =?utf-8?B?WW5mRUpDWGlxOUg0OExYbS9qVGFaUHI5cjFrSDdKa2xMWUJ6NFBpV0o2dHZy?=
 =?utf-8?B?ZllKaUxnMUZjMWs0eUlaWkNtM0xUVGVKVDJzQ3NENFUrWFVncEVuOTJ4UWdN?=
 =?utf-8?B?L29oZDFBNlJOT2JXSlYxcGppcVMzTmZUV200SnpZRG03TlFnWGsvRndFNzV4?=
 =?utf-8?B?ZndFYlpYR0FFblB1OGtuQ0w2cm1OcFVyaGNweG03d1ViTFdFU0FmZ3N2T1Ew?=
 =?utf-8?B?OVk1U0RZV05sQXdicFpMdENmTnRFSHROb2lQT3loOWpOTmhJYU5IaGY5UER1?=
 =?utf-8?B?NWhzczZ0M282YmVGRzJKUmx4RkZkb1VqSnU0NTNmRUVNamVybHFrbG1RT0NP?=
 =?utf-8?B?anlEbURlRE9TbE1FTGp6ZVRwYVBLRnpsWlVvWC9vbG9aeDJWd211cFR1K0gx?=
 =?utf-8?B?ZGFiMElQUTVNVHZYV210SWZxdjM0ZnZENXNBOTc3b3Jud3Y5MVg3b0NldU1z?=
 =?utf-8?B?NjRiQnNuY2dwVllkYUtwdzVmYVBhN09vOFVEZXFYK285OC9MVWR3cUp5VFRV?=
 =?utf-8?B?U3JtaHhUamQwaFBJaFpRaDV3aGRVY2g0c2ZVaE5wV1FPcktCOGZxeklDMFBl?=
 =?utf-8?B?aDBnUDN6TmNJMWdsM3N5RTJZb20zelRsbHJJR0s0aEUyRllUVUYxbXM0cVkr?=
 =?utf-8?B?eHRjQjFJTkovODJYY00xT2laQWJsY3Z4NUlzenV6dGRMYno1bEQ1a2RUNnhh?=
 =?utf-8?B?cUpnVTJiaUpELzA1dlF6R1IzL2ovMVhZVkY0eVBBRjhhVm5uR2VsUldHcENL?=
 =?utf-8?B?cWNSTXgyY3NIaHpXdnoxMFY3anBNTjJwY2poZDJGU0Jrd0dFMWtqcjdCa0VJ?=
 =?utf-8?B?Vk9QZU9tSnhYeTBCZzVOY3FiS3gyR3J6cXhVS2dlUEF4Q0dBMWRlNHplYk4y?=
 =?utf-8?B?NGd6WWJtZ2hVanpqV0NrSmlXSFZjUTBXMVIyaDBLbXlzWFlFVXRVeXNTdUlK?=
 =?utf-8?B?WVgwdHhTdi9EcWI5TUswRCs3bzlpS0NuemhCT0ZUeDEvR3hCQWpIODIyVzg3?=
 =?utf-8?B?ekd2NnVSRE1SRi9vdnJqUmhIcnphZWVtVUg2dmhjUVBSeTIvUEdydzBScXhJ?=
 =?utf-8?B?YVczU2htWVE2dFBKUEhHUVRvQ2pFc0FwU1Q4Q0FrNEtDNmhkSWlmUE50Smw4?=
 =?utf-8?B?T3FNZ1p0ZDlmK0RQczR3eWQrazFrMGExVUcrUnRyMklITnQzS201R1FpNWZV?=
 =?utf-8?B?Nk9PWFJSRUxXZjBlTzQ5Zm4xYVhiTVlFOUdNNkJGM2daSStYRlZCMmxCTTd5?=
 =?utf-8?Q?BNP4W8wV2EY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR18MB5549.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTZZNThWWFQ3c3JhSG1kQVA0dE0zdlZkVGRBdmZrUXJFQ1JtaEFQU2grbk1n?=
 =?utf-8?B?YU4zTXl4VzEyb2FxS0FmOW93SktueWExWk0vcFVOYkJkQm96YzNyRjI4NGdJ?=
 =?utf-8?B?VXNyeVRidUNoTzZ5WTAvc1JOL3psbDY1Wkxud3ZXUy9YM1k3SkdNZW8zVUx5?=
 =?utf-8?B?NDFraWtFQTNJaEp4VzdwTnlVR0MvRmMwb0FWT2czcWxiZ0xCU2k2VXlzSTRL?=
 =?utf-8?B?UHd2NitIOUlzejVocnFyZUhEOS8vQXJOSHZTaHJveXZlZmdsUHduRjlPcXMw?=
 =?utf-8?B?NGxPbDRFdHlRc1ZUMVludDJRSUdLWmExaTBYYXNKVjFjRjJZR1BvZDBsZnJo?=
 =?utf-8?B?SnpNZTRsWVlHN0FPOTh6cmJodTJyK21SUjhFY2J0N2VEYXMxTzBoWk9menp1?=
 =?utf-8?B?N0VMV3VNbXB3Z3hRV2lOT1VSelc3MEFZbml2bWJJaDVhRmt4M2JUbkFka0RY?=
 =?utf-8?B?dS9YbTVOZEJodWJUTXlZa3NkS2xzbWRYNmZjbzd1YSsxRVJPQmxzSGlCUWN4?=
 =?utf-8?B?SkEzd1JTT2JVQTk0SmFRVHNMM2NiREYxdk1BTHoyZ3hUZGVOT2RvTUgwTlZQ?=
 =?utf-8?B?TEpJRzRIK0RaWnRiS2tFM3Q0bUtwNWZWazdTRW9PbkpZbTk4ZGVRclRxbmZx?=
 =?utf-8?B?Qm5Mc0NnaGpYekwxb2NRQW16OVU4TXlsNnpJSTRaT0VhczdpSDgwc3hGd05M?=
 =?utf-8?B?R2RjdDB1b2J0ZE1OU256N2xLQkJUc2EyM3l3M0pKTHpncVVBR1lRRS9MZjRR?=
 =?utf-8?B?MForTkluT092QWdZMW56VUFLc2ZleGNiOHdPK3UzaFdmOTZzRlh3MHhkdGFS?=
 =?utf-8?B?UHVwWktXbXJwSTJDMURVOHhzTWoydURZVkl4Z1VCYXdsTkI2QUZEeEhOS2hF?=
 =?utf-8?B?Q1JmR1Y4YWxnSkNSMWNOVlA4NkQ2M3ZtZzZUNzN1dG0veG9yRlIrMFRYb1dF?=
 =?utf-8?B?bUxPc3pLOVF0V04zODdLVVBsZ0NyQWo4MEZNV0plZjhaNFMxL1lrdWtpWlY0?=
 =?utf-8?B?R0RFc1JNa3FSNGZzY2lXUmhKbTNZb0psVWhwc1JDaUhRREYyWjFtdzhETXVq?=
 =?utf-8?B?eEI3STlmL1NxU0JVckhaTkZySXgwUW93c0tMMGxjMW5xbGVqcGdTWm11SkdN?=
 =?utf-8?B?TjhDMEVkeGpNcVRick1kQjh3T0h1T2VWbWFkaXN4WHVja0ZPdHZSWVNIc3l4?=
 =?utf-8?B?bGhiOGNheFY3dlFoODNyQXZMTGduak9KcEZTWmhlVHRkaHJydFNncGtDaTNH?=
 =?utf-8?B?VGJkSS90MWVYRHJORWRQOEhkaVk4UWxwVEtERWUxZmw4SFZBVUY4bHV0dmRw?=
 =?utf-8?B?SlZzMXBLeFd0dDhHSUpoUytqRHI0aW9NVExLWUZhbE8raXcxK1hOd1F0NGlE?=
 =?utf-8?B?bVdSbW5JK2l3NDFVQzlCNERpK1Q5eU1aekg4Y0xSbk5wRlo5OWtTczFXU1Jl?=
 =?utf-8?B?M3FDSDE0YlJpVkNIWEFMcEhjRmZUaTZIYk1tWDJ6WHAyYVQxcjhSbmRwNmJp?=
 =?utf-8?B?QWI4MWx2bGpLQWJmVDdCK2lhdUpaOVpGUzdXdXpoNWdyclQyWjBMZVA2L09I?=
 =?utf-8?B?ZDgzd21RMlc1WWU5RmVhNzF3dnNuMGs0L1FIQ2JQSEZkWFdFaHhVMzY1NWNC?=
 =?utf-8?B?RGVtdXNQTFFLL0NUQ2JpYXBmR2dWSGw1UThzU09DcnVZQloxOGQzUWw1MGh0?=
 =?utf-8?B?WHBMcnUrQ0FoOUJlZFhER0NUek1la0NHMU5SY1NZV1NHcDlOU2piZFVpcjJO?=
 =?utf-8?B?d29yeFNMb2xTV1NJNkc2TS9Kd1Rkb2gyVVAxVFVZUnY4MlgvY1JJK2NacWh6?=
 =?utf-8?B?V1NGbmdBVmR4d3RRZGxOL1VvTWxvbnJOdi9kNEdLSlA5amdSeTkvU2ZqT3pq?=
 =?utf-8?B?a2s5U3ZxdFJ1RjFkZ2hBYVRqZGQ1TXU1SWY2YXg3U0xQMDRNUVM2NXRMbnV0?=
 =?utf-8?B?OVpKMmhGbXJSOTBTNmlySC9KUlNZV1VUN0tyWHo4UHFyZ25neEVnUVVDTkJr?=
 =?utf-8?B?Z0RDOGN6Z3A2Tk9DSGRBWm9qWjl0eGNtQldka2pBWTQvVjZtb2I3UHNNaEEx?=
 =?utf-8?B?TWR3S2VWZkZNalF5ZUpma2s5M0VHYmE5d3d4Vi9oVk56MU94c2svdnBGM0RX?=
 =?utf-8?B?WTZwY1oyYlhiUnRtRzRhMTR0OTBWN1U0eURJd014clhXY1ZRSEJLVTVyYkty?=
 =?utf-8?Q?lp8MCfCjOVBMFf7zOJUhez4=3D?=
X-OriginatorOrg: viavisolutions.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 907652e7-da9b-4462-c616-08ddeeab4144
X-MS-Exchange-CrossTenant-AuthSource: PH7PR18MB5549.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 07:42:25.9980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c44ec86f-d007-4b6c-8795-8ea75e4a6f9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nASyCpLTPNR7mVCUDj46BV6ymU69rLWvEcY7E/vfZQhkbgtjeODGiLi/zkJvVmkOKr5nL6O4t4eRbuApJtwvCjAj4Qrw3ugqKH3DwGzdiKHO5bj7WUoOZDNppMv3yftd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF2E0F60746

Hi,

In fact, <fabien.proriol@viavisolutions.com> is the email of my 
companies, unfortunately, the email server broke the indentation of my 
patch.
This why I used my own personal address to re-send the same commit 
(<fabien.proriol@kazoe.org>).

For me, we can use either one without any problem, so, if you can change 
to use the same in the signed-off and the commit, it's OK for me.

How to process ? can you change it or, should I re-transmit the message 
again ?

Thanks,

Fabien Proriol

Le 08/09/2025 à 00:07, Stephen Rothwell a écrit :
> Hi all,
>
> Commit
>
>    8543d1c462e2 ("power: supply: sbs-charger: Support multiple devices")
>
> is missing a Signed-off-by from its author.
>
> Actually the author in the commit is
>
>    fabien.proriol@kazoe.org <fabien.proriol@kazoe.org>
>
> While the SoB line is
>
>    Signed-off-by: Fabien Proriol <fabien.proriol@viavisolutions.com>
>
> We should prefer that they match.  Also we prefer full names in all
> email addresses.
>

