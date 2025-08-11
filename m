Return-Path: <linux-next+bounces-7885-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B21B2022B
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 10:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DE5B3BDE99
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 08:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22FED218596;
	Mon, 11 Aug 2025 08:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dXr4u0nx"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2078.outbound.protection.outlook.com [40.107.96.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659B21F4176
	for <linux-next@vger.kernel.org>; Mon, 11 Aug 2025 08:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754902090; cv=fail; b=Oq/5AlWOl71um6reMNRmA+gbvkUHWaofIhIJ5r1zR8z7hH8T8xAAKw8/O/xt0chquyl8N5M5EcJAhhZw+dCnobT64yyB/3i+/8ZlQ3zJXo4pXsqjz37tb81lpl6D73rcnfQ7faE5TdwJ1SXrLMR1i+EmEq/SSJ9piVFQvlzeC5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754902090; c=relaxed/simple;
	bh=K6qrP4Sv/g2Mnd6oLCq7wue0o//ZYXKH6VapcG5lP6A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=REmuPC50u5uVM5T6zJwrD7d1V0pz7ZxVYU4+vk+XQpVUBe2rQx8yv184wwR630ld1oZQeWuFRfCjzeHHA9Z5UnIirDa5Pb2e7Aa/VVMkl2bGu0nOn8n0B1s+6rB9wQKs6fTTY+TwPxYdx1eLknFriqwRL/kMH3MpwzGAFrw9b+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dXr4u0nx; arc=fail smtp.client-ip=40.107.96.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UVd6BzGLVthK0NFUrtbAS6MvxxntWvtDr3XlvHLQ0DNBRCvgPTHD2Jg9cto+AN5o+cwdgaxQUQtog5E5KF88QnoJfWQkSPu3lxlPOIdf/V3FUAim8WV1UHQn7YJ8hGQBQtI93GLzcoNvecLbd2YRJjjc843u/n9lSfL8z6bDEil+st0o5XtblV70Gc7kBD31KN31awADwlHke7CPCDktXNymXeP6v+IhY6XkSlDVrHe2SRoAkguFSUm+iouEpbCK7QgRHdCkGKApG5yDa2kj6i2bAIl8fHDFDihttyxwHhgBMFFdWZ3T3SbdvOV6pbahRsGcJH7XcUY+Pjp570Yjdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tqM6kq/t/poCf5IZWVOilWSTw5HlM4xIkwNQ7EGSDE=;
 b=h0gyzaVVczzA352lm6wbRvTW496lAV6cx3WEVlu1MmG7CVoVIi6XWsZlTDBBSDfe5jHlMsXixQcKmFhcsBBefhWjxyWlsyGTUHxf78E/Owvg1zcPy2XBIaKmr4MAf2AdwLcMqwAauKTVsWdZKD79YQRgCfIkRczxzpnQUx9Ij/bgigAshs74ArlVwBJHNZpoJtFV5X9LRMUkLDf6Q0vfLG6BiKDNyzqeMlnFVxPABxdw1yJd+BgMQwwjIzudHisKgp2hzp+RLRzA94ZsMzeeW147p7X+WFBHwUAuzcMKEeiwhyytJiWqDC8Le0XXYYKmhrkYW0cyB3qAxGF8c9qA4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tqM6kq/t/poCf5IZWVOilWSTw5HlM4xIkwNQ7EGSDE=;
 b=dXr4u0nxM75qw2/rZfI4rg7OnHG+v5EgH8FyF1jYGSlxBLKBY3T1DI38yo0Rr8OCyM0ikkGHFk12Y5d8N8dDo6NRflUZzvJe3TEQN5ahgtE8+TzITE0Y0a//3RT/oxlFHtkzsraaD4JCqH4FoVIrXSDYRGHP5IpNeXi1Y8VLHrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8035.namprd12.prod.outlook.com (2603:10b6:a03:4d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Mon, 11 Aug
 2025 08:48:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 08:48:05 +0000
Message-ID: <9846b386-87c4-4f86-ae11-6361470cbce7@amd.com>
Date: Mon, 11 Aug 2025 10:48:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: drm/radeon/r600_cs: Build failures with GCC 16
To: Brahmajit Das <listout@listout.xyz>, linux-next@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, airlied@redhat.com
References: <pqpvdwxmqler2mg4ou665v56g6qe36vwi5jeavqeszj2mrk5m7@io6dy7jsvuhe>
 <smpcrwsua5kwutn5ynzz4eiupocvw5c7b4tmk3xugynvmnr53d@zxyraythnybm>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <smpcrwsua5kwutn5ynzz4eiupocvw5c7b4tmk3xugynvmnr53d@zxyraythnybm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0389.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: 866aaa46-9c18-423a-875e-08ddd8b3c9bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVdLb1dNbzViSGsya01hOHlqU1JZZm01MGpBUGRPSkN1L2ovSVAxemhsZUZu?=
 =?utf-8?B?SitNY1RNeXBXNWdzQ2ZmUXB2TklaVngyU0xzN0ozbUxVcTBPQWZQV01WbktR?=
 =?utf-8?B?MlFnOTRHSXJFRWR1bTlocnV5NWVuTm0vQ3lwOVQxV0NJa0FBTzJENzZHb2ow?=
 =?utf-8?B?azNXTE44Y081Yjl4SE1xUkZvVXdMa3NhY0NvQnRmWGdrVklrRjAxdmd6TElH?=
 =?utf-8?B?K0RFOW9rZ0xkM0QrUGdCKzBlRnBQYXUyTVBmNWE4Z2VudnI3UHhIbDloMTVW?=
 =?utf-8?B?dVpQckpiU2xQMCtwZVR3eFhsRDVyNEoxRUdhRVI3R1ByMW0yOWd4ZnAxVHBV?=
 =?utf-8?B?TEoyZ0VvN3dLUWZHRDBKbllDUC8zVnFoT0d2ajlUUG9YcDBIRjg4TGxHSnFD?=
 =?utf-8?B?ZU44dldIU0hUZ3ZQQjAwVUY0Ulk1dlBobG96dHJuUGNzUUJHOTJodTZUd0Y4?=
 =?utf-8?B?UmVJdlN2SytKL0NCeU94d2hYZDlIWTB1M3FKSmo1L1B0ZXlEK05aWmNtSlBX?=
 =?utf-8?B?cTIvYVZzQmxBVnhFVVNKVlZYa0ZxVk5ZNXNDTEViK0FZNFE3ZU4xUmNyZ05F?=
 =?utf-8?B?SEJoK2JhOWJNSndTM09hcVNGVnNNRk1mb0Joa1I1bFJMaGVEendVdlhPRTNr?=
 =?utf-8?B?V0NUYzBOdGlZUXpYenZ3TDZRYjJ3T1lrekd6M0FWQmh1S2pGL3cwanozUHo0?=
 =?utf-8?B?ck0vRlNjK3AwY0ozRXJSL0xTbHFlYjVMc1NvUEROZzd3dVA4QzJraTNFdEgz?=
 =?utf-8?B?eFhJL3pYKzlDMlZhSzI1WVlDbVFXSHpMK2tKZHA5UnI0d2tCdkw0Wml5L2d2?=
 =?utf-8?B?U1EwRG5zWFF3bmlEWnFUcFZJWGJ3cVBaK0dhbi9zbW1ySkN3cTI3MnhocVRV?=
 =?utf-8?B?N2pnOUJqSVl4QTFQKzU4amdMS3Fzdm1pOUEvbG9NZUlRWW45UUk0UVo1V1BS?=
 =?utf-8?B?YkgweWlveHNIc3ZUNVdYMEZVODFBRWFNMzVFbWZFM29yM2l6eERqeUZkSmFi?=
 =?utf-8?B?SUZjdzIwdEhJK1lxQnpzSXN6LzEwMjhGM0YvaDFtVG9RNWVYdEpzeEoxR0xw?=
 =?utf-8?B?c2RuYlpLNUJTVHdEd1I1NE14VFlvdDlab09DMzlLcXRNcFlFTWFaRGNtT04w?=
 =?utf-8?B?R2g4dDRJeng5ZjR2SjljOWNkUVFWRVRvNnJDY1BnTy9rWE02OTdrUEJDbjlU?=
 =?utf-8?B?MkZxL21PSTFsUXdVKzM2S2w3aE44WFFzaTZ0c2tSVmFCNjNVcS9tVkpzSTFl?=
 =?utf-8?B?WllROXlnc1pybXFOZFhKNXFpbmpXb2tic3lSV2V2cCtzOFVBZ3dYVFFmbjRk?=
 =?utf-8?B?OFk3eVhOUGtRV2RiZ0l4WHZhdncxOWY2eXJXUTB6VjhEMmdPWVpHOVh0Skxw?=
 =?utf-8?B?VXRacTIvRnp2VFFDbWwzVGZQRklmSlVSLytmcVZoT0VGUUNXWXg2SUYwWERH?=
 =?utf-8?B?c2EvWWdibUR1QitIYnZKcHVlSkFocWRLbnpvRzA3V2FzVmRLZHFxazVqMDBW?=
 =?utf-8?B?S2Y1MldBRFhhbU96a1U5YWNMbTV4NkpYZzJqSW9xbG1walJZMTBQWFhQUlB3?=
 =?utf-8?B?NEphWU5QWFhmalFyNGNWcHg0S3d1bnJzQjV3ZGNDMDVlVVBCNmhvcy9zQU5U?=
 =?utf-8?B?QXVPTHV6bGl0dE9LZmVkaU5UMFRLYzNZdzVIREdFeWh3Mk5xampuMzF3Rjlt?=
 =?utf-8?B?eE9kYUlnem8xckdOTGltMjdKS1M2UGNrT0FOUkRYSWxIU2xvdmZPSE9rK3dw?=
 =?utf-8?B?YjJlUFpQRGYyOEpmL1Rub1F5Y09UTTFtTXZoc0pxeTVCeldFZ3FsREFQT3Q1?=
 =?utf-8?B?U2F1VGRtK0U2YXNnMlZsTmh2VGlhWVhsUGl3MFZCOVl4bFRhSVJDak9NaVFG?=
 =?utf-8?B?R3QrdGFDLzdtU2xKdGlqV290cTZHVGx3Sm43SnBDY1VuNEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnZWV2hRMnB3bnFxYzFJbWZTYTdpTXFsUnRqSVJRSzR1ZlBWd2ZMZXBaR3Ur?=
 =?utf-8?B?OUJWVXN4NTRaTzNRRlZZZElBQzRQdXBsQTJyWE9OZnVOcGVocEdrcmcxaE9S?=
 =?utf-8?B?MDdJcW5mMnhxalZjR09Zd0N5dWxtWGVjTWVvTjlrR0ZudjdERGZ2enZscDVF?=
 =?utf-8?B?d3dYZDN6eWF6b2xSZnFuT2xvazMwK1NkSWxmZ2psT0NGKzFoREtoaFd0MkZs?=
 =?utf-8?B?bmxRbTlqYzVIWURuM0RkNlI0UW1qeW5rcm0rRW8rVHZXME5HOTdFVjNVUHVP?=
 =?utf-8?B?NlEvelVtT1F0UHF2VDE3dGsxS0NmNE0xVllDSWMyN1ZlOURDZlA4OXUyZXF0?=
 =?utf-8?B?bzJJZSs1b3hHcHNNMlFkb2xjWU0xM2tXN1lvSEZjMHU2M2xIVEdQNGVtZzFI?=
 =?utf-8?B?eEJNTGdKSUVESUhVOU81b0lNVjladzZONjE3TnB5NGFicHRESm1JcHpSVWkv?=
 =?utf-8?B?blBaeDhKVmdGdDRZOVBEOFF4YWQyTE45ZWdid2R2R0k2amp2cktseDhidngr?=
 =?utf-8?B?aTFtSFR0ekNTbUx6dHhqVDRnU2NvMTNQeWZPRC9NRGVrdW9zRkEzaDExS3J1?=
 =?utf-8?B?TU5RNE5BRDBGYkVTbXNPeVpZc0YzOVZiZHpicDAyaUMyM2wxVVFDSkZraXR6?=
 =?utf-8?B?UHQwaW5aR0IzYjI4RGVmdDhGZmMwbjhSQ0RsYlNSakx0cUc5Qjgwa2M1Kzhz?=
 =?utf-8?B?OG1MK3A4VFdGeWpoci9RWkk4UnVkUnBNQjc3RVlERTExS2cxMVk5aU03cVZT?=
 =?utf-8?B?RlAwWHNyZC94c1U4V2hhUVNHSGhWdkI2OUZwZXE5YkdieEtDWnFZVkRmV2Vj?=
 =?utf-8?B?RjNKSGxtTm9XN294djk2TkVBVXlYeU9GRUZmV2llc3pxQzhlOW9mU1hHdmk0?=
 =?utf-8?B?TTF0WXRBTW9RQW9sa2NadklCWjhvRmlWUW9GcTFpR3drTTVGWm9TT2IrNDNO?=
 =?utf-8?B?OXlyWVN6cnBNYkpWY1FLNDlUbkJROUdoODB2WEsrczZsZXhzV3FqUWhDQWxN?=
 =?utf-8?B?Sk82Q0hhRGdiaHlRTUw3NmtBSWZxUXFPdTdSVG4vc05YMStXMEFPM1lxRE9Z?=
 =?utf-8?B?akUyMEhhNk00bENwQ202RnB0WXVabVBFdDFaY0dlWnhQNXo4RktkRnVtdmJX?=
 =?utf-8?B?RktKQjhuWW1JNVduSjkyOFZCaXl6MGcwZGZnNmxFU0I3Wk1PVTNIVDh1aytM?=
 =?utf-8?B?cEpEenRySGJGWGdMQ2pWY0VRK0NUeTlkZWM3aFFIQ2tSQ1FNOE1ya1JJYXg3?=
 =?utf-8?B?UEJUbHgyUEpPM2QvamJSSXlNSUtFajVWNTNNcXMwaTdNU0dQVk0vN0h0cTda?=
 =?utf-8?B?Z2dOUEdtaVhlRXZBbkwwdVVvMEhxTmQvanlNRTdYK1ROWEVwakFpUCt1cThO?=
 =?utf-8?B?cGdhOFJRV1oxaFJZR3oxSnFMaEFFeVRpQnlqd1lsZ1NjdDFnVjBocU1TQWRj?=
 =?utf-8?B?cVN1L1pqVEdTRDZJNnRYNWdoZWQvUFhoQkp2Mkk0eGhMNnE2UEFoN3grblJH?=
 =?utf-8?B?RG42SFBPZ3JoUmN0bHVGSzEzZUFkM1pCMS9PM2wzbk43VGdJa1lDNWpESHVQ?=
 =?utf-8?B?VmFENVVuWnJ1dU15OWRxVzVhYld0SkZ4TzNCSk9neml6ZytTVk02cEozY3Rw?=
 =?utf-8?B?ZUgrWFJHMmJFdzZURS9WRUtOeUhxaTNDK3p4S1dhYkU2K2N6RjliaGhhNDlz?=
 =?utf-8?B?QkZDQklkSkRDU0FzakRZT1dremRtZUJCYUc0S1pVV0YrUmVja0hJMnE0cnZZ?=
 =?utf-8?B?UEhOUGpVaURRY2E1QXp4MXhEMlJVdGZtM0ordTZON0dSM0RpSXc3VnFrYXVZ?=
 =?utf-8?B?OWRoM1dySmUrMXlGYkdXQzhkREtYckc1MURHMnVNU0VSS2pCYXR3LzdMcFRa?=
 =?utf-8?B?cFVrUFZxcnJWT2c5WTFCU0RhZ0ZCeGY4Y0Y3ZTU1UUc0Ynl6Mkh1cmF2djJ3?=
 =?utf-8?B?czdDd2hqazNZMjR0NmRvM29Zc3BEeERJdFowM1UwVVFmVGtRamdUbzVLMDhr?=
 =?utf-8?B?cXlzQ3MzbnVHV3ZtRUw1UGpzSjRScmtoMCtjemFPVmM4MXBJZ2ZFZkNlRmtw?=
 =?utf-8?B?NTNCNWZZdmZPazVNMGs5UmhxSXFVd21FWnRIU2pXOTk4NklFaHh5cUFWSGJC?=
 =?utf-8?Q?4RGbgGCnqa2rqpae2KeriR3ui?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 866aaa46-9c18-423a-875e-08ddd8b3c9bd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 08:48:05.4383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c4k1UYykyq+4/H2Bp/THtsWQ5E0ZVXHleU1jZzaMen+kPiIudRABoJv+0kzSupYT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8035

On 09.08.25 11:36, Brahmajit Das wrote:
> On 09.08.2025 04:45, Brahmajit Das wrote:
>> Hello Developers,
>>
>> Building linux-next with GCC 16 results in this following build error
>>
>> $ make
>>   CALL    scripts/checksyscalls.sh
>>   DESCEND objtool
>>   INSTALL libsubcmd_headers
>>   CC      drivers/gpu/drm/radeon/r600_cs.o
>> drivers/gpu/drm/radeon/r600_cs.c: In function ‘r600_texture_size’:
>> drivers/gpu/drm/radeon/r600_cs.c:1411:29: error: variable ‘level’ set but not used [-Werror=unused-but-set-variable=]
>>  1411 |         unsigned offset, i, level;
>>       |                             ^~~~~
>> cc1: all warnings being treated as errors
>> make[6]: *** [scripts/Makefile.build:287: drivers/gpu/drm/radeon/r600_cs.o] Error 1
>> make[5]: *** [scripts/Makefile.build:556: drivers/gpu/drm/radeon] Error 2
>> make[4]: *** [scripts/Makefile.build:556: drivers/gpu/drm] Error 2
>> make[3]: *** [scripts/Makefile.build:556: drivers/gpu] Error 2
>> make[2]: *** [scripts/Makefile.build:556: drivers] Error 2
>> make[1]: *** [/home/listout/linux/Makefile:2011: .] Error 2
>> make: *** [Makefile:248: __sub-make] Error 2
>>
>> I'm not sure whether this is kernel bug or GCC bug at the moment. But
>> building with GCC 15 does not give this error, hence I'm more inclined
>> towards the latter.
>> Planning to also report this on GCC side, wanted to get some
>> opinion/feedback from kernel devs as well.
>> I'm on GCC 16.0.0_p2025080.
>>
>> -- 
>> Regards,
>> listout
> 
> After giving a more thorough look, the level usage seems like dead code?
> It's just set (level = blevel) and incremented in the loop (level++). I
> don't see any other usage of the level variable. So if we do something
> like
> 
> diff --git a/drivers/gpu/drm/radeon/r600_cs.c b/drivers/gpu/drm/radeon/r600_cs.c
> index ac77d1246b94..953ce0c57dfb 100644
> --- a/drivers/gpu/drm/radeon/r600_cs.c
> +++ b/drivers/gpu/drm/radeon/r600_cs.c
> @@ -1408,7 +1408,7 @@ static void r600_texture_size(unsigned nfaces, unsigned blevel, unsigned llevel,
>  			      unsigned block_align, unsigned height_align, unsigned base_align,
>  			      unsigned *l0_size, unsigned *mipmap_size)
>  {
> -	unsigned offset, i, level;
> +	unsigned offset, i;
>  	unsigned width, height, depth, size;
>  	unsigned blocksize;
>  	unsigned nbx, nby;
> @@ -1420,7 +1420,7 @@ static void r600_texture_size(unsigned nfaces, unsigned blevel, unsigned llevel,
>  	w0 = r600_mip_minify(w0, 0);
>  	h0 = r600_mip_minify(h0, 0);
>  	d0 = r600_mip_minify(d0, 0);
> -	for(i = 0, offset = 0, level = blevel; i < nlevels; i++, level++) {
> +	for(i = 0, offset = 0; i < nlevels; i++) {
>  		width = r600_mip_minify(w0, i);
>  		nbx = r600_fmt_get_nblocksx(format, width);
> 
> I think it should be fine.

Looks valid to me. Potentially just copy&pasted from some older HW generation and not correctly adjusted for r600.

But the HW handled here is >15 years and the code easily >10 years old. I'm really wondering why gcc only complains now?

Regards,
Christian.

> 
> Would really appreciate some feedback.
> (CC-ed Dave)
> 


