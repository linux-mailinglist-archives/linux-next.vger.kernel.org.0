Return-Path: <linux-next+bounces-6800-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC027AB8B93
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 17:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8890C3B33C5
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 15:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60DC020B80B;
	Thu, 15 May 2025 15:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CMxvd8+C"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2077.outbound.protection.outlook.com [40.107.95.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7E21FF1C7;
	Thu, 15 May 2025 15:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324248; cv=fail; b=YivrLplnSTKdlElUyKkJqf5iWkplKDNig/6ZkIoCfiDmP5Bq9iNfW0xpjjH6QDKLyiSHe9aoz8y5oBKz5kLnLx6m2HbD+OxwqRNoZtNCIOUQfHgg1uVYp6WUBjN95woNwViq2A+0vKLnKHVgDzOWCFiS7vpvAxFi6hLrZ/j9CzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324248; c=relaxed/simple;
	bh=7Mhtp5kHtW/iD0IQmZ7q4FTLiiivHvoPqMx+XZiZj00=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O+DMSnXcn6OZrQ0OgcqSWWms8bS8tjxfoDXUOF65P7Qx5wGDho6Kbo+inVxHvqCaByfOTM70rYNiaHrBqRZuukC4+kXJjCfQp1U3k9Ne51xdz0Qr02jY9d4ADGVCSpmxhEzOwVHVVv58h5JEwna78p/oF8Ftmzjam3LgshjxBTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CMxvd8+C; arc=fail smtp.client-ip=40.107.95.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h46X+SYy7LoVXSvJxSNqfRmMZ7rUWDdxp4lwIP87Z9pXRp7upawTSHyE/WfOgMgILJQiX6jOh/EXKTtSO9OCk+PfnZp+od9P1dQ9rdUTNVUmrKnNpk/Hpvttls9/YSpo3CLNLcw3PqTPm8Gb3Fe3NhJKHlyQHvhVxtdlFL5L9NMc2eQvbFzIYki1lnAIw8RJhK57fHoSQTgzWTb0jVBVvYw9TcnVLgrurE8vsxM7VZY3GvI7+e2p8bt5GSquXDnRMx4W9fZAH0HzcaRQH7xnl58GBjUSQrJ2SWRAZBcXx6ddQuupMpbSbh+vgKGZLhk57oD9RS7hooL4LKOQl3eBsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSKnWlGm+PyXG7kNL503hWvOmuXQOmmVF9moIOgEPE0=;
 b=gInzqACKp+IF9QDWiUJ/2z7Z7UWU/QT/A3b+78AVMbhjm6Wm7gcmYS+4TzQIe+FpPcvm826qMTOdUBlCMpO37NBHFsSndUTU0kKqb4WRrGQi7JVOhBp6rsGQT5JhWOBLIudhdH/uVyjjm+tV+sFJz/q0zgBVKrncpstsGoNf2IsJ1hWUYcr0/k49Wgmh4JKE7BBY2BU/d/N0su8+A8hAKcGDkVDvpxUGwD3Srn1ZnqNzUCXyTQA6odSo46fK/5vuOghcs4Km2XuMHARf0zvC6D0eGwC6HJhIzp9k2w/CRYLV2yEvVUcmvrE96ALW8bszzlNqulwqG3YtZTjB26evnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSKnWlGm+PyXG7kNL503hWvOmuXQOmmVF9moIOgEPE0=;
 b=CMxvd8+Cvr9jG/AwFmONv3ddjnz49e0BdLsrXBqtoxVapvIIQq4su83jpJxWsxw0oyyxSvRr/mAislOpmB12avqJK2BRxtyzQa2pUxOfIgLPNfP56UckSPq0b5tn2wWEfgtQANQXwmxMo7oBNc0+iBYauYnmUWJ0pseKmVYAr3k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW4PR12MB6851.namprd12.prod.outlook.com (2603:10b6:303:20b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 15:50:41 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 15:50:41 +0000
Message-ID: <46e04d1c-dbc8-4a45-95d4-fecfdd943065@amd.com>
Date: Thu, 15 May 2025 10:50:38 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
To: Ingo Molnar <mingo@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>, Dhananjay Ugwekar <dhananjay.ugwekar@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250512145517.6e0666e3@canb.auug.org.au>
 <20250512152326.3f2f0226@canb.auug.org.au>
 <8c4ab851-1853-442e-90a9-225be16c804c@amd.com> <aCYM-A_PYHK2kjSd@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <aCYM-A_PYHK2kjSd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR08CA0045.namprd08.prod.outlook.com
 (2603:10b6:5:1e0::19) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW4PR12MB6851:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d9299b9-b8c1-46fa-0112-08dd93c83ea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3FLbXZDMnI2b3lmWldhYlpsazZtVVN3bVpZSmZTdnl4OEFaUHM1Zi9URTUx?=
 =?utf-8?B?VnZaeEtCd2xVMWhlYzRmMHQxK1JJNFRCU0w2dE4xN1FNcGQxUWpLRDZtQndv?=
 =?utf-8?B?aFBqVnU5QnBXdGFWYlYrSFZQL2txVnpxLzVMcGJnTWhPVEpGdXpCS1NqWm1j?=
 =?utf-8?B?Z2FMMll0TVNQNVBLQlVBdXZaSHNIN3BEb3FIekFtQnY5Q0RIWmVieDAvRDFh?=
 =?utf-8?B?NTBzcStTT0dxZzU0VEgvUHNhNXJ2amIrZk8vdmZvM3I2ZVUxSkxGVlRPdENp?=
 =?utf-8?B?RGFTaGNEWm1NZDBBMFozK2Rld3lkRndEOHRmYmNuS1gvWno0Z3BsN3VrQVFJ?=
 =?utf-8?B?N25GR29OcWNOd1JEN0QyaUJTTGg4ZjVMY3gxVUpYSW5QZzlMWGJjQ2JjRU1G?=
 =?utf-8?B?bXMzTm9NREJXYkxVUCtxdjNKTkVsQS82VHNrbG5ZQjkxb0NUall5ZGs0bGJR?=
 =?utf-8?B?SkJoVHVydUFNeHJTekdGcWprR3ZaSngvUjh2RjFiVEZCVHM3cmZQSXpZUUk1?=
 =?utf-8?B?aWtSUUlTVFZyUUVvbTFEUERud3hQT244UFZPUnFJY1pocURIazNFeDIrWldJ?=
 =?utf-8?B?clYrSEtpOEZJYXpkeGlDTy85d2NwZmdyVm8rYk1zTWhMZE03UW5saCtDTkRS?=
 =?utf-8?B?VTh1TEhYd0ZMeXQ2VUU3TlZkdXdtYzZaZjZYZCtZQ0hRWUhubjhMSlJCTzU1?=
 =?utf-8?B?K0krc1Q2Z1d0VUpzOWdOTDgwUExaNFBjS1l5THFycHM1ZldycmVEckY2K09v?=
 =?utf-8?B?L0NUOUkyVVduLzhENm9sb2l2WU9ydmZhTVZzNDZwYWZqTjhGS0UxbW92N3lK?=
 =?utf-8?B?dmRJYlJtcUpmNHlMdEpHTEZINXF0bWxYUHY0YnZoQkVrQWh6OFhOWi9obzc0?=
 =?utf-8?B?Y09OdEZpV1pQNTRLUm5Wd0dyWjNQK3hkSEFQN251b3kzM055bXM1Q2kxQ0kw?=
 =?utf-8?B?UWZhQXp4REhwbkFaWm5WeXBMZ1JvSWZrS3J4TWxpN3dVdW9nZXJjdllwZzdl?=
 =?utf-8?B?SFdzRHJIZWNJKzRKWHZmUThzdXdaSm5sdUFkall2dHF2amVXdUNsYkFuZWtu?=
 =?utf-8?B?QlhSVWZ4a2hSekVPVjNsOUdvU2R0dFVKUGlwb1ZNMi9TYllpRW1kc254SHh6?=
 =?utf-8?B?NHMyZzhuVTFDTk9tNFIvbVpCZFNuM1Y0a0V4SGg0cFU0b3MrYldJMXR1U3Mv?=
 =?utf-8?B?RlN1eWFpY1JSRHZIOGlTQ0laaVJoaXJyMUpvbklYRGtiWGZoajRyUm1tWlVK?=
 =?utf-8?B?V0JvME9MSUUyUFdYS2dGQWxNcmsxZmltcWxYaUpvTUdzQWZENGJ4cnRJSkdn?=
 =?utf-8?B?SlMyZUdJN0ZkQS94THY2ZFFva3kwRXNvN1l2bm4wMnFpT0pveWd5QkMrUGlK?=
 =?utf-8?B?ZHcrNVIzcmVTMDZmY3FueTR2QzZ5bjVaZERGTS9WbWZGZnpVNnVMT2NxQmox?=
 =?utf-8?B?eEV5TGwwSkp5WWdOekZMaDI0MjNjcUdNVVptVDR4OUkrZ0FaWHJLL1hoakR5?=
 =?utf-8?B?SjhpcXNCUWNxUWhMaklhN3VkN04wYzNFeFdvYS9KcjRzSXJsT3ZlUyt0S1Jx?=
 =?utf-8?B?b3FHL0pxSElnZDRnUlE4bU1VSDNEaWo3SmtxRUZ4emE1MFVndGVwd3FCTkxZ?=
 =?utf-8?B?M0hwakZZdWgvTWZSd0ZIcVRqZlRaTmV4UHJGUEVyN3pjT2g3VUQwTzFoM0s4?=
 =?utf-8?B?MUpaN3A0S1VNS0FZd2x4bzVlbDJPVGVpNzUxb0FEK2lwTFpBdDJZOXhZT3lk?=
 =?utf-8?B?VWZsY3dPZmIzNFQrNW1wUGZDU1pkQXJEb1V6MGdUUlRGSC9kZndrRW9sSWhP?=
 =?utf-8?B?MS93cjMzeFF5dmlNWmQ2VXlNMFdteS83MkNRdlZ2R3Q4S0o1eWxLQmZDTTBy?=
 =?utf-8?B?Y3htWnkrV2pDZFdBeWc3QXBpQzR0elNPa09GZVpTU2xsVGlCbVpzMGFaV016?=
 =?utf-8?Q?B49lJOc1tc4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zmc0Y0xXL1RVVnJ0MWQyRTNFZ3NCV3ZzZEh1dWtRT0IxQ1RUS2kzWTFQV1ll?=
 =?utf-8?B?TVNtQjR1VDVBRzIwUHRSVEJ1Nk5IOWhuK0JKbE8rbEtsVHJyYzMvVWt6T2Vy?=
 =?utf-8?B?Q2VBbkM1LzdFcjVKMWZmMXZscmtqU2lia0NhQkFSazFVMFBYWGFnK051YUlQ?=
 =?utf-8?B?cXppZnRxRzRoc2tiY3d3Q0x1K1BnZEYzSmZVV0tkTCtTK0p6TjNxUytTNi9W?=
 =?utf-8?B?VUFnb2FNdHp5ZHRDQmJSMVdsUldnSVFBL1J3Yk1XSGtJSXVoVXN5Vk1rOXVU?=
 =?utf-8?B?eXNjK2xCQWxJUVhiY3lFc2FibXU1Zmljdnoyc3huY2FjZmZkOWhiYUs0eExV?=
 =?utf-8?B?L2xmcnVPVUw4UytWUFB6V09EU1pGVjhhcTBNaWRHWE9rOHlNcVpjZ0g3YWc0?=
 =?utf-8?B?cVFsbjVudno3S0lPYVFCb3JoR2lJb1graDRHb2srWmhsSFo5emVJRGdrWmdZ?=
 =?utf-8?B?a2JSTnpYT3E0bmZDSUM4bHZTaDEvWDR5Mk1kRm1uYVM2Y2FQWXpWNWM1MHFH?=
 =?utf-8?B?WFZxcDdUcXROeXIwbjdBdEc4dTA5TTBkM05zZVp3ZndUblhpVTRyY3M4UTJZ?=
 =?utf-8?B?K1RxL3ZNQUFBRVBPQTY0NEE5OHZLZ0FPdVpMSFgrb1AvenJUUmhZY016OGNH?=
 =?utf-8?B?ejBYMGtoUWNqMENJeDgydVNQNDE1NnZSMEhjNHJJVnhSM2xJUDRHOTRHS1Nh?=
 =?utf-8?B?S08ydkdNQlk1NWNnWnh6eXlrNUxxaVFLeWpaQkdnbXRkM1Bodkt6UCs0allL?=
 =?utf-8?B?ZG9pYW9kN0ozZ0kxMEtvdFNsWEVuUWhwbnBzem1pQ2lMUHErYjlQRWZQL2o1?=
 =?utf-8?B?amJwdml5enRmU0lEeWpWd1k4ckwwNnUvN2phdHNtU3RzenhBMzVlZ1ZZTnVM?=
 =?utf-8?B?Qmtzc2g3ZGtFWFllaHpBY3QzZ0FvWmQxRHVwNmVHUmZNL1J3dm1DY3Z3WVMx?=
 =?utf-8?B?WWpJVWhmLzRkUGtwL3FkVmVmZkFkWWprQk5FSmszTmZsSEZWazRsd1ZmVWNI?=
 =?utf-8?B?QVZoSWdjMUVqM1RMTktMa0RoL1k3ZWtwTGlGLzIwRlkvK05uWHJySzdUYnpa?=
 =?utf-8?B?OXNFcWlNZUVCKzF6K0U1OTI0QTBmSzdyWHFtc3JjQkVqcEhCNmtva1JSbzRl?=
 =?utf-8?B?L25lV0dwWmUreHFJTmxkOGxLMzZHNjdXdmhvQkI1VE5pZU41RWZTS0g2dkdI?=
 =?utf-8?B?b1U0RHUzUDQwU2EwcGk4N1M4ZnZ4S2doWVJNSFJLZGZILzVod0dqRFJxQm05?=
 =?utf-8?B?ZW5GLy9oVmtpYTVnWllMZXJmZGhtdHNLYkY5ei9SM2RrWU95akQ5cXpkekov?=
 =?utf-8?B?SzA2TktTWkJISkgwcVowb3g5WDgxN3VzZVRxSmZUdEtEOEk2K1VzVmVLelZm?=
 =?utf-8?B?YVloOWN6c2hzcytJTklhQ3hyMmkwdWhzNm45R0dJZ1FsWjl6NlFsTml6eEpy?=
 =?utf-8?B?MHJXdUJWTGQ3QUl6bU15MC9HaXd6cjdKMXVOTythdklaQnVxdDdXb1NqeVRO?=
 =?utf-8?B?L2dSdk4vVDlqRSszbE45RjFSK1Y3YWlZOG5MYXJ3VkJ5SUF5dklVVk8wb1NX?=
 =?utf-8?B?VDdHL2xvekxLaXk1end5WTJyT0p3SnBCV0txYldLcFBKTVR4RDJLR1Q0S0N4?=
 =?utf-8?B?T1M3cWVWaWtzVkRGcUU2YmZwUjBTa0F6R3kvdWJBeDRGK2hsZm1rOGFnamF6?=
 =?utf-8?B?NmZmTncySGJpMTFRczBRTUpMdXp0dC9yYmRDbXBXYkhlSnhYZzdnL1NlMElC?=
 =?utf-8?B?WjNSSmVHM3FUMTZzeklmZnZxK3FsWCtwazM2NS9nSmZQVmNpUDBCbHJQcERo?=
 =?utf-8?B?VXl0bThJSW0ycE1ULzFqSldSeElnRnFXalFOVlVVbUVWRmVDTFY2MVRxWU9R?=
 =?utf-8?B?U2xUUytVakY2c0t5Y3NOdi8xWi9lL1FIWDJYcHhpL1ZlSnprbldRdlZTTHJ2?=
 =?utf-8?B?YkF0azBWcmdDWVVweG51UW9uWDY0UER1a1N2MVpJaWhBQktYTys2a1VpdjBz?=
 =?utf-8?B?NXlSckxtY1lYQVBoZXZiNG1lV3FMQUMyZHNYLzFDRVYzS09CNFhvaWtYdGND?=
 =?utf-8?B?T3V4TDc1eWRWdloyeVU4ci95cDErSVVTL1FHM21CZWZLRFZCcDd4d3pLRFdM?=
 =?utf-8?Q?Tn1wtd4Nkvc0t7tXCeSzwiqG3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d9299b9-b8c1-46fa-0112-08dd93c83ea4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 15:50:41.3991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAHmUYq3cGZIKCbqC5vAnPC/hN7953f9IUarz5jPSpMWrRs+60k71GcAvRFaiKi+bozve8I6hbNzgQlA8stT6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6851

On 5/15/2025 10:49 AM, Ingo Molnar wrote:
> 
> * Mario Limonciello <mario.limonciello@amd.com> wrote:
> 
>> On 5/12/2025 12:23 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> On Mon, 12 May 2025 14:55:17 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>>
>>>> Today's linux-next merge of the tip tree got a conflict in:
>>>>
>>>>     drivers/cpufreq/amd-pstate.c
>>>>
>>>> between commit:
>>>>
>>>>     608a76b65288 ("cpufreq/amd-pstate: Add support for the "Requested CPU Min frequency" BIOS option")
>>>>
>>>> from the pm tree and commit:
>>>>
>>>>     d7484babd2c4 ("x86/msr: Rename 'rdmsrl_on_cpu()' to 'rdmsrq_on_cpu()'")
>>>>
>>>> from the tip tree.
>>>>
>>>> I fixed it up (the former removed a line updated by the latter) and can
>>>> carry the fix as necessary. This is now fixed as far as linux-next is
>>>> concerned, but any non trivial conflicts should be mentioned to your
>>>> upstream maintainer when your tree is submitted for merging.  You may
>>>> also want to consider cooperating with the maintainer of the conflicting
>>>> tree to minimise any particularly complex conflicts.
>>>
>>> Actually it needed the fix up below.
>>>
>>
>> Ingo,
>>
>> Can you guys make an immutable branch for Rafael to merge into linux-pm for
>> this change?
>>
>> I can redo the amd-pstate merge based on that immutable branch.
>>
>> Rafael,
>>
>> If you want to just carry the fixup that's fine too.  Just LMK what you
>> need.
> 
> If it's only about rdmsrl_on_cpu(), how about the simple compatibility
> wrapper below instead, applied to the x86 tree?
> 
> Can merge it into -tip and tomorrow's -next would resolve this without
> any changes or merges done to the PM tree.

Sounds good to me.

> 
> Thanks,
> 
> 	Ingo
> 
> ===============>
>   arch/x86/include/asm/msr.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
> index a9ce56fc8785..4096b8af4ba7 100644
> --- a/arch/x86/include/asm/msr.h
> +++ b/arch/x86/include/asm/msr.h
> @@ -329,6 +329,7 @@ static inline int wrmsr_safe_regs_on_cpu(unsigned int cpu, u32 regs[8])
>   /* Compatibility wrappers: */
>   #define rdmsrl(msr, val) rdmsrq(msr, val)
>   #define wrmsrl(msr, val) wrmsrq(msr, val)
> +#define rdmsrl_on_cpu(cpu, msr, q) rdmsrq_on_cpu(cpu, msr, q)
>   
>   #endif /* __ASSEMBLER__ */
>   #endif /* _ASM_X86_MSR_H */


