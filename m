Return-Path: <linux-next+bounces-7588-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BFBB07D88
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 21:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 196671894155
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 19:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1D229AB15;
	Wed, 16 Jul 2025 19:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FXeINIo2"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D817A194A60;
	Wed, 16 Jul 2025 19:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752693858; cv=fail; b=ZB3tp5nbBPxsZxkMqbWcaBpW5eGYSbyvgiftdzsfLM9j1Shd2n66pz8/flF59FrjM0KwyQInhC7nbpRzcfNA5BqrRfnHaccEtV7u15wf0oS1290ak6cvfkjyPRp7WTberda3w8AK8mpdAMY6cs7z+9aCKOAWvskbD6aNAqBt7Ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752693858; c=relaxed/simple;
	bh=7z0eu9QULjefMzPOEXaxxwjyXY4N/w2ZqPBWMo8TFUY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c0Lx9guBFoiLgFBuxy/EV9GvkyKXQSB7pEZ4/CsNwjXbfNWcNHwudO3Vhmb3QL7v125lSmpssZAMQtG0CMT/VRkt1sNPE9d1MAwDBp2PMlWwpVmzMcZoJFQOTHXB3+2/tg/d5GO/fXgqr/fVNrZ1pF63U4iMcs6GRquzyMKeX/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FXeINIo2; arc=fail smtp.client-ip=40.107.236.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrPy6UlMTlQR+Bn6WpLKulzxEclZRGtkHiobvbyH8FhDBTKDyM2QVIeCNMGxqAKcUv6R3p6AweRziynj9ClUE4g/nHC09hFuyy2uicdytDl9l03h1CbktLewxn4EnE6M2a2FsRtykamB6ohisKYkeITpKjbpCFsn47FHhPf0NbowT5VrLxOhqSsRvZZgW6xTKv0rScDC4xX21Q5+XPjnom9JiYYkBV6kk9MUdGgE4InvdsJ4FagpkdZDOszvPwTc/iqWbmJWy+zj719Nkf5rgSHZwfUjQBrD1aWui7GRsVYuV8CSH3u4FaMY4FeAE3F/nLTncoQmgq7cdk54U+8uBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=revA3V3wHE/I8eSKKurd3dSzfo4n9PSx3VUqfabC3qs=;
 b=qMh+ihlEo3m0gLYtnHZYcdDia/ur0mWNrL+AHEKgdGRMDr7jIfr3mKdLn4q0v/tq/FMBymqC6JvBT8XeMAoBEm1ApctghezSskCG0aIIYmMqkL/fkmS4m6cuRXt5j3zLgQGHHKsvjlWuco3JLz0b1IrFyltsu16E4NHKGpZgOcfMRsViieq6Rlq5/rQyR0KI4SGqU+V8cvtVEgLtHoWWkXnq50uuMc0kMndo+QQyfNUAkpMC6FgEs4vwnpuyELoc9z4RNfLWDAUX7m77EO+Cee8uGJQwR/eeeo2klFNno5MSAuHSPYEQ66+RrR984qgblmAcxeV5zKtPJOZThs8kWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=revA3V3wHE/I8eSKKurd3dSzfo4n9PSx3VUqfabC3qs=;
 b=FXeINIo2Q4kTkad8lMJ1c3CxmIANJMBMKk8h7C9xKYzIviFp3HR0FqPt0+VTjXOTAge/JT9FXif4km3OhS6PEaftvZboNsJ/PPx2xwZpkKxmbTAQpsAIkaDOkU8E55FIcZ0gr4zfGKNEHSZpBLehbUbbjKohGFr8Zn5Xi8CFOsg=
Received: from IA1PR12MB6044.namprd12.prod.outlook.com (2603:10b6:208:3d4::20)
 by SA1PR12MB7343.namprd12.prod.outlook.com (2603:10b6:806:2b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.37; Wed, 16 Jul
 2025 19:24:10 +0000
Received: from IA1PR12MB6044.namprd12.prod.outlook.com
 ([fe80::b62f:a186:3978:4a57]) by IA1PR12MB6044.namprd12.prod.outlook.com
 ([fe80::b62f:a186:3978:4a57%5]) with mapi id 15.20.8922.025; Wed, 16 Jul 2025
 19:24:10 +0000
From: "Zhu, Yihan" <Yihan.Zhu@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, "Hung, Alex" <Alex.Hung@amd.com>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>, "LIPSKI, IVAN"
	<IVAN.LIPSKI@amd.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>, "Kazlauskas, Nicholas"
	<Nicholas.Kazlauskas@amd.com>
Subject: RE: linux-next: build warning after merge of the amdgpu tree
Thread-Topic: linux-next: build warning after merge of the amdgpu tree
Thread-Index: AQHb9jxmRlZrnVblGEiPsy7gdg+6qLQ1FpwggAAG94CAAAMoEA==
Date: Wed, 16 Jul 2025 19:24:10 +0000
Message-ID:
 <IA1PR12MB60448C621D9999334E7DF264E356A@IA1PR12MB6044.namprd12.prod.outlook.com>
References: <20250716202831.68661f12@canb.auug.org.au>
 <IA1PR12MB6044F52C3C58284B49DD77DCE356A@IA1PR12MB6044.namprd12.prod.outlook.com>
 <CADnq5_MUdC_odm9LM09V31=KW+Td64PkodmvS9VJuFv0e=3w4Q@mail.gmail.com>
In-Reply-To:
 <CADnq5_MUdC_odm9LM09V31=KW+Td64PkodmvS9VJuFv0e=3w4Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-16T19:19:50.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB6044:EE_|SA1PR12MB7343:EE_
x-ms-office365-filtering-correlation-id: 5fddca8e-f173-43ec-160d-08ddc49e5713
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|4053099003|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dTF0M2ZGZUhvaWR3Mmx2dGRCL3JtNWxtZnJKTXVXT3kxYzBBaUllcDFldkc4?=
 =?utf-8?B?SkM1bjJGZ2hWcUxaMGZJZHh5VURKQndGanVTa1dWaVJ4QnB1Y21HekVaMVFn?=
 =?utf-8?B?N2VkdUY3MHEyWjcwUWJ2RWpwdEExZ0w1VkpmU09BSGk2dlM2QTkyaVQ3ZTBq?=
 =?utf-8?B?UFVBMkUzWS9ucit6UGp3SDZGYmNKQkFGc1VwMGxZSmlEWFVsNmU2OFYzTHd4?=
 =?utf-8?B?U1lMTU96T3lzem5hY01FbDNmd2FXY2N6SkVwbnlIVmZIYjB4OUNGbktsckNE?=
 =?utf-8?B?ZjBySXJlV3RQbzErTzhkQTRMWkRSZlZJZjhqNWgzK1ZQSkt5ZDVYT3lweEd3?=
 =?utf-8?B?Y2UwRC9zbThMZVJCMW0veFhBZnoyemFIY3JTNnJscDlQU1FubWg2UVpENWRM?=
 =?utf-8?B?dVAveDBVUDBFYm4yZDFsWi9XZ3NNekVEL2lGZ1BZNFVneGZORFI0eE03NmJr?=
 =?utf-8?B?UlNqTTVkUjJCU3RvZnZURWFFT1RQTDdoTU1nQUtmY2R3QVFJQ2NEYXhmRStJ?=
 =?utf-8?B?K0JPQkJHMittYll5cEl0S2FncEFNMmlRcW5iS0h3b0JyeVprUERpQkNBSjB2?=
 =?utf-8?B?aU1mMmZicERWVGZrdFBwMWdQbjlNSVFFNWVFNmR4Tk9RejIvbUZ6c21aMytX?=
 =?utf-8?B?T0pQQWZCY21xN1BRb0x0clJzakpVZHFhS3F2c1hCNWp1ZVVHenlSMkN3RUor?=
 =?utf-8?B?UFc5dklES3REcVpKRnNNRmZZWlk0MTk4Zmg1TTV3aC9WMW5kNVB3NThrYkVW?=
 =?utf-8?B?c1g2M1NibEpqWmR3RUwzc3ArY3BVS3IvVEZJRjVURGk0eElxV2loclE0dHpv?=
 =?utf-8?B?M2pOd2FHamVEVFlrQzh1SlpTWGQzQ2dQMXE3TjBoa0FoNDZMYUhwSVBuUWxr?=
 =?utf-8?B?Q1Z6bWlqY0hsYm1WQjlkaS9CU1g0cFRGMytMaG9BaUFyeDd2dnFEamk4RkQ2?=
 =?utf-8?B?emh2VWpGaUtCLzcrZllJdUZObG14NDFTR1kzbjkzTnoyaFlRbWFkSUIwaTlu?=
 =?utf-8?B?T1FlNlFibWhLRzZVTGpKUkE3OUVZOFBXTXBOeUx4Y0JjMWM3aGc2OFAyQi9m?=
 =?utf-8?B?cjZrVmZnMUpSRFhKN3BZVkpyTFFxMkhFa1lQc01NQ20xUkozY3dXMXdzclB6?=
 =?utf-8?B?aU1VNW05cmI0SllKUncrMmkvSGlRQzhQTGg1ay9sV1o1U2NoNG55ZllYQ09v?=
 =?utf-8?B?eitybnVyWElkOTB6ZW1UM3FaY0tRNStCM3JDMHJNVGU3ZFNWTkNKK21vd0J1?=
 =?utf-8?B?VnFNT1NCRVdUMzhreVZZN2JpRVNvd3ZJRDZaRE13dHQwL0N0VzZsRGtSQWMy?=
 =?utf-8?B?L2M3NWFiWWZFSEZSY0JpdDhLTVFscjY2SUdQK2NTVWlEdEowSXhuYlRWT0kx?=
 =?utf-8?B?cjM0UUkzdFd6TGU0V3dvVlcwbzFEdHhyRlh2bjBiSll5eVVQeXUwbWhQSDYz?=
 =?utf-8?B?bjJNM1QzNGkrQThLbUpYVkFQVWVDTlM4c1gvS0FoRm1UV25DdmhsZUhxZG5a?=
 =?utf-8?B?QUw4WlkvdGs1R2krL2lUNCtFL0hKbmFTTTlkZW5kOXRVaXo1UlRCb3lHM0s0?=
 =?utf-8?B?NFJDRjhpSC9LS2s3NUJJTUMwWS9lVlNmbFk3VzhwT0xHdkdpakZQRWtyYSt0?=
 =?utf-8?B?bEU1V05mSFVUdTBFT2M4d3NkWXlMV21wK3ZoblpOVG5aRnJiVE5taFo0WWFF?=
 =?utf-8?B?OHhVaEdsVStWRDVFSEVIcjdWYklnejEyUk1RVTVZV0MwT0MwNi8rbE9UU2lm?=
 =?utf-8?B?TU1kak9VWk0zRVVaZlRTZWZpdTBBQ3FyUEwyZm1NSU1WREVTYkRENy9sQTJH?=
 =?utf-8?B?MVV4dVpROEZhZGQ2ejFKeDdkazNoT1c5V0hINXdlSlJwUmFlSnpEWXo1NEpa?=
 =?utf-8?B?ZUhWS2xha1NFYTNpSkpwSENyZTQ3SE55OG0vaG1uQXg1S1BucEVwR0ZYd0xo?=
 =?utf-8?Q?qB4W2MX4FRQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6044.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4053099003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ei9UbFRMVm1TMXpzNVVtTC9oQUdQVHFQTWVTQmc3VVhlQUlIR0NQbGVMSmVI?=
 =?utf-8?B?a2xadktwSFZ1ZHFqVDF0dmJpZEUzR2JUMHNxQWFITU4vM3hiam1nL05vOStt?=
 =?utf-8?B?VXpGN1BJMVMrUVpFaVFaQnpZQWMxSlp6RkJITE5UN2UyRDB2R1lZTmR0MnI2?=
 =?utf-8?B?QXIwaFhBdjErZzRLSkV2OWorYTZVS3U3SGJIa2U3RTBndWZRekZTQ1FXRksv?=
 =?utf-8?B?NzlUdUNyYVpZV29MTVFWK25zM2E0dXdMNFVEUmM1VzdXckxuaXpMQ3FXS204?=
 =?utf-8?B?THI2TURab0tzYzl3NmhTWk5vMGVGWVBENzd4cDVibGxLZGtJY2FxM21qM21X?=
 =?utf-8?B?c0xhdHR1Wnc5Z3V2SzBlNE1EUm9HKy8xUStpQmJxRjFpcEI5UGJKWWVCWjNC?=
 =?utf-8?B?Yko4eHJwL1BRTGxiYVFOQmlaUGhxcnQ0dVlqNXNBY0JUUlVHRnBZL09uRWxt?=
 =?utf-8?B?TG1xQ3ltdGJIUitrODluRGJzL0diYTFRaitsbE9rVDJEd1ppYncrRzBoYmcw?=
 =?utf-8?B?ZFQvNUE3YlZIRG1WMFh0WVZzaHc5amVWdE5nUCtPOHdhUG5sS0JWdENHZm53?=
 =?utf-8?B?aFJlL0RwY0cyOEliOHJTTjhVZXdIN3dFeEdzbFJSdmdyMDBKWlhtYXdrd1Nh?=
 =?utf-8?B?WnE1WThubWdlTWx4UGNiQ3BmMlJTUVFNV0l0T0Nkb0RWUDhDbXFmZlAvc0pP?=
 =?utf-8?B?a0FZN3c3NFArN0x3enE0b2dDMGQyNTErSVZNM3VXZ2V1c2p0OXFTdmJjNDVv?=
 =?utf-8?B?SGtGVGhydU1WbWQ5SmZuQkYvRWg1dFpjd1IyVGVYTXFNSUtVNjJxTllSWWpT?=
 =?utf-8?B?M0NTR1JhYVdmZldtREFBa2RVbUo0MTREc3FhMTcxS3lINWZQNjRpMTg1Z1Zs?=
 =?utf-8?B?bXBHRXdlZDdTM3VRV1g0bG90Tm1nZnUvNW5HUGpXOFNyd1l6Ti96U0NKOEd3?=
 =?utf-8?B?b0ZnZHRaUzl3S2RwQWxNcnNmZWl1RFVjN1I5T3A4ZWxKM0xmOHZrYkdYSENW?=
 =?utf-8?B?eXE0RFFpV1BsQTJGeSs4WjEvckpjeGR2blJ0M3BpckYzTWFtSjcraEs5NXVo?=
 =?utf-8?B?OFh0T3lWVmx6U01HUlhPWU9EL2owbUtEemFRMHBtUTBZd09IbVY4eFovM0ZW?=
 =?utf-8?B?SmE4MVQ5Ym5odURaUVF2Q3lEa2R5OUpHRjhJQW9zRXFJSXQ1ZGp1K2RqWWRD?=
 =?utf-8?B?RUt3TlZEdXkrbVJuVFlwalcwbGFRbTFyTGJzaVVwcVNIYVY4SEV1ZnFNYzlZ?=
 =?utf-8?B?MXVYUU9mcHFxbzQxQldrblVhME1VbERJWEEwaEcwUVkwYjBXd1lYWHpIYVFj?=
 =?utf-8?B?SzM2cUwwSE9hclMyc1UyNXgwV3FxQVIvZlFGbmxEZ0dySzNmTVljTGxyRUtr?=
 =?utf-8?B?K0JHZDRwb2M0S0owNHFnTWFOL3d3TndsVDNLWlF6MDhQZlRESTdIbnlkRTFS?=
 =?utf-8?B?NlRQRHBXRnZUVkdrcW9VNHN3N042M3NLajFlVURCOE9zUmpBenZ3YWxXTU1V?=
 =?utf-8?B?UkI4bWNlbVVvNmNDME01Ny9ETmJDUm5qVnZDOW5kblY1OVhPS1NWSDkxb3ZT?=
 =?utf-8?B?eXMzNzlGY1Vsbk9vN1M2MWJYTjlTOHVKRTlGMWpJci81UVNRRmthTGhyY3M1?=
 =?utf-8?B?ckVRM0xjWDZTUEt4WlpCdTlUREFkeGhKdUZWTFZNeHcwOHVRRmQwTTNWM3l4?=
 =?utf-8?B?OTRwRUltU2RKazFtVXJRYXN2NkprU3hnU0ozamRhUzZhaFNuNEtoOEl3UUlE?=
 =?utf-8?B?YmdCM1FubWIzdjNFNVNLWmoyTTB2Q0JNc3JlS25LTlhUQkowTE50Wjl0MFpn?=
 =?utf-8?B?V3BpUFNYWWc5eW5xc0VhSkhBOU5FRTdsN25HNU52TnhlMEVJTE1VL1h3M2Ux?=
 =?utf-8?B?Y3ZzMWRoVUJxNFUwQTlEMjg1cU4yMTJkR1l5MTFWdXJRcmxEZzdUUUwxZnAy?=
 =?utf-8?B?UWFoQzRmZndYQXBmZnd4c3N2aVFjUkxtNGlReHJXTFVkZEF0b2hVT01jOTFN?=
 =?utf-8?B?dVN4NUxtdTVCUzN3bkp4TmViNStwQUQvbDZtYnJZSGdQaHRobVZkRGdackU0?=
 =?utf-8?B?b1lST2JHeG50Rm5YMmtlTzRmN0NUdTk4WUtKVkJWcW16azZmaGxqaDZVUjZi?=
 =?utf-8?Q?hsg0=3D?=
Content-Type: multipart/mixed;
	boundary="_002_IA1PR12MB60448C621D9999334E7DF264E356AIA1PR12MB6044namp_"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6044.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fddca8e-f173-43ec-160d-08ddc49e5713
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 19:24:10.0686
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ydMZAErNns/PKC8HJuwzW876UpU1LfWyxVKEpcJwcjRZn9eExnf/7B4Np70r3ua6r+d3f59paB8YZgohcYGSbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7343

--_002_IA1PR12MB60448C621D9999334E7DF264E356AIA1PR12MB6044namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGkgQWxleCwNCg0KSSBqdXN0IGRvdWJsZSBjaGVja2VkIHRoaXMgcGFyYW1ldGVyIG1pZ2h0
IGJlIG1pc3NpbmcgZnJvbSB1cHN0cmVhbS4gSSB3aWxsIHdvcmsgd2l0aCBBbGV4IEh1bmcgb3Ig
Y2FuIHlvdSBwbHMgaGVscCBtZSB0byBhZGQgZGVzY3JpcHRpb25zIGJlbG93IHRvIHBhdGNoPyBU
aGFua3MNCg0KKiBAbnVtX3JtY21fM2RsdXRzOiBudW1iZXIgb2YgUk1DTSBoYXJkd2FyZSBpbnN0
YW5jZQ0KDQpSZWdhcmRzLA0KWWloYW4gWg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+DQpTZW50OiBXZWRuZXNk
YXksIEp1bHkgMTYsIDIwMjUgMzowOSBQTQ0KVG86IFpodSwgWWloYW4gPFlpaGFuLlpodUBhbWQu
Y29tPg0KQ2M6IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1PjsgSHVuZywg
QWxleCA8QWxleC5IdW5nQGFtZC5jb20+OyBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5E
ZXVjaGVyQGFtZC5jb20+OyBMSVBTS0ksIElWQU4gPElWQU4uTElQU0tJQGFtZC5jb20+OyBMaW51
eCBLZXJuZWwgTWFpbGluZyBMaXN0IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPjsgTGlu
dXggTmV4dCBNYWlsaW5nIExpc3QgPGxpbnV4LW5leHRAdmdlci5rZXJuZWwub3JnPjsgS2F6bGF1
c2thcywgTmljaG9sYXMgPE5pY2hvbGFzLkthemxhdXNrYXNAYW1kLmNvbT4NClN1YmplY3Q6IFJl
OiBsaW51eC1uZXh0OiBidWlsZCB3YXJuaW5nIGFmdGVyIG1lcmdlIG9mIHRoZSBhbWRncHUgdHJl
ZQ0KDQpPbiBXZWQsIEp1bCAxNiwgMjAyNSBhdCAyOjQ14oCvUE0gWmh1LCBZaWhhbiA8WWloYW4u
Wmh1QGFtZC5jb20+IHdyb3RlOg0KPg0KPiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gQU1EIElu
dGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KPg0KPiBIaSwNCj4NCj4gK0FsZXggSHVuZyArTmlj
ayBmb3IgYXdhcmVuZXNzLg0KPg0KPiBUaGFua3MgZm9yIHRoZSBpbmZvcm1hdGlvbi4gSSBiZWxp
ZXZlIEFsZXggaGVscGVkIG1lIHRvIGFkZCB0aGUgZGVzY3JpcHRpb24gaW4gYW5vdGhlciBwYXRj
aC4gUGxlYXNlIGxldCBtZSBrbm93IGlmIGFueSBmdXJ0aGVyIGFjdGlvbnMgZnJvbSBtZS4NCg0K
SGFzIHRoZSBmaXggYmVlbiBzZW50IG91dCB5ZXQ/ICBJIGRvbid0IHJlbWVtYmVyIHNlZWluZyBp
dC4NCg0KQWxleA0KDQoNCj4NCj4gUmVnYXJkcywNCj4gWWloYW4gWg0KPg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVn
Lm9yZy5hdT4NCj4gU2VudDogV2VkbmVzZGF5LCBKdWx5IDE2LCAyMDI1IDY6MjkgQU0NCj4gVG86
IEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPg0KPiBDYzogRGV1Y2hlciwgQWxl
eGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgTElQU0tJLCBJVkFOIDxJVkFOLkxJ
UFNLSUBhbWQuY29tPjsgWmh1LCBZaWhhbiA8WWloYW4uWmh1QGFtZC5jb20+OyBMaW51eCBLZXJu
ZWwgTWFpbGluZyBMaXN0IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPjsgTGludXggTmV4
dCBNYWlsaW5nIExpc3QgPGxpbnV4LW5leHRAdmdlci5rZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBs
aW51eC1uZXh0OiBidWlsZCB3YXJuaW5nIGFmdGVyIG1lcmdlIG9mIHRoZSBhbWRncHUgdHJlZQ0K
Pg0KPiBIaSBhbGwsDQo+DQo+IEFmdGVyIG1lcmdpbmcgdGhlIGFtZGdwdSB0cmVlLCB0b2RheSdz
IGxpbnV4LW5leHQgYnVpbGQgKGh0bWxkb2NzKSBwcm9kdWNlZCB0aGlzIHdhcm5pbmc6DQo+DQo+
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oOjI1NTogd2FybmluZzogRnVuY3Rp
b24gcGFyYW1ldGVyIG9yIHN0cnVjdCBtZW1iZXIgJ251bV9ybWNtXzNkbHV0cycgbm90IGRlc2Ny
aWJlZCBpbiAnbXBjX2NvbG9yX2NhcHMnDQo+DQo+IEludHJvZHVjZWQgYnkgY29tbWl0DQo+DQo+
ICAgMjZhZDc4ZmZmYzY2ICgiZHJtL2FtZC9kaXNwbGF5OiBNUEMgYmFzaWMgYWxsb2NhdGlvbiBs
b2dpYyBhbmQgVE1aIikNCj4NCj4gLS0NCj4gQ2hlZXJzLA0KPiBTdGVwaGVuIFJvdGh3ZWxsDQo=

--_002_IA1PR12MB60448C621D9999334E7DF264E356AIA1PR12MB6044namp_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Wed, 16 Jul 2025 19:24:09 GMT";
	modification-date="Wed, 16 Jul 2025 19:24:09 GMT"

Received: from CY8PR12MB7124.namprd12.prod.outlook.com (2603:10b6:930:5f::11)
 by IA1PR12MB6044.namprd12.prod.outlook.com with HTTPS; Wed, 4 Jun 2025
 20:02:36 +0000
Received: from IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9)
 by CY8PR12MB7124.namprd12.prod.outlook.com (2603:10b6:930:5f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 4 Jun
 2025 20:02:35 +0000
Received: from IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692]) by IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692%5]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 20:02:34 +0000
From: "Hung, Alex" <Alex.Hung@amd.com>
To: "Zhu, Yihan" <Yihan.Zhu@amd.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
	Alex Deucher <alexdeucher@gmail.com>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Lin, Wayne"
	<Wayne.Lin@amd.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Thread-Topic: linux-next: build warning after merge of the amdgpu tree
Thread-Index: AQHb1QAQrzLA18ZA9kmk8U1kzhNIFbPy/7OggABs7iA=
Date: Wed, 4 Jun 2025 20:02:34 +0000
Message-ID:
 <IA1PR12MB8495F4F4CE8C69C0B3F024B5F76CA@IA1PR12MB8495.namprd12.prod.outlook.com>
References: <20250604132331.5929895f@canb.auug.org.au>
 <IA1PR12MB6044D456DA05361DAEFECE4DE36CA@IA1PR12MB6044.namprd12.prod.outlook.com>
In-Reply-To:
 <IA1PR12MB6044D456DA05361DAEFECE4DE36CA@IA1PR12MB6044.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Exchange-Organization-AuthMechanism: 04
X-MS-Exchange-Organization-AuthSource: IA1PR12MB8495.namprd12.prod.outlook.com
X-MS-Has-Attach:
X-MS-Exchange-Organization-Network-Message-Id:
 f34388c0-059d-4d8f-f7ee-08dda3a2bf2e
X-MS-Exchange-Organization-SCL: 1
X-MS-TNEF-Correlator:
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-06-04T20:02:33.992Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
x-ms-exchange-organization-originalclientipaddress: 165.204.54.211
x-ms-exchange-organization-originalserveripaddress: ::1
x-ms-publictraffictype: Email
x-ms-exchange-crosstenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-Microsoft-Antispam-Mailbox-Delivery:
 ucf:0;jmr:0;auth:0;dest:I;ENG:(910005)(944506478)(944626604)(920097)(425001)(930097)(140003);
X-Microsoft-Antispam-Message-Info:
 tifPdPS9Qh+FQ0TfYcobJSNOcp6HyvxrlJDw7c8Lv6XeUpS6gnJ9p9h5csghJzZKUZ+98imBQOg4Oo4SEbz+eSdEd08XJIFHsmBQTPonnP5LstuKr2TvHUbTjqgqGUpCR101I+Ikvd98oikzgxRh3RTd4nyVvx7hgDy7HEJ3ydvSE+ap1jEgBL1DIyY44CF3HHjsrFJs3ukp+qpHYCmQypb9gR7FOM940wkP8NqKn4yrI4VXThPu+sggWrnUR55E8kTdbE7y9SXKJJZISRUNr44b0zkrkb/MU/0E37HdTF+hXnk6JUl8bB3CP1cscO/rRtgO835icxveDysJUmQJ4v2qf3WMw+aJ0UYCdHOcLOlUXz5CAw6Iu3JidcshqYeDYdtkIzGYqPn7rNXZgOWs6rM+gtocmPoxe73gmTc7eXvr5jqVy7zCyzq3Zf0jhTXAOQvZbLGrBDJtnApSzipH2S3mHsFcEsC7kC70Mkly6pAjRgTpapjROET6LfTw5tQbCFBDmprjcQg3zWrhw/q7NzIy23UmDriYRZqDT3hvWODcE1qmkppa1XoghVO34JYcUgUM1x6l2CCraF8GPLmu0I6Swz3pRjbZ40wTJyu83mjlGeuYGumCFeh+wVppjbasn8FdhkQAfRSLXch0gRX6luK+7oiS1hSO5Sues65qzMzI5rO6EqJCvwplqJCu2uPjJMEsPWv8+aSpXrg/wNcNHDahO+Ll2ebnkfEOMUDw/kiMHIb1dPMwTk3pYObxVq7UCFd8OJ4c/buN4ySXGkkoGxd4yMwWyHu7H/pCmajnDNM=
Content-Type: multipart/alternative;
	boundary="_000_IA1PR12MB8495F4F4CE8C69C0B3F024B5F76CAIA1PR12MB8495namp_"
MIME-Version: 1.0

--_000_IA1PR12MB8495F4F4CE8C69C0B3F024B5F76CAIA1PR12MB8495namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]



Hi,

A patch is included in this week's promotion patch: https://patchwork.freed=
esktop.org/patch/657001/?series=3D149850&rev=3D1

Cheers,
Alex Hung
  _____

From: Zhu, Yihan <Yihan.Zhu@amd.com>
Sent: 04 June 2025 07:31
To: Stephen Rothwell <sfr@canb.auug.org.au>; Alex Deucher <alexdeucher@gmai=
l.com>; Hung, Alex <Alex.Hung@amd.com>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Lin, Wayne <Wayne.Lin@a=
md.com>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; Linux Ne=
xt Mailing List <linux-next@vger.kernel.org>
Subject: RE: linux-next: build warning after merge of the amdgpu tree

[AMD Official Use Only - AMD Internal Distribution Only]

Hi,

+Alex, I sent description to Alex and he is helping me to add it into the u=
pstream.

Regards,
Yihan Z

-----Original Message-----
From: Stephen Rothwell <sfr@canb.auug.org.au>
Sent: Tuesday, June 3, 2025 11:24 PM
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Lin, Wayne <Wayne.Lin@a=
md.com>; Zhu, Yihan <Yihan.Zhu@amd.com>; Linux Kernel Mailing List <linux-k=
ernel@vger.kernel.org>; Linux Next Mailing List <linux-next@vger.kernel.org=
>
Subject: linux-next: build warning after merge of the amdgpu tree

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs) produced=
 this warning:

drivers/gpu/drm/amd/display/dc/dc.h:247: warning: Function parameter or str=
uct member 'mcm_3d_lut_caps' not described in 'mpc_color_caps'
drivers/gpu/drm/amd/display/dc/dc.h:247: warning: Function parameter or str=
uct member 'rmcm_3d_lut_caps' not described in 'mpc_color_caps'

Introduced by commit

  71e17aedb465 ("drm/amd/display: move RMCM programming")

--
Cheers,
Stephen Rothwell


--_000_IA1PR12MB8495F4F4CE8C69C0B3F024B5F76CAIA1PR12MB8495namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
A patch is included in this week's promotion patch: <a href=3D"https://patc=
hwork.freedesktop.org/patch/657001/?series=3D149850&amp;rev=3D1">
https://patchwork.freedesktop.org/patch/657001/?series=3D149850&amp;rev=3D1=
</a></div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
Cheers,</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
Alex Hung</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Zhu, Yihan &lt;Yihan.=
Zhu@amd.com&gt;<br>
<b>Sent:</b> 04 June 2025 07:31<br>
<b>To:</b> Stephen Rothwell &lt;sfr@canb.auug.org.au&gt;; Alex Deucher &lt;=
alexdeucher@gmail.com&gt;; Hung, Alex &lt;Alex.Hung@amd.com&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Lin, Wayne=
 &lt;Wayne.Lin@amd.com&gt;; Linux Kernel Mailing List &lt;linux-kernel@vger=
.kernel.org&gt;; Linux Next Mailing List &lt;linux-next@vger.kernel.org&gt;=
<br>
<b>Subject:</b> RE: linux-next: build warning after merge of the amdgpu tre=
e</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font face=3D"Times New Roman" size=3D"3"><span=
 style=3D"font-size:12pt;"><a name=3D"BM_BEGIN"></a>
<div><font size=3D"2"><span style=3D"font-size:11pt;">[AMD Official Use Onl=
y - AMD Internal Distribution Only]<br>
<br>
Hi,<br>
<br>
+Alex, I sent description to Alex and he is helping me to add it into the u=
pstream.<br>
<br>
Regards,<br>
Yihan Z<br>
<br>
-----Original Message-----<br>
From: Stephen Rothwell &lt;sfr@canb.auug.org.au&gt;<br>
Sent: Tuesday, June 3, 2025 11:24 PM<br>
To: Alex Deucher &lt;alexdeucher@gmail.com&gt;<br>
Cc: Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Lin, Wayne &lt;Wa=
yne.Lin@amd.com&gt;; Zhu, Yihan &lt;Yihan.Zhu@amd.com&gt;; Linux Kernel Mai=
ling List &lt;linux-kernel@vger.kernel.org&gt;; Linux Next Mailing List &lt=
;linux-next@vger.kernel.org&gt;<br>
Subject: linux-next: build warning after merge of the amdgpu tree<br>
<br>
Hi all,<br>
<br>
After merging the amdgpu tree, today's linux-next build (htmldocs) produced=
 this warning:<br>
<br>
drivers/gpu/drm/amd/display/dc/dc.h:247: warning: Function parameter or str=
uct member 'mcm_3d_lut_caps' not described in 'mpc_color_caps'<br>
drivers/gpu/drm/amd/display/dc/dc.h:247: warning: Function parameter or str=
uct member 'rmcm_3d_lut_caps' not described in 'mpc_color_caps'<br>
<br>
Introduced by commit<br>
<br>
&nbsp; 71e17aedb465 (&quot;drm/amd/display: move RMCM programming&quot;)<br=
>
<br>
--<br>
Cheers,<br>
Stephen Rothwell<br>
</span></font></div>
</span></font></div>
</div>
</body>
</html>

--_000_IA1PR12MB8495F4F4CE8C69C0B3F024B5F76CAIA1PR12MB8495namp_--

--_002_IA1PR12MB60448C621D9999334E7DF264E356AIA1PR12MB6044namp_--

