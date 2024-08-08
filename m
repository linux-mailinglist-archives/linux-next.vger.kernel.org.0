Return-Path: <linux-next+bounces-3262-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F6494B669
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2024 08:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66CB51F236EF
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2024 06:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45A67A724;
	Thu,  8 Aug 2024 06:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MpJJa+FA"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA501623;
	Thu,  8 Aug 2024 06:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723096828; cv=fail; b=tNTciV1QSCRUJd+JjRClpfm89K95C2LctwufuwHWtaR4vlixFmyGQJnNyBFC4QTX6Ho0WXh/nKPUDrGYk64OcyiEdhL29Vp1LFBEoeva3AqpdEiSFexOJxbZbO51x9CxVcyPTcp5xOtreZUfNbwZahyH/J+bmZuZlRfROixxQC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723096828; c=relaxed/simple;
	bh=4E7yhggywHkBTLRWcrypGvIcf/QVmwSQbrOgXoe5PN8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Di6Ba7fwORcmahAha+IiH12QQt+9Urb06IneQYzeR++KYDBaNhDwyzFXJmQmka8cAplwSwhgKlx0pfC8dI0iDg6x5ab0PB79SIB+vVJwRjB72NcFI0Vzi30qfnR3jvdswVecMwvpiah+dZBzUM0gHTuy6w0GRUY/NXgzMAAhOUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MpJJa+FA; arc=fail smtp.client-ip=40.107.243.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEmztrc3MmNMJ6ejDTeqQu5PwcninYxUf1jcKjJy3tlD/CkJvCiVIqq+p+8znRi/Ji/KkJp6KqCBPi4Y/+lWZGDySVUD8mZ5SkCDQL6LlqOokfOQudwQDUrIcX6k6LGwovZ5bPGWz1sSW0Xwn7kHtliEoUuKeqRXRUg2dlzNB+puo+f5ZFPQohv9WtXpyeQeRD3xv1CYmhVvEKuo54oTjVCC5tMOesYGHbvdjv7GKT4ytDAl6k4QJonaRmG+KLQD+TxYUvzaSXJHv5dAfPsQhs2PmOLTWe3vmupdYW1IiHgGuO2TwfcnQikvG8VvwZ5YuspY5iqIxpOuaYMsdgvqhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QamwSkyOvMNRraUDHSYnimX6gYe/qsPNhNyUO/iRzw=;
 b=JZ/z0oPdZ9fB0ApmY9MC4ZZI7Rhmx13Ct8bqk0z9ckcZv+fGWyAmTQJJBkiCQuX0XkZQ5yfiWm+FqY5Z8XDhNwXGBG/IkrqzaLrDk5HZ7e2UHc+IwtHWMMkhlXfGMWx9qUMGCnUdmjQ5bTQldvCDAqb1jbJWLOisSUSEgR2FaZjJatd+V19FJEevNN2iQHYUZq9OtJqJW1Gqmj/jhZuv+TTBhxs0dZD/MwBwcfyw5aS1GCTw70++YC7sW/5gGVRPcGvQADw4ciiNhdopVV7079t0/MnyR9HYM8RLrCM6suYtiSdZAINjmLuI6PgShAzOat7QXtxQ1AvDHigJPhd3Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QamwSkyOvMNRraUDHSYnimX6gYe/qsPNhNyUO/iRzw=;
 b=MpJJa+FAXDafPFAIqeYQEf6hWHkPQNnXf8PLET8/uFtQ4rvIbO+RnwVh5L6utEPzwp0U+eCX8UceuRbe2YEaDsU3sYpI7NUBxAiqwRyy6VAGS8FvpHead0eLa+Qz9ZRwdwQ3Fv034PKN7+KTZTP+08e/MeU9/NB7LilFsh5zRpY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by MW4PR12MB6777.namprd12.prod.outlook.com (2603:10b6:303:1e9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 8 Aug
 2024 06:00:24 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%5]) with mapi id 15.20.7828.021; Thu, 8 Aug 2024
 06:00:24 +0000
Message-ID: <e8688839-7686-47e9-a497-31b57abd46e2@amd.com>
Date: Thu, 8 Aug 2024 08:00:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tag needs some work in the nvmem tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240808083050.6ac578f9@canb.auug.org.au>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <20240808083050.6ac578f9@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0266.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::33) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|MW4PR12MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf9be2c-6876-45f0-f83f-08dcb76f64a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmVEU1NHQWhGZ3AzSEhtRytSN09GYmFHQ3ZHRW1UTnhiRXBrSTZxSTViU2Vo?=
 =?utf-8?B?QVQyMnAyVVc4Y0o2bTVTM3lGWTNxYWRWK0pnenZFWVNoTWtqb0pEbXJLc1p5?=
 =?utf-8?B?OE9BRlh3UkFMS0ZJclQzc2lSM0srd3ZxdUcyS1ZQYTIwakpxeTE2aWd3T3Fw?=
 =?utf-8?B?anowRUxTZHpqWjVSQUYyYUZyWllOOWMwRFNFQUJGTm9GUVpGT09lSHFLaUVR?=
 =?utf-8?B?bS9qb1pwZEVZNlBhbkRDVVBkRlNFM1MzZkZoNVJlSHlZRUpWZGljdFdnWDc1?=
 =?utf-8?B?Ri84V0NONWg5bzY2SEZOL2RKS1BISms2d3NQWlRlUlpsUm1uMDZiQllNWmUy?=
 =?utf-8?B?US9ENzhUMWt0RTYvaFBUUFUxMFBZdVdrQ3FrWW5PVzNyNHh5Q3J5THhkQk9V?=
 =?utf-8?B?NmNJRGZjdDRGU2pKc0cyWDhML2R2ZGdvaXJkaEFjNGdaei8vVXpFRUxyeXFQ?=
 =?utf-8?B?cDNhYjdweEEraEo3RmJCWC9LV0xzdjZibGZRa0RSZ2twakhDcTlLN3dCV040?=
 =?utf-8?B?S2ppeC9PWmVyWHBFbm9UMEQ1ekVLeFVCL3ZMWDVoNStDU3VCcDh3RWRSYThm?=
 =?utf-8?B?UEtRMHNpcFR2c0RZY2t3WHFpMi9CZHhaSzZzQUxqWnFUdFdmeWRQdlNRUkZO?=
 =?utf-8?B?VHFlaFFjQk1YVVFId3ZkUmx5RGN2ZDN5OU1WYU1JQm9PbDczT0JiS0Z4Mnls?=
 =?utf-8?B?NWlLZmtGL2dDM01TdWZPS0t3eU9uUzBVZ3cvYUQyZzJtczRoOU4rbTlaRHFh?=
 =?utf-8?B?TE9ZZGpycmxrL3RRYXFrbW5KS01XeHZUVjNNamM2YnpCNm03NHN2RHJuMmZE?=
 =?utf-8?B?SGhiVGR2OCtnbmhXbWczckVqYnZnM2Z0T0w3MWgwYXd0MzRFUi9yM2ZPcmxJ?=
 =?utf-8?B?ZVVuMGNQVWFIMzIyZEY5STZFdDdxUGV3S0taZktRQUFPbVJZSVZUc2JXOCs2?=
 =?utf-8?B?K2N4ZHkzNzRIVVdRM096L3g2VHZyMnBuSnAzQnMzZWtMTmFpWlJnd0crSnJ0?=
 =?utf-8?B?bERHQmR0NVdxK3JpeXV1cDR1ckt3MStRMEkzZXlKdEF2V0plNDVmcVZTSzhG?=
 =?utf-8?B?L042OGdaeERLdW5zWWJ1R1RrTHk2TExtNk9HYUI3cDBncE5WUmdLRjFzMWtp?=
 =?utf-8?B?dlM2aFR3b2hFeEhWdG0vbjUwWUJyeEVXcmtmaXJKSUI2VDdLUm5PWWZYcldk?=
 =?utf-8?B?Y25YTlhMTFJ6YmdJYTQ1YUp1aExTdXN2eDdWOXg1N2QyT3VUWmdQaDdESThT?=
 =?utf-8?B?N0ZJYnBWRjNKQXVJQ3lubUgwVms1MkM2RVFxcU5zRk1abWMvVTVjaUNFdW1p?=
 =?utf-8?B?eS9JMis3N0EzaHNFUFh3czBmT1pyNWthTjA4cGtjNGFxNy9tNjFHcThLTWlB?=
 =?utf-8?B?TFR0NGJNWW1icXN1SkZ4bC9wRUJFdUUwMFZPOFd1M2RLSXFzOE16WFVER3dQ?=
 =?utf-8?B?Q0xCZ3BBQksyeXR4QnJ6SnNEcWlZL0NBeHNRdlVySjNNMlVYdG4yNzdHMTdy?=
 =?utf-8?B?c1FlZW91THhlaTJYeXhiV0JNV1JpY3dZSlhrRGNGa3FwK3Z5T3hSbFhoeFAv?=
 =?utf-8?B?NnBoby92ZDhBNnFoRXlsY1hGWEpHZCtjMXAwVXJvYVQzSW9GdENXN2lvNW9u?=
 =?utf-8?B?d0kvTjZCb0NJVkhVRWxncWl0YTVXaWxteDg2OEdWZG4zTlI4c0xwdSs1WlZ0?=
 =?utf-8?B?bVpTZUJVL1V0RXJ6c0laaDJjRWZHbE4wejZFTFpCaUVaZDZjYTZiZEx5MWl1?=
 =?utf-8?B?cGtoMDh5eXlzODFaZGtZb21pdW9DTEk2OTdBMVZiRzREUmhtS3Z0WGV5Vi9F?=
 =?utf-8?B?SWdjR3B4aDJpMzFWUVVPQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFAwQ3Z1aGRiNytPSENlK2ZlS2xmbGZwRVFpQWFSWnpkb05JU1piMXE1UGda?=
 =?utf-8?B?NjNGYVladnBRTEZKZ2tNdmNrSnBaZ0pyVUV1VnRncTVXMVAyY2YzeXBhdWx2?=
 =?utf-8?B?UnRlUFBPaXZDbmxYeEgzT2hRS2s5TGZmVXZKTWJncTE4amQrV1NnQXVtN3ZZ?=
 =?utf-8?B?YzFDNnZIeHBPRDBmbk81RXJTZWlGRmdSN1FVUnJ2RS9PRVp2Nm1UTDlBNVhk?=
 =?utf-8?B?d0JTYWtVOG1WQ2U1dG9CWUVmMzNlank3NVVhUDBwN2tuTTI5TEpRNDhQTndX?=
 =?utf-8?B?NWJvQ1FmSlVRN0MwdS9HSFU2R0NFdEhsNGZKRnlKa0N1UWNBMjRKTGltbmxy?=
 =?utf-8?B?YnBZbEw2T1RTK1MxdFhvMkdzM1JwRDN0YjFXdEVBUHFENytaL2JZbS9qQzdR?=
 =?utf-8?B?OFl2VDh2bUorSk9lMVNUNGdkeFdnQkVHZXJGeExDbFV1SmFQRGQrY2gvcE0y?=
 =?utf-8?B?cFlmdUJLZnFKc1F4TFBwTDBUTCsyaFlOeEwzZW1zaTA3Z0hBVXVTenJkWSs4?=
 =?utf-8?B?Yi8vbHhXSkdSVjN6Vm5iY0RVWkhjdWtkMjFhU3kzTzQxeWZrczJvWGNUVFVi?=
 =?utf-8?B?dUlLaWpnY2lwSlMrWWVjZVM5SWVibkl6TTZwRlRORlJYY1NDOXJySHl2YWdh?=
 =?utf-8?B?bWEvV0VscEFEb0dreUZhZkZaUXJmZTBLSnFpRkI3L0VUREhHelYwbkNuTlg3?=
 =?utf-8?B?TFY5WTJOaEErWnA4b1F4dGs0WTd1SlFOc01pV2ZHVDNGaGs4VmRONi91cVpw?=
 =?utf-8?B?SVNoaXF5OTRvMDh3L1ZCOUsweTFjOXhtS0sxS2VVSmpMQUVFNEk4TVp3UW1V?=
 =?utf-8?B?aU1aRS9tZTZoTysrL3hsc0dHNm5obEFPbi80MVQ0NWRxUEJsTXZua2RzcWdB?=
 =?utf-8?B?L01oWmJpWW5tTzkvWjNMTnZtVm9wWHFacVZBdVdPMnpYWFVQcjNSS1U2NC9U?=
 =?utf-8?B?UFY0OVBndEU1R1FTMkg0VnhKaDdFeHMwTG01dk82R3BJaTJIVjlETk1hSGV1?=
 =?utf-8?B?RnBKSTM2Wk9ROEJ1bVQ0TjhtbW1FNkVhWk4vSUUwdVZROEZ0ZEtZQmJRNWlH?=
 =?utf-8?B?RS93UExBSkluTnFNZWFiVG5qdnRFT1A4SFVQTlcvZ21MSnNYN05LckpJMTBl?=
 =?utf-8?B?YWFsd2IvR0dVSnlOMklXUUtDbDlxWFc2WFFxZnFDZDJ1a1h2NFcwN3NJVFhW?=
 =?utf-8?B?WEt6TDdvNFNJei8xdnQ1Q3RWekI3Vk0rS2JoRnFxWG9OWmVDcXBqb0l2ek4r?=
 =?utf-8?B?MjhpTWFZQjRGeHNtREdpcDdvemhSeXphOS9xeHRqcHBkSU5yclZNL0FBNXR6?=
 =?utf-8?B?SUVFL2N0YXp0SkNBdXd5S2dOL1U3UWx6M1JucE05ZmtPQWlqMUJRclFRTTQz?=
 =?utf-8?B?TFhNUVpha1lQSEV2UUlGTlBQYjJjdXFXRWNqcWVkSEtsUTJMNmhZWFYvZ1ZI?=
 =?utf-8?B?cDh3cGhyVUxxYzUyQ1VrWjAwcDh2UG51NnFuaUZNWUt5UHpxVWZmWjMzVVl5?=
 =?utf-8?B?Q2ZwWm1YZVZXTy80VWdxeDNJTU9rZzFSZFQzdC9md0hXWGhZRFRYekM0NUlt?=
 =?utf-8?B?YU9DRFkxQzNnbGEwNEtBMnhHR3lIQ2NScjR4QkdDWVRobVVlQ2U2SURpd3R1?=
 =?utf-8?B?M1JSVGh4UmFDeE1MeGZnMG84UVNqeldGQTRXYmt2Nk5PUnVQSzNaWEdKME9l?=
 =?utf-8?B?VDVRelRRTERJaVNucDdMdHZEcnkyY3BqNTBHZmM5STZJcmZsUWg3K3U0WHJL?=
 =?utf-8?B?VWhpRk9TODBiUG5uUk1YS3ZqamZiazlWSnJWalZiNkNNdGJ5c0VzQ1pCa2x1?=
 =?utf-8?B?a2ZZNkhncm9CSXpHcEx4QjJZYmxpS1ZrN01KdTgzS3RYY2x6QWpITlV6N0x0?=
 =?utf-8?B?cUFTeHpsSVF5Q2cxN0VheThiSDRJRkw0c1Fia3ZsZWFSenphSUhnTDFtLzlw?=
 =?utf-8?B?d1BzUm94NDdpRWFwQ1YwOGdpSHE2djRKaHRQOTBqMDFwMXJZK0lTeUROQlZs?=
 =?utf-8?B?S3NKWDZTblg2eXpDYmhEa2RnVmtLQVdMTFNhQmsvcXBVRnlxS1FiWE1xUjB0?=
 =?utf-8?B?Y1kxTmV4RmVZbmhUZFo2NGZKSS9VaUZJR3F1RlV5dzFlT0xadkZLaHZ4WnVD?=
 =?utf-8?Q?UghHaVMQwbNh53oa2hjLvkd6q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf9be2c-6876-45f0-f83f-08dcb76f64a9
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 06:00:24.0289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/BcGq25aDaI2X5r+x3/FpHjj+yAWjosDHnw8Xc9pV69AgeMsppRWBz9VhsPBQIH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6777

Hi Stephen,

On 8/8/24 00:30, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>    c258adca4fb4 ("dt-bindings: nvmem: Use soc-nvmem node name instead of nvmem")
> 
> Fixes tag
> 
>    Fixes: a0cfd5e99782 ("dt-bindings: nvmem: Convert xlnx,zynqmp-nvmem.txt to yaml")
> 
> has these problem(s):
> 
>    - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: c7f99cd8fb6b ("dt-bindings: nvmem: Convert xlnx,zynqmp-nvmem.txt to yaml")

thanks for reporting. You are right and I have no idea where a0cfd5e99782 is 
coming from because I even don't have this sha1 in my tree.

Anyway that's my patch and issue on my side and I am sorry for it.

Srinivas: What do you want me to do? Send updated one or are you able to update 
the patch itself? Please let me know what you want me to do.

Thanks,
Michal

