Return-Path: <linux-next+bounces-9544-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B1DCF5B7E
	for <lists+linux-next@lfdr.de>; Mon, 05 Jan 2026 22:51:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A7573030FE9
	for <lists+linux-next@lfdr.de>; Mon,  5 Jan 2026 21:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0925A2D7DF2;
	Mon,  5 Jan 2026 21:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VJYiG0Rg"
X-Original-To: linux-next@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010028.outbound.protection.outlook.com [52.101.56.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398D316EB42;
	Mon,  5 Jan 2026 21:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767649889; cv=fail; b=k0ooD2P8DUbxJDcdC46vVNqkCSpuHAJ9YAO4naanR9Nl9IJ/dYQJqsHddGYGXwQwDv/mt9mSSTIbrM+XTUZPLcJ0OrVplIGP/+yTMaJfz5x8FjC+xS+ynZ3J2KVxj/iaJkO/lHyFxL01JzKqltr3Bfc6neXtbc1v+S9dnUwFDA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767649889; c=relaxed/simple;
	bh=86Z784D20pHPTNgwbPTl1eHcUrHdlfsyFEwJdTnnWXI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WS1iRwELyZN5inJuwzPUXdmCCwARhMDqy/H8dn0T5eSKurK41+hif/NgOAIpvbjZSjXNMCfd0/ZeY39vxmKUHU1XQSSLUtEqZGRKzouobhOptCvkcnTK+HO8ZMwUnCGp6UFZqlhlml0j5bDwvNBLicvLcgimvfMY1CNwg2ZxSqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VJYiG0Rg; arc=fail smtp.client-ip=52.101.56.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mo36Np9q2CU+6kqDUOOooJ0XiYrHxf9a2eRVW2C9uRoVOcEM7bjsHhWsTbKAyNpfbcvOA9wTD2FqIhegJvsRSMdfcftT2Vkhrirnyy2e3cPJYmKaVbY6qEneoVaHeFX79Ue1gnYFoiqPM7uTkmgTSy2jcqgD4RO3XEMJnDCDKdiL4y08Y8ZCKzrUW1DDe6rLLgS9+PhsUaUEhMGwwLZp7UVHgbhdChwZqWr5EDujdVBgOMH8A12M9s6u6C+4gBU7nGDaRw4XmPfGeesysBwRVxLWNGBMbPjBPWdJthwhk3zVJVT0ZVsC0CFiD+GXyBd2mj3NiRgK3MA7j79YmzmPow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohqcAJKhVN5DzGxTh+9Z94VUrGPIsEpfvy8bS1C8HPc=;
 b=YgTzAD+21Qa1gf1wkN8vBE9YTLzUEEs8cWBx5X0kokGcEsn202jErm6vqXMmyxdRQ+ZAnVLgzWjUxYsB9TLbzk+zKmmrPDAZvDcrf+9uBiaa83rwq2iN6jC5UowqWGLxEi5Nz47yTQZo6anCV9UIl3dxh6LGGnw5pQRdUDG2rq2YFdAah3PXfrTM0Xbe85G1ELmsnDQx1jQKqSlW9yUbm/wftnnOuFvOd9Segix8mo2VZoTMBdRHsUWNiH60RkfTyoXSr/HbBeb6Bxc3jmegrquUGiod4KI3H/KW0Qt+Rfq6LX9v8X7tFt2PYxwdGyKgCDtCU6Fzj2lJdZv9vSkYmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohqcAJKhVN5DzGxTh+9Z94VUrGPIsEpfvy8bS1C8HPc=;
 b=VJYiG0RgWKK7TwSbckWCn+To3mp8rKgMoRCBM9kV2zaybRN7XSvtwuDSS8c6u1QNvb1b66p89S3MmBJjXxQL4lxTbBx95eLr9HLLtSl1WeOg2NF+pSs9EbxfodakDJqcFqOMikSaNl4wU8FYyz5iqs2jiwAEnIJJ+6P0dMoKO8esrOUb7SP4acupShZDDqAOPzVcfHzKzuEsGbkgtAk8MUjr6xszVxYyifOce2NOfxLYxpwdAH+EdrKCA3TKDOhEBedQr6G1bCt8HIIyZfgkj8BwVLG9xYRujG9gbxGRo1aE0M87/faJyExTFPEt4Mtp/fqvRtNQMKajPOXT2a9SlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6329.namprd12.prod.outlook.com (2603:10b6:208:3e5::19)
 by IA1PR12MB6091.namprd12.prod.outlook.com (2603:10b6:208:3ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 21:51:24 +0000
Received: from IA1PR12MB6329.namprd12.prod.outlook.com
 ([fe80::eadc:c846:73e9:8ccc]) by IA1PR12MB6329.namprd12.prod.outlook.com
 ([fe80::eadc:c846:73e9:8ccc%5]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 21:51:23 +0000
Message-ID: <b8e8dba7-0f74-49fc-a384-b507132f2a7d@nvidia.com>
Date: Mon, 5 Jan 2026 13:51:09 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: trees being removed
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas Larsson <andreas@gaisler.com>,
 Christoph Lameter <cl@linux-foundation.org>,
 Chuck Lever <chuck.lever@oracle.com>, Dennis Zhou <dennis@kernel.org>,
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 Ingo Molnar <mingo@kernel.org>, Jean Delvare <jdelvare@suse.de>,
 Lee Jones <lee@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Miguel Ojeda <ojeda@kernel.org>,
 Oded Gabbay <ogabbay@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Tejun Heo <tj@kernel.org>, Tyler Hicks <code@tyhicks.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
References: <20251215184126.39dae2c7@canb.auug.org.au>
Content-Language: en-US
X-Nvconfidentiality: public
From: Dipen Patel <dipenp@nvidia.com>
In-Reply-To: <20251215184126.39dae2c7@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::10) To IA1PR12MB6329.namprd12.prod.outlook.com
 (2603:10b6:208:3e5::19)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6329:EE_|IA1PR12MB6091:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dd941c7-f86a-4888-cf85-08de4ca49145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2pYSTI0dnBIc2FFM05ZOEF0bWFsbVVYeFprdDIxL1dtemdNWEVwUXRUWTkv?=
 =?utf-8?B?QVNxdXg3NzNNbFdLWmw1L2lsWXlObWw4WDlGaWFDeUl6enJvVUU1KzBWQ3Fw?=
 =?utf-8?B?a1dnVk51ZEdPdGNFeklva1Q0U0ZRQlkxTVBQSGJLWVBZVmNpdzA5QURXb1dl?=
 =?utf-8?B?SWVJNkQ3YmgzTStrMG9vRTZ5bURPVGdLVlFtdEFzSm5NR3MwalpVaGc5dlp1?=
 =?utf-8?B?b0N1TmZKVnQ2M0kySWdRNlpCSTk3NWRBUXNzMWY1eGN4ZmxBcVV6aHFNaG9W?=
 =?utf-8?B?QXRGVjBrWDFNZ1J5N3A2S3hZY3NBM0JhVzZkT0tuSUhDTURCR1JuclBnSUEw?=
 =?utf-8?B?cHI0bmg2UVJnblNjcFBiNEpDcXFUTmdsazI0ODU2R2dRblFPelpydDZrdFVj?=
 =?utf-8?B?V3JMZkUvc1I5dkZuWDRxZVQxb0QxekhybmRBekRMejEyMWlmQTRSTmQ5Mm5v?=
 =?utf-8?B?RWV6UUlkR1pvOFd5aGtQZmRTdjRNQTMwYzBMWTBUVlpkb3FYT1FUUTBtTnUx?=
 =?utf-8?B?b29EV0xWT3ZnUDhUU0czaXNQZng1SmVJSkxXQ1phdWthaEVndTVoY0dTWjNL?=
 =?utf-8?B?dmgwMWpxWHZoZ2ROeklFMUdZYVZERjRBVjNLTXMrUXdoUGNzVkxXQitKeXlP?=
 =?utf-8?B?SFhYcnZydW9YYldDMjJUL1psalJtWjk3ODNYRmR4VUVrZ0I5SmgyTWo5eTBO?=
 =?utf-8?B?U1FIa2xWVEM1NWNlUEFZYjlMa1ZTVWEwOE5MZU95RDErMlEzT05Od3d4N1hX?=
 =?utf-8?B?NVJONU1JU2FSSFEzNEx3Tm4vRjFTcWIzQ0ZmZDc1ckd4dmhrOVlFNlhYOWVm?=
 =?utf-8?B?ZjhZWUlHQncyU2NKTUt4MGRzWjZkSUl5cUg4c2hWQTBEcmJUblV5czMyMHVC?=
 =?utf-8?B?aGNlSUFGYldKRGFvRGpXdmoxV3NDZkw5VEdLbm5ybllDV3Z5WkVhMUhNVCti?=
 =?utf-8?B?aHhVcW1jMmdmSlhXS0Y2V3VMbko1QXRWci9rYmJhbkJCVTFmV1I4d1h6Q2N1?=
 =?utf-8?B?VnNFQm92TzVOQ1VhZTRPMUhQNUZPOWRtcnRBN1RKYTJHS1ZJWkZoc3FGZTVB?=
 =?utf-8?B?ZERDVVJPMHVxWU5SK1lTOHg3eUVVWVkrTXUwMHJESmF6cFR4bnh4ejdmNGFT?=
 =?utf-8?B?Wkh1RitGNkhkRDR4eEtyUVBKL0VySVY0WEtzbnYzQlhpaWwyRlBXaGk1RHhQ?=
 =?utf-8?B?TldOdTRacm43QWhFOU5KUmdRejQ1QWVNZXhLQjd0Tkw1ZFhwY0Mrd0p5allk?=
 =?utf-8?B?Y1FlZUpyTHR5UXhGZWZiUFhWTUtTaDlOL29RZkV2ZndzVTFPYnAxVzZKc0Zm?=
 =?utf-8?B?UmF3MGtKR2tKSThZaC9kVjVTaS9BUTdKY0Zhdzlna09XdDRpZENrQ2pUQldi?=
 =?utf-8?B?RzRYYmdzY04yVG9NWlBRYWFvMlNmeENMZ0lpOWpTeFZYcW5xT2JCLzF4TVdI?=
 =?utf-8?B?dmlyalBYd3FCRmhHcFJvdlFiYjJLVVRBRFErTU9HTmdCU0x4NjBnUmJwTXE0?=
 =?utf-8?B?R1hJbkJNamk3MTJpKzZLV1FuSTIwVDVqZHgxai83UC9NSVFRYkR5Z3NQM0x0?=
 =?utf-8?B?UUNFNzNzQllwNlFJc2hsNTlTUlRCdnRYQ1RzbnVaNFBJTGpaRzMwdjIySzFQ?=
 =?utf-8?B?bFgzelJEN2prNlAyRmE3ZlV6cU1qd1ZzcWcwNGxDZEc5cTY2ekkzZXBDS2ZF?=
 =?utf-8?B?cHhqUE90eE1xZUpZRTl2TC8rS1FrTTNHUXVwMXU4UC9janIwU013L0xvbU5P?=
 =?utf-8?B?S0pYTkp1SFE3SkRUeUt2UXN0NDcvUi9haUM2SE04NkpUS2IxdTNHWTRQaFZX?=
 =?utf-8?B?cnZubEZDNHFWaWg5TXphZzcrNW5yVXhqYlF0bWpqU0ZxdW91eW1IdDdNVXlD?=
 =?utf-8?B?M2NoR2FwWklzd2czZ0tzWHN4YmxYMVltbVpFZ0ZOaUJVTE9zZkxLUE9ZcVNo?=
 =?utf-8?B?SEZjcFhxdjdUdi9mcitHZTg5VWxINVQvbFRJVmJWeEx3YVMrTVRpTDJYd043?=
 =?utf-8?B?Yy9QWnRCVTRnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6329.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjFWaFNKRVdkSlVLcDhycVdiNnpTV1l3ZmFkUGxzRXNMMVQ4SHJ3UmVlMUpv?=
 =?utf-8?B?M2tOQ21KZ0xzeWpCdytRNGdEbkk0VzZ4SDU3R3BnMHRSN20zTVArL2R0NUxF?=
 =?utf-8?B?bzBqRzd4YzROVVlUbjQ4bW9UMGxzUzQxcS96a0U0bk9nWVpydG4vS0pUZEFB?=
 =?utf-8?B?cDVqclZ5cmtJbFRDS1ZHbmhqM0wxK0xuaHdBVkZrK2RWaVFGdUM4UXpZWjkz?=
 =?utf-8?B?UmhJTjZzOEdmQjNwTHFleGk4eGF1UUdBbEx3UkVlVFVHaWR2MEJJdWF3V0dV?=
 =?utf-8?B?S3lWYWtLampBUnZpUDM4TGIvL2NWWTJzWFNhQjNMRk1lendQa0QweWhTNlBy?=
 =?utf-8?B?aEF6K1VCY21nSjk4V01nbS9iQzZqRDhyVjZjOVRSY05QMG84Uk90N1VXSTRW?=
 =?utf-8?B?a1NZc2tORDZBOTlxaU13RUhxQjVxbFpEaEFXaUlDMlZkTnRkYk1EOFRVV01S?=
 =?utf-8?B?WG9UVllBY1U4Y2lNdjdpc0JKNHB2ek15VDZndWF6ZEVKWXVLLytacEZtOFg0?=
 =?utf-8?B?aUQyM1I0SHpBaGJWWlNJam5XR0ZTVU1GZEZtNTlXbndCYnNzbEZMUFluMnh4?=
 =?utf-8?B?WFBaZnpMTUp5S2lIQ0p2SUxBZFVLdUVJa1dWd0E5WHhiNlh5Snprc1MvVnBs?=
 =?utf-8?B?cjBoMm52bkJlWHY5UVJnWUtKa2NORDlhb3RLcUZmRkRvbWNkMEM3bUZzdVYz?=
 =?utf-8?B?c0tIb1FtcWtUdU9BeUc4R3JkUEtGeEdKbmFNSTNkQjUvWnFXenAzM0lYYTND?=
 =?utf-8?B?N2tmQndWMkR1cTB1ZHpobzFGQ2E1eXFWWEtMbE5ZVHdLUEhnbXR3R2JlYnFn?=
 =?utf-8?B?Z0hIYVVzbGRnaDMwbEZVVlZZa0xCcXpaNDdFS0E2OHd1Uk1XWnNsR3d5bCtq?=
 =?utf-8?B?cDErTVRRZlRHZ1A2dks3V0I3cXM4aXhxRDdSY0NEOExwNEVoTXFtMlBTMVl4?=
 =?utf-8?B?V3J5ZVZhWExWMWxYNDhKMmRqbXkwRjN1b2w0NFo0b3R0THJIL3FkZEVkYjk4?=
 =?utf-8?B?czhLTG5sb2JSUFJDNmc4WHJPZmpEMzNBTU8zY0IvYnhHTzN0K0dHMXZ2ZWtJ?=
 =?utf-8?B?dG8ydW5WbFZtSVhBOFBCYys2TmZ3K1hYMzg1TVl4QU5RbmZyQ0tzRHl5SzZu?=
 =?utf-8?B?SWo4WUlvL1hmbGVndUpxVGJPU3p2WEtpUW5pY2VFdnN6WWc5UVJ5dkg4UDYy?=
 =?utf-8?B?aVFSZVhDNWlvVEJpV2NmQTJMQ2tnRzI2cERzNHdvdkQyQm1OeTdLMGg4b25N?=
 =?utf-8?B?WTZNMlRJaldrcXVxMVdoYUkzbnhwMDRJTHBib1kwcEY2cjRuVFZ1STl3dFho?=
 =?utf-8?B?YUF2M0c0MUd5c3BZc0VqSlBTNTM3c3pEUGt6dWY5VUxodVJlUUZHanJlVmwy?=
 =?utf-8?B?SlBkV1ZCSi84S0UwYTE0MGJQZWpYeHNtTW1DUzRWaWxQRHhCTCtFajZwNHFn?=
 =?utf-8?B?NVBhM1M0bDBEMGtMdjl6a2ZuRzl5dlRxZng5SXowZFhrNjREZ3NGMEpRR1Bl?=
 =?utf-8?B?TFdNSzZic0xpOE5jWTBIWmc3TGpONThpS1hIZnNrTUI0NStXWmxNY0RJaWhI?=
 =?utf-8?B?eWdSdWEvSDUyV3pOVm4wb2V2RUsrSkhhNU56TUVZaU1STy9MWlhROFk0dVFD?=
 =?utf-8?B?dkVxNXdrUnViT09tWlRKbFAvUGRwQzd1QlM0TkxNTDdFcURhdDN6WFVHcUtX?=
 =?utf-8?B?UXY2d1AxUi9JczF0d0F2OVhXb0MzMXBFTzF2bEJmU3JBa0xTZlNhbENLNjFr?=
 =?utf-8?B?eW9UcExhaU9WR25lck44dnZIanlpekxodEVxZkJISE5RSWhaRC8yR0E1dUV5?=
 =?utf-8?B?VDJHZjBhSFVib2xIRW54YldTaVVIdmViOGF4M003VCsrZ20yRCsrdTNOaUFu?=
 =?utf-8?B?Vm5mWXBtb2NFQVdzK2w0cWp1UVM2bWszZkRFTE1pTDQrYkRST3h0cjJBdDdH?=
 =?utf-8?B?QmFFek81aytESTBIWEhzMFRMUWhvMVc0NXdXYyt4Vjk1cGpqcm13TlVKckY2?=
 =?utf-8?B?d2pmWUNFK2JqMnUyNGFWYTJaVXhpNG5lTkxTOGJIQS9jNEFEK0lMM1h0UUZ4?=
 =?utf-8?B?ZUJkU3czek15dm8rK2JVQjh1cUUvYmpRd3lpNmxPL0Zic2QxNjExaUV4ejl0?=
 =?utf-8?B?YVZiaVJqSDFLeWFrNHVxV05jbU1vcGpwb3lyVWxvaCtuVG1BR0o3YTZpdW1h?=
 =?utf-8?B?Smpta1ZuR2JudkRwa0hIYnFxdzZFTk41bm44dzgyTExVSEp0Mm14RGdDT3l3?=
 =?utf-8?B?Yi9Bb0xPdU4wMjF4VGNsT1d5blAwL2JjNlZKNmJ2ZGxSNVF1NjdsTng4Vmpp?=
 =?utf-8?B?U2daZm1CcUthdTgwN1dUZzRxQjlGZ2pRMlMwV0VwVUF3ZmhqUkgzdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd941c7-f86a-4888-cf85-08de4ca49145
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6329.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 21:51:23.3794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AdQrnTDhdOtIuHktLE1cFd+th6A8lMihETwRvPiK2JefAT7lx/aPT09BcOYiJiXoJebsOwaUUmKK98RFVPxd3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6091

On 12/14/25 11:41 PM, Stephen Rothwell wrote:
> Hi all,
> 
> The following trees are going to be removed from linux-next because they
> have not been updated in more than a year.  If you want a tree kept,
> please just reply and let me know (and update its branch).  If you want
> a tree restored after it has been removed, just let me know (and update
> its branch).
> 
> Tree			Last commit date
>   URL
>   comits (if any)
> ----			----------------
> accel			2024-05-03 11:00:53 +1000
>   https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git#habanalabs-next
> clang-format		2024-08-02 13:20:31 +0200
>   https://github.com/ojeda/linux.git#clang-format
> compiler-attributes	2024-09-15 16:57:56 +0200
>   https://github.com/ojeda/linux.git#compiler-attributes
> dmi			2024-05-14 11:23:02 +0200
>   https://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging.git#dmi-for-next
> ecryptfs		2024-10-21 01:47:22 -0500
>   https://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git#next
>   b06c72107980 ("ecryptfs: keystore: Fix typo 'the the' in comment")
>   da22e0dc323c ("fs: ecryptfs: comment typo fix")
>   68c119aecdcd ("ecryptfs: Fix packet format comment in parse_tag_67_packet()")
>   fba133a34118 ("ecryptfs: Remove unused declartion ecryptfs_fill_zeros()")
> exportfs		2024-11-17 14:15:08 -0800
>   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git#exportfs-next
> hte			2024-06-19 12:24:03 -0700
>   https://git.kernel.org/pub/scm/linux/kernel/git/pateldipen1984/linux.git#for-next
> percpu			2024-10-07 11:33:26 -0700
>   https://git.kernel.org/pub/scm/linux/kernel/git/dennis/percpu.git#for-next
> siox			2024-03-08 22:01:10 +0100
>   https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git#siox/for-next
> unicode			2024-10-11 15:02:41 -0400
>   https://git.kernel.org/pub/scm/linux/kernel/git/krisman/unicode.git#for-next
> xarray			2024-09-23 15:16:41 -0400
>   git://git.infradead.org/users/willy/xarray.git#main
>   c88414f56c37 ("XArray: Prevent node leaks in xas_alloc()")
>   6684aba0780d ("XArray: Add extra debugging check to xas_lock and friends")
> 
> 
> These trees of fixes will be kept in any case (please let me know if
> they should go):
> 
> backlight-fixes		2024-05-26 15:20:12 -0700
>   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git#for-backlight-fixes
> sparc-fixes		2024-01-21 14:11:32 -0800
>   https://git.kernel.org/pub/scm/linux/kernel/git/alarsson/linux-sparc.git#for-linus
> tracefs-fixes		2024-11-01 08:57:55 -0400
>   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git#tracefs/fixes
> 
Please keep/restore
https://git.kernel.org/pub/scm/linux/kernel/git/pateldipen1984/linux.git/log/?h=for-next.
The branch has been updated to v6.19-rc1.

