Return-Path: <linux-next+bounces-7229-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68762AE642F
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 14:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BFC54A3740
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 12:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC709280004;
	Tue, 24 Jun 2025 12:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GFkAlEQN"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2045.outbound.protection.outlook.com [40.107.95.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E10627A931;
	Tue, 24 Jun 2025 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750766640; cv=fail; b=XLmHE0kGIo9lj+9ZG3ZIYG0L+s4wT/eo9CBCB6ObXlQY7f7m7jjp9QXRG3IVMQZjjv8H7mrtkS0IkjizibwE/t0npo952bpopTgT2IntxcSyxvrAHM1cocuFOb8RkvDwhfWSj0B7JaynO2bc8qZKFwB2du0LCSWMXToXqnlq69M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750766640; c=relaxed/simple;
	bh=NK8I1l2Ri4NdH+qHL0XJEKBXgxW/zPaNeyke8t9XYP0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=AdWZKr212+oFfcfLYNvlZjwa1/L/D0sHP22kFPC2rQWHb5SIvpLWkREbFrbous4pkFQL2qoGmUOpmP5UxWDKyTO9BC1sWG7NkFcpJ8wkXzfHm1iYbvk+cQZITRnOi2ZTRNpz82QpetEha8JRMOA6fkvouMGBmh3RjNJAmzM14uM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GFkAlEQN; arc=fail smtp.client-ip=40.107.95.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOYQGrKeok31pC8Ko6cRd8wV4uvp6ChYcNxb924/6xMRpKDyLcLy0Ho5Y9MhagUeuUl0tymXi1GHE5ju8ZEGjBsMAye5SaSY1aD0BJZfSUYE6lmT5XIkDGiGUitVmMjBXrPPiLn1cQFN9G22Rv4zvgLAzCF5p0ofy3G9OQ+nqdAUxdwZI/DXSrkhG5QtL7A1DeyMzDhsF8Q/DQAJq5uxKKJaVvFhNP87dDLvi/2NH2NHaUL9Q/m0vIm8p+qhxS3HKqcs00jmSGvuuo3OStuGOXRXuCcL3tORl5ZTmxyzcLeCOjX0npF0kxLEyWcuhLHug2Frm/Vea/uVEQ59itKdfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdoOlRIX+2iwVqDLp5uMr/u2jv7iASewh3PwUZAax3Q=;
 b=Xwz2gJMegAND6wgwRT/2R+CBojvuaUmdYae52xLOicLPP9VT1vrbOCsXFJwaYgnnVIUs+Z2k9ntdP2an/BPcq7EruQZDOOhE6CosRveRukj3cJiDMzAltbscddoS0Fxpxmdn2J3XSvWOZvKPgeSf+kwgNfbCOBcsjVDY5jO+2e/tp69jekIVhxdZyB3vI8qLXSXpJPK83hp0x3ABYI8LqZoinzBlLXBtfql7fW6LkjDaxFng9NmKT/fWA8A0SKYOqBR6zSbPVLvwLhZj1e0qnXMoT+9Asx0VHVc0cgrSYnoY73QdQa6OV4hY1bE2Y5piIuIOIWMtD4Au15f8BpM85Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdoOlRIX+2iwVqDLp5uMr/u2jv7iASewh3PwUZAax3Q=;
 b=GFkAlEQNNNn0KytIyOI3Qayyt8yAB6fcRaVUnS6Y9S78XbwMNlvBzQxLZUlixB13zDqRSJXNEzf/oXiF22eCjc9INhD2NWRf18Kl0nJcNtdy2WR/UsT1KDw+xQE1CQyBI0+Y+3s2ZJ8sfCg+ZTCgnPUcrEv67mQMaLD1+1lM0g64eMMBuCYv5fjJNTVa2J0abB82E4BLGWcfghxm9MdkzICcU8GC03m9rsr3ihNdwGNqDyyZ07XE1wV730BemZnabK9zuS3LHobR5xVI+uxCfnZ9OC57oXijOrOtUxR/jKJVcfU2nMBkzN25Zbd5wlgSFuiq5PXDr9jxK0OMt4+alA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6410.namprd12.prod.outlook.com (2603:10b6:208:38a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 12:03:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 12:03:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 21:03:48 +0900
Message-Id: <DAUQZ1TY9VT3.UJEFQ96157DJ@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rust-timekeeping tree with the
 drm-nova tree
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Stephen Rothwell"
 <sfr@canb.auug.org.au>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <iuo4BpdTglZkpW9Xyy1ehjFspmj3ay0q7iejyeOShBG0HLZmIrhzIpi0eG_wBv71ZPPCgh2lcn2BOsrFHOegfg==@protonmail.internalid> <20250624195142.1050e147@canb.auug.org.au> <87ecv94ay9.fsf@kernel.org>
In-Reply-To: <87ecv94ay9.fsf@kernel.org>
X-ClientProxiedBy: OS7PR01CA0191.jpnprd01.prod.outlook.com
 (2603:1096:604:250::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6410:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e014f37-445b-484e-d9d8-08ddb3173051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmU2T0hvVDBUdzJyTFNQUDFJUndJaWtoUldvazVHdDVSRjY5QzhpUkRwazZ6?=
 =?utf-8?B?ck1nakdDTHQ0ZUJzc2NBdzZuTmt0WDdoaHpQZUh3ZlY1cXBiUDQzbWRzSUJ5?=
 =?utf-8?B?UHB1N2t3azB5MlJPVi9hbUdyeXpYTTNONy9BWHdWL1ZmbnA5bDNCSXR3M3Z4?=
 =?utf-8?B?N2pXNlJXNWRaTFR2NUczdVd2SThxYytkcTRYTGNwb3d3RjF4UGZvY01YWGZ0?=
 =?utf-8?B?S2cwNGcyR3Bqc20reFJQclRGeFprTlcxcFcyaGF1ek1aQ0lVelE4NUQ3Y0VD?=
 =?utf-8?B?Ynd6a2tXZFdkTDVwSHlzOElFKzJjYkd2aUlFcXBDdGhyUUp6ODlYdUlhQ3k4?=
 =?utf-8?B?Y2ZIRzI0V0xOM3d3cS9hc3ZBTm05RVNldlZFVEFoQ1VYUUVIS1JtYy9ocmxl?=
 =?utf-8?B?c0xhL1FPMVQyV05HWU81WXF1S1JpOC9Pak1pdWhBTlJPaUUxaEM3NWFXb0dv?=
 =?utf-8?B?NFN2VXJDWTVqYnNDMHJjVURhUHVIVG12N09OT1NCVWZ5ajU3L3lrY3QyOTVP?=
 =?utf-8?B?NzJqSUtCUmVSQnlkVzZNc3lyc2wrTzdaeGQ5a1JYSXIxNXIvcmFCcXV4QThr?=
 =?utf-8?B?MUppLzMrV21TM3JYekxDdVU4UVZ1aVc5KytmNlpoblBIRHhQdHI0WGZtOFhL?=
 =?utf-8?B?MFV5WitQb2ZXdnp1bjBQQ1J6U3hPY3Y4VmRFZUN1cW93TlpiMVhYV2xMSklp?=
 =?utf-8?B?Vk1scFpZS3hyTXEzYXU1Y1dBZGNxSUZGNTZoSlN5SzY0UTJ6VkdmMEFCVzhn?=
 =?utf-8?B?bzJPNHYzcnJnOXpzbDJYNjhETWJnVmxWY3FjYmVpVG9BWGwvQzJBZVZuVE8z?=
 =?utf-8?B?SUR4OVhkVWRSN05LeGliNk1yMW5mMFVtK0E4WmRnUG5yQlJpR1VobHlQcmMy?=
 =?utf-8?B?WTh3VnA5UlZxamdsQ3loWittK0UwcE1wRXJpNXgzZTN3VGdnbzJaT2NFZ2d6?=
 =?utf-8?B?bytneENiU2RzdGFNMWNKcStlLzBOQUIzZXhYRVdsTU9LMCtuMkVESkF5eUFp?=
 =?utf-8?B?QzdUL1RnQjArd3QvMk8xV0g4UnRYbkttUHdHeGdlQ0Y1dmg3eWllbERnQ2U1?=
 =?utf-8?B?SUFxZmFiSmJsWDByNEw5RklkR3pNZkZmeGRHc1Q1Y3JqQWg2ZVVnWlVydUxT?=
 =?utf-8?B?eGNmS3hYdzA3TStJTE13ZStJWDNlRGMzODcrM1M4MGRHMWFKbmNSUGJFVE9z?=
 =?utf-8?B?cWtCR0JEZVZUbE5FMXlpSjRjQW12UzNPUmFvYXNKeUNNVEVCR1hXVG1QVmV4?=
 =?utf-8?B?cVR1OFBRempBclhmODlLQWR0T2hDKzJ4dnVPcGJHMjJEeGVXb0tNbFZVUnVW?=
 =?utf-8?B?V2twa3dFU0RZM1h2emk2bUJqT3RISTliK1Q5YVhmQjZQemE2T3RJL3JBbmdt?=
 =?utf-8?B?R3MxcDVWVi80UEhrUVpFeGdaaWpyLzFIa3gxYVdPWTl2dzZEN2pmejUreW8r?=
 =?utf-8?B?SnQyajRKSHZkZmpLeWlVOE5SVnV4bDEvY2JHdDNTdHpLYUxOWVZPOFRCZmt0?=
 =?utf-8?B?S0NoY1RqODJsMlozdW5jaUZ4eEZqendXSmhEVW9TWnkrY0FORjZlUUpvUFMx?=
 =?utf-8?B?QWhJY0ZQbTdLai9yVFF3Y00wMmRDNXRtYzZQVmpDYUh1NzJwUTYzOE9ydHlv?=
 =?utf-8?B?L2x2SUhNUUkzWFpyUk01SGVicWFZV1pRSUMzYURVSE5PeDVzWHQyWUprdEU0?=
 =?utf-8?B?cTVQekRJeGpIOEJCcjJ4U3dsK0tSWHBnR3JESDNnOURwcXN2WlpXdG9IZmV5?=
 =?utf-8?B?d09tdlRJU1pIYy95UlVoTnFQTTFkTWFnYVZhV1N0RGNBMDhSOWFHVGx4S0dx?=
 =?utf-8?B?SmJSb2hOTTFLSmt6SFlRK0JkQ1JJdndTR1pJUFRESXJuSFEreVIyZW1RY3Yv?=
 =?utf-8?B?MEEvNFFkNU9hSFE5YXNlYzB2SldmL0xYclNiNndFSFRaNmlXQWZjVllkby9j?=
 =?utf-8?Q?nPyFVUNUxfU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFdnZ2VBTW1hQnJoZlRBMXJhQ05GcDIwS1hIakJWQXZrTWtEV1ZCRDZzN0tU?=
 =?utf-8?B?UTNiOUJlTDlYM294SWoxeVlTMjJNRVRZWmQyNGZFMGYrZDV5bzR1SUZFbE5L?=
 =?utf-8?B?cjRsTnN5YW9qc05IdlNNaCtFRGpacW9lZGZtdDNxeGoxZmhCZ2h3WWZYMnNB?=
 =?utf-8?B?ZDhwVnM1SjY0N2Y2NVRYanFkbHRhUUNwM2xmUHVEbG5WVno4VHI0UlhnZ0Nq?=
 =?utf-8?B?bGYrdm96YnJJaENMbjFoK3hyVm5RRVYrREZ0anJGWVpGaktoU0FlS3FYVW12?=
 =?utf-8?B?c2VUVFdtMXlPbUl6WG9ESkdRZmtwRVFHNXRZSG1uSnlYQmRuMzZBOVZRMkxU?=
 =?utf-8?B?cmVVYXp5cDlkY0lCRWlKTGpCUmRCc09IRE9hWUZlWER6VjNtZUNXSjBySXRN?=
 =?utf-8?B?RjY5T1RveEcvQTZCSDF6Q2J3bTU1cytYMFIrVHR6dG1yNmRxSk9rZUMyRThG?=
 =?utf-8?B?a3VqeUI3WXlaaUNZellHMWcxWkI5YWF6amhRNFYyektLa0d3YU9YVHMvT2lZ?=
 =?utf-8?B?V0cycEw5VlVyZ0hkZmIwcThBVk51QXVMODZzTWVMZkg0UmI5dzRRbmJacjVQ?=
 =?utf-8?B?TzQyN1MvMEwyNHNDRkZVdDI4eVI2eDhMU254QXNnZjk4YVYwR0FPUjVHc3k2?=
 =?utf-8?B?cjFnVU9adWlodGVIZzVxeVJDd3dwdWgyalZqa0xzdndLL2Evd3NCVTI2YWhy?=
 =?utf-8?B?eWNZM2FOUytyOVkzNzZRVkZMMi9PZ25RdVRzWkd3dFV0b2FwYnRqTGt6ZTRR?=
 =?utf-8?B?bDJoVEdqVm4yWU94blplT2EwQS9GR1g2UkY1UDlFOGRSSjdmb1BiTGZ2NUY2?=
 =?utf-8?B?Y3RZU29vMkJkamk0YkZRQ1czL09DM1JrWUZBd25Sa0xBUXJxakFoZzNxcDhh?=
 =?utf-8?B?SFRPOFMyeDl4Yi9tS0hiYnUrSzB4cmR1WUs0V3NURXJ4Ui9KdHdIUFBabmhP?=
 =?utf-8?B?aVkzSE1xMTZIdHo2VnV0ZnpURG1YaG8zbzdycUZlOFNCUzh4YXQ1QkJoaEd5?=
 =?utf-8?B?UURmUGhLRURzRXZVOUowTmpjQ0lFcThTY2pndHQzbWxxbmVZVENMajVCemEv?=
 =?utf-8?B?ajdlVncwMU52R2MzWHQva1M0ZTYvbnFwWThYV0cyR1QxaHI3Nmw2RlNMQ29q?=
 =?utf-8?B?MlVUWHBIc0xDT0taaFV0SVBhWkhWZ3ZoVG5iaks3KzdSM2VKd0tVRWJMd0ZX?=
 =?utf-8?B?dlk3aVB6TXdPeTRLQm5tQ2ZkejgwZ2JUOHBaTTk2QnFYdnNCVlZHYS9nNElp?=
 =?utf-8?B?M0FONE1IOStpS1lXTXd4U0pvMjY2WGt3b3dSS09obHJiMkhXdjlrbm1zbVlE?=
 =?utf-8?B?N0oyMUs4Q1Jxd0ZBT25DKzdIWDF6WDc3NTRjMjFFbFJpZkpBUGE4cEZJYkV3?=
 =?utf-8?B?OUk5TzU2eWt1Rm0wWXo1K2xnbVV2dkxDK3Z6bkZ0MVBjcktYYnk4S3NhVHUw?=
 =?utf-8?B?VVhnb1pycDFZOVVSMkVydlQ1TDViNWFWMUk3ZHhsSnh6TVQ1bmVuanloL2VJ?=
 =?utf-8?B?VDhQMTgzSm5COUQvdm1NQ3piZjU3dkZVT2tOMWtGbkpsU1JBTGlHZzIvcm5t?=
 =?utf-8?B?YWVEazVCVml3RkpGWXMzems4K3hqdFVRQ21JNys0YVNCNTNnRTdVRVlaUk05?=
 =?utf-8?B?M1FBUDNSMUoxcUdIWmNGdkpoOC9MRFVBd3FqaDF0bzJqSWNFWThFQ1pkb28x?=
 =?utf-8?B?U1RXYmkyQzBDQ29Fb0RnWVhxSEdaaTlmYWZpMlYzRmJNUWhxTjYyejFQejd1?=
 =?utf-8?B?SzJWZmdaMnovZUR6VEFpbzZuanhpSEVPOGRTRHJScjkyT3dESGJPUURKeHZN?=
 =?utf-8?B?RVpKZ2VoS0thOXpJTCs0UFlwL0pnSUJleCtjUFZJdThTOSt5WnRtdHgyQWZP?=
 =?utf-8?B?S0xVZmxBdVR6d1hBV3V2dW50RE9xOE1MQ3lWRUcxMTNpTEhsejF2NmxWYzVN?=
 =?utf-8?B?dEN5bm9MeVc4cjJUM3MxcDNGcHA3MXZjanZKczJ6SDIreU9PREYzV3d6TXZv?=
 =?utf-8?B?WTN0TElpTi83R3BrYVY2Q21XV3BsNzlwbG1GaTdSeG10UC8rZnFCaFNjNDFR?=
 =?utf-8?B?blZDbGRmUnZkQ1pZelk2SjBSMmN4M2E2Q1ppMHB4dHdRYXNnVnRTOXJIbXQ5?=
 =?utf-8?B?RjVXYmtGemlaYzRlMk55VWdnZjljQXBtM25YNThpeTc3aDVMSmJ3SzF3d3lC?=
 =?utf-8?Q?RiHJWrGCIuFaCJd1DdeeXIEp0e2Cxm9ZxKd54EddSBWH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e014f37-445b-484e-d9d8-08ddb3173051
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 12:03:53.5528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRrei3EBJFYSnhwietXqndw9XJTrRFstRKbItIUEjZxd3G6njXLeNE4Ha1qJQZQymCINKBX+5oLXMIl4aA687w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6410

On Tue Jun 24, 2025 at 8:48 PM JST, Andreas Hindborg wrote:
> "Stephen Rothwell" <sfr@canb.auug.org.au> writes:
>
>> Hi all,
>>
>> After merging the rust-timekeeping tree, today's linux-next build
>> (x86_64 allmodconfig) failed like this:
>>
>> error[E0599]: no method named `as_nanos` found for struct `Delta` in the=
 current scope
>>   --> drivers/gpu/nova-core/util.rs:45:33
>>    |
>> 45 |         if start_time.elapsed().as_nanos() > timeout.as_nanos() as =
i64 {
>>    |                                 ^^^^^^^^ method not found in `Delta=
`
>>
>> error: aborting due to 1 previous error
>>
>> For more information about this error, try `rustc --explain E0599`.
>>
>> Caused by commits
>>
>>   2ed94606a0fe ("rust: time: Rename Delta's methods from as_* to into_*"=
)
>>   768dfbfc98e2 ("rust: time: Make Instant generic over ClockSource")
>>
>> interacting with commit
>>
>>   a03c9bd953c2 ("gpu: nova-core: add helper function to wait on conditio=
n")
>>
>> from the drm-nova tree.
>>
>> I tried to fix it up, but this lead down a rabbit hole and my rust
>> skills are poor, so I just dropped the rust-timekeeping tree for today.
>> A merge resolution would be appreciated.
>
> I would suggest the following:
>
> diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.r=
s
> index 5cafe0797cd6..24cbf3f4cc39 100644
> --- a/drivers/gpu/nova-core/util.rs
> +++ b/drivers/gpu/nova-core/util.rs
> @@ -3,7 +3,7 @@
>  use core::time::Duration;
> =20
>  use kernel::prelude::*;
> -use kernel::time::Instant;
> +use kernel::time::{Instant, Monotonic};
> =20
>  pub(crate) const fn to_lowercase_bytes<const N: usize>(s: &str) -> [u8; =
N] {
>      let src =3D s.as_bytes();
> @@ -35,14 +35,14 @@ pub(crate) const fn const_bytes_to_str(bytes: &[u8]) =
-> &str {
>  /// TODO[DLAY]: replace with `read_poll_timeout` once it is available.
>  /// (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonor=
i@gmail.com/)
>  pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Duration, cond: =
F) -> Result<R> {
> -    let start_time =3D Instant::now();
> +    let start_time =3D Instant::<Monotonic>::now();
> =20
>      loop {
>          if let Some(ret) =3D cond() {
>              return Ok(ret);
>          }
> =20
> -        if start_time.elapsed().as_nanos() > timeout.as_nanos() as i64 {
> +        if start_time.elapsed().into_nanos() > timeout.as_nanos() as i64=
 {
>              return Err(ETIMEDOUT);
>          }
>      }
>
> For the Nova people: You might consider if it makes sense to take a
> `kernel::time::Delta<C>` for the timeout.

It probably does now that it is available. I'm willing to do it this
cycle if we can find a way to not break the build. Should we have a tag
to merge into nova-next or something?

