Return-Path: <linux-next+bounces-6512-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 697A8AA8B57
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 05:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B18A23A537E
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 03:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2638915B102;
	Mon,  5 May 2025 03:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZDUThniz"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45694C6E;
	Mon,  5 May 2025 03:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746417067; cv=fail; b=heoyPxBvn/iXZ5pipjyRl2xMh+tqPW9eXgmgmbfCy9OjIvPgAHt4JcPMY5vejJ05adWSZXVnwdQKdBUI9tuTX9UodbvcXqQwFIUHibKhoeDVMyMQ3V2iwXNJRL0A5L5iwLkDuWBKqMjNK820meJnNqLBU58l0z5tTWnByxK3m+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746417067; c=relaxed/simple;
	bh=iTQsRcXu3rb3fRG2Cv6hkUUw/9lgoCvDvGJKVY2O7hc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dmpDVqf268q/hpVPS3pJUEwMBkJZRP07GWUU+t0hfuQWkTZXUtQGA+T+h+OvNihA1OGFARFbzQSiND0D7ksUeUIqETFZaCq8HM/HHsem2MY4/ft5NH08U9Ww0fHlFygrzGnCo4bdI/xCGtkFeGisbQcdcRM3JCKoZsMSxoGUFpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZDUThniz; arc=fail smtp.client-ip=40.107.92.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a25tae0M/K3eJQQw9tX8yd5i2No8KvsvYCUiuyKZSF/yIwxlSKqTn+qWwzIEP29m9NB5GJW/zeJnu6oAAhvY5RTSC/fmoeNef8eQ6r7yROKHuUDvx3dTsxHXDFIRh0P0cHbs2DLeNoV/mwN9ZKFyFYWm/LueAVLn3hw/s8AN9SP9nQWxRpmNPAM8H6NM1PekraMYYZlCc8eeA0r2Ysc43MYa6TKXLEGcrlbzihrvv1on6Z+//aZ6CIpYGzwJqt7xn0NbELRYaZe5b0Xu24p+6WeZSFZs0XljRJSwP6aN3t8WVvl8/UyQavNWzXJMHf/qZfy1GtLxL1VkZIQjhvrKXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmXr2RpE6+KbKxE093lXxPccD9y3x7bvmfB9SxJ/wuY=;
 b=WoZTdgRkVHhconlDfxlIgyoUgWd48h/8F1eH4fTmCD5X93hAQUuCSW6y4e6w1UcdRdeAhONtsXcNtv9zn9oCV2YHi3jiitbH8LmEjeLz/W8z4YjPkXJtRZPRI+RWVquV8uOm5Zbo0Khqcv7PsGOOljyiIRK7PDoHTpGQFeShOl4UZ2UGnhjxAcifSXvMf8OPbSI27kgGf7L9MZCjOUOXaZ7IL7fXqTDwol/n1263fHrmaQcXCR3xntD1gEiNzu5wZBNxWkrq//iW85KW4IrHygHD7Dv+Yl7aFkIuQJhu1A2ZzgdQF/9BJ1yw7pnZVZGEAT0Ke3lGUpw/e0YsKRiTJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmXr2RpE6+KbKxE093lXxPccD9y3x7bvmfB9SxJ/wuY=;
 b=ZDUThnizjUoy4gICxL9MLx7f+BsAjW6PZRzKNX4o6YxggPIxGRET7CLAr0AzkZCskCQf+gg4g/AAdmm31lJa8NoT8/vfAreRjEYBtuFIJss54/oVOTcgM6GFTXyBFcwoHAnfbDlcZoseNCPTOBtlYJl48Sc1w4BBxOwqGstHcLM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by SA1PR12MB6800.namprd12.prod.outlook.com (2603:10b6:806:25c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Mon, 5 May
 2025 03:51:01 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::1fc8:2c4c:ea30:a42f]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::1fc8:2c4c:ea30:a42f%7]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 03:51:00 +0000
Message-ID: <8f746aa3-9ee6-45a8-84b1-da335be17c2e@amd.com>
Date: Mon, 5 May 2025 09:20:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for May 2
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Neeraj.Upadhyay@amd.com
References: <20250502194808.67e5164f@canb.auug.org.au>
Content-Language: en-US
From: "Jain, Ayush" <ayushjai@amd.com>
In-Reply-To: <20250502194808.67e5164f@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0129.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b1::11) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4401:EE_|SA1PR12MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ae99ca5-60f1-49fd-d036-08dd8b880c92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGdkMFpEeFlwRDNranJ3LzZuR2I2b0d0U0duZHdBdTBydmw4MWV4dEw0VzRR?=
 =?utf-8?B?b1VMN09rWExvbGFsS2hMeTdnazhIOEtycklDZ2hVcUwxYi9EZ1pQR3ZsOXB0?=
 =?utf-8?B?bG05WlNvNHRCL29sbkwwc1BWdkNyTGdjV205L0ZWTyszZ3dmcytGMnU0MFcw?=
 =?utf-8?B?aFAxaWs3OGZDVVorbTQ4ZGRkWTFqZ0dwcHZQeTdrWEsrSUNOcDhwR3NZK0lJ?=
 =?utf-8?B?OXA0OEQrNTFHbnNkWnVnZDQ2VDVWcjBsL1E0RnYrc0xLNFoxS3pDbjV2eHgr?=
 =?utf-8?B?bDhwSWYreWV2MGdIRjJkSnc5TXNRMGlMSERLc1BjZTdyNmo3RExqeHZ4Yzg0?=
 =?utf-8?B?Z3FSdTh0Vkg0alMvUXRVTkl0MlhiV216QzFqUU5IYUdLSkVORkhkTzc1SGlm?=
 =?utf-8?B?cUhURFJrUENLdnFNZzUyaFlIVncwWFphaXgvd3U2OGhmVGRSY3k5OWx3U1dx?=
 =?utf-8?B?dGx4OWpHNFFmRXk0UUZOTnZSY3EzVWVWZGoyZ05FVjBJbHZXTmdEZE5WaXZs?=
 =?utf-8?B?elJydTZiWXFtS2V6VzlJMzJiQk02NHBHR2dkR29IUVgrZndsWTVQSGtQczg5?=
 =?utf-8?B?VG5JQW9xdGZBZWNBaHUyditucTAwSGp5Z3BqQjZ5bEU5L3B3MFQ4aWJYSlp5?=
 =?utf-8?B?SjlsWEcrb0NBWGoyK0tKUXh2Y1JWWWZvaG5odDBqR2xMZHhwdmNVd2xBNm9I?=
 =?utf-8?B?dUIrd3R1MDdRUnJoQVIwL24xaWVsMTJlRlZ6ZXlQNUZLczg4Mmt4aHpGL1BC?=
 =?utf-8?B?dkpsRDJMT2xWTnROYnpqS0ttcWZqa2Q3TmpPWmlNUEhHaGVHMG15R25xQzdL?=
 =?utf-8?B?d2RKWFpKd1Jkb2xmZDVQVGtMdG5SeUc2TUIyNTJoTStVZEZmUWVBMW9SRWNk?=
 =?utf-8?B?cVZOVlkvMmJWLzMybCsrL1VRd2cvOGdkd3NFTnloY25zbi9xcnkycm1adS9w?=
 =?utf-8?B?WjRWaEErcE9yVWNVbnVxTHJ0eElibDhqZHlZSk0yd0FjM0F3aThaMTZBeWps?=
 =?utf-8?B?amRvaWE5SUtWUXpMTWN2bHF1N3VubjN3c2xMb0FHREQzc2tjdHh4eFZNUTh6?=
 =?utf-8?B?ckl0Q1dqZ1d2ajRrdGJEMmUyTjRoQ3lYNm81eGx0eXVJM20vRCtHTDNIQU0w?=
 =?utf-8?B?OXlvTHVmY1RtVkg2MU1ZMzNhNlN2dGJ1a3N5L3BhbVdjTTJweTA4cG16VXor?=
 =?utf-8?B?Vm5HRXNYTndRVnU0eWV5QnczdXdxTzVTSWZJamN0RnlUaUpXRDdoT0xLUzRS?=
 =?utf-8?B?OC90TkFGdmMrYUpSMGYydHh4TW5LRzRpSE5QZHoxbUVkTmhjV25WcW91Njcr?=
 =?utf-8?B?aGRzdGpGbUIwM3k1b29zZ3FMWW1BdmhoeDFHYWdtbm8wa1BWVUJJYmxSa3o5?=
 =?utf-8?B?bkQ2YnZxUXk2OXdrcEg1SmZWeGJ5Y09YMkVBTFBKRTRORys1NXFQUjBnQ3Rn?=
 =?utf-8?B?Z3Y5RWJadk4wN2ZIWmJ2cmNGSXBLYWh3cW5keHhrOUR5RjB2RU9SekVDSG5F?=
 =?utf-8?B?YmRiTThEa2xud0ZySGE5YWI3dzZPSjltakhScGZOVlFqKzM4Tjl0TWxxZElL?=
 =?utf-8?B?YnFjL0pVTCs3dlB6T25iZWFSWmczWjZjd2xuemRmQWdqWTl0RFhSdWJ5NVlX?=
 =?utf-8?B?M1o2YUFCRnBvZ1VVd3NOZ0J6UVF3bWRjZ3JYVFZkbXkvQ3RzMDFaeEN1anpz?=
 =?utf-8?B?a2dyVHZna0xuYW1oNVZ3eHpMYmk0bVdxeDhneXJ3SE13cnZkclJwV090eGZy?=
 =?utf-8?B?dHFwZmN1MVI4bGZqUGJzSWduVTYvK3M3ZEtZZTZIeUxSeTdTYjBybVdIb0d5?=
 =?utf-8?B?QUdwS3FiZUNvem5wdFo5eUhoOTl3eEdLLy82V2VON0Z5c2VWdnhBQzErem9S?=
 =?utf-8?Q?TYDIq7hjJ0/u9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4401.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlpiSDZwYjdXSUxYbkU3aXVxazVPeE94cHNBT0pSZ3YwbmxudTRMN2RycERy?=
 =?utf-8?B?MU9jZzZMQ0ZmZWR2Y29OV0JoM0tFSXpReVVTcXJhTTVDd1BmTTFQRVBKTUVs?=
 =?utf-8?B?bVptbFRZaFpvZC9ONElzdXVGWGRhblN1Z1hUWmZ5ZDdpcEZuNTdYKzRQZE1w?=
 =?utf-8?B?TjB0VjlLWXFLRGptNVVnaHpoTFNaNzJBT2pOWStWVjM5TmhBaEFLcWw5RGdF?=
 =?utf-8?B?TnlDRThGVkl5N1BzZ3E1L1hzbVJsOTdpaXpNWEFXRlBJWG4zU0pWRml4dkdz?=
 =?utf-8?B?NDZnVG9RR0tTdFQrbkdCakplN0YxL1FBM2NIL2VvcUlKVHFNTmVhY2Q1U2lj?=
 =?utf-8?B?eXhEaGI5UW1OUjhqaHRpZFk5VEpYNSt4V1lOUU1QUG9HMWRmbW5jTHlad2tq?=
 =?utf-8?B?eGsvblpPaFE4N2FsM3MwNnZwc0FHQmF3S3FDTGZjdURBSk40cDhsQkVCM0tk?=
 =?utf-8?B?QmdpTjh2Uyt2S05FNGxCL0FCRTRYVmc5TmtFSkRNK1U4MFdkdm9JbExxNGFx?=
 =?utf-8?B?MjhMQUIzWlhuUTJLS21ZTjF1V3NXZU1YVnJhWlArUTlyOXJKbC9qb0k0Qnd5?=
 =?utf-8?B?WkpwUHI4dC9xcjBTUUhCWXptMk5KTUdmd3hobnVZdWNWSEdLbmpadmNkVi9m?=
 =?utf-8?B?VGd4NXlWWllCVGFCYUQ0WFJmT3Y2d1hCc3M4RDVpMFVLc2VqS2tnT0FoRHJu?=
 =?utf-8?B?ZlhPc21BemRndDZQd2VrZFkzOWY5Zmt4MmJXZEFDMEtZMGJMQ1FWRFNpK25h?=
 =?utf-8?B?djVBd2Z4Qm9PWWZ4NERmTVBnZHR1REZHK2FxWjZadWxCVTQwVVdGcU5aU2F6?=
 =?utf-8?B?Vjk4V1BKWGRHWER2Q0ZDQyt2c0kvVE1ucHZBSlp5Tm81eDlZZkVqbmdxYXdq?=
 =?utf-8?B?eTByK1U5bmJuZXRCTytEZExSK1pTYXRuVSswMlhPTlErMUFYdjJtZGZwMXJ6?=
 =?utf-8?B?ejByRjFVRGszTmR0TzlHVDU4dTY1a2UrNEpuczc2aisrSjUrK0J6Y0Jxa3BB?=
 =?utf-8?B?YVI2N1BBVE5vV0ZrZS9OeE84TzJESEJrdVdMc2hRNzFiMGFLa1VLQk9TSXRh?=
 =?utf-8?B?YnpmOEJIazU1VllucGlUdjcxNlMvT0g2TFVwVjZYbUUzY282eUNacUt0ZjFQ?=
 =?utf-8?B?RHI1TzdwQVBXUzNINjJGNy9vNkU1YXVFdUEvSEs4ZVhBcjlvMmVvUEsrdWY5?=
 =?utf-8?B?ckNvNFVUbE9vY3E3Snpsb1Vvb1NiQ1NlTnd1UkRvMlIyNHI1cEJRRmxleHAr?=
 =?utf-8?B?dldMWUpwakUwQjBITW9CTERodWo3ZGovMzV0dWlROFYrcEdicldMRlVhOXJB?=
 =?utf-8?B?cGIveFFVcGoyaE1VSkJIa1NUTWhrRERHYk9xeEtDb2JQN01YaS9YZWN6ZC9o?=
 =?utf-8?B?MTlWdG9ZZUFYalJyUVlIbHhUZERCTnF3djJSTjNZQjZ1bjkreFh4NTU0Qm9h?=
 =?utf-8?B?TEZaR0RQY2ZCQ1BqdnNYNzk2YVozZnhRUjE2MTBOMVNYeGlFRmF4L0RyZDNl?=
 =?utf-8?B?bS9mL0hmZWlycVdyMjRRSnZZQXdneFJpRUVDUkt3UnFkenkrOGlQYVl5OFNH?=
 =?utf-8?B?dDI0Qkh1dTZEMmFONmtPdFhIVFdOek9VOUZFWU9ETWJtTUJiRkdvOTY4OEw1?=
 =?utf-8?B?QkgzU3lSU080dGRIRjZUeGtxTFJUYWNoTm9SdXcyLytETFpENkxnOG9yY1BD?=
 =?utf-8?B?cEpOakJMMnh2NlE5T09pbUEycy9tZC83Ynl6YmY0eEdNTlhlbXZiVEpIZHY3?=
 =?utf-8?B?SnFWbjliQmRoVHhrS2dMV1ByTU5ab0tCS2tlSnZQWFk2Zk40L3BDOXRKSE9a?=
 =?utf-8?B?amZsOGtOWFdSSnJITFRNdjFNSE9XN2dNNDQxRTdxbE5PQ0p4YTl6ZG5wRVBq?=
 =?utf-8?B?Q1J6NmxEVnNKYlIrZk1qa08wRWdUNGxQdlJjcWM4Y1ZYUnBFVHl4Y3F3ZXhM?=
 =?utf-8?B?dTJzY0JEREw2OUNKdUdRNVB6M2lZL21FdDhnV3FzZVFZZ3BsWkg5Z1FWdGdE?=
 =?utf-8?B?M1dCTlFxSHFBQkNrZW9XYzZLTFYwWmR3WnhXZ1NjU01IN2ZSUm9hL1hjZitN?=
 =?utf-8?B?VWhoNnBmaEpzODYvV1lMTUM5UEZJTk4ydVF2Z0JNNCs0U0lvRFVrKzhlcGpv?=
 =?utf-8?Q?grcmkdc98V9DD27I1TTaZ+7NS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae99ca5-60f1-49fd-d036-08dd8b880c92
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 03:51:00.6704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vE9XmNKTZ/CiiqpE1Qohtlt80d2Wb69E+xqtAdLgDBYWNLk7DbrdoQjzB9ZiSeirpqx6AtAkR7WNzNGlTvNWlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6800

Hello Stephen,

On 5/2/2025 3:18 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250501:
> 
> I have reverted a commit in the mm-nonmm-unstable tree that was causing
> build failures.
> 
> The scmi tree gained a build failure for which I disabled a CONFIG option.
> 
> The tip tree still had its build failure so I used the version from
> next-20250414.
> 
> The ipmi tree gained conflicts against Linus' tree.
> 
> The char-misc tree still had its build failure so I used the version
> from next-20250428.
> 
> Non-merge commits (relative to Linus' tree): 7260
>  7323 files changed, 304374 insertions(+), 157636 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
> are tracking the linux-next tree using git, you should not use "git pull"
> to do so as that will try to merge the new linux-next release with the
> old one.  You should use "git fetch" and checkout or reset to the new
> master.
> 
> You can see which trees have been included by looking in the Next/Trees
> file in the source.  There is also the merge.log file in the Next
> directory.  Between each merge, the tree was built with a ppc64_defconfig
> for powerpc, an allmodconfig for x86_64, a multi_v7_defconfig for arm
> and a native build of tools/perf. After the final fixups (if any), I do
> an x86_64 modules_install followed by builds for x86_64 allnoconfig,
> powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig, allyesconfig
> and pseries_le_defconfig and i386, arm64, s390, sparc and sparc64
> defconfig and htmldocs. And finally, a simple boot test of the powerpc
> pseries_le_defconfig kernel in qemu (with and without kvm enabled).
> 
> Below is a summary of the state of the merge.
> 
> I am currently merging 395 trees (counting Linus' and 150 trees of bug
> fix patches pending for the current release).
> 
> Stats about the size of the tree over time can be seen at
> http://neuling.org/linux-next-size.html .
> 
> Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
> Gortmaker for triage and bug fixes.
> 

Hitting Kernel Panic on latest-next while running rcutorture tests

37ff6e9a2ce3 ("Add linux-next specific files for 20250502")

Attaching kernel logs below:

[ 1070.635450] rcu-torture: rcu_torture_read_exit: End of episode
[ 1074.047617] BUG: kernel NULL pointer dereference, address:
0000000000000498
[ 1074.054577] #PF: supervisor read access in kernel mode
[ 1074.059718] #PF: error_code(0x0000) - not-present page
[ 1074.064856] PGD 0 P4D 0
[ 1074.067395] Oops: Oops: 0000 [#1] SMP NOPTI
[ 1074.071583] CPU: 48 UID: 0 PID: 307 Comm: migration/48 Not tainted
6.15.0-rc4-next-20250502-37ff6e9a2ce3-1746413815614 #1 PREEMPT(voluntary)
[ 1074.084258] Hardware name: Dell Inc. PowerEdge R6515/0R4CNN, BIOS
2.16.0 07/09/2024
[ 1074.091913] Stopper: multi_cpu_stop+0x0/0x130 <- migrate_swap+0xad/0x120
[ 1074.098619] RIP: 0010:__migrate_swap_task+0x2e/0x180
[ 1074.103585] Code: 00 55 48 89 e5 41 57 41 56 41 55 41 54 49 89 fc 53
48 63 de 48 83 87 a0 03 00 00 01 66 90 4c 8b af 50 09 00 00 e8 c2 47 07
00 <49> 8b bd 98 04 00 00 e8 26 11 36 00 48 89 c7 48 85 c0 74 0a be 3b
[ 1074.122332] RSP: 0018:ffffa4bc4d54bdb0 EFLAGS: 00010002
[ 1074.127557] RAX: 0000000000000001 RBX: 0000000000000007 RCX:
0000000000000000
[ 1074.134688] RDX: ffff8d80c01fcec0 RSI: 0000000000000007 RDI:
ffff8d2153c93480
[ 1074.141822] RBP: ffffa4bc4d54bdd8 R08: 000000fa1239fb41 R09:
ffff8d9f3e832380
[ 1074.148955] R10: 0000000000000004 R11: 0000000000000001 R12:
ffff8d2153c93480
[ 1074.156088] R13: 0000000000000000 R14: ffff8d60dc9ac14c R15:
ffff8d2153c9414c
[ 1074.163218] FS:  0000000000000000(0000) GS:ffff8d9f8a626000(0000)
knlGS:0000000000000000
[ 1074.171306] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1074.177051] CR2: 000000000000049op+0x10/0x10
[ 1074.203665]  cpu_stopper_thread+0xa6/0x160
[ 1074.207767]  smpboot_thread_fn+0x122/0x280
[ 1074.211866]  kthread+0x11a/0x230
[ 1074.215098]  ? __pfx_smpboot_thread_fn+0x10/0x10
[ 1074.219717]  ? _raw_spin_unlock_irq+0x28/0x50
[ 1074.224076]  ? __pfx_kthread+0x10/0x10
[ 1074.227829]  ret_from_fork+0x40/0x60
[ 1074.231407]  ? __pfx_kthread+0x10/0x10
[ 1074.235161]  ret_from_fork_asm+0x1a/0x30
[ 1074.239089]  </TASK>
[ 1074.241279] Modules linked in: rcutorture torture xt_tcpudp
nft_compat nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 nf_tables nfnetlink binfmt_misc ipmi_ssif nls_iso8859_1
intel_rapl_msr intel_rapl_common amd64_edac edac_mce_amd kvm_amd
dell_smbios wmi_bmof kvm dell_wmi_descriptor dcdbas rapl ccp k10temp
acpi_power_meter ptdma wmi ipmi_si acpi_ipmi ipmi_devintf
ipmi_msghandler mac_hid sch_fq_codel dm_multipath scsi_dh_rdac
scsi_dh_emc scsi_dh_alua msr fuse efi_pstore ip_tables x_tables autofs4
btrfs blake2b_generic raid10 raid456 async_raid6_recov async_memcpy
async_pq async_xor async_tx xor raid6_pq raid1 raid0 mgag200
drm_client_lib i2c_algo_bit drm_shmem_helper drm_kms_helper nvme
ghash_clmulni_intel drm tg3 mpt3sas nvme_core ahci bnxt_en i2c_piix4
raid_class libahci i2c_smbus scsi_transport_sas aesni_intel [last
unloaded: torture]
[ 1074.316817] CR2: 0000000000000498
[ 1074.320135] ---[ end trace 0000000000000000 ]---
[ 1074.418846] pstore: backend (erst) writing error (-28)
[ 1074.423983] RIP: 0010:__migrate_swap_task+0x2e/0x180
[ 1074.428949] Code: 00 55 48 89 e5 41 57 41 56 41 55 41 54 49 89 fc 53
48 63 de 48 83 87 a0 03 00 00 01 66 90 4c 8b af 50 09 00 00 e8 c2 47 07
00 <49> 8b bd 98 04 00 00 e8 26 11 36 00 48 89 c7 48 85 c0 74 0a be 3b
[ 1074.447694] RSP: 0018:ffffa4bc4d54bdb0 EFLAGS: 00010002
[ 1074.452919] RAX: 0000000000000001 RBX: 0000000000000007 RCX:
0000000000000000
[ 1074.460051] RDX: ffff8d80c01fcec0 RSI: 0000000000000007 RDI:
ffff8d2153c93480
[ 1074.467184] RBP: ffffa4bc4d54bdd8 R08: 000000fa1239fb41 R09:
ffff8d9f3e832380
[ 1074.474317] R10: 0000000000000004 R11: 0000000000000001 R12:
ffff8d2153c93480
[ 1074.481450] R13: 0000000000000000 R14: ffff8d60dc9ac14c R15:
ffff8d2153c9414c
[ 1074.488581] FS:  0000000000000000(0000) GS:ffff8d9f8a626000(0000)
knlGS:0000000000000000
[ 1074.496666] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1074.502414] CR2: 0000000000000498 CR3: 000000409341a002 CR4:
0000000000770ef0
[ 1074.509547] PKRU: 55555554
[ 1074.512258] note: migration/48[307] exited with irqs disabled
[ 1084.683268] watchdog: CPU6: Watchdog detected hard LOCKUP on cpu 6
[ 1084.683274] Modules linked in: rcutorture torture xt_tcpudp
nft_compat nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 nf_tables nfnetlink binfmt_misc ipmi_ssif nls_iso8859_1
intel_rapl_msr intel_rapl_common amd64_edac edac_mce_amd kvm_amd
dell_smbios wmi_bmof kvm dell_wmi_descriptor dcdbas rapl ccp k10temp
acpi_power_meter ptdma wmi ipmi_si acpi_ipmi ipmi_devintf
ipmi_msghandler mac_hid sch_fq_codel dm_multipath scsi_dh_rdac
scsi_dh_emc scsi_dh_alua msr fuse efi_pstore ip_tables x_tables autofs4
btrfs blake2b_generic raid10 raid456 async_raid6_recov async_memcpy
async_pq async_xor async_tx xor raid6_pq raid1 raid0 mgag200
drm_client_lib i2c_algo_bit drm_shmem_helper drm_kms_helper nvme
ghash_clmulni_intel drm tg3 mpt3sas nvme_core ahci bnxt_en i2c_piix4
raid_class libahci i2c_smbus scsi_transport_sas aesni_intel [last
unloaded: torture]
[ 1084.683352] CPU: 6 UID: 0 PID: 83659 Comm: rcu_torture_rea Tainted: G
     D             6.15.0-rc4-next-20250502-37ff6e9a2ce3-1746413815614
#1 PREEMPT(voluntary)
[ 1084.683357] Tainted: [D]=DIE
[ 1084.683358] Hardware name: Dell Inc. PowerEdge R6515/0R4CNN, BIOS
2.16.0 07/09/2024
[ 1084.683360] RIP: 0010:native_queued_spin_lock_slowpath+0x2b4/0x300
[ 1084.683368] Code: 63 ff 4c 8d a8 c0 d1 20 b4 49 81 ff ff 1f 00 00 77
46 4e 03 2c fd e0 5e f7 b2 49 89 5d 00 8b 43 08 85 c0 75 09 f3 90 8b 43
08 <85> c0 74 f7 48 8b 13 48 85 d2 0f 84 5e ff ff ff 0f 0d 0a e9 56 ff
[ 1084.683370] RSP: 0018:ffffa4bc6b503a28 EFLAGS: 00000046
[ 1084.683373] RAX: 0000000000000000 RBX: ffff8d403f9b31c0 RCX:
0000000000000008
[ 1084.683375] RDX: 0000000000000047 RSI: 00000000011c0100 RDI:
ffff8d403f9f2280
[ 1084.683376] RBP: ffffa4bc6b503a50 R08: 0000000000000080 R09:
ffffffffffffff00
[ 1084.683377] R10: 0000000000000000 R11: 0000000000000080 R12:
ffff8d403f9f2280
[ 1084.683379] R13: ffff8d403fdb31c0 R14: 00000000001c0000 R15:
0000000000000046
[ 1084.683380] FS:  0000000000000000(0000) GS:ffff8d408b7a6000(0000)
knlGS:0000000000000000
[ 1084.683382] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1084.683384] CR2: 00007f54f32a3010 CR3: 000000209f547008 CR4:
0000000000770ef0
[ 1084.683385] PKRU: 55555554
[ 1084.683387] Call Trace:
[ 1084.683388]  <TASK>
[ 1084.683395]  _raw_spin_lock+0x3c/0x50
[ 1084.683399]  raw_spin_rq_lock_nested+0x28/0xa0
[ 1084.683404]  _raw_spin_rq_lock_irqsave+0x29/0x60
[ 1084.683408]  sched_balance_rq+0x6c8/0x1430
[ 1084.683412]  ? srso_alias_return_thunk+0x5/0xfbef5
[ 1084.683422]  sched_balance_newidle+0x1ba/0x450
[ 1084.683426]  pick_next_task_fair+0x39/0x500
[ 1084.683429]  ? srso_alias_return_thunk+0x5/0xfbef5
[ 1084.683431]  ? dequeue_task_fair+0xb1/0x1b0
[ 1084.683433]  ? srso_alias_return_thunk+0x5/0xfbef5
[ 1084.683436]  __pick_next_task+0x43/0x1b0
[ 1084.683440]  __schedule+0x20c/0x15b0
[ 1084.683443]  ? trace_preempt_on+0x1f/0x70
[ 1084.683447]  ? srso_alias_return_thunk+0x5/0xfbef5
[ 1084.683450]  ? preempt_count_sub+0x50/0x80
[ 1084.683452]  ? srso_alias_return_thunk+0x5/0xfbef5
[ 1084.683455]  ? hrtimer_start_range_ns+0x137/0x4b0
[ 1084.683459]  ? srso_alias_return_thunk+0x5/0xfbef5
[ 1084.683463]  schedule+0x_us+0x23/0x30 [torture]
[ 1084.683489]  rcu_torture_reader+0x138/0x200 [rcutorture]
[ 1084.683496]  ? __pfx_rcu_torture_timer+0x10/0x10 [rcutorture]
[ 1084.683503]  kthread+0x11a/0x230
[ 1084.683507]  ? __pfx_rcu_torture_reader+0x10/0x10 [rcutorture]
[ 1084.683512]  ? _raw_spin_unlock_irq+0x28/0x50
[ 1084.683516]  ? __pfx_kthread+0x10/0x10
[ 1084.683519]  ret_from_fork+0x40/0x60
[ 1084.683524]  ? __pfx_kthread+0x10/0x10
[ 1084.683527]  ret_from_fork_asm+0x1a/0x30
[ 1084.683535]  </TASK>
[ 1084.683537] Kernel panic - not syncing: Hard LOCKUP
[ 1086.154471] Shutting down cpus with NMI
[ 1086.169269] Kernel Offset: 0x30200000 from 0xffffffff81000000
(relocation range: 0xffffffff80000000-0xffffffffbfffffff)
[ 1086.583614] ---[ end Kernel panic - not syncing: Hard LOCKUP ]---


Test recreate steps:
1. Load rcutorture module to machine
2. Toggle cpu status (Online/offline)

https://github.com/avocado-framework-tests/avocado-misc-tests/blob/master/generic/rcutorture.py


Let me know, if more details are needed from my end

If you fix the issue in a separate patch/commit (i.e. not just a new
version of
the same patch/commit), kindly add following tags
Reported-by: Ayush Jain <Ayush.jain3@amd.com>

Thanks and Regards,
Ayush Jain



