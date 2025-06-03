Return-Path: <linux-next+bounces-7012-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7B3ACBEC6
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 05:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8CAF3A2F37
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 03:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF85156C6F;
	Tue,  3 Jun 2025 03:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="b9lRjKVP"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA7179EA;
	Tue,  3 Jun 2025 03:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748920737; cv=fail; b=q1VDJ4OyIIE7O1YgShjSr3FQs+hT03X2sZ2Wf1xMFmbtUpVIFQf496gZGTLSXZAxBEyewWOIyb/v2Ys+cuYIAqY4jHCw2xEkEpu+RyWighphy/Wj76pbVYNl0nuvF0nuP/jlg+jFyygqi0D/pVXklS4XSgz1oFpSlszkGNVOMqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748920737; c=relaxed/simple;
	bh=pCHaghHOx3Vrk0pTKa1by61EbDLoOjbqjmfn5EtgTV8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ja4aO4lhFMbwQ1+GCjzia8pNAy0f4E1OpKriFqi6r9UdAZ7pj1hi4dMyUtHao80H1iMZAKtmpnVe15RVvOBu3njUGOJitboLFCB9xcbfzpeqZgdMJ9jMY9OvEw3furYkjIw1VOrZpfQ3JhwTLhPSR9OYY/TQllavnqbsFzSvA04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=b9lRjKVP; arc=fail smtp.client-ip=40.107.237.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wezqwVnTwh/RgcjQZYZIb2RuEBn+2tLOPUMEDiZgY/gi490eE4M3J50alS6DwSisX2Hm1/lXuCAhG3ez6MThLbz1YlQknbCusKrAMLKXTlgKLkQ9Q6iJMBeEB2qtAKDrZwxdDX0sOQRxka0ySHwxREgvwURxp3z+6DIrTVfAe510pPdlTftY7Z7guEiHZklH1LEEXS03qzqJIHLn4vmSrnA4tj2+tAFsn/611vXFDmaZH4Sjh0dXUDyHwa1k3/WDtrVogoqJ4EHQZD7ic0ebzAR2xC2OK/UZ7h6Lyv1Xm3cHhquohnjAnkxt3BJvD1prewxYxDRryvzeXCPKK51D7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BT21sTQpjFGFUNNIfOalyzAbrRkmcPleXuDiCjYyh4=;
 b=g4XdF78V13zoczPIIuANrNYCCEl4Gg3ePdZbo3a2vk57lteAXbbepn6qFa0HujhgqiHAfp2uPXKDvtBGySYOR1nrY0pBAoX4IlvGGcf2vTUNktYP60hU7rPvmgnweL90K6ckos/sKRM6rRDna+w1R1YMli6QbABfu9wiW5q1NwDxQJm6zBZHXKXe3o3XeTUY63ukLwsBa7N2TiTI5hvLgL26cHpauk3nty3NAGMV/xCVkKZDE6iWu89+6zuqejuK9RG3I7++rNx8HracAtxJINz5iP5BX7gYWKatsTGct+y8TZP2xkRRoYK3VafwT+ntCk0QCs/59YyGr0BLX6VCsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BT21sTQpjFGFUNNIfOalyzAbrRkmcPleXuDiCjYyh4=;
 b=b9lRjKVPX+FQIU1uRaAEqj3ogoss9qWe1jYLBItaMbLVw6lCyKDy2D/dqUN5vyGDvlMlTAnR6N77AO7owtB60kE40EUIp6FlclFW5e7cYAiFLZQQ1mRZjqo2I24+5wBr4DMBPXjr7goQqIB+XfMaMrc95l4MzDX5v/v/ZmFtLak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) by
 LV2PR12MB5726.namprd12.prod.outlook.com (2603:10b6:408:17e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.37; Tue, 3 Jun 2025 03:18:53 +0000
Received: from DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620]) by DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620%5]) with mapi id 15.20.8722.031; Tue, 3 Jun 2025
 03:18:53 +0000
Message-ID: <6e764150-2a37-42fa-9e6d-1d5dafcf1e5b@amd.com>
Date: Mon, 2 Jun 2025 23:18:49 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] i2c: designware: Initialize adapter name only when
 not set
Content-Language: en-GB
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: rdunlap@infradead.org, Hans de Goede <hdegoede@redhat.com>,
 sfr@canb.auug.org.au, linux-next@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250530200234.1539571-1-pratap.nirujogi@amd.com>
 <20250530200234.1539571-2-pratap.nirujogi@amd.com>
 <e75a0e17-8a1b-14f0-a33d-e59c0f692651@linux.intel.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <e75a0e17-8a1b-14f0-a33d-e59c0f692651@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT2PR01CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::20) To DS0PR12MB6440.namprd12.prod.outlook.com
 (2603:10b6:8:c8::18)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6440:EE_|LV2PR12MB5726:EE_
X-MS-Office365-Filtering-Correlation-Id: e5a87765-9e9b-4e0f-ac5b-08dda24d5d88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVZNaFZtTEhjK2JFRDBYRFM1L2x6a0JGN0VCamFUbmFtczNwRTIzWGZmTUFj?=
 =?utf-8?B?ajU5d3BUcU1qRnpBWXpSUVRvTE90NXByY0N1ZHhZK0FpMHlxZ05lWUZNWnlV?=
 =?utf-8?B?R0twTDdYdTNmWlJ6VTIyRkkxalcvZU9kTFRCZlhqMWNHcVZWaUZWNy9kcmVZ?=
 =?utf-8?B?bllvcUVRdnVGbVRuazhYU0wzOUZYOFpTalQwR1VYeWRuazhIUkJhdkdidkh0?=
 =?utf-8?B?dmxwQzE2Rmcxb3krRXN0TlZkaWVuaUZyOHlBcG1RRmhjMFhNNkNueUNQUGkx?=
 =?utf-8?B?U3JzTUJQOVZNNDk5bEdhMzRyRTBLRHBxTXFqZS9rdG9wQ1hLSnI5eGRlMit0?=
 =?utf-8?B?MzNwVGZUUFZoM3UzSlRkVldJTVl4aldOREJ0MDZ6M3BwUFliRlZLdmJBNHFk?=
 =?utf-8?B?ak5lME8yTmdScDRJb0Y3Z2tlY1VIQ3ZVbUtKNzI3bW5SU2toVDhTc0tmSWpE?=
 =?utf-8?B?NC9Yd0MwdS9ZTWJHdTRVSkx2b3N5eEw0QzR4TFNYUDRnRVJncjd6d0Q2aUhJ?=
 =?utf-8?B?MVVlZ1gydXdSaWVOa0hmYVB4c0E3L0FXRjlicDhuSWFSaW5mSjBqanVNMnN2?=
 =?utf-8?B?cTlrajBsYUtNVmdtaklCUG50bUdjVnRHb28vcDZYMG5GZXFSSGJjbUlMT1hu?=
 =?utf-8?B?MTAwaTBDSFM2Y29XUEFOTDRWckxvYnRVS0JmZEJrNXJydkhvdlo3aWVVQ2Ix?=
 =?utf-8?B?MlZ6OGhTMWtCZ1h3MThLZGd3dUVjRG1FeW9ucS9mWjZhZVlkeFM0TTNxMVhX?=
 =?utf-8?B?MVVsUmYzRU8xK3dxZU42b3k1Qk1Ld0hiK0lySnJXUXU5dzVtbUVIMmhDMVdM?=
 =?utf-8?B?KzRqdmZld0NIZUVReG5yb1k5KzA1NkRjVXN2M09yYXRYZkVhYkFBZk0zOXlN?=
 =?utf-8?B?TlRDTHJubGpQUk5XSkdJL2JnajVGZXhwOVd0UGhxSXlSVUw1OEpYTU02SDZw?=
 =?utf-8?B?eWJvZFJrbm9YZGpPaFVpRjdZYlg5Y2orQ3JLenU1STR6TXRTenUrUzB3ZWg5?=
 =?utf-8?B?Q2NDZmc0dW5rWXp4SmNQVzd6NUN5eGtsRENsajR1dTd2RUxOSFN6M1R1T3Zr?=
 =?utf-8?B?YXVZQ0ZUWUhxcXp2Yzk4MkpyQWNQWWkyb3ZoR0FoY2tiT3d4bDVKallXYjha?=
 =?utf-8?B?eks5dk9BQU5VOXRlcmRLUTlrcGF3TFRvS0V1TVgvazJ6UkRyR2Nqa2Fiek5p?=
 =?utf-8?B?ZUhESkNDQ2VjcmVBQ2poWDNSYVFIRjUrU2NoN3hDOHpYSkptemg5T1FvMUZ6?=
 =?utf-8?B?Nk4yaVF4MUp1UWpaOGVLSXpQaHVxbk1QUGZKUUhoN2tlcUJwdWtKdlZHejlK?=
 =?utf-8?B?Q3FZa09yMzlralBpMWJjTTJ3a1BwNGRKMkw4aXRuUk5VazM4azFzVHBWSWZL?=
 =?utf-8?B?RVljaW5hdm9Uc1Z3MUZsRDFJVEptQ1FrVjhqMDM1WVVEbm5NL29wMC9DS0hW?=
 =?utf-8?B?QVpmUTNOVXhIY1pGMisvdkkxeWF2ckI2VUtycDg2ZWk2ZVJjbE5WbE9DdGxN?=
 =?utf-8?B?VTZtdERpN2dNdFhDbnYxWllxNTdvYU43UEpuczFsdjNUZEdpamJtMWpJYWxr?=
 =?utf-8?B?Wm9ERWxUcStkR2tuc0J3WlgvZlRMbzAzZS9oblBmR2tJUGNKd0I3Rmt3YTAz?=
 =?utf-8?B?STducWZST3JMd1JjUDF2bXpXVkQ5eFZJN3NDVTJXTHhJNjZnK1JLTS91cUg1?=
 =?utf-8?B?OFV5elRGaDBOTXVzQitzRFpURnNWSGtTNmZEaEJWeENwR05UbjNLcG4vMkMy?=
 =?utf-8?B?VDQ4RDNuajkrL3NUM1pIMllKZzdUR2lEZjZuMjdRdnhWVVJTc2FXOW5BaTlj?=
 =?utf-8?B?ZzJ3OWRZMmwzdERMZk1XaStVb0taemNGbTZuakI4YklmbmQwdVlKL0ZKd2ZR?=
 =?utf-8?B?TU43cGdMRmxJWnJKL1JLMmxGS1Z2UitpVFRFS3pMaThyNXVJelN0V0dLcjZa?=
 =?utf-8?Q?mAcHfjJBFMA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6440.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzRBcUFKb3FqYXpCR3R6Z1loRnBhT055TVZUeGNyVVU2S2R6bW9Yak85NUNt?=
 =?utf-8?B?TVpwbTRXeE9KM2ViTmM0cE5mZ2QyVVNGQjU4SDMveldrWG5jZW9pc3poUnRp?=
 =?utf-8?B?bGlqNkZReHl4bi9nYzRQM3RCanRtUXVUcTRzVHBrYk5UZDBhM1Y1WTllT0pv?=
 =?utf-8?B?UWF6LzdpcVNJUlh1K3prRWxSQ1RZQTNDMWRMRzJXQlk4T2txTzZXWUZ1aXFz?=
 =?utf-8?B?a3N0aThraCtEOWNmNFR1ZnNGRm55cWo1NExNS0h3U1ZLZFlGQVN1bDlKNkJ1?=
 =?utf-8?B?aEE0Z1J2c0dmZmhwOVUxNzBmMlRSZ3Y1SENsWU55VFBTT1lmR053eU5MYXJy?=
 =?utf-8?B?bUErQWJVZE4ya0JXTUJmSjd0c2pDTFpoQnRVRmtmbnI0VGNJRGxpWGlNeUpW?=
 =?utf-8?B?U1BRWlBCalpGVno0RTA0clB2UEg3QTJzd216MGl6U1U4b25CU2dHL1UxSGNX?=
 =?utf-8?B?bzRFMG5CdUJhK3NBdCthWSs5NUl1RkE5VEs5TElScTNEcmVtUnA2eE83TVl5?=
 =?utf-8?B?OXNQTkpIWERCbExJUjlWQVBoNDdXc1RnMDJzTk4zQ0tXckMyR3ZUNTNvVTdD?=
 =?utf-8?B?VWlvQkQvdCtLUVkzaUc1Z2R5TWZVR0FjQ0MvR1FkQjVPU0hkTGViMDJVRDh2?=
 =?utf-8?B?L0JLd2xxalNOTXg2Njc5Q012dDFuZXUrcWVkS25UYVRDSjlQa0dQbVlVU0pT?=
 =?utf-8?B?K1djTkM2aFIvanhjcGlDakoxYm1KeU5YU0RxZ3o1dTBUTEZlbmVYelRjQy9O?=
 =?utf-8?B?Vm95VWk0eE5sTHB1N1pZa2lsMC9LekdEYk92ZEJzTUxZYnVlVGNqc0tMWEtB?=
 =?utf-8?B?MGg5KzVNS0pZLzdZckxVeVViTEFXdFpOc2NJaWJINmFDRzl4SXNTaWtaNlgw?=
 =?utf-8?B?WU1DVlFsUUhQYVdGbHE0UVRvMEU1Z0lyOVcrM0RDSk1RdVRReDRNc09qYVRv?=
 =?utf-8?B?emFXVXBKVzJzaXJRN2hKRVBNK3BDNGhaQUhEM2xSeHRjSXUvYzU2M0oxTGk0?=
 =?utf-8?B?ckpTYmpUeHQ0Smx4YVFNWVJrYkVtVUVRaHg5dmFHUHN6bkV3b1FTeUViYklU?=
 =?utf-8?B?SmRhaVNNSk1sdjdFblRHTmdBTExENkt1RUxVNlJnRGMxNkU3Ky9CRkNSYklz?=
 =?utf-8?B?QUMyNlZ3S1MwbTlLdWVOVXRtSTkrWk9XaStvK3NCdWZiQzdHSHRBNHoxbC9Q?=
 =?utf-8?B?TjZEVFhGdml2eVRZc01ydkUvTy9yLytpZHBhK2swQzlqSE92dEp5eHFxUWVy?=
 =?utf-8?B?OHE0WHVhYnp0L3RERHYwSEJVaTRUWExBRXFzK25xamRqY1hoN0M1MU9mNDFP?=
 =?utf-8?B?cjU1ZkRLZk9hRXBjbVV3V1NLZlA2WjRsYzUzS25QZzdha0ZlbUJlTmJjdXJ3?=
 =?utf-8?B?cUZka0FpSWZObUIwdU5OVlp5THlRY21DSnBTQy9nZVNjejdGSWU0OEx3SkVi?=
 =?utf-8?B?TXRJUTdGSUtxbzErK1FzNmNpaTlPWnh2TE11ZFJxeUVzcjRXeWt6MlQvalVB?=
 =?utf-8?B?UG5PYTJzMDRvUVhwdkxkeVhiTnlzUWNnR2xPV0ZSMVZuR2s3Vy8zcmRESGlJ?=
 =?utf-8?B?cDFqT1NaQ3VxWXBRYWVzSGt0K0gyRjFmN1dOZ1c4NXBkMXU1NWV3NHdjcmZP?=
 =?utf-8?B?U0c5WWVLRko0VlIxcWNuMFNXeXhHVGkrbVcvQlRFK2o3Smkxa0JHVDFoQlhF?=
 =?utf-8?B?cXdpN3Arc1JHLysyR2M0SlpzbTZ2VmU4eHg0bTlNSExSNUIrMFJiR2c2VWpH?=
 =?utf-8?B?NnZ4amRoenMvdEZUS0pkSWVFbi9ZcHFtbkNKOFdVRU9RNitGeDF1c3V3Ry9l?=
 =?utf-8?B?bVRyd0NDRWIrajJjTmhpS2FtcDlGcUZuWFJKUzVRQnltSnNFR3FJYXQva3Bx?=
 =?utf-8?B?aVFvR3J2bGd6akU4K0pXdElQMi9EZ2hobnJiQ0lOOGFCTFNIVzhJd3l0ejdF?=
 =?utf-8?B?a2NiSXBRL0hweENSWlp1cUl5Z2lzUmRlQUV4QWVTek56TWFVL2NEKytndWQ0?=
 =?utf-8?B?ZlVrbWo0RE1TSnFIcFpiTjF1T0kwemtCK1RFK3hkejN4bElUa0FCZCtTM1lC?=
 =?utf-8?B?aGxxU1BUQmdCRkl0c0JWditneXZiTHB1WlNxUnl3WkxVamFhWW4wMTE4R3Bt?=
 =?utf-8?Q?LLWPUqXwHqvwsB5XqG1h1YFUD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a87765-9e9b-4e0f-ac5b-08dda24d5d88
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6440.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 03:18:52.8264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WxPegKd3m5RLL4TMJrB7yrAjA/sbYyuorpnvtCRSl0ctv8ZTkYSd0aVyT+s5lRweF/jOteuH0A3YuE8KU4xq6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5726

Hi Ilpo,

On 5/31/2025 1:14 AM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Fri, 30 May 2025, Pratap Nirujogi wrote:
> 
>> Check if the adapter name is already set in the driver prior
>> to initializing with generic name in i2c_dw_probe_master().
>>
>> Fixes: 90b85567e457 ("platform/x86: Add AMD ISP platform config for OV05C10")
>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>> Link: https://lore.kernel.org/all/04577a46-9add-420c-b181-29bad582026d@infradead.org
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>> ---
>>   drivers/i2c/busses/i2c-designware-master.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
>> index c5394229b77f..ab03943d6aaf 100644
>> --- a/drivers/i2c/busses/i2c-designware-master.c
>> +++ b/drivers/i2c/busses/i2c-designware-master.c
>> @@ -1042,8 +1042,9 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
>>        if (ret)
>>                return ret;
>>
>> -     snprintf(adap->name, sizeof(adap->name),
>> -              "Synopsys DesignWare I2C adapter");
>> +     if (!adap->name[0])
>> +             snprintf(adap->name, sizeof(adap->name),
>> +                      "Synopsys DesignWare I2C adapter");
> 
> I'd convert this to scnprintf() here as well and add to the changelog:
> 
> While at it, convert to scnprintf() that is preferred over snprintf().
> 
> As with the other patch, this too is missing receipients (as indicated
> by the get_maintainers script).
> 
Thank you, I will use scnprintf() inplace of snprintf() in v2 and will 
make sure to include all the intended receipients while sending the patch.

Thanks,
Pratap
> --
>   i.
> 


