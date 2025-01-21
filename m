Return-Path: <linux-next+bounces-5281-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A87AEA17CCC
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 12:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A24CB3A2DC2
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 11:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0CEF1BD9F2;
	Tue, 21 Jan 2025 11:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ddn.com header.i=@ddn.com header.b="ofpGw6Db"
X-Original-To: linux-next@vger.kernel.org
Received: from outbound-ip191a.ess.barracuda.com (outbound-ip191a.ess.barracuda.com [209.222.82.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3381BBBEA;
	Tue, 21 Jan 2025 11:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.222.82.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737458158; cv=fail; b=J23AyQnfwF3m0pbCqqZx2xIgg+GT7B6mLY+Vsc4Y8JhoSix2N5X/6J8kuFSC6D3dQtx/r116LGJSOD1jbGylDjAD5R615ilSsV6p8vVXaLyzuCrhC3UZastRPCKIyYhkF+naNm8gPDm4cp1mGidTQnXBmzl6s64lrKenogHcOJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737458158; c=relaxed/simple;
	bh=bBeNRRpZ8LEyEj+Cnlgz0xy0JKPCClsNp8sC/IP0lus=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B6+HcbDL6hrVTKVUkVSjQOluQjihf2I5X1Cnly5WMlg9lPqZmn5uc8BW0j8wRtUE/XSeALIh3cEza393QrmPqMNH7vt8vYvlnZwFlhQ/u7Ee0PtAQy/v0N7/tzggUQgi+TfLG8OHcGhPKLzGqnqC1haWL4JA75NN8jaX8YnWuzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ddn.com; spf=pass smtp.mailfrom=ddn.com; dkim=pass (1024-bit key) header.d=ddn.com header.i=@ddn.com header.b=ofpGw6Db; arc=fail smtp.client-ip=209.222.82.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ddn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ddn.com
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173]) by mx-outbound10-111.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 21 Jan 2025 11:15:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9HdaOYoh690It6uG0wdY4GgLiGVkK78gI3A7K2dhVsU159E5T05NtutS1D99Zcq1//IqYUL39BDe8RGkbtSeI/wn3IqTs0osbcSEpdkqj9ZKxsOBym7joMNQsCKNvd7nhfSURn3dhBZ7osugA9LhWB3yZnYbAf/RJdRu9BpOEihsCMBJr1rwoCJs0lN0z0zYiSwJ7UsAXiTtBEA9+OeGIzXe3z1/gmsVgr8yhMGzQzBulPPYFMUrE8/vV5+OgSDNWzFFDpYdtWpJoF4vaGzU9HohdEOhYonty2snlV7vunDUeSgjTB+TsDKuG49+ls+5v/wbkZiYk0Datv7uv6jdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBeNRRpZ8LEyEj+Cnlgz0xy0JKPCClsNp8sC/IP0lus=;
 b=wHF3hIWa4PAuIP5TTK/Jt3FuPWL/aiHsKqH3Ws6ET0z1VoAI+42o1stG+r+Cs5MotA9KGgHiKBbTHmdK7e6UiTkJ51qtOyc/f13NdbwIP0O3qO2XUwlyi/U8J0ReiKigRwN3n2Flsswzz4/GCXoryod70GT7twKK/1b46xuuR0xDlaSBUWgAsac9a1xxNPewocfHEtuGn5nuzQ7DWeLN/Jd3SnTw7ktsMy0s8lueRDcyc09ZaUQmOZewqzdRWGOksVoNkDWTXV03yGVyGdf1ccLf4qYox62FIOpnWHLxjYQIaL6ba6PZDX4REEJZhtmq/kuqScGNJvXgVo5mAvLLlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ddn.com; dmarc=pass action=none header.from=ddn.com; dkim=pass
 header.d=ddn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ddn.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBeNRRpZ8LEyEj+Cnlgz0xy0JKPCClsNp8sC/IP0lus=;
 b=ofpGw6DbMjOrWZsi9NwVrvwNlK3vSFeSfAv33Tcx85yvWPGqZubcKIAESLVRaawOA4DRb3Uzaon15ykBqli7cf/0sys4TiAnGMWHwP35VxMypbx69zneM/bRLREMBvpjh1f+PLgqOa+sGluaNjNaneLbVJd76lYN6Fqu5YUi8kc=
Received: from CH2PR19MB3864.namprd19.prod.outlook.com (2603:10b6:610:93::21)
 by BN0PR19MB5326.namprd19.prod.outlook.com (2603:10b6:408:159::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Tue, 21 Jan
 2025 11:15:34 +0000
Received: from CH2PR19MB3864.namprd19.prod.outlook.com
 ([fe80::abe1:8b29:6aaa:8f03]) by CH2PR19MB3864.namprd19.prod.outlook.com
 ([fe80::abe1:8b29:6aaa:8f03%4]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 11:15:33 +0000
From: Bernd Schubert <bschubert@ddn.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, "bernd@bsbernd.com"
	<bernd@bsbernd.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org"
	<linux-next@vger.kernel.org>
Subject: Re: [PATCH] fuse: Fix Documentation/filesystems/fuse-io-uring.rst
Thread-Topic: [PATCH] fuse: Fix Documentation/filesystems/fuse-io-uring.rst
Thread-Index: AQHba9/Ywpyq8ubBJkq801ioJ1oqLLMg9bMAgAAeHwA=
Date: Tue, 21 Jan 2025 11:15:33 +0000
Message-ID: <3eb0dff2-d51c-4037-84d4-281e8534d1b1@ddn.com>
References: <20250121174848.382cc2c6@canb.auug.org.au>
 <20250121083746.2196931-1-bschubert@ddn.com>
 <CAJfpeguaLKfh8T1z+YSzkzgvLBmHNXkRQU0qOAyVQdWeABg+_A@mail.gmail.com>
In-Reply-To:
 <CAJfpeguaLKfh8T1z+YSzkzgvLBmHNXkRQU0qOAyVQdWeABg+_A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ddn.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR19MB3864:EE_|BN0PR19MB5326:EE_
x-ms-office365-filtering-correlation-id: 9957a149-4bdd-4bf5-1517-08dd3a0cec48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZENpcUJhY3Q4RGltZEVxQm1RK04vVEFzUWFzUVFLTDh1T0RhS0VpM0FJUUdu?=
 =?utf-8?B?aTZ0bks1bVNlSk1UR0FuaVNyZG1xU0VUaEc1NXV5NncvY3FkS3FVeVQ3bmt1?=
 =?utf-8?B?L2tVdk1WaHM3aXloODhYL3Y1Sk5aYmlzbnVXTnNSYUFLY3NkSGF5SFJuVWJD?=
 =?utf-8?B?aUgrdWN2KzN5ckp2b0VCOU0vZHFnZjVZZlo4SUFJSG1IMjJ2T1lSeXR3ZVA2?=
 =?utf-8?B?cXlncFg1N3MyTmZjYzB3QVo4UENxMFI2WEFWYXNmeXBKRTFxUUVFd2dmMFVn?=
 =?utf-8?B?Y2xPeWN1VlZMTzFxeFhkNm5CdkNhZjFsaVE3eG1Tc09tWDA1R3hteTBBaU9x?=
 =?utf-8?B?QjRaUVloTVl6dnFLV0swc29nUFNsK3k4K0tGMXFyU1ZnQWFNY3RldVZJYjNz?=
 =?utf-8?B?blByQkNJWmhhbUhNbi9xT2NwZkNKYVhVRitNTkRWZ2dDc1VrczduWDhMRE1l?=
 =?utf-8?B?eTUzOTNvYmpKUXp6Q2ZXbDhaTnJRcUJxK3NFRSs2OUhIMXAzOXNOM1lBUU1Y?=
 =?utf-8?B?aGl0LzhUZVpGaGIvL3greUZrUUJNT2lhOVZQY0RybW9OSEl0Q1JLQlhRNUow?=
 =?utf-8?B?SmdmSklJb3VJSy9OTEVSNHB0NUNNV05DMGJkNnVienh2RTV0WEZmcEk3Skwr?=
 =?utf-8?B?UGR0V09NL2F5UWk1cTdtdmRqQWN0ODZXa3Q4TWJKeEdWQmQ5cVJuV0RjbmJa?=
 =?utf-8?B?TUJWMGFUaUhpeFBscnRPaUxiQmlyYnlvVDJRK3ZkbkZLOGErRlRMRmhtNTRs?=
 =?utf-8?B?Ukh1TVI3TEwyeWQra1hTLysrV2h6eGNoMnVXWW5lTnpmS2hObDJEY2ZWUTVn?=
 =?utf-8?B?QjRQYnd1c0xjNFhac2ZUZ2hXUnA0eUk5TVJmYjZ6SzlQV3A1OW93ZnN0dWpP?=
 =?utf-8?B?bkpEZGVDNlJMSXZNSTVjRDlQL2E5OGpGM0NxaURlbHZBM3VqN2JSQ0FMNkRE?=
 =?utf-8?B?eXNMMU8rWm1IUFg0WGk0NWNLYnJPbFJya2VxcFROeW5MWFNMTkJiQ0k2QXRN?=
 =?utf-8?B?eWxGN1dkaVY2UHhDV2h2UVZWU280V1JqT1BVNnIvNFVjb2ZrTWQ1WWdCNDJq?=
 =?utf-8?B?ZXN4UWZFdDdGNml6T2paQ0JKYkNGTzI3VnZ2Q3VrM1o0c3pwa0dpVEJzMkVT?=
 =?utf-8?B?eWs0ZnVKc3lnU3BJMWV2TDA0d3NhcHFhcjZlSGFYMHhLZlZPenJQZTFPUk90?=
 =?utf-8?B?dHdVby9scGVaWmtpbWpEWm1SWGQyOUZNb3B0UThiVWRRSzY3M3RyamYxZEFs?=
 =?utf-8?B?aFA4VlNBL2k2cGIzVlprRzNnWVYxWUd2WXpmeG1TN3JrWUlTL241allHL0lC?=
 =?utf-8?B?ZlJFcURCdW42bWhPV3d6MGVYUUpoM21id2tVd0FPNlFmbEZIZzhzdXRGR3BG?=
 =?utf-8?B?NFVZMEFOS0dHVUIzZUJYR1dqVTJUYWcrKzNzdEtrZytlZnJLRlV3TVZrQVNq?=
 =?utf-8?B?a0ZrVjBUMWZHQ0RFK1ZmbGtGRUwzekJpekFNZWowOWNjNC8yZlZIdmRYMmlQ?=
 =?utf-8?B?SGxIS3I4NUZxSndndGdDQjJjdUovKzlwRUJISU9SRk9meUhSOVNHZ0NEbVlm?=
 =?utf-8?B?aVg5WEN2QVUzeDhlcDR6TWJkeUg1L0xZbDgybC9MRlNNSWR0TmNlUDQrV3Vj?=
 =?utf-8?B?R1dySzF6WGNETTFsbHJBV0Y1VVV5T3lKb3FwQzQ3dHAxcktIZzV4YWZENXZT?=
 =?utf-8?B?WHhDcWlHeEpxQmlrSHhWZy9MT1NPemcwQS9zTmdtTlBhZEN6WjJXejBrU09U?=
 =?utf-8?B?aHpkM0U0LzlJSE4zZ1d5QXB1OS8zV3JVeTgwdCtQK2Zjd3BKL01VdnhHWnJn?=
 =?utf-8?B?Rzg3ZEF1ZUd5U1l3RnExMW5nRVM3U2JkNm9mMUNnQXNxS0xNb01qOUhmTmVY?=
 =?utf-8?B?U3l5ZjBzQ2JNOG1tb3kyZHhXdmMwbktMakZKSnRkNjdwc0RKVktNaSt3SGZK?=
 =?utf-8?Q?WN+PVVbT1peCI5whAutRwIejw/hsPqAf?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR19MB3864.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dmVjZTF4R1dqZEN5U2hoOHdzMmg5Ukh1c0pEUnVYYmhYOHlqY29tRnplaU1X?=
 =?utf-8?B?eVZXdm9ma0dkQTlVT3cwUEFGR1ZqSjhiVEwyUFlyWVQxM1BaeVlJaU5RUTNq?=
 =?utf-8?B?Y3czc3lCYWdkNm5Uckljc28wNVNLdE5VUHV4ZC9OT09Fc1BnRldqcVpPdk1l?=
 =?utf-8?B?VUppdGZIajlpWFB3YmsxdWxYaStrWnFhNTlaUTNicU91dmJvK2ZRS09pRTJC?=
 =?utf-8?B?UTJZR2c1QlF3Z1hmMTl3MEVCMjJQdU1NT2pjR3RIRXV3d093S2lqWG1pcjhG?=
 =?utf-8?B?LzY2TW9DRmZ6SnZSdGpZSVV4VHRFZ1ZXUnpQUnhLOWdQd1JwdE5YT3o2a0ho?=
 =?utf-8?B?N3NjWWUwbU9ReVRReGFBWC9GNVRaUzR3dWRlSjJTdU9OWmlUMnhnaEZlUzNn?=
 =?utf-8?B?UFpxQ1R3ZjJJZFozSFEwR1NuMWJvK01qbTVuRUlOMDdMcUpBL2k2dS9XNGpT?=
 =?utf-8?B?RE4wMzFOYjhJdUl2MW42bHVLekJTcW5uYUc2Q3ZqQTFFTVRCUlZacGZIL3kx?=
 =?utf-8?B?cWN4WnQ1cjQ1Nlk1cU1rOHppRDh4bUJaVE5ocU9LRmlnMnJLb0RNamptejho?=
 =?utf-8?B?RjBSK29Wa0hZbmZ5citYTW4rZC84NXFtQUxuUWF1NkUvclhZUmNtK2QyaWFz?=
 =?utf-8?B?YWlXdWpoUUgyTkUvanNqK0dmS1lEcElVS0VhM2pnb3ljaElTU3lxeWhZb0U3?=
 =?utf-8?B?NFFKcHl5OGg4TEkvUG1yTzJyRlZtc3R5TitXNS9TMytldnJUNDEyWk9ibHpD?=
 =?utf-8?B?N3VZTi9nekh0bUJHQ0lUVDdGQ2x4dnhCdjVWYzVwNWg3S3ZQMDVSZ3lDWUhD?=
 =?utf-8?B?WEVrV25aNDZuSU5qWVhpL0xEaXBIdVppMlZ3UGVvMWhoQ0krRkllQ1k2RkJO?=
 =?utf-8?B?ZXpBNjNoNGNHYUwxNG8yek5EMTBYZGhDcTJVZEJTLzJzRGNaL2VoNEN6aFBk?=
 =?utf-8?B?cW0rM2JyZk9Cbi8vZXRDa05Da0hMdm9lcTN0UnlpRXhKdGxPTXpmU1p6eWVy?=
 =?utf-8?B?WitEWFBiZHYxVnE4Nmp6bytqcFd1K2YyL3VrSld1WnAxdEorVDBodW5xL3NP?=
 =?utf-8?B?R2p5VTdIbklLYlVpb2Ryb1lUS0tnTk91YjU4UU92WlRkVVNwM05Id2g1U2RM?=
 =?utf-8?B?UHEwaTlscFlESHMwdnhtNXBrWW8vdU0zUW5qT1plQU45K003ME55dGpGVy9Y?=
 =?utf-8?B?V1Uwa2gvWXdOSUpyNno5bllwMkdVdmZEQWJRbWlKOU1PZ2VieGN3aEM5d1hN?=
 =?utf-8?B?QStlaFJ4R2xpZkhLeldrTGdEOXY5NjhqVUhZVkhLaCtuczFSd1llZWlUQ3cz?=
 =?utf-8?B?M2RULytxd2Q5eVREY1ZiR3lvWUJGS28xSGRKVm9xYXNCekR1VUxTUVBwWThG?=
 =?utf-8?B?UGd6UEloSlF2TG94d2VnTFlUMHJrNk5FZ0V5RXU0eStobzRVTHlvdzJNYWcr?=
 =?utf-8?B?RzBXM2wxTktkYWpFTVExeXlkQ0Jqcm5BTWpkNEpMejJqdzFNckZqTjM2RGZ0?=
 =?utf-8?B?aUlqQlBhOEJ3dlI0V3J6OGtqMER2L1FNN1UwWjFtT2FBZnZhQlNHZ3d1V2hv?=
 =?utf-8?B?VVpiZDc0MzZ1RDZXcDlEdkxwSGR3Ujl3Y1d6RzdlcTRzZWlWVk9Vc1B1MGFT?=
 =?utf-8?B?Vk1BbHNDVTNKOUJ5Tkh3N0Q2QzFubEVRVmhTb3V5dGFrbGdLbGE3NFJPb0kw?=
 =?utf-8?B?bnMvKzBvZ1hpK1UxUS9BY0k2dzl4OGN4MVU4YWFTaHdTUUZ6Z2h6QldVU2RQ?=
 =?utf-8?B?Sm5VNTBuVENHcUs2bWszVWdMcXpVNFZjSEVHK2lZQXdlZ0ZDdGpwakMwNEYr?=
 =?utf-8?B?ekNEUjZVeUo4VXg3cXVOdXBNZ0IycWtsQndRV1JBSGhYMEQ0VzhtK0NqRzF1?=
 =?utf-8?B?aS9VUnB0a2YwdFk2ZnhYU0kzMjhocDFXcG9uS3ZyRkFYRE85R0E3WlVpVVMw?=
 =?utf-8?B?VkFqak5adWF6QnkydllkYUhGZWV1Z1d5MzBzcTBxcTZwWDlERmxkZHpvdk50?=
 =?utf-8?B?ZDExcjgxdk9hMGpsQmhNU0lqdXhoWmR0Q2ZXN0kyWUJxcFlPL0RLclY1K2po?=
 =?utf-8?B?bmxOQTFrdkNrRHkrQXlvV01RVm1jU3E5K1NZMmlSN0RhaWlKZ01PTkRDREM3?=
 =?utf-8?B?dkNlaWNjdWVPdlZwaHZrODZRb3FzcmVkK25PdFZsalNuOGlVQU9YRUtiZ3NK?=
 =?utf-8?Q?mWVKLpW2V/UNt423OVA6I3Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8CC281867F887649B2FA7B9FF893B839@namprd19.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	95xR1vi4XNgGhxTFCzR20o8G6vyXDbQpfBfBwln12q+Owmb5lS3vRL+ZVWNftoX88mQfPmej2en9VtyH2r3DMvNdv0KvBos2wKc6/SsaZFGEMEKoPQze/EDEgvjt07uIZNvLVXsj2GP53Ih1VhOjOsJyJd1xMhkWct0skCUrYFF7IWiGSUa1xNw+Ea5/yFCnSZiC4xy7wfJqQ3+axpHm41ZL3KyJO6t9sI8qq2K5E1luhIzuk9/T6eaTQi74W5FIc4pmwin+gZhVwGoOArv7z060E1i68Hv36pLxJaqfMlFqnytL9+f48vZOsCyd2HDXNk+vgJkQKQJu2YxYGjCdOyiUjuUoLFKQAhRFk1adWZ953G1yrS9YXR+RVgZUVlKQz8X7LZDafsmIPoadohnYeyCWIyrTVVjEOEmMHjE5WokrxxwDO7kpQ1jyjaNPvB71K8XISCx6XlfCHN61/YItrgm1JuafgE1DpKwbM47mNwa1nXpMKIS/cysXqKtjXKazavuCiUS+Tf81jdB27YFdsO/auebSynVy2Vy515kgXRYaNecCAR5Q+OyZgLeZ+kOYeFWYM5jkYwgG96+qx9Zxk1OoXmH237AYZkExGvetzvpYJ9XdZp8n4NpS1883ocm18ofn7cx02BZRn5adKxXE+g==
X-OriginatorOrg: ddn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR19MB3864.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9957a149-4bdd-4bf5-1517-08dd3a0cec48
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 11:15:33.4303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 753b6e26-6fd3-43e6-8248-3f1735d59bb4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PvlgqfS2uA15yswPicKqkGP89vKDUKqvH6tSKjc2WwaDc5iFmkxxxtZCvPsxNjoS1yQ/nsr0uE6/zCoQ5Ip0kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR19MB5326
X-BESS-ID: 1737458137-102671-13532-439-1
X-BESS-VER: 2019.1_20250117.1903
X-BESS-Apparent-Source-IP: 104.47.56.173
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVsYmBkBGBlDMwjTF2NgwzcLc3M
	TAONnMzDjJ2MIszdTYyMQo0dI8MUmpNhYAp5gJo0AAAAA=
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.261951 [from 
	cloudscan11-81.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS124931 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

T24gMS8yMS8yNSAxMDoyNywgTWlrbG9zIFN6ZXJlZGkgd3JvdGU6DQo+IE9uIFR1ZSwgMjEgSmFu
IDIwMjUgYXQgMDk6MzgsIEJlcm5kIFNjaHViZXJ0IDxic2NodWJlcnRAZGRuLmNvbT4gd3JvdGU6
DQo+Pg0KPj4gVGhpcyBhZGRzIHNldmVyYWwgZG9jdW1lbnRhdGlvbiB1cGRhdGVzIEkgaGFkIG1p
c3NlZCBhZnRlcg0KPj4gcmVuYW1pbmcgZnVuY3Rpb25zIGFuZCBhbHNvIGZpeGVzICdtYWtlIGh0
bWxkb2NzJy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBTY2h1YmVydCA8YnNjaHViZXJ0
QGRkbi5jb20+DQo+IA0KPiBGb2xkZWQgaW50byBkb2NzIHBhdGNoLg0KPiANCg0KVGhhbmsgeW91
IE1pa2xvcyENCg==

