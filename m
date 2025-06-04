Return-Path: <linux-next+bounces-7059-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FC7ACDF1F
	for <lists+linux-next@lfdr.de>; Wed,  4 Jun 2025 15:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A25541894191
	for <lists+linux-next@lfdr.de>; Wed,  4 Jun 2025 13:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1BD742AA9;
	Wed,  4 Jun 2025 13:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tCl10R/v"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD38E175A5;
	Wed,  4 Jun 2025 13:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749043897; cv=fail; b=BfI4VEPbYXvt/gm6UOX9rUlqaEfAbHXQKHw/U8LZUdBxZTucwtk6zvDMgLqhcrv5Pb2qJ6Uznx049kC/jLy8GlprPP6UQj8gMm4xZX9K4/0s0aCKLrfl1AOQGeL+rLNHxrWg3mFtdRoaYFHqwiXznn/H1u53eRjXcywF2i3xrJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749043897; c=relaxed/simple;
	bh=Dh8F9NtE/AxAkLoLxtxoAbp34YKNBTL3wHQIbmWdDL4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YXXElKMLBiN1bVp46tnHd+m011Wxji942FadPXsOUeJ4JnrOJ/MnNuJibHpN6/hThejCB03xXamzO48ksVKN0PqaRNfbIQ7Ufg2x0TSq3L1zWvdWjmfsWogRUarFSnceEZXBn+NOIVX6hgbVZiDzTrTVxuPWnhCw8gOOycR519o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tCl10R/v; arc=fail smtp.client-ip=40.107.237.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xw7DBvwRv1PCLZHrD/+esQdsrMLHI43F9Ad6KB0ITlyGEaqZ/ZdwAP3hIC26NM1lSUK/gInIDfeJLRHmr3QKBCsnCU9wm+9kDv8Obz1a61C/KJYcEKP+h+i/YzptzrlHGT1NNOs5efYzp+yZ/hooRiqaqacF4Fdwck5kmBlxTuR5K2oxHA0f65wqZtbt++KoXIJsBk+DG8OoAhi5XBLZFyGzNg4N/D/qUv3QXDbnJv/YKEKMPvQvYwUUr1VDg7TNQWqignlRRi5iAdbbGCGbm0C5Cyr+JYX0bdGfaorp04krqFAEalv3QICO+18VYgT1vdtwdzKVvHG63U2WAaqYBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tcl/p1LLKx9KPTyXX5IWb2qyp/e/lHNmEERNzvJWki4=;
 b=paIU5Cde8hCJyP84mdpLBpDYFCRsxa7pCBl/hGjWAWhj8eqXAxRxqnXIjiP//fbD16TP3qAPJ5vhZyiJ0WYOPBq4U693DyGusX1BoHfh+Rlecoh0MUgC8j7lj4QJ+T4IKQT5mnB6xgPQi4ZtLkexd0YqlWDNK2tpaqqLgzYGFlVtUfDM0DfBz0hVbna/ka20ufifkg4qLU4Xx2gRCG9EW0OhVrF78Qq0eJ694An2Fizpkr2+XdHa42/raxvzwwa2WT4w0zZYd+m8KT5jALGUYiuPtYq0XNUkBUE6eWksgkNb10dY+FCG/wko602R2HiYhQoC/OEf0jQIGiIHIQGr8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tcl/p1LLKx9KPTyXX5IWb2qyp/e/lHNmEERNzvJWki4=;
 b=tCl10R/vd1lM36lLb6XWi/TEks0KJpwEyIcxf1Lf5iioHV3J9QuA0AdeMly1peCr44rSxzHrZiXPTSKpyVXgeHCBTah5XtbiKX2MmwnxLdQCjhPhxVByecPrWrE2CMW1qZs3I6hhuLGoYshrsuKjq5dsCzFcnRu3MSwXDsNbsoc=
Received: from IA1PR12MB6044.namprd12.prod.outlook.com (2603:10b6:208:3d4::20)
 by MN2PR12MB4439.namprd12.prod.outlook.com (2603:10b6:208:262::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 13:31:33 +0000
Received: from IA1PR12MB6044.namprd12.prod.outlook.com
 ([fe80::b62f:a186:3978:4a57]) by IA1PR12MB6044.namprd12.prod.outlook.com
 ([fe80::b62f:a186:3978:4a57%3]) with mapi id 15.20.8769.037; Wed, 4 Jun 2025
 13:31:32 +0000
From: "Zhu, Yihan" <Yihan.Zhu@amd.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alex Deucher
	<alexdeucher@gmail.com>, "Hung, Alex" <Alex.Hung@amd.com>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Lin, Wayne"
	<Wayne.Lin@amd.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: RE: linux-next: build warning after merge of the amdgpu tree
Thread-Topic: linux-next: build warning after merge of the amdgpu tree
Thread-Index: AQHb1QAQrzLA18ZA9kmk8U1kzhNIFbPy/7Og
Date: Wed, 4 Jun 2025 13:31:32 +0000
Message-ID:
 <IA1PR12MB6044D456DA05361DAEFECE4DE36CA@IA1PR12MB6044.namprd12.prod.outlook.com>
References: <20250604132331.5929895f@canb.auug.org.au>
In-Reply-To: <20250604132331.5929895f@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=d74cd196-0597-4d3f-baa2-f7dbaa48a868;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-06-04T13:30:34Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB6044:EE_|MN2PR12MB4439:EE_
x-ms-office365-filtering-correlation-id: 276273ff-e632-4121-7f20-08dda36c1ee6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?zHIYQYf3uEksj8E/Pp/HzxbEuiObrCV0LFXyFHcNg76eW/LF9s4jE4DAwZ8P?=
 =?us-ascii?Q?NSaTQm+CMY+3Xf0hEReagraRHnGZIWBkuFPC7JxbM7QC9+pMaCYF2Gxev/2m?=
 =?us-ascii?Q?ZFJ75QOe484RqOnydstKISOs8RX0/PDf4yweqrN4ZpLOJv+Y6X6j/nz/rXom?=
 =?us-ascii?Q?Z41ivD26oKs1CC1pFvcjodojwtJFMwyla0xx0XHYTDtUzCkrXjumXwkHZXa3?=
 =?us-ascii?Q?P6YSl7o2Cjf6NnVK1oNrt+WL4T6HpwEEBB6ANPBbXBWrWDwedoAG3L3PdEQJ?=
 =?us-ascii?Q?WNljkzAZSnFBfFUk4fmVmMFOek3objClXXkRvskUTNPITksRI/BqlauUwdTY?=
 =?us-ascii?Q?tNcHUtdqc706iLrmHEYY8/29bTIgz7FGOJYBAHS5NHtF1sVeL+ykg3+cMqS6?=
 =?us-ascii?Q?sjDNrBtYRyC/oYhr4NH0LrIFOCLCt36NQ3QoktpjvnV83k0f5pFCS7y6xl4r?=
 =?us-ascii?Q?MyRccifWiewFjxJeCCWqbwmzrQntEAUQaTBIQXbB5pzeBnBl42GG+4cMk7bI?=
 =?us-ascii?Q?fWdg2BKhCgK+QR+MIv12BByjj2CUdhDO2xLubWI0MkRFwGGeVgkuLP20vHMX?=
 =?us-ascii?Q?s3EH7AGRmZND2xRg7u3f8naYTipoKwPw4bDHfd/1mZKeqiC+wJadT+iGsNxQ?=
 =?us-ascii?Q?IgXBI9wmXG+/fRe3Tn8xC7wYd7EFDpVrUVLluJZBpvyFuOjGatbSlAfOmv3O?=
 =?us-ascii?Q?T+VBsN9cMGTycgAs9CZOu8CckhbvqQp9+3ibdMqPNMRu3z1Vpvjvtaombgd/?=
 =?us-ascii?Q?TUpsFv5boZzwBg+9Q+1a5idOSVJ1U+/sfxpz+ggj9kpGOLbTersSUzW7vHSK?=
 =?us-ascii?Q?k6NkZMVbGBCXRwj6AhdLVkMP0qEQOhntRCEu61JPj+bQjM9uDFGENmYyhZd7?=
 =?us-ascii?Q?hgZsXW5kCttOV8XOW54cM8yg0ek0QryeNGP2q9dRHkY7lKeGOIIrLwn6f+bI?=
 =?us-ascii?Q?JnOlCd/GCYibwOaNmEoKW9l7TGgmNJR66FdQoAV0snkheRxlYjOkZvKA9E2S?=
 =?us-ascii?Q?cEjT9f64M3l7AZVqEJmChs/fT+gyS/WxekzCBN9BmRQpzRC7ugNuYHUwKBhZ?=
 =?us-ascii?Q?HHB8QQkF7UPvnWiZH5WVFpoIbYzV4L/ez5fU8fUZvguaphpCsHhIN5lV9vWR?=
 =?us-ascii?Q?Ti6x+zUE/O3wN+dnATTPBwAnZhiQJzG0KKkOIhZj2iz3PfLAudF7Vd1F7uSa?=
 =?us-ascii?Q?RnYNlqzDVAoVS+P9JiKtjRHOF12m9wgyZICXCa3o5FPU2xLeZgIWY39GUh+D?=
 =?us-ascii?Q?XbiRR+ioPUD0nkk4TG51qq8gLtUd1z2UcPuwxUCRmRfS3mu+qRb149Huyu2V?=
 =?us-ascii?Q?7n29LGisOCSNMtVri7rVajfmiPheX8QSImqvpE5abzc/djjujAd4etrhTZZj?=
 =?us-ascii?Q?lr35dlkCZnEhzmXmUr4D+NtRIDEyetUWzhwCxqCViUZVzubmOvhQojQo9jJy?=
 =?us-ascii?Q?YfreBALoNmjIn+Hx5AArlMsc3Ajx/luxVX9xFmq7nAq6PstCD0Ks2flF3aNS?=
 =?us-ascii?Q?ZJu+AvvK1/kuapY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6044.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PO/0ABeURue42Ets2KCFUO7KktmfwQrZ6FnBr3W1A+q4h1nt9g8gCfQcZh1q?=
 =?us-ascii?Q?y1OwcxyOl7mPIAMmx0Ycl/xVKEHQzEG3W+Z9XGyIEpUQHv/G144Amhc5OxQL?=
 =?us-ascii?Q?IaAzhusI23FM0fU+TPMI4BHAoFv4Y/gfOIFbbq+0wq0h5UnCUBZhvUNHlY0D?=
 =?us-ascii?Q?M9Xf4R2yyslhtuqOfbXltC59fMdfkPvlGSxxX3GLWgaPoQqovaCr38ycuQrU?=
 =?us-ascii?Q?/c4SvNyVZEE6WHBCNv2ir5LCOaxGu+Wj38q4A71Ear0A/yYaCX2tH6nklWlQ?=
 =?us-ascii?Q?QiTfPduJdTya7zWATR9Z4zHrsz2JeJHdvdWb+HJg+KESbJDV///D5vBceYhT?=
 =?us-ascii?Q?BlteqzJNKKhCPxCnk5dAtORDIygZcEr8kgfFpp9tCHmL+uxY37jFikkNxrVz?=
 =?us-ascii?Q?FrDtNK1ZmklM3RsbeKDFv57Fdpe0dZM41LtkOFky1Wgp+nkCSc0LY+08e9W1?=
 =?us-ascii?Q?0vpFWvX8sJ5UKHFgS1nqrmn6Dl195sfYVfMQPmZgeJOfo5Vwew9rIkbzcfeb?=
 =?us-ascii?Q?kAmzbGT/uztyIaN8WdkJKxFYg0/o3anhNiYrA+wt9ayh38pSrK7UgfSnHpDQ?=
 =?us-ascii?Q?an9Rw4PZ8Lq26yECjlLapzoCi82lANpkDahuGeeowDwX6nh2uUtZLcEXEcwJ?=
 =?us-ascii?Q?Y59SYlnJrlcxO8fBA3vVqqIIgSGMOkhR/yL9qK6A0jAAXN5Ux0fl6gd50YI+?=
 =?us-ascii?Q?AiFMT6AgWkc1aFoRv8EYy+r5n5etx4iO/z36nQhNPIP36mZyI4DrPPfaBlel?=
 =?us-ascii?Q?HEuCN/YPFwKMABdul8JdvDfMRqW02RRasHqtTuiXXVc6udDV7jWcSEWhNLy/?=
 =?us-ascii?Q?TMSpsKrKgGqlIizwUqApo8yiuttz4Q8gkF7tcDVrpoSPSJFQBZcQ2Z3stdo1?=
 =?us-ascii?Q?2BuokgTahvjm18EylMC7IyFOuPUq1gBf9iPiXQlekKv8LbT7wRQr6XkOX3gu?=
 =?us-ascii?Q?2MvS6eBvRyFup6YCImx2YgjhJoA6A1WOYL0nHw0ERx3FgHGjiCGQAkFxfpaZ?=
 =?us-ascii?Q?JD5l8G14A/mERb/ErHJVfyvKj1kaa0WeKpzStLzzpv2/FlF/DjRtkklJR89R?=
 =?us-ascii?Q?THTfDKtTNyMuWYyVRVnq5CxTIKGBCJD3vmEtt2RArM0gLUyUPSZ3Txocqgsq?=
 =?us-ascii?Q?7blwBfwLaDIv9Nbh2WfR1wd+EpluPTkvSlLgWMlP6mljjMyKVC3GW7F/RAQi?=
 =?us-ascii?Q?N5WyQsEvB/HyFAPGgoBiwGVjQO4BHWNQtgfRbOeZYXvNR2x/qeWa+aviNeCG?=
 =?us-ascii?Q?sVG01nj2fZvmYG/OSuMIOxb8fDDsjrAPnrPgy980lEaAoK5XHfRJTkFVXOzt?=
 =?us-ascii?Q?u6qU/8xRPEG7rJRquNSjjyC1xYDbnlCRCHmu+Gl556G9+WkKZCKV0JkS4muv?=
 =?us-ascii?Q?ByIJXaUxl+J9SzWkraw2j2qmujbUioiIgrSejDNs14u8Uh5/wCCM186N0A4d?=
 =?us-ascii?Q?s0QV/oPhJfL6+9xhUfUw2NviZJgHlYSH81uSysgMpukTKKKXG4p0h6IA9Y14?=
 =?us-ascii?Q?vJ9eNjnj4Fvc2zMeAng07I8CPslhNyVSUK5O2sBY7mLSr/AfDxyWL/t10A9j?=
 =?us-ascii?Q?ddlCPgf2tLqJTVtYwVY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6044.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 276273ff-e632-4121-7f20-08dda36c1ee6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 13:31:32.6343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: URynjYb5s0CTzlL8IOWxZXCXQDSiSKgyGhW02/ZOVUFQFCsnIR56cw5J6qYjxxPF49KTQRudQ66YWcZVj4M4HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4439

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

