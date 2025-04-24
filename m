Return-Path: <linux-next+bounces-6373-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F42A9A018
	for <lists+linux-next@lfdr.de>; Thu, 24 Apr 2025 06:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 840011943837
	for <lists+linux-next@lfdr.de>; Thu, 24 Apr 2025 04:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871991891AA;
	Thu, 24 Apr 2025 04:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lJPG4IZo"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2066.outbound.protection.outlook.com [40.107.100.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E00A4414;
	Thu, 24 Apr 2025 04:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745469051; cv=fail; b=MNxFeNhViF/vUknqEu8StO4Sv4eYaJaRaeIHb0DubJAmVbK6xg1+QId4mISjEiTZY/UpGe1DkXAzUcV/ujJbtWQxXW7sUU4SsEGao3+3xCW1d3hIVYwYhp3Nbm/sVpT+chU+57v8kfE/yNxZxtmwq/nhOlnLO9EidZPeSBlgNhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745469051; c=relaxed/simple;
	bh=y/NJBn3T8tuHcf0J4it0P0ZHxOavrB+bB+bjFA+YV1c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cvb0Amelc8603I1yIDpGdqw5aXp976AKY4iMe9ilm65SO1+gl7orndL8zSKXAd+P6fx91nuzqxQxPEdksC2cv5h8ThzIHOQWpwUUZTDIj1Fai4wsMOcjeeBaqv9tgGaN2AItAz1EGqJvkEPV8VcDkQ9D2PFPz4HD7WO/Rbz0jtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lJPG4IZo; arc=fail smtp.client-ip=40.107.100.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7wu8N9otdFwHIzAWOAXLjqT/1UlGQ9i04ubUWf0P8rwO5KIvaMX2U98iXw2GNNtq5Yb/9Mhr1rN3nXYSpR7Lo1Siw7f8pWiXMU5BpPvBK3Yyd3kPX48Zk5CeukR/tfqn2qOeOQCCI5Utj2ctgw8ugazjDXJCpOh/ijzJu68RAUtf7iRqsUQCjxTcEhk0xqLSSoGAta1fV2Z64Cq9l3fDtth5/R/X4TuZev8ecTRJG3QAD7RxLYsYoUsdO1RGfZAY8yMSQqMU5jaT3VsitCwgiggi7jNe/MC7rFgYaAVzreQGyqb55/D4soLxkIzZUU4/Mu+1v9JafDLv8fgt/gIww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1Mk1B2BLZ8y7Fb6toJR0WNcPMhxoGq7/b6BQ3ESKZE=;
 b=F4pY8H0fQCNokFvZj/ESDnbcUYek00OP6gJ2c4HN+P3tfdkgUjlLxLr6ANuhzt2zb+jD6LCOuLIR5SaZszV2zp+5uJyT8SI3Cap6xn9WhHHF0YznUNesGw0+qerEcMjcTg+f2oxRNFFFK+eKtQfruBx0gqgfLdmdUer1beHQ7rgt6CwzlfOp2OEx+e/+XOEkDmVOBJIsvL+hPuExx/zua6/pLl/Ply6cVWC15rBQG1g2pUII0RVio8X8BMJUPNZ3/B5f5swqdp68ojTH8tFHhns0SEpHC0SeSA+lObcb8SDIQUkcWfmdclQJQd/rTtbCweB0MM4jpMRW9IbMSQ59lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1Mk1B2BLZ8y7Fb6toJR0WNcPMhxoGq7/b6BQ3ESKZE=;
 b=lJPG4IZoJy34az98MO/nnPpvsX59YbYZuQHP5BfWUFoUyD6hgnajw8fEDq3dG0pGWSTT5RaHHr/BXtvwZMyZgonNjg+/Vvjzn2Nd9FEwjIJ9BubKX33kGmNVkuZ9xtDwCwsOPtie+ZnJxeqfCY65jVOhwQrUWM02NWN1mgcegNM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13)
 by DM4PR12MB7695.namprd12.prod.outlook.com (2603:10b6:8:101::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.37; Thu, 24 Apr
 2025 04:30:43 +0000
Received: from IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf]) by IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf%4]) with mapi id 15.20.8655.033; Thu, 24 Apr 2025
 04:30:43 +0000
Message-ID: <5dbe2246-fb9d-4bc8-82a2-8cbffa913b6e@amd.com>
Date: Thu, 24 Apr 2025 10:00:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: commit dd4cf8c9e1f4 leads to failed boot
To: paulmck@kernel.org, Bert Karwatzki <spasswolf@web.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Mateusz Guzik <mjguzik@gmail.com>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-kernel@vger.kernel.org,
 Linux-Next Mailing List <linux-next@vger.kernel.org>
References: <20250423115409.3425-1-spasswolf@web.de>
 <647b9aa4-f46e-4009-a223-78bfc6cc6768@amd.com>
 <fa8dd394-45c1-48d3-881c-5f3d5422df39@paulmck-laptop>
 <5a4a3d0d-a2e1-4fd3-acd2-3ae12a2ac7b0@amd.com>
 <82ff38fc-b295-472c-bde5-bd96f0d144fb@paulmck-laptop>
 <1509f29e04b3d1ac899981e0adaad98bbc0ee61a.camel@web.de>
 <8ded350c-fc05-4bc2-aff2-33b440f6e2d6@paulmck-laptop>
Content-Language: en-US
From: "Aithal, Srikanth" <sraithal@amd.com>
In-Reply-To: <8ded350c-fc05-4bc2-aff2-33b440f6e2d6@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0110.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2ad::11) To IA1PR12MB6460.namprd12.prod.outlook.com
 (2603:10b6:208:3a8::13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6460:EE_|DM4PR12MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: 416ee452-60f9-4d6d-d87c-08dd82e8c617
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnVpR3JNLzU3OTV1TE5MVUhqZEw5ZGRxVHBPOGJzZDBGbTRQa1lpZ0FkTmRV?=
 =?utf-8?B?VER3NUFmTDdSODVHenJiLzRoUll1QjRHYTJFQjcwcEQvd21qcVRrRVU2a3d0?=
 =?utf-8?B?d0VucHM2d1hVWGN1Nk8zQWFhYldvODJlYzliR25RYm0vTUNObzZZd2NWMWJu?=
 =?utf-8?B?MUpsMVo1eXlQcHJXcFFBWC8weFJZSUVpL2NEeWhBQUF5a3BCSFRhK0lTYS9w?=
 =?utf-8?B?ZnM3RTdkTDJHcXlYUTR4QWF0d2FmOTdKL0pvWG5TNlNKRjlQaVdLakJPSWxH?=
 =?utf-8?B?MXhmbHMyMzNkcFI3a3ROenJPYjR2cXFlQldHcTFIVHRMMkFsczU4d2RLUnJj?=
 =?utf-8?B?WXVyUzMwVnRLWStqMlhtaVRQWWdLdGlva0hqRGl2eml3TlJCR3dJTFVTTTAx?=
 =?utf-8?B?ejZtWWRKdG1CZ2dLNjJQdGlMS1FzUjdLc3U5b3liT1AwUlVLMVBPVTc0bkNz?=
 =?utf-8?B?WGl1dGVzUy9YSDF6UnlJbmh4d0hwVVhMZXBrandsRXlIbGoxQnYzTXNZaWVq?=
 =?utf-8?B?TDlBS1ZiLzRoTHV5UVorei95VEJrWW10VlIydlVmYUxqZWpvazM1WGc0UlNX?=
 =?utf-8?B?THJqMXh1cng1eTUyKzBjeGtjcTNmT095REN6TUd0Zk5xUHJ3NFVQTmlLaktl?=
 =?utf-8?B?UmtzSE5YOVNYMXV4anhMbW5oMTN3ZGZVR2FxYjVScXVteTBDR2NIeWtGVmFy?=
 =?utf-8?B?bEQwY0RFdzYwbVEzZHZSVDhKMmlveXJWSS9qclIxTlBKZTNrazRiYU03SHUw?=
 =?utf-8?B?SzA4SkdGUE9pNmlaMnBQVEFoc0FFUnVpNHZTeTBKcEIrUzJXenY5d1oxMGMx?=
 =?utf-8?B?cktkWUFwcjJUN2ZvWmxuTUs0QTFDOUc4TGdQUnN2RVBzN2trck55Z1kwRWdn?=
 =?utf-8?B?b1c3bXJ6aFZHUW1PYzFOYnNxUDNwQjdaanZQNFpZNmZ4RVRocWdhazZLTjVv?=
 =?utf-8?B?TzlCMHZBTksyMlF5U2dsVllNcTVFTHRpWklqb1hodlg0cnB0WWF4a01uc2Fz?=
 =?utf-8?B?YmpQT29jVTdVT1A5S3ZKQWJuaENkMUZtdmEyY2QvYlM4Nm1TSUVxazladGpm?=
 =?utf-8?B?VThkOVlzSnlzRVpSSkpJbE1tdldrbnJrc2E4VXJJckd1dDBSWUpseGx5ZmVB?=
 =?utf-8?B?VWh3MWFJbmY5VEt6WGtIYVJhenBocTNEZHFOc0lSMytieTZYMEo2WmthZ1lR?=
 =?utf-8?B?eWxsSHRXdFA3VE5wbVExZ3R0TzhKOXRKU2R2bTZIRFdmNXVRcGRab1ZuTzNt?=
 =?utf-8?B?Sk5HcWpvK1V4MG11ZWQxbWpEcTV5aFRyOWw3Y2dBVXN2QlZnSjRucHlXYXFD?=
 =?utf-8?B?QTJWMHVIUXRJcHlwcHduNDltczhXS3lEQXFpZkt0RXZqN3lEbm9nbzdXSzRK?=
 =?utf-8?B?aGRnNGNRZXRzMHNQVDc3ZGFLb3UvdFJUNnBMUi9RQVJVTk5aNlk2YmVDdndN?=
 =?utf-8?B?bXNUWFNpVDhobnlpOHlIMFNXejlSUWlJeEpyeGxWVno0L1pIZVgrVnVad3Rt?=
 =?utf-8?B?VDhmNjNWaHJTVHNScjREVXByTHBCYktaRHBMR1VwMXRybk5acjNUbVI3bWdy?=
 =?utf-8?B?UTNMYXNQMWgxUlQvdStGVnc4VkxmUktuLzBnVjBwN3FhRktoK3ZCZS83cWIw?=
 =?utf-8?B?ZVYvRVgwK3Y0OXMxVndicEdtanh0VFBaV0I0eVR0U2t0Q3B5bkVvVC94Umtj?=
 =?utf-8?B?SkI0Z09FcUtNRjh0VUhZbXZoQUxxajd5cUNObVBTdDl1Zlp2aEMwcmx1QlFz?=
 =?utf-8?B?QXVuc1BGYlhIUWY4K3B3Y3FHMTViZUJia2VCbWhLMG5DWFZvTytZcGtvc1E1?=
 =?utf-8?B?bHhRS0hmTFBzQ0swSTJUSzFmaFBySkh5NU91MGlrWE1wYndrbGZRaHg4UE5M?=
 =?utf-8?B?TUkweHJhY29oS0cwS1p6LzdYSzN6MndBRmRJU2Y5TnJtQ3dWLzNZeDZYVjZq?=
 =?utf-8?Q?lgFXGRJnGlM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6460.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWhXZjhBNXJHeitQa0ZNNlVqdVJWaGJIZStwbU1XbHNjMm5FemUyM0s1R3Zz?=
 =?utf-8?B?Qi9BVDZpWTlNem5Fakd6Mkh0MUZUMk5hRm5DUzBhcURXTXBzbXhGRHlvNkZa?=
 =?utf-8?B?QzMrc3B1SGVpSWRTdEdaTU5sODdmdUJIM3NjY3c3VHlhTmx5cGxKc3E3YjMw?=
 =?utf-8?B?cW9Na28vc0p6SURsTWVtaVhvb3U5N0RwMlYwdEdpcnlrMVFTaWFSM3ZmRVY3?=
 =?utf-8?B?ei85SEdkRDNDekJVWWU1VXhISEVkM2x5dDdxMWh0VlcxdHZXcENwZitlY3hD?=
 =?utf-8?B?bndndEpQdUZNdWxqb3Q5V241MXdNa0dRUktuUnkvMVhxbHNUMzMwNmkzK0M5?=
 =?utf-8?B?ck8xTlZYSS9TRUlxOWlBUUxYcGR6Znoybm9kbmFUWFEzL2Q2bkZYU1hNamhI?=
 =?utf-8?B?OXpjTmxWMFcrWjByM1B0ODFwc2RDNXBsQjl0VTRGelNjYk81Q1JBNU9qS2p3?=
 =?utf-8?B?RkwyLzk3T2o2VXhBUTVaY0NIRkFRK20wMzhNMkVZQWFUa05EOWJ4bWtsbFN3?=
 =?utf-8?B?ck9BYVluVFpSN0dIa3dFYmNwNEF3ekZyd05CbGUxS0ZrcDRTYmJ1ZmFjd0pU?=
 =?utf-8?B?bnM3dnpYUCs5YW8xenpHVHMvQ0pxQnpQK3F1Q05QZ1J6V2ZPSitqNHpoU1FL?=
 =?utf-8?B?NWcwV215YzFLMk9WaU5EMTZuSmZ3SC9pV1YxbUJsN1c0UjhBd2t0ejR5MExZ?=
 =?utf-8?B?MHRjY2FrVXpwUmdMbklWRGo5Mks5ZHBOOW4zRDRhZ3RVZVU3Mlh0M0x2algz?=
 =?utf-8?B?VlNkMWRhZFN3QkZ0N3h2SVBEcVBsWThUN2wrc2puV0NZaFkyTjc4c1Vza1ND?=
 =?utf-8?B?SU5nY0pPMm1yd29WM1dUTmllWFJJVTZDZmNSam5QYXhFYXBOcFM0UmZ1K29n?=
 =?utf-8?B?bVE2eUJWdjNOZEF4WW1aeVJOQzFlVUdYQUVDRThHMzhsYUVCbVpkTjE1Ymtw?=
 =?utf-8?B?a2VtcGgxY2syQVRPSklPK3FzTEZWUzI3OHR2RDRYajZqWHV0MXA4dzlqR1lu?=
 =?utf-8?B?UllRa0ljSEJQRWNGS0hTNU5tVVdqSElyT1EyaGFjRHJ3YjdwOUc0VDNxaHMz?=
 =?utf-8?B?WWRHN3ptS2haZkp3enBEbk1MUEJqaEp2MFNuSHBpRnJibjVuZGtjY2pxVE1K?=
 =?utf-8?B?TTBLeTFyY1paOWJ4ZGtJeEdSQlNFcC9XdGhOWWNQM1ZhMEV0Rjh4bkZMYWVW?=
 =?utf-8?B?ODJPWHpOQ25kNk1mRW44enZMSW0rQWZxc2xJR3FySEhZRmJJS2hMai9uOXpH?=
 =?utf-8?B?eDllUHFZWjNaMHN4aHYzc0psSVY2VGZpZkdTbmtyTEFkc0svcllxSEt5NUc5?=
 =?utf-8?B?SmpndU9Va0c2UFZxanRoTVF2RGZtVzFxUjgyaktYVmtBWHZHZmpEMERIdHFu?=
 =?utf-8?B?YklIY0diQ1ViYkMyZk5OUjhPNHljempBeTU2M0U2RDNkajRPcDRrYW4yZ2JJ?=
 =?utf-8?B?RTdqQXFWU2dzYTJpUkROUzZDS2cwRktGRkRHdWZZWnU2ZVFhZnpBVEJqd3Bw?=
 =?utf-8?B?ajl4K1p2QUQzKzNlZGtvN1ZLYW91M1dDdVptUk1xTHBNdW1OZjg2TnYxa1JH?=
 =?utf-8?B?V1R2UGR3UEwrZmlzYlcrbXFvOFhXdFRaSEVMejFjRTNrZU94WWFkS0Z0dmY2?=
 =?utf-8?B?NEpMTUxNT3pROUJ3aGwyZXZtSTNTWVFvSlVlejFJWVErcTRDb3hjQ09yZjJy?=
 =?utf-8?B?VDIyZEFZYXdoMzU1dUh0ZjRnL05rTUFNdWY4MlhWK1RXS1IxSzNoZ2JZYm9C?=
 =?utf-8?B?MjErWktsQUxQalZZcFRqeGJaVkkxajJUSDgzbTZjRDkweWMxdEFxYUVXNEg2?=
 =?utf-8?B?SWhKbi9WbXlPUFRxaG45L1BVSE5HSjczQm9id2RGRE5Xb3R1L2wrcjNLSmUr?=
 =?utf-8?B?OE5USlljdnFxS0cvazNEZWthUjIyKzhPSlcycndIL05DZUNXVUhyS1ZPOUVQ?=
 =?utf-8?B?OWVpQnpCS0dDaFQ1NlVIazRjTno1WVlzQkx4VjJaK3VuQ1IxdTNwc1Zsb09o?=
 =?utf-8?B?UVRhVmhBNTc5NlRaT21Gb1VNQmdkLzMvdlpPVDY4SzA1QnJ2WklGb0c0Q2NZ?=
 =?utf-8?B?aEtVWStvK0dlYW5EYmFGTUpRUzFxN1IrWGl0THFHeDhJQmRLYWZqKzczR1hD?=
 =?utf-8?Q?tSiYOhdCfK0PS2fxRzf31EV/N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 416ee452-60f9-4d6d-d87c-08dd82e8c617
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6460.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 04:30:42.7357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pi5QCyuQtcZv92WOGNIS4vaavpotQqca57oBYFKV4u0lDqaruaVVfCwIA8wGv8YySV2GSfavu1nMS6BEng81xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7695

On 4/24/2025 1:26 AM, Paul E. McKenney wrote:
> On Wed, Apr 23, 2025 at 09:19:56PM +0200, Bert Karwatzki wrote:
>> Am Mittwoch, dem 23.04.2025 um 11:07 -0700 schrieb Paul E. McKenney:
>>> On Wed, Apr 23, 2025 at 08:49:08PM +0530, Aithal, Srikanth wrote:
>>>> On 4/23/2025 7:48 PM, Paul E. McKenney wrote:
>>>>> On Wed, Apr 23, 2025 at 07:09:42PM +0530, Aithal, Srikanth wrote:
>>>>>> On 4/23/2025 5:24 PM, Bert Karwatzki wrote:
>>>>>>> Since linux next-20250422 booting fails on my MSI Alpha 15 Laptop runnning
>>>>>>> debian sid. When booting kernel message appear on screen but no messages from
>>>>>>> init (systemd). There are also no logs written even thought emergency sync
>>>>>>> via magic sysrq works (a message is printed on screen), presumably because
>>>>>>> / is not mounted. I bisected this (from 6.15-rc3 to next-20250422) and found
>>>>>>> commit dd4cf8c9e1f4 as the first bad commit.
>>>>>>> Reverting commit dd4cf8c9e1f4 in next-20250422 fixes the issue.
>>>>>>
>>>>>>
>>>>>> Hello,
>>>>>>
>>>>>> On AMD platform as well boot failed starting next-20250422, bisecting the
>>>>>> issue led me to same commit dd4cf8c9e1f4. I have attached kernel config and
>>>>>> logs.
>>>>>
>>>>> Thank you all for the bisection and the report!
>>>>>
>>>>> Please check out the predecessor of commit dd4cf8c9e1f4 ("ratelimit:
>>>>> Force re-initialization when rate-limiting re-enabled"):
>>>>>
>>>>> 13fa70e052dd ("ratelimit: Allow zero ->burst to disable ratelimiting")
>>>>>
>>>>> Then please apply the patch shown below, and let me know what happens?
>>>>> (Yes, I should have split that commit up...)
>>>>>
>>>>> 							Thanx, Paul
>>>>>
>>>>> ------------------------------------------------------------------------
>>>>>
>>>>> diff --git a/lib/ratelimit.c b/lib/ratelimit.c
>>>>> index 04f16b8e24575..13ed636642270 100644
>>>>> --- a/lib/ratelimit.c
>>>>> +++ b/lib/ratelimit.c
>>>>> @@ -35,7 +35,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
>>>>>    	unsigned long flags;
>>>>>    	int ret;
>>>>> -	if (!interval || !burst)
>>>>> +	if (interval <= 0 || burst <= 0)
>>>>>    		return 1;
>>>>>    	/*
>>>>
>>>>
>>>> I applied above patch on top of 13fa70e052dd ("ratelimit: Allow zero ->burst
>>>> to disable ratelimiting") [linux-20250423]. This is fixing the boot issue.
>>>>
>>>> Tested-by: Srikanth Aithal <sraithal@amd.com>
>>>
>>> Thank you both, and to Bert for intuiting the correct -next commit!
>>>
>>> Could you please try the next increment, which is this patch, again
>>> on top of 24ff89c63355 ("ratelimit: Allow zero ->burst to > disable
>>> ratelimiting")?
>>>
>>> In the meantime, I will expose the version you two just tested to
>>> -next.
>>>
>>> 							Thanx, Paul
>>>
>>> ------------------------------------------------------------------------
>>>
>>> diff --git a/lib/ratelimit.c b/lib/ratelimit.c
>>> index 04f16b8e24575..8f6c54f719ef2 100644
>>> --- a/lib/ratelimit.c
>>> +++ b/lib/ratelimit.c
>>> @@ -35,8 +35,10 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
>>>   	unsigned long flags;
>>>   	int ret;
>>>   
>>> -	if (!interval || !burst)
>>> +	if (interval <= 0 || burst <= 0) {
>>> +		ret = burst > 0;
>>>   		return 1;
>>> +	}
>>>   
>>>   	/*
>>>   	 * If we contend on this state's lock then just check if
>>
>> If you set "ret = burst > 0", but "return 1" this will make no difference
>> (except in the case of a major compiler bug, probably), as I wrote in my other
>> email which overlapped yours, this fixes the issue in next-20250422:
>>
>> diff --git a/lib/ratelimit.c b/lib/ratelimit.c
>> index b5c727e976d2..fc28f6cf8269 100644
>> --- a/lib/ratelimit.c
>> +++ b/lib/ratelimit.c
>> @@ -40,7 +40,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
>>           * interval says never limit.
>>           */
>>          if (interval <= 0 || burst <= 0) {
>> -               ret = burst > 0;
>> +               ret = 1;
>>                  if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) ||
>>                      !raw_spin_trylock_irqsave(&rs->lock, flags))
>>                          return ret;
> 
> You are quite right, your patch does fix the issue that you three say.
> Unfortunately, it prevents someone from completely suppressing output
> by setting burst to zero.  Could you please try the patch below?
> 
> 							Thanx, Paul


I have tested the below patch on top of 13fa70e052dd ("ratelimit: Allow 
zero ->burst to disable ratelimiting") [linux-20250423].
This is fixing the boot issue. Thanks again!

Tested-by: Srikanth Aithal <sraithal@amd.com>


> 
> ------------------------------------------------------------------------
> 
> diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> index 04f16b8e24575..d6531e5c6ec4e 100644
> --- a/lib/ratelimit.c
> +++ b/lib/ratelimit.c
> @@ -35,8 +35,8 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
>   	unsigned long flags;
>   	int ret;
>   
> -	if (!interval || !burst)
> -		return 1;
> +	if (interval <= 0 || burst <= 0)
> +		return interval == 0 || burst > 0;
>   
>   	/*
>   	 * If we contend on this state's lock then just check if


