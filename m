Return-Path: <linux-next+bounces-7579-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DA7B0741D
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 12:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38F593ACEEB
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 10:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C4F2EA473;
	Wed, 16 Jul 2025 10:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="o9hMTWmB";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="Qrwq52qU"
X-Original-To: linux-next@vger.kernel.org
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD1F194A60;
	Wed, 16 Jul 2025 10:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.153.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752663521; cv=fail; b=ZPuvO7M4FPZlkRu9OOheKFPd4bleZaR3BljknIsBcZ7yMw/VRELWo02yTldEVyuV6VEpbtklu5RgWZ3+Tfq0wXI4Xd8AtHWSxHemNTxsDFqllWhHvvX2JVI5o0hx5B5b/bD96FjorxLLQugbiYpnYNwzi3rFczhuZFs9+Qhg2FQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752663521; c=relaxed/simple;
	bh=xIaNXhCe0dIR/WPb7topi6ol9+FyfdAACZsQkIdLXcs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mvvcnmr9J5BYxromVnVtgzpzRhwaPF32aF7QWypabyuMNnSQ5ddF1ZVnS8SA2R90sLAYILBPX02ghpCvLKg+sXYEEqMQPjjSqPX0TaqvfB/EAKxWWJYC9keY5W8TRmEppJYobpMcW0jzQjJWVEJLYN1mK+/ustcSvs+MlQyy7kU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=o9hMTWmB; dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b=Qrwq52qU; arc=fail smtp.client-ip=216.71.153.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1752663520; x=1784199520;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=xIaNXhCe0dIR/WPb7topi6ol9+FyfdAACZsQkIdLXcs=;
  b=o9hMTWmB+GoM5fii8e79xZ6p+LLMGRxISrkfk6SqH/TY+Dv2LNf3i18g
   RFCyNZbt0rd3rkmlKvTXCevh0BI+IQjlBwn1Y5KIQVA1CSGfvJyecfHjk
   w5K26msGo0nzEOiVd7jr1EVdf0ZsGGpI/nP7P/vNkaK4lRDsolB+3BEEV
   QHKEBgx8nv6OJdfmrrXZL8AiRY9b3UeESrHpTwRAbJdSl0mxe2LoXZ7Kv
   l616IMAvFpTC4O+S3/HXfPiiLkmdlOFFY3a2XN7Bwn00+/hZKGVCxtCBJ
   +FIUZZFc6YoujFhdeQ0OVsIhBy1/GH9tYILarLXjSybEuMazT6VjjXkhc
   A==;
X-CSE-ConnectionGUID: 9vvlFr8iQlCAHcuTsYMjKw==
X-CSE-MsgGUID: hnd5r2EUSFWbcM3eOJADVg==
X-IronPort-AV: E=Sophos;i="6.16,315,1744041600"; 
   d="scan'208";a="89462123"
Received: from mail-mw2nam10on2089.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([40.107.94.89])
  by ob1.hgst.iphmx.com with ESMTP; 16 Jul 2025 18:58:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkYJPgrWbd+Uc1cy6v3Xuzpq93OxX/4nvz+kHWHPBnUkGp9dXJ5j3LcBHwFEg+R3PLSO5WQ0bROFQ6wzAdyyOuBQ/vifyJzgbDxDmwv1QfIWCsKAdenCpgNuDFW0JYpZ3CkaBPJ626yd+/JhzxCYRyh4l5rXQgDaAVaGaS5TD5iezgOIC1yBD8lPCUCapwSkyrh+X1pcVMSZsFK/5TT69trQ0rE5DmrVhHgro3AfRx2JgFh//tD+SJkw20X7PVJjQjH/Z+FQ1D+t23Ixm8gVpVxmW2s1lhm5EU1J8Twt4Q2BA45rOZ6JTWtFUk/eLTwH694j6IevZPB8CCoyXTWBvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIaNXhCe0dIR/WPb7topi6ol9+FyfdAACZsQkIdLXcs=;
 b=nQx8u1mnnVoW8Vbcsn3o4Yfb7rGgfaQqvaiDXRebomAZjZOkRwpBdaU+oM6aTte0N5RD2AH0gDTv1ALTCeeClwPnrMgv4GB7IqQor2sizEB8VdtCssjKIoAbkVeaEZp47w9LeoueYmfD7GQRB9qyJjKG87EjuiiOXr5h96sJWYLA+DUvtlDWI9vV+GMWBzBoPhMsPoSerqgV/UGG8rK0ku2tsMvkchZJQPxQMfxsmoI0drJyaz/FDuLrutAdZK0HIYW1cBvWtBe0W4uCi9xj+HuGbRbGlzjS2kZl1jwMBPmD2u7/V80NVSE/xNi/fne4T5DE+F8muAu/ruYgaqjoDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIaNXhCe0dIR/WPb7topi6ol9+FyfdAACZsQkIdLXcs=;
 b=Qrwq52qUjI5ZO1QQuvHHO8MKpoLjx1XlnLjUn+KbSAl3hIfFcZmkRKDExUT+wopY/+XHkym/a3sVSNAEyhpyuPCzr7KnKmgGevuCt2QkozpNm+A7Ar0grNyJfXFvIow5HPYxOpyNPXiIdM01+TiNk+2oiZ6cwqAt1nCf0qSrlKA=
Received: from PH0PR04MB7416.namprd04.prod.outlook.com (2603:10b6:510:12::17)
 by CO6PR04MB7764.namprd04.prod.outlook.com (2603:10b6:303:138::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.37; Wed, 16 Jul
 2025 10:58:24 +0000
Received: from PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::ee22:5d81:bfcf:7969]) by PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::ee22:5d81:bfcf:7969%4]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 10:58:24 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the block tree
Thread-Topic: linux-next: build warning after merge of the block tree
Thread-Index: AQHb9j2xk028cfv2TUi+nPGLeAKd8LQ0lJ4A
Date: Wed, 16 Jul 2025 10:58:24 +0000
Message-ID: <dafa8dc8-c51e-4b0c-9383-c19d80f7bf0f@wdc.com>
References: <20250716203748.5a4ad396@canb.auug.org.au>
In-Reply-To: <20250716203748.5a4ad396@canb.auug.org.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB7416:EE_|CO6PR04MB7764:EE_
x-ms-office365-filtering-correlation-id: de6cd66c-a1ad-473f-b361-08ddc457afda
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VGRiTkZkTUhoak5naldIcnNMN01zU3g2Q0tiY2hLNmRjZ21kRDlZUTQzTG9K?=
 =?utf-8?B?QkgzK2tKT1RCL0Qway92S1BHa3hQZWFyZ2xlSjFmNlg1ZUFUMFFzU1MzQnFP?=
 =?utf-8?B?UUtFNVFCZ0tUY2pFQlU5R0tnYkJ3cmxuS0YzVlFNM3lrU1Q5YXZBNzRsRnVs?=
 =?utf-8?B?NFVsSjJUSllRQlJqRWNGY0d6UWpHKy9WMS8rRExod3E5N2IzejFhNkluQUF0?=
 =?utf-8?B?THNoanJGUmc0MUhHcWExb0V4T25Kc2sxd2pBd2xWWGVzWDdDaWwwN0lhK1Z1?=
 =?utf-8?B?S2kvbitDTS91dGFMNy9KeHhkT3ZWV2JCTHNObnNtL0w4QSs1NmhZZGVhREhz?=
 =?utf-8?B?eUppMFRPVHJLVXFBcHJLU3Y2aThHVGJnTkk0NCsvYzF6WnlMejJaL1pLRUdq?=
 =?utf-8?B?NE8rMVBiSC94eDB2ajg3YjlnY0pMZUdsT2p3SzBaT2I0VlUwVlNTbHNlU2ho?=
 =?utf-8?B?Z2hBMFIzTmplWEU2VExQRUx0WkJiSTh3bk1qeVRXNDJnUThEZFpMWERBemdZ?=
 =?utf-8?B?cVdCUENCem53ZjFtbDZIZnBNbWVJaXZRRjBZOHJMb0hwbnQwKzBlQ2cvYWla?=
 =?utf-8?B?ZEhZUXJMcXhqbWliWnhZc0NlSHBSM2pQRmJVa3p3WEE2TWFLOUtJRW1VQWxu?=
 =?utf-8?B?VUNPUzM4WnFZaVlUdjhVdHl1Z3AxNEVIc29lOERzT2toTlpDSklwYXhVTWdy?=
 =?utf-8?B?VFRQQnRnWmpJbitNeWpreHJEWXJmdC8xQ1ZTNmtoREFrSTMzMmxrdlQ4T2lM?=
 =?utf-8?B?Z2w3eGNRQTU4UDF4dGx0UFVwc2lwTDZaN0dJY2JxbGx3RjRFUnRKSEo5ZWpn?=
 =?utf-8?B?alRyOUp5cm5PQ3VDOHpQb3g1dkJnZ00vZW1oTWxKcG5KVnVtaTZUWVlDSEhw?=
 =?utf-8?B?VmtHTGUyNHBPMXRMWTZBa1IwclFrM1lSNlE3ajA2bGpkMFJkMXM4dTJJYm1P?=
 =?utf-8?B?YnRVTkZyVEdPNktNMlEvUEJkY3VUWUM3Wi9PeTBWQUFDU09Yb0RRa2hVd29P?=
 =?utf-8?B?YVQvUXBsUDR4WXZOaFlIYTZaUUNpNGNwaDVtWW9YaUpZc0haakJ4ak1GUjhk?=
 =?utf-8?B?SGhYNmwvWWg5MUptQmVnYmVTSEs2eGpFWktBYmFpM3pudkNrYTV5a0Q4eGhT?=
 =?utf-8?B?TitGOWk5NTRiMzZOQ25uK1lwcGVMeVZXSG1FYUZqM2h1ZkJ4N3JUQjNuWTJD?=
 =?utf-8?B?V21CM1N1K1BOZzVhODNHUTJtWjUrUHVuRUJGcGNNSW1NVzBFU2JSb3AyS0RE?=
 =?utf-8?B?MzlkTFJlZVRSOFVkclBtWHVSWUt2c3l6NFo0eHAwc1BlcmFpUUg1YTBsUkVN?=
 =?utf-8?B?Q1E3UmU2Z1FOQkJ2cHh6djYxTVh3ZmRMM1BYMG1ZQStLVlduWWlNVlNyc2FF?=
 =?utf-8?B?aFlXQk41M0VJc0RTL05CV3oyOWR5bFRxZHhjNlcxYXprdWZEblpHdmNqSXpO?=
 =?utf-8?B?bzlDY2t6WXowQloxZm0yUnluLzRWcUFWWjhmSWs0N2tUZk1kZDhGcjUvRW1i?=
 =?utf-8?B?MnVuUkRqaEpveXd4b2lWTjM2c0RERDFmMDhwbGZQN3ZFdWxpSVBYV2FJd3h6?=
 =?utf-8?B?MWlRQ1d2OXM1aFJUNXhEd0xKUS8xUVJCQ1dRc1JVZ2lmUDdlUU9mdEV3cWwr?=
 =?utf-8?B?SGljcjhGZTlKaVhJT3pTbkhaRm9sMVVGM0JkWUY2OXVUOUJYd0NDb1RhUEdy?=
 =?utf-8?B?ZG82Qi9udXBYeXhCMm5QZ2J1N0ZEbStWRjl0MlRsVE10K0x2RWJkZXpXVVdt?=
 =?utf-8?B?VURGY3dOaWJnOUkxaENjRG40b2NNMjhCUElmTHZGeEt4ZEhxRTlUT2NRNXBP?=
 =?utf-8?B?SDBZYjNLVy9iUzh2SFJtZmJwZW1pcnE3aEkwZURpNUVxU3VYK3JIa016SW1B?=
 =?utf-8?B?OXR0S2hHWDQrRDg5cjlYdUpEQThWWlQwVVVoSzVYSytvUlRZaWlKaDdpVStX?=
 =?utf-8?B?REQvQ0Ivd1NKbEwzeFp6M0tVRC92R1B0T0ZiWDg0UkRwTm9nVFF1enEzT3JV?=
 =?utf-8?B?aGo1cjlXWDd3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR04MB7416.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?emFGYlNBWHc4TjFxQ0oyUFBMT2F0SkFBY0tuY3VTTDlUbUg5Vk00Q3o1WExH?=
 =?utf-8?B?U2NyUDNGUExIL1hCRGt3ckxlNWpCUFBSZmE3Mm04WTU5bXo1NW5xMzdHRlg5?=
 =?utf-8?B?Y1drNlVoeklBMnFsWFpxMTJoQVdnRDd1UzMrUDNrYzIvcGlXRlZuOVpUbmdt?=
 =?utf-8?B?Q1pyNWxSUWwxWkRyUTJ4ZzAwY1p1eXQ2c3MxUXQvMVBjZ1N0WUo2T1FYTXhU?=
 =?utf-8?B?bmRYNTJVNVdsbkdYMmJaYTdlbU1rUEF6dlNwZVNLQlZSS0RyU3N2Q1ljMC9q?=
 =?utf-8?B?ZS81SFJEak1meHRidTNDajFzYkNRSkFIZ1dNaWlOTFpkT1hJRUNsTWlzL0p5?=
 =?utf-8?B?K201RVVyTlVhSFlGQTcvNHFzNms0TmNvYzJvUFJMTzdidGE0WEtaM2U1MlRn?=
 =?utf-8?B?QkM5K1hyVVNVVkRnSGNDUWt4OFltbWtYekF4MS9TODRhYmlTMjRuKzRNOGJ5?=
 =?utf-8?B?a0tITi9FcEJkK05MUXg2R3Nkb1c2VDVFTDBpN1l2clVMcVNsa0hVWUREREJ4?=
 =?utf-8?B?b210cStRVHZJcE5tT1E0d0IvcFM4a0I5Sk85VU44VU8vVUUzOEMxQXI3aDRH?=
 =?utf-8?B?MDd5eWdvZWVxK1dwTm9oakFyZzZEVHBtRkI1RzEzQ20wd1hNd0ZWS1lzUEpY?=
 =?utf-8?B?L3dmWXpRRnJ0WnB1QmkybGk0ME45TUxqUTZ0MGVEVlRkNXhPcG5BWXB6REhY?=
 =?utf-8?B?YVYzeGMxZ1ByWWdCSmlxdmV3blNETk9zZWR5TG1hVlhlUWV0YThhRGZlSUZG?=
 =?utf-8?B?UW90TkFQcDJyWnN4L1MybDFzaGFRWUlJc0pqYVpEa1l6M1ZHN2JTOW15ZWgr?=
 =?utf-8?B?V1ZDZUFDQnRXUDRpTnVKNGMrUWxEQmlKSHNZOWFaT1ZLRUJJVTVyQ2FhM05E?=
 =?utf-8?B?ZXA0MThYZGVIUE1JcEdmUCtXK1JrRE5IYm5jOVZqL1VVelV5UlJ2b2NDRkk4?=
 =?utf-8?B?K3lmWjFMdFo0bVZlNjh6a2hSUFQ0VHpQeEQ3VWw0SUwwc1RmSCtySllENldW?=
 =?utf-8?B?dTdjZmdSb1RyMlBYbW1MY3Ewbk00aE9nSnlSQkErRjIrWjVXUU9MT1F4Ukdl?=
 =?utf-8?B?Qnk5aWV0bG1oZzJENEJuUnYxMmJGeEZHTzJiU3JTVlNtOGZpTU1KaFVMdE05?=
 =?utf-8?B?SWhORy9ibTFSSUZOemlnb2dqeDFKWUpER0pOMUt4cDF3cXByaUozRTlRMjJz?=
 =?utf-8?B?WVRJRlFiYXRRd1I1L0NYUXRKZldTMnc2c1FTWEFjRTREMllxSG93V3ZvcFF0?=
 =?utf-8?B?b1lkRFV4ZjhJQmNPWkRNQkZieTNqMG01ZDJEUnVrRk9DVEFpbytQQVZWaUZz?=
 =?utf-8?B?ZFMrWDVhMUhEWDlWUVc4dFAzcndmUDN2bzZGOFpEV3VMSmVOem1ZZmRQYThR?=
 =?utf-8?B?Q3lwL2ZmNUJySTVpU2RLSzJCelVmL3V4eEVVclBORTd0TzM3VTVEd2ZXNnpp?=
 =?utf-8?B?QmFWeWhwbGdGKzhwZStweVRMZXA5QWpWS2NVMUgvWUQ3RVBDQWxpak80VmhK?=
 =?utf-8?B?VitNU3FMNk5sOWRDbEN3V3RCZnRSRVl1akdZcVcrOHlUV3Y2Y0twZXJoTWJz?=
 =?utf-8?B?eHc5VzZxRUI3WnhNaHh3T2tHMW9NUk9rUENpUmxGSWlyajVJN1hyMWFJSEJk?=
 =?utf-8?B?aUtPNDVheVMvRWhoUWV2MEs4dkErUVE4WUZOUGFLVFQ0aVorRjB3RFIrUXNw?=
 =?utf-8?B?Z1JRK3EwNC9kRFV6UTJXRHlPYXQwakZnMEUxMFZJVEF6RTc5OHo1NEhLTngz?=
 =?utf-8?B?ZmptcncxUkxhR2RhUU1oQnFsRlplN21DZWNvcnRKVklQSUdlWXZhOVh1UXJq?=
 =?utf-8?B?QmJzL3JzY3dQQVo2cHA3T2VzVGkvSlZ3cmJXbis5dEgzSUJBemZsb1N1V21s?=
 =?utf-8?B?Q2xvcGVPcWZ6ZWtOVUxFWXVJUzRxL2NJZXkvdEc1TzdSeDhqalVvYVoxdW9t?=
 =?utf-8?B?MDhmWmhTUzlxV3N1Z1N1Vm1JOURCc2dKZFFWRFlHL0FQdThIbWZkbWtYSDdq?=
 =?utf-8?B?TVNBZmVjVG42TXRQUEJQTmV4WVVRc2U3QzhWeWRzM3RFSzh1eFNWd2dHSzBF?=
 =?utf-8?B?d0lySlc0U2JJYzJSSXcvbm1NVE9kQ0F2OW14dGdQTkZ5TFNRbmlhQmdUbHph?=
 =?utf-8?B?Z0ZhdEx3bnExNHBhdVhZRGdrcGxBR09rYkVnOXF2dFFkTjJGc3BDaFZGc0xF?=
 =?utf-8?B?NGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DFCC5A37A569E241B5A36AA66FBD4507@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QAS9aPZxFfK5UB+yZp5s8GPrbq3+1PFe+/pTgmc9aS5F0doiGrzvzYrdVAKFr/H21Ak6SuET07NVn98/e/C8avfv2FWkQ50iMNke671LMnGmiJzPyzIrEB771ARVbAYaHLVYZHbGn+y5Ey3t4iqYUpkdFFO8GK/XXv55OpzzFrzZY9o0xijeu9G5ATY86Y74FkMTt0WpBWX6/oVrFFXZz0MSSa+66z2o5BU3bTCLYjZv9bam90wREbsHx98nQJlVS+PdTW9atx5MBd3GB2jgw08s074g+xDHNe4XHpk2vdPtUYE/cILmpfGnO70rhN+NoKCh3gR/YOXMuB2lQcO3SQt+Mu5Dg4+a8nIrPbjoBrVY+VmbGgfiPJJxPgUK6BmvgmRvo1aO61ezZEtQw1JHtcsW5pin5nuXCKmRpWBpcAHLZP6iY4YWlnhxtfiTE3HrN/k90fDd3q5B7vTD4zm82Q1cYH/yRF2knWO2y/oCcOeZTS6Lf9r9J4pPoJXnJgNg3c/iHSNA/8qjdmGS4V+yoYwsl1+lnDSh+K5LFE6fcZ/lgRN0y3NrbRM1xEIHfx8EgmeoAurVVzZr75uBXJoFZ5A2KWs03YFeO+AxGnV2AMjxtKjESHHaDiOaPyMH7/cx
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7416.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de6cd66c-a1ad-473f-b361-08ddc457afda
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 10:58:24.7850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j+9XjC2S7FFhpMuGEHa/KGZNVXBJuNuZz8hkdenWHNH3obLEv/LaQcS5djPN7saRnT+spTHu9CsDn4olfeljzXEvqIFRglFefo5lO2epaf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7764

T24gMTYuMDcuMjUgMTI6MzcsIFN0ZXBoZW4gUm90aHdlbGwgd3JvdGU6DQo+IEhpIGFsbCwNCj4g
DQo+IEFmdGVyIG1lcmdpbmcgdGhlIGJsb2NrIHRyZWUsIHRvZGF5J3MgbGludXgtbmV4dCBidWls
ZCAoaHRtbGRvY3MpDQo+IHByb2R1Y2VkIHRoaXMgd2FybmluZzoNCj4gDQo+IGluY2x1ZGUvdHJh
Y2UvZXZlbnRzL2Jsb2NrLmg6NDE2OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3Igc3Ry
dWN0IG1lbWJlciAncnEnIG5vdCBkZXNjcmliZWQgaW4gJ3RyYWNlX2Jsa196b25lX2FwcGVuZF91
cGRhdGVfcmVxdWVzdF9iaW8nDQo+IGluY2x1ZGUvdHJhY2UvZXZlbnRzL2Jsb2NrLmg6NDE2OiB3
YXJuaW5nOiBleHBlY3RpbmcgcHJvdG90eXBlIGZvciB0cmFjZV9ibG9ja196b25lX3VwZGF0ZV9y
ZXF1ZXN0X2JpbygpLiBQcm90b3R5cGUgd2FzIGZvciB0cmFjZV9ibGtfem9uZV9hcHBlbmRfdXBk
YXRlX3JlcXVlc3RfYmlvKCkgaW5zdGVhZA0KPiANCj4gSW50cm9kdWNlZCBieSBjb21taXQNCj4g
DQo+ICAgIDRjYzIxYTAwNzYyYiAoImJsb2NrOiBhZGQgdHJhY2Vwb2ludCBmb3IgYmxrX3pvbmVf
dXBkYXRlX3JlcXVlc3RfYmlvIikNCj4gDQoNCkhpIFN0ZXBoZW4sDQoNCkRvZXMgdGhpcyBmaXgg
aXQgZm9yIHlvdToNCg0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvdHJhY2UvZXZlbnRzL2Jsb2NrLmgg
Yi9pbmNsdWRlL3RyYWNlL2V2ZW50cy9ibG9jay5oDQppbmRleCAzZTU4MmQ1ZTNhNTcuLjZhYTc5
ZTJkNzk5YyAxMDA2NDQNCi0tLSBhL2luY2x1ZGUvdHJhY2UvZXZlbnRzL2Jsb2NrLmgNCisrKyBi
L2luY2x1ZGUvdHJhY2UvZXZlbnRzL2Jsb2NrLmgNCkBAIC00MDUsOCArNDA1LDggQEAgREVGSU5F
X0VWRU5UKGJsb2NrX2JpbywgYmxvY2tfZ2V0cnEsDQogICk7DQoNCiAgLyoqDQotICogYmxvY2tf
em9uZV91cGRhdGVfcmVxdWVzdF9iaW8gLSB1cGRhdGUgdGhlIGJpbyBzZWN0b3IgYWZ0ZXIgYSB6
b25lIGFwcGVuZA0KLSAqIEBiaW86IHRoZSBjb21wbGV0ZWQgYmxvY2sgSU8gb3BlcmF0aW9uDQor
ICogYmxrX3pvbmVfYXBwZW5kX3VwZGF0ZV9yZXF1ZXN0X2JpbyAtIHVwZGF0ZSBiaW8gc2VjdG9y
IGFmdGVyIHpvbmUgYXBwZW5kDQorICogQHJxOiB0aGUgY29tcGxldGVkIHJlcXVlc3QgdGhhdCBz
ZXRzIHRoZSBiaW8gc2VjdG9yDQogICAqDQogICAqIFVwZGF0ZSB0aGUgYmlvJ3MgYmlfc2VjdG9y
IGFmdGVyIGEgem9uZSBhcHBlbmQgY29tbWFuZCBoYXMgYmVlbiBjb21wbGV0ZWQuDQogICAqLw0K
DQoNCkknbGwgc3VibWl0IGEgcHJvcGVyIHBhdGNoIEFTQVAuDQoNCg==

