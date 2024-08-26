Return-Path: <linux-next+bounces-3420-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FEC95EDE0
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 11:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66CEB2858B3
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 09:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E147146581;
	Mon, 26 Aug 2024 09:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="aw9qROtI"
X-Original-To: linux-next@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010025.outbound.protection.outlook.com [52.101.128.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEADF13CA9C;
	Mon, 26 Aug 2024 09:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724666386; cv=fail; b=CRsxBFJeCpFHNELMceLwePHPHGfmt1Fx4RMsXEQrvnmhBnDxCw6QR9Bg3L43xfkvxsCEWlcKDo5MJgswoTCcWCvsgRMLv9rRsILws7jLpKP/Wju4d3qe/1mCaPV15yHpdFv+cCSKEQ9ZMSxdQNxImO6LRCVdKmANLm2zp6Jhq5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724666386; c=relaxed/simple;
	bh=7NkmW1+2DIWOI5Hek7OLMlDDUCXXTF+dZkxo1mN9yBY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bO0IJlxy1xMDDdEMTrkPNmsXWN37diwOP/i5VfP/tV/0wIIXqrOip98YX754d/2PQJDlBrvLzb71zGxOcIt6YBK/hvc8aIktFPkUBhnca4FpR12iArwH9X2O8tETeT3UA4wLNT6DWxVNEIB2MfhXIQgLWe7rF1tMKITXSMBcoV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=aw9qROtI; arc=fail smtp.client-ip=52.101.128.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ilHGy/8Y2zDEksgXu8Vy+YbL4cLZBCcxa3RuEpoDIdbKDkrlQFzuaIR+Mr9bg4pYSRe2CxOhAvRLOOjczghe++5qzQZr2JSXRY/RM86J0Y/m0eZDV3oIrG6S9+jNyi1usLXhYdERgeLtlrlHHa1/fgZx4EFNDO0VMIZNRUci+ZlrtXNIzGJwfA7FEzytRGbk0CFEv5/O0S6fQeQKZVcNnYJBD7Mw7TdP+QUaZ+i6D/XT+mRtyfwGn3cvWPSotecq/sfWhLerjuKCtHppY3jZ8A5yhKCHDxSCdVTY2GPe/3fLZNfmddxUpza0L2DG5iUO7LvMfVpfnNS7tHIg1AQ4BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIaVYmZOfkYvLamziMVJkh5FKabRgTVxjdZc9p6tWy8=;
 b=UlrhBmV/X1n/PkVJGOv3EpV7tzCSePhB13HwU6yffRmrkrQKbzB6dNEsLB/E+1lyIw4x2Su+uz6cMvKSa7v76S2XR0szK3z+QfsFX29EVqr4E+nkuExLcLfuoHYxOWlYu3FWaVCuv5ZpKmdbWNT6hThH9WAssauGB1uCztBOIatOEmJGpIX2iLOBB+9sTm+0mKxBXf/92ywZTvFrtfTCPbJr8AL4JsHY3OHWNA3VZxCxtTJlcrvr0sT0ObRb0Q2ojwLDHqbvpqnLhUUys+g9p323FqqF05y4dsUYlpc8gi6naZXWqk/ay/47YYb9D9rCh8VQqrRB4oEiooEGXkXwmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIaVYmZOfkYvLamziMVJkh5FKabRgTVxjdZc9p6tWy8=;
 b=aw9qROtIkinFBGXJXfxPFsipdLXAoXj0m/bvt3Jws4aAgdrNvmBGDUes5/oK46jLjVgjlaW1nCX7JX9ihO02WBFplA1siMJYE6Sj0R3kpAhpCyWHTPl2NE+vH7/p/PK+UICyrEmKkOLsKey57X5xwZpFRHfUdAxZW2+18asz+Ug8G0fD1/86az+P+SHGCJAvmF3C3qqkrMBD5rfHlrn4mzKM6squAlGb0f1TFCdOS45QGbewuI0SAo3awAKX2jBTvFKB/5FJuBOgpN6IpiFVd43AEGCjYCT0RwqV/yraFnTtfMgVvJ/Ybyi9D/xanPvlM7pnNhgUilqky+onkJuD4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from JH0PR06MB6849.apcprd06.prod.outlook.com (2603:1096:990:47::12)
 by KL1PR0601MB5798.apcprd06.prod.outlook.com (2603:1096:820:b4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 09:59:41 +0000
Received: from JH0PR06MB6849.apcprd06.prod.outlook.com
 ([fe80::ed24:a6cd:d489:c5ed]) by JH0PR06MB6849.apcprd06.prod.outlook.com
 ([fe80::ed24:a6cd:d489:c5ed%3]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 09:59:40 +0000
Message-ID: <ae41f459-2f71-4f68-8dfb-3ce3ea558208@vivo.com>
Date: Mon, 26 Aug 2024 17:59:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: boot warning after merge of the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240826194648.407fdf58@canb.auug.org.au>
From: zhiguojiang <justinjiang@vivo.com>
In-Reply-To: <20240826194648.407fdf58@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGAP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::20)
 To JH0PR06MB6849.apcprd06.prod.outlook.com (2603:1096:990:47::12)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR06MB6849:EE_|KL1PR0601MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: 09427b38-7cec-413a-cf42-08dcc5b5cd8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|43062017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTV3aW1KME1lUUMzaG9wVENkSHBBQk1pb1h5aW9kWFFYeG1ZL2cwWWVnTzU5?=
 =?utf-8?B?VURVVUpkclRCODczT0NCOW1RWGRRS2MzbmY5UDd5ZlFNRDAyYVlCbmJSc0lI?=
 =?utf-8?B?ZDhCMC9UMWZHYk5CQ1BpZkNLV3VVVHJNTGM0cURicmpEMjkzQmNFcUJuSTl0?=
 =?utf-8?B?ZlZsYXFURE54MWVCbGRoSk04MWpHamgyZklvbWNkaUZVWldDMDVVNFNJdlE5?=
 =?utf-8?B?M29BVFIrSXkrRUdZMWtlYnNFSndHV3czanlLZWh3Q0xXL2p4NUpURDMxbEE1?=
 =?utf-8?B?TFl4NXlDNS9QVzZyWlRWL1RUeHpFZWgva2djQkt4M2s3d0lTS0lYN0VFMWth?=
 =?utf-8?B?ZHJxd3BOQ21EL1dzdVJzQVE2NlJQZnA1OVNiTWRRYXpHTVNhS1czRXJtQzBj?=
 =?utf-8?B?STlzOTdVdXNscmN2R0M2WlNhckxzWjh2cDVkQ2toYnk5NXN0VjZnMzZVY1JM?=
 =?utf-8?B?N3Btdm83QlByN3czNGZpcjd3emVhK2ZKcFgrdHRXN1BmZHlkNWZtdmh4SHN2?=
 =?utf-8?B?UVk0VVhGa3Mrb1RicExOZytFdUx2Rm92NXJjMFk5bnJWNmprbmFJRU01dTNC?=
 =?utf-8?B?b3dmTzMvb3d1UTMzTTJlZTBsYW11anZCOGhLcEVPWm1XMnZyZXU2R0pUTG5r?=
 =?utf-8?B?Q1BWZWVGZDlxKzJrU20yS0t0ZjZBU0dnSC8weUF2Mnl4VzJRWTFTVjhXNnkv?=
 =?utf-8?B?VHUzMkc5QnRaNUo3Sll5REFGdFFPWnpaRDV3SStZRU1XRDB0WXp4RDNBS1Br?=
 =?utf-8?B?TzhtcnV6VTVrYlFTc3pWbm9UK3FZNmZZTDNqTHFCcUxLT3V5SmdKelNGS0xz?=
 =?utf-8?B?a0lVTUN6ZFFyZElTRmpvSmVwaHd5bFpWQllLQWFzcGl1ZzMyWHVMQ3FZSjhi?=
 =?utf-8?B?cmx2bFBxcDRVZkZjVFdqV1hXdFN0TW9XVUdyUTAxMzVnRjF0dHVRNEpFTlRZ?=
 =?utf-8?B?cWljeXZhMDcvV0xIMk9jTWxmWG9PdGhzcWIxK0RSV1k2QU5NNHhrVTFLSzFW?=
 =?utf-8?B?TjR2aWRpTkxXVzdCNTc0d2RFckROWTdOTStXWnJsRGlFNDMyanhHWXVPaEpS?=
 =?utf-8?B?VFM2VHpCalM5Vy9xZ1FKSGZSai9nbUkrT1dsb2IycFBqTGpHU3VpNU5YYTg2?=
 =?utf-8?B?Rlo1cFNGb0FDUWR2Q1F2QXVUenJxa0JaVFlJVVhHaisrZDIyVlUxN1g0eXFi?=
 =?utf-8?B?SDlSNGU4M2tDMDlxc2NXeDRXNXIwS1RxVDBtYzhCWnRJL0RUajFrRHdncFNt?=
 =?utf-8?B?NzNXWDIrU2M0b2VZMTBHdGNUTzU2UGpDcU8vbW5YRkk2Q25zdXp0NVRlMHNv?=
 =?utf-8?B?Y0lxQkJPYUNCd2M2bDUxNE8xamVzakhROERWUWVpdnhjcm8wUkxNYkZ0MWVp?=
 =?utf-8?B?ekhYYUV3RnorM01oajI2Wm9ENkhHcFJTTEpyOVBnelJoUUlhR1habzNwdUF3?=
 =?utf-8?B?UXVLbVdoaWRNNlhwTHNCbTgreTZERGFoRmptdHNYNENpSnZrM3E2Zk5EWC9Z?=
 =?utf-8?B?UWZZakVUZjRvdnR2QmJhNWRSemNqdVFNNlRJNGRZMEIydU5lSEpRYTdETy9j?=
 =?utf-8?B?Q1g1WU9EWGwwSmRmeWxHWnRDYVp5c0NFaU0xUDVCSXpFM05waHBZQS94enNo?=
 =?utf-8?B?R1pCN2xOaHRVMUlPYnNKK1c3MVdOZlZncStSZFlNanpHYk8rREZzSEtwTlNx?=
 =?utf-8?B?WjRtN29rbzg4VUwwdUhhNXpPQXhlWkJEVC8rMU9CVk4wQ2RSYVZaVHhzMXI4?=
 =?utf-8?B?bzk3Mk5rS1lPb3ZYWjRFdEtVbnN3SWZGcTVMS0lCcmJNaFY1eWh5QTZzbVlT?=
 =?utf-8?B?eWkyVVdzODVGWGxVV2Jkdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR06MB6849.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(43062017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1h0emZ1SDYxSmd5NVA3YXhhUEVOQitabWVBMkRReU1seCtxQmdwR0NsR1hv?=
 =?utf-8?B?VEMxdWFiSVdMQTN1UUlITzRZenc5amUwSzhaNmRORDlyWlN3MVUwSGxiNW1C?=
 =?utf-8?B?bmV3KzM1TmR6Y0hwT3VUMG9kaHFEMForSEtRTHV0L2xPZEhLclNnZWZKYkxW?=
 =?utf-8?B?STVqWE1BQXM2Q1BkTjhrM1dmN00zMEtCNzU5K2VvcnZXNEx5UHVGUGEreVdR?=
 =?utf-8?B?OEdOb0FkS0x0U05oNnJ4dUh0ZExybmVQOGlEYXdXUzZoc2ZLNytGbytZZm83?=
 =?utf-8?B?MTdqWGRHVzEyOU90bitQblovLzJETXpyTXhtK09DbkErSzJyRUVVY2EybFBF?=
 =?utf-8?B?R2w5dEZJVzJXdThGbmJmN2NFZHBQVnBzR3hGTWpyTnlIV2V5dVZGQ2RXUEhq?=
 =?utf-8?B?OVdBbVN6SVFJdE5WUGdUeWFDK2tKK0hDOE5yaEJZcGFTOVBDMjNEYUhkdWxr?=
 =?utf-8?B?Nnl2UTZGejR5MkNnaWJiRUFnM3JFVHpMdjBGREdkMmJaUi9oU1lxR1lpQ0Js?=
 =?utf-8?B?VFpTNmpzSEh0KzEySEVkaXF1Mld2UWw1d1ZCMGdIQU1PclhpdkdlMDFKNUo1?=
 =?utf-8?B?QnU2WThxNVp6MUszRk5Hdkc1VEU5SEdtSDZaZkh0ekFzY0Q0amt1T2tiMkxa?=
 =?utf-8?B?RmtXZzBDeFRDK2FOc3dla01DbWQ3SE9QQ1V3Zk5SdlRjWU51b2lCWDRFTjJi?=
 =?utf-8?B?N3NRSkRteUVvS290TXFSR0kzNm9XUjNDVjN6RE9jZys0VEtEQWF4OXFSNnUx?=
 =?utf-8?B?VTNMQXgrd2lMWjV1ZUtsaENpV0t0c2laMnZjbmEvWVNHU2c0ZFQ5cEpXVlcz?=
 =?utf-8?B?UDV1aHlwM2tBeE04U0crMkhNZUQ0bDVUMzdGOHRlNk5tYmEyUzhPZVRiUk1I?=
 =?utf-8?B?T2h3K3NubGFEVFVLTGpNRG0vT1drdjI5WGlBa2I0YVNqeVdlMFd6eEk1bjhZ?=
 =?utf-8?B?LzlZMjd5RWpRMmNkSDhnMTRwMStBVE84QUN3S2s3U2dyRWdMYzduS2F4WDZp?=
 =?utf-8?B?V2hjUlpjd1VPTEhCOUhvVUNBekc5Q09yWjdWQjc4YTh1ZkJEWVo4YlQyNEpV?=
 =?utf-8?B?YkIrOGRBTTZFdlhiOTFweXFwUE51ZG93VVppVlRTQThvWDFKc2ZhSE9uUzZn?=
 =?utf-8?B?dnpjYTNleE1YTHp0QTlwbUkzVURHUytyRDZGN2YzR05rVVVQQU9BcnBZSWlY?=
 =?utf-8?B?U2ZNK0lIV0VvM0YreTFoWnFQenR2NTRmMVBtbjgxODZ6b01OcHc3WUg0S3ZT?=
 =?utf-8?B?WUhxcURXYzY3cU04NEIybytPRmVkV2pZTm53UkdnaTJhT05SajFuVXAwVTBr?=
 =?utf-8?B?SG1yeUpMOFdkdXdoS201ZktnRk0xbnRWSVk1U3N2SlVYNVZTaHl2M0tuL3ND?=
 =?utf-8?B?K1c4ZVNmeFRidS9PeCtFeEE3T2Fhb0JjQUlsVHpBbVh3RStTcWlKbGFSU0hs?=
 =?utf-8?B?bmplcmZJUlR1SVZwUzdYellrQkQzbERBeEhCMWNKTCt2NW5ublQ4ejR1bmt1?=
 =?utf-8?B?aC85UUNFSmt6aE9PSzBORTNMV3VMZXhlT2ZxbGYvbkRXMHNTS0N3R205SzEw?=
 =?utf-8?B?aHdTaGdYUjUvendvNDN2eEIyQm94UGViNVA1bTdMMWxoU1lmOFBkTDNuNnUy?=
 =?utf-8?B?Q0JHVWUvaDRsakxWL1k3UlZ4S1dhc3BZRFZrQ1FIOGlVRnJWZG1Ubko4VGtS?=
 =?utf-8?B?MnNUY2tCN0V1My9wNThLU1FZdFR4OGZSbXZZRkpvbEZjejhZYnZDQXQ0K0Fp?=
 =?utf-8?B?STZ2QjZBZEM2ZHVuTXpROUdVNGpmR1ZudnpZK0IyMnZUOE4vakVvZGllc1cv?=
 =?utf-8?B?YXJrT28yNkNkQXFIcGlRUGNDd1k5MTNZajJNR0E1OEUyR0o5cmNteDkzN3Fr?=
 =?utf-8?B?aXR6cjVxUXMzUTB6aWUxOExuQXoydytOMVplakNUVzRIMmF0NE1OZ0ExOVQz?=
 =?utf-8?B?RmV6alZpbCtsQkxkaW1XRjNydTVnc1BuMGk3VnlUSEp3eXBYbEh5Mm5WRFRp?=
 =?utf-8?B?MlFmNW1GMGxYTlhnRFR4RitRZ3dOM2MwdFJhcXdDWW1KUTNxaksyWjRTQ1k1?=
 =?utf-8?B?SXVuV0lNU0dpbTkwQmtEOE1ZUlBlb1A2MHFPdnFwQWJQUlNTMjg3b2gwbkRB?=
 =?utf-8?Q?5cPZADgQnMRyigc1ghWupjrdb?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09427b38-7cec-413a-cf42-08dcc5b5cd8b
X-MS-Exchange-CrossTenant-AuthSource: JH0PR06MB6849.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 09:59:40.8899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: euG888gFu1Pl5fW1z/r3XXtkg8c0q4ZrKTUjbS4Jd0PN53oEFsbdy6Cq8Si8VA1zwN0eP+av95uabUlGJPnd6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5798



在 2024/8/26 17:46, Stephen Rothwell 写道:
> Hi all,
>
> After merging the mm tree, today's linux-next boot test (powerpc
> pseries_le_defconfig) produced many warnings like this:
>
> Run /init as init process
> mount (55) used greatest stack depth: 28240 bytes left
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 1 at mm/rmap.c:443 unlink_anon_vmas+0x23c/0x358
> Modules linked in:
> CPU: 0 UID: 0 PID: 1 Comm: init Not tainted 6.11.0-rc5-06732-g133a683d26fd #14
> Hardware name: IBM pSeries (emulated by qemu) POWER8 (architected) 0x4d0200 0xf000004 of:SLOF,HEAD pSeries
> NIP:  c0000000004d0208 LR: c0000000004d0158 CTR: c00000000121d230
> REGS: c0000000049bf550 TRAP: 0700   Not tainted  (6.11.0-rc5-06732-g133a683d26fd)
> MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 44004222  XER: 20000000
> CFAR: c0000000004d019c IRQMASK: 0
> GPR00: c0000000004d0158 c0000000049bf7f0 c00000000167b100 c000000008b5e2b0
> GPR04: c000000008b5e300 0000000000000006 c00000000445a108 0000000000000000
> GPR08: 0000000000000000 0000000000000001 ffffffffffffffff c0000000013550d8
> GPR12: 0000000000000000 c000000002b90000 0000000000000000 0000000000000000
> GPR16: 0000000000000000 c000000006cea000 c00000000405e3c0 c000000006556500
> GPR20: c000000006ce5000 c000000002a30308 0000000000000000 c000000008ba8398
> GPR24: c000000008ba8388 c000000008b60310 c000000002acb790 5deadbeef0000100
> GPR28: c000000008ba8398 5deadbeef0000122 c000000008ba8388 c000000008b60300
> NIP [c0000000004d0208] unlink_anon_vmas+0x23c/0x358
> LR [c0000000004d0158] unlink_anon_vmas+0x18c/0x358
> Call Trace:
> [c0000000049bf7f0] [c0000000004d00f0] unlink_anon_vmas+0x124/0x358 (unreliable)
> [c0000000049bf860] [c0000000004a7eec] free_pgtables+0x1d0/0x368
> [c0000000049bf930] [c0000000004bce20] exit_mmap+0x1c0/0x578
> [c0000000049bfa70] [c000000000151f80] __mmput+0x60/0x1e0
> [c0000000049bfaa0] [c0000000005a6980] begin_new_exec+0x6e0/0xed0
> [c0000000049bfb20] [c0000000006405a8] load_elf_binary+0x460/0x1b68
> [c0000000049bfc70] [c0000000005a4088] bprm_execve+0x2ac/0x754
> [c0000000049bfd40] [c0000000005a5de0] do_execveat_common+0x188/0x250
> [c0000000049bfde0] [c0000000005a71c4] sys_execve+0x54/0x6c
> [c0000000049bfe10] [c000000000030980] system_call_exception+0x120/0x310
> [c0000000049bfe50] [c00000000000d6a0] system_call_common+0x160/0x2c4
> --- interrupt: c00 at 0x7fff98ea1638
> NIP:  00007fff98ea1638 LR: 000000001004a12c CTR: 0000000000000000
> REGS: c0000000049bfe80 TRAP: 0c00   Not tainted  (6.11.0-rc5-06732-g133a683d26fd)
> MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 22002824  XER: 00000000
> IRQMASK: 0
> GPR00: 000000000000000b 00007fffcec19410 00007fff98f79900 000001001dc20410
> GPR04: 000001001dc20440 000001001dc20450 0000000000000000 0000000000000000
> GPR08: 000001001dc20410 0000000000000000 0000000000000000 0000000000000000
> GPR12: 0000000000000000 00007fff98ffa9a0 0000000000000000 0000000000000000
> GPR16: 0000000000000000 0000000000000000 0000000000000000 00000000100b8fd0
> GPR20: 00000000100d03a2 00000000100b8f90 0000000000000000 0000000000000000
> GPR24: 0000000000000000 00000000100e77b8 00000000100b8700 00000000100d03e6
> GPR28: 000001001dc20450 00000000100d03e6 000001001dc20410 000001001dc20440
> NIP [00007fff98ea1638] 0x7fff98ea1638
> LR [000000001004a12c] 0x1004a12c
> --- interrupt: c00
> Code: fbbf0018 7fdff378 48033221 60000000 ebd90000 7c39e040 3bdefff0 418200a8 e87f0008 e9430038 312affff 7d295110 <0b090000> e9430040 312affff 7d295110
> ---[ end trace 0000000000000000 ]---
> mkdir (59) used greatest stack depth: 28176 bytes left
>
> Bisected to commit
>
>    1cd7eb306a54 ("vma remove the unneeded avc bound with non-CoWed folio")
>
> I have reverted that commit for today.
Sorry, this commit has still some issues by discussing with other
maintainers, and the submission can be cancelled.
https://lore.kernel.org/linux-mm/5a17754a-162f-48e0-93a5-19b043d29c37@vivo.com/T/#t

Thanks
Zhiguo
>


