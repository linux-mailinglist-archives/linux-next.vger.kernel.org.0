Return-Path: <linux-next+bounces-3516-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0CF967727
	for <lists+linux-next@lfdr.de>; Sun,  1 Sep 2024 17:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 339C81C20BC2
	for <lists+linux-next@lfdr.de>; Sun,  1 Sep 2024 15:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC723FC7;
	Sun,  1 Sep 2024 15:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jW1pUqoq"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E389F2AE69
	for <linux-next@vger.kernel.org>; Sun,  1 Sep 2024 15:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725202893; cv=fail; b=H9aUbfL+f4elSv1A0Ifp+OE89JY5oT2Un4x+NGBwOYOQ4D33yQ6qUWnvBvl35Z556Ws2H+BrObLESeWyWYOjc6xFhc1/m10ybqwYSZ6t/px4lw58+ZWYc8nmwYqOJ0uY4UuAfFS4PbdekxGpU6NAiuQkuSCt+Wd/BkQZDAOyE/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725202893; c=relaxed/simple;
	bh=APLAsxKlTgWJGfUl5GeOwYs0PDceVO29dDEtVvsLOOI=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=s0CJAGfmvWypr/8lxCAKTkVP9Wt3bq2nRdQBF0HWgM1fU+EAFvUif45HA7j8Z3GrZgkGZGVD6nTw6nBW3rIdsEfPaV9+Fo/6xaYEdcz9uqV6dumEZa/vxf+pmbaSvRE4pThK0KuOE1ODAQV6GoTTuo7Yc5WjCeku2o71Y/Ey1nM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jW1pUqoq; arc=fail smtp.client-ip=40.107.220.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tn513hqMFkfQ+mzpQg8Ls81QeJxlsfVSEsdf4Evun6rkM9fiKVFAhKNSVWMUSEZY9HjfqgLZ/Ocvo9nYZIDDJ2tAlJsQGXUGTOZyv30JTsCRZeiuKo/zGMkae2rsOzey1PqGZUEZKD6h71Y9S8GCSbb9RkTYi60lJUVS6ZQewNIBtZJnxAdD3G+/G618MuWfhcDgEUeo13qn2xq/Zn5CRMgIoUZFNVmoojyIQsyDwxSGcGYUfdmrHxlfswQBA65J+x5Xw1FK9NgQbCTLuwuCHfvNhU1AdY3HRKlzU6eojJFJb38EhEtGqT+n0uldT9a0VBPDSTLxffJ6RUFJfUXHvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5cyWXWYryBoDsTQRkEELKsbO6o989V0fqV9qC9gH7M=;
 b=cK7fCn0BJ9FwV3BnM4wWd/KyvVR4E/0tSjNl2QC2uDHpNR6Vdbeqi2Y+mAXVfXnwTmYMACxi9yxmosr385TisPDC7okZBPGOnbGra5JqYmc7eUOgR5YZA0Qvt8AltjrKiyiwW20YG6LaJhmV/gTqkGmPV1UL84WsZ7WQr3m5dN/k13BPbvvfXbG19/+J/WDVWHSAUVFws/p55Tr83Vp/xX0wY2iexbEDr98GxXzMg5333sPXfq5IP87mW3zlWTUcC0fkeH3ZxhMvGRLYJKeEynkspEkjCAQlT2cHKegWPewtaO48Mo57tutFsKmMMXyMqqULxrzsr8cHEXLK/6TwQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5cyWXWYryBoDsTQRkEELKsbO6o989V0fqV9qC9gH7M=;
 b=jW1pUqoqcvDsOmiQBy9sIo+Vcb4IXudF+y3t+aqfMRdOHNMhaOp7A5fLsZNRZqRaI4fTAJTNYtEkdf14gYa1VE4mppkbNBYT0lcqll3uDh3DbyFahdldy23nwrxlXVFRY6R0jueXFXyf+t+RId3/2adVjeDAOnUtT9Df4dnu5Og=
Received: from DM4PR12MB5086.namprd12.prod.outlook.com (2603:10b6:5:389::9) by
 SJ0PR12MB8615.namprd12.prod.outlook.com (2603:10b6:a03:484::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Sun, 1 Sep
 2024 15:01:29 +0000
Received: from DM4PR12MB5086.namprd12.prod.outlook.com
 ([fe80::70cd:b5c2:596c:5744]) by DM4PR12MB5086.namprd12.prod.outlook.com
 ([fe80::70cd:b5c2:596c:5744%7]) with mapi id 15.20.7918.020; Sun, 1 Sep 2024
 15:01:28 +0000
From: "V, Narasimhan" <Narasimhan.V@amd.com>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
CC: "Petkov, Borislav" <Borislav.Petkov@amd.com>
Subject: BUG: kernel NULL pointer dereference, address: 0000000000000000 on
 boot with linux-next-20240829
Thread-Topic: BUG: kernel NULL pointer dereference, address: 0000000000000000
 on boot with linux-next-20240829
Thread-Index: AQHa/H4CjONKFts4p02AajOgrb3fMg==
Date: Sun, 1 Sep 2024 15:01:28 +0000
Message-ID:
 <DM4PR12MB5086C89FD0EAF070D167733389912@DM4PR12MB5086.namprd12.prod.outlook.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-09-01T15:01:28.459Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5086:EE_|SJ0PR12MB8615:EE_
x-ms-office365-filtering-correlation-id: 0647ab96-06e9-4c36-5ea9-08dcca96f51c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?byfD9ouNRcNkzlufoaH9/HLIc3rIasIJRO4ZVnVYFlzHIRkGPxSE4tyIR5?=
 =?iso-8859-1?Q?rzJ6M92l1pJ9ZOX8at8WXiWh79oUe29h9DbJKJSNFwLE2UKKLwv4KkHh+s?=
 =?iso-8859-1?Q?8Wat6eBeWrQ1bZG4ZAfDP6LpCvfEDi6c605jaqtgD93SEg+Zi1G+NDHFQ3?=
 =?iso-8859-1?Q?6VPHUsjzD1LLAXfF18oaDdEL/Qpo73xWtEMPPNc8pCmwUfYqsTritGn6GL?=
 =?iso-8859-1?Q?18PjWPH8mtZ9x+o2gTF4QCb3mpKvVHMTDUEZ6LfHOgMigCWRKhOd9ay/tE?=
 =?iso-8859-1?Q?IRtlTnYLVrk7NAVgvrMTmzKb3VJ7ze+MQBxKy+PH+GaP/Qnx+6LRtmufg+?=
 =?iso-8859-1?Q?eyvta8Cwgh/Hs7jwJBwe0oBarLOEvuxdIMM18BYl1TD6qf9Q9U6ozebzPM?=
 =?iso-8859-1?Q?SYDCFbRHgv4iv+lWmepdUumkPD/A09h1CIxeUOxRErof4Px0ifRhNtngdE?=
 =?iso-8859-1?Q?8zOL4o91lXHEF5EZCNpbJffgyFvlw7xmDsCV0ihp+O2I9zcUvnMG3rugBU?=
 =?iso-8859-1?Q?HbyBIUVTzEdJYmVC+V18jWs5uTS3/DYXChc+R6WkNj8Df2C0wMcGk/qOwk?=
 =?iso-8859-1?Q?b0okTk3o+n8gC8EXSvlOIZgiEJP7SPbNNjdV5FsKg+GJr7lnj2qolKJo35?=
 =?iso-8859-1?Q?seoFNKxMHhyufZ8wGmlUpiHsl+galOp/78u65/chn8/rzIs6QXDHH9Y84C?=
 =?iso-8859-1?Q?GlDJ6FltGuhYZgZACLa6NCobqkQ271kW/KLadW4HkvPENLC2/dz5rsUpe+?=
 =?iso-8859-1?Q?sAjf9pxIJ5+/s1h4Yw96+kvyNQ4c0SltytuM6gdvvFctYV95MXuuSlIaf9?=
 =?iso-8859-1?Q?yWMpLZMpytj9MsAWAQh7GXKuNdnt5NgWLokJl/XoyVUwZNarDqIc2xHVzN?=
 =?iso-8859-1?Q?uZubbtLrUxk7sca+0KW+PuteDiTzNX9u424RYPQik+4OXsTr9TMPfkCHCH?=
 =?iso-8859-1?Q?R+O8v//sV/Pd6zwGSf29lHq2Fr9a0FRxCXIh+muhTztqjYmJLb/fitdwxk?=
 =?iso-8859-1?Q?PXzPaXIlql1vmIBKnL9L8pbsIOvQweMF56+D9Kw3gUNgSiVosfAnk8373w?=
 =?iso-8859-1?Q?O8CgRN5ENGFcyHsTX5wo+nHAeWH0lS/G2+RWIIlRVYIVf9J7GF4E8Cn/bm?=
 =?iso-8859-1?Q?oTewuWQwmgr/aoqwynT7mKk5/9wYeS2xAgBNXNnOoMz1PHP2OUqj9mxGwo?=
 =?iso-8859-1?Q?xIpc/HtdwwR49LmyeB8zxeh3fMb0htCUY8FYN9iMvScURHFoy7A46fOKgn?=
 =?iso-8859-1?Q?hqd9WooYFcs74IWNXwk04uRwddg4TUOVt8mkg17oZo2xc2BfeYuoO+0Ofh?=
 =?iso-8859-1?Q?SshVG9vMgGSAph37r8w06icidhUOGUL8vLHcHknOZ6TzQiXJ0XXT28SSnw?=
 =?iso-8859-1?Q?i1R3368lra3ZAy0SgOFXAhXkpa+ydV+e8vUGUdoqgBtwiBnrFfWSlYOGxY?=
 =?iso-8859-1?Q?Vl484P278GwOg4Bfl8bMGE+js6mC5l+t69r4wA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5086.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?6X3IXasqmrvJz42KaQvvlwFR4k7TsMKU9Hj20cWh31c1kLLmuZ4biApyGY?=
 =?iso-8859-1?Q?mXZw6R6iMxOS2Knf9/6xgsYfAwDwDcZlLyoreldYS7HbWq79kFDoBTGMvs?=
 =?iso-8859-1?Q?3bmXfkqr6QQnbcbXlOAdUWchqLacevSWM/tMd20WMtHy4NQi6D7wbfUzKD?=
 =?iso-8859-1?Q?pFviU1oghUwiDXD/9EUNFlvCJNq91bCAtsCqW4NpRxb8yAM+DyvcPKfBrS?=
 =?iso-8859-1?Q?zwrEin3B7hfoGYFV60zGFsx5XcCs1Nr6/LieWZUj4+weTYVQup2EFIg6XQ?=
 =?iso-8859-1?Q?XTC7JX+YHEv2ZgRcawK7O73ABHFpgUE7lCPP0b4bCmHja4I0dZaedUlcIc?=
 =?iso-8859-1?Q?zKEfsuKMMe7jB5OkP0tuyVqHQd+dY+r44hsUrcjv1zqkzG3MrCYoVhSBxC?=
 =?iso-8859-1?Q?yRyvSGALH3YwZummvWVntc3sqgnxH/MIBmPexrhxE9c+MoFn/obMt/lz2I?=
 =?iso-8859-1?Q?TFdO/ILLe8tJIQiwDtCDi2uQ9SQhnj/XEf5LyaDUWWdHIprs8TRhxbo9OP?=
 =?iso-8859-1?Q?MMtUE43PYx/11X8CyZFfoSNjy3IyuhiM4zDq+bLMNhcc9az4oPlBSSpFVr?=
 =?iso-8859-1?Q?zZE2ZYqZRLFoeu1s0GQB4drVauvywbP7LYbJVOyU9sK1eQrDRULsznjMcB?=
 =?iso-8859-1?Q?vUa6J/6Rjtf9uP4yW8CoX88lVtoTbnYmTBalolg+EChWGo6gfmar7ybtzd?=
 =?iso-8859-1?Q?7oTvj7lljHmt8b0DQnQMdEpHHBUlw47yjBCrZ2fNjtJjUhB8x+2myVd34m?=
 =?iso-8859-1?Q?Bnktqf53WM4hTWOSZx2TEMzcZD6qFp11FDCyGlqIp4ekM4EWTQkPBLpnGF?=
 =?iso-8859-1?Q?S8h6woKKRzT/dmfys9ZQ65ZutzMuN/9PKl2vKXkFLkYgrxa6SIg3zdkXT4?=
 =?iso-8859-1?Q?dw9DPzOKSGCHWeUWfxhHWbksPjTIrdWiMPm/SoCedwz4PQe8EbBhIF6a4a?=
 =?iso-8859-1?Q?Fj2gIannrV+i6A2GuN1c5xZtNBCyvWQtGGtHQKHyxdXLrebb2goKIzzbia?=
 =?iso-8859-1?Q?OAY6QNt5RVn99kkMrRTijahtO9nr/61m608SObI/wPq4fHs+AQEi8kOVOy?=
 =?iso-8859-1?Q?0zWTON+vrRLn/wtGS+tbrqnIc1M3mD5yEm9hXyaAt/syq4v4P9oHKLltCE?=
 =?iso-8859-1?Q?BCxTFNSzaekeotYhWeYLZCXbhOyR/rro1rBpA4ywqNZWwBAytG7VyCyA0X?=
 =?iso-8859-1?Q?rFUh2k1SKj0uLjcwIyU1Bn3HBnavX2enc6uJA8NQFU+NY3026BxPhtD2aI?=
 =?iso-8859-1?Q?xbrxPHcodebyTdC/nfVGbXBejhpVC/fB+o/d/RkyhfMd7N88WJkhQHAKiq?=
 =?iso-8859-1?Q?ItL4N/HWD/FO2z1BkjGMwrUGGlbAKCwLoe5aK19R88SkFdOv/WpZtZ+5Xx?=
 =?iso-8859-1?Q?uHtDHLIHyQnxykN4JCCQ6eTp0U3yaPOqIP8UznlsHiGAPo8HmVIv3vZb2s?=
 =?iso-8859-1?Q?rQ8KFW+LQ8ZS5VWf8zh5UZYsjV06/5Jo+WZ2nFv03287Cev/AE8NlxLqhc?=
 =?iso-8859-1?Q?3xcQKRZHPYtQ/PKZSjGGfX0kYfSbyTkivBkBt4PvZwD7tFNAHJ+CRdNDmM?=
 =?iso-8859-1?Q?W6xtSm3dIKveFU1c2WQmmLwb4jKfhXTuwxjF6mSTK9+wfk0d6cYEhOpKpN?=
 =?iso-8859-1?Q?u0dfoLS/yypHM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5086.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0647ab96-06e9-4c36-5ea9-08dcca96f51c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2024 15:01:28.5635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZgfBh1dNlh6/8ZaJhgaZISAvYh+1p/ufQcVA0JrqyRglX27KXPjv/rBPKlgMl+ZsaTuMxtuHixiqTP22WRrdUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8615

[AMD Official Use Only - AMD Internal Distribution Only]

Hi,

Seeing the following warning and bug on boot with linux-next-20240829

WARNING: CPU: 0 PID: 8 at drivers/video/fbdev/core/fbmem.c:467 unregister_f=
ramebuffer+0x45/0x160
BUG: kernel NULL pointer dereference, address: 0000000000000000



19:07:54  [   18.395285] WARNING: CPU: 0 PID: 8 at drivers/video/fbdev/core=
/fbmem.c:467 unregister_framebuffer+0x45/0x160
19:07:54  [   18.406264] Modules linked in: ast(+) i2c_algo_bit drm_shmem_h=
elper crct10dif_pclmul crc32_pclmul drm_kms_helper ghash_clmulni_intel sha2=
56_ssse3 drm tg3 nvme sha1_ssse3 ahci i2c_piix4 libahci i2c_smbus nvme_core=
 aesni_intel crypto_simd cryptd
19:07:54  [   18.430347] CPU: 0 UID: 0 PID: 8 Comm: kworker/0:0 Not tainted=
 6.11.0-rc5-next-20240830-1725196918033 #1
19:07:54  [   18.440929] Hardware name: AMD Corporation Shale96/Shale96, BI=
OS RSH100BD 12/11/2023
19:07:54  [   18.449572] Workqueue: events work_for_cpu_fn
19:07:54  [   18.454435] RIP: 0010:unregister_framebuffer+0x45/0x160
19:07:54  [   18.460267] Code: 83 ec 08 e8 7d 4a 76 00 49 63 44 24 04 83 f8=
 1f 77 18 48 83 f8 1f 0f 87 d6 00 00 00 4c 3b 24 c5 80 76 a7 83 0f 84 85 00=
 00 00 <0f> 0b 49 8b bc 24 d0 01 00 00 48 85 ff 74 0b 41 f6 84 24 ec 01 00
19:07:54  [   18.481224] RSP: 0018:ff56f06f800efb50 EFLAGS: 00010286
19:07:54  [   18.487058] RAX: 0000000000000000 RBX: ff2d2a8913c77a40 RCX: f=
f2d2a8913c77400
19:07:54  [   18.495023] RDX: ff2d2a8900956000 RSI: ff2d2a8913c77428 RDI: f=
fffffff83918360
19:07:54  [   18.502987] RBP: ff56f06f800efb68 R08: ffffffff82dce06a R09: 0=
000000000000010
19:07:54  [   18.510950] R10: ff2d2a8913cfc2b0 R11: 0000000000000004 R12: f=
f2d2a8913cffc00
19:07:54  [   18.518911] R13: ff56f06f800efbd0 R14: ff2d2a8913cfc010 R15: 0=
000000000000202
19:07:54  [   18.526873] FS:  0000000000000000(0000) GS:ff2d2a980ba00000(00=
00) knlGS:0000000000000000
19:07:54  [   18.535903] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
19:07:54  [   18.542312] CR2: 0000558d19347c98 CR3: 000000011827a006 CR4: 0=
000000000771ef0
19:07:54  [   18.550275] PKRU: 55555554
19:07:54  [   18.553293] Call Trace:
19:07:54  [   18.556016]  <TASK>
19:07:54  [   18.558354]  ? show_regs+0x6d/0x80
19:07:54  [   18.562153]  ? __warn+0x91/0x140
19:07:54  [   18.565756]  ? unregister_framebuffer+0x45/0x160
19:07:54  [   18.570917]  ? report_bug+0x193/0x1a0
19:07:54  [   18.575008]  ? handle_bug+0x63/0xa0
19:07:54  [   18.578901]  ? exc_invalid_op+0x1d/0x80
19:07:54  [   18.583181]  ? asm_exc_invalid_op+0x1f/0x30
19:07:54  [   18.587842]  ? unregister_framebuffer+0x45/0x160
19:07:54  [   18.592994]  devm_unregister_framebuffer+0x12/0x20
19:07:54  [   18.598338]  devm_action_release+0x16/0x20
19:07:54  [   18.602910]  release_nodes+0x47/0xc0
19:07:54  [   18.606898]  devres_release_all+0x9f/0xe0
19:07:54  [   18.611371]  device_unbind_cleanup+0x12/0x80
19:07:54  [   18.616136]  device_release_driver_internal+0x20c/0x250
19:07:54  [   18.621967]  ? srso_alias_return_thunk+0x5/0xfbef5
19:07:54  [   18.627315]  device_release_driver+0x16/0x20
19:07:54  [   18.632079]  bus_remove_device+0xcf/0x130
19:07:54  [   18.636551]  device_del+0x16a/0x3c0
19:07:54  [   18.640444]  ? srso_alias_return_thunk+0x5/0xfbef5
19:07:54  [   18.645791]  platform_device_del.part.0+0x18/0x90
19:07:54  [   18.651042]  platform_device_unregister+0x24/0x40
19:07:54  [   18.656303]  sysfb_disable+0x5c/0xa0
19:07:54  [   18.660296]  aperture_remove_conflicting_pci_devices+0x33/0x14=
0
19:07:54  [   18.666907]  drm_aperture_remove_conflicting_pci_framebuffers+=
0x19/0x20 [drm]
19:07:54  [   18.674886]  ast_pci_probe+0x2c/0x540 [ast]
19:07:54  [   18.679556]  ? srso_alias_return_thunk+0x5/0xfbef5
19:07:54  [   18.684904]  local_pci_probe+0x4c/0xb0
19:07:54  [   18.689087]  work_for_cpu_fn+0x1b/0x30
19:07:54  [   18.693271]  process_one_work+0x17a/0x3b0
19:07:54  [   18.697745]  worker_thread+0x2a0/0x3a0
19:07:54  [   18.701927]  ? __pfx_worker_thread+0x10/0x10
19:07:54  [   18.706688]  kthread+0xe5/0x120
19:07:54  [   18.710192]  ? __pfx_kthread+0x10/0x10
19:07:54  [   18.714375]  ret_from_fork+0x3d/0x60
19:07:54  [   18.718363]  ? __pfx_kthread+0x10/0x10
19:07:54  [   18.722544]  ret_from_fork_asm+0x1a/0x30
19:07:54  [   18.726923]  </TASK>
19:07:54  [   18.729359] ---[ end trace 0000000000000000 ]---
09:13:40  [   18.100937] BUG: kernel NULL pointer dereference, address: 000=
0000000000000
09:13:40  [   18.108694] #PF: supervisor read access in kernel mode
09:13:40  [   18.114424] #PF: error_code(0x0000) - not-present page
09:13:40  [   18.120153] PGD 1156fa067 P4D 0
09:13:40  [   18.123751] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
09:13:40  [   18.129194] CPU: 0 UID: 0 PID: 458 Comm: kworker/0:2 Tainted: =
G        W          6.11.0-rc5-next-20240829-1725075030567 #1
09:13:40  [   18.141618] Tainted: [W]=3DWARN
09:13:40  [   18.144922] Hardware name: AMD Corporation Shale96/Shale96, BI=
OS RSH100BD 12/11/2023
09:13:40  [   18.153551] Workqueue: events work_for_cpu_fn
09:13:40  [   18.158412] RIP: 0010:fb_destroy_modelist+0x1a/0x70
09:13:40  [   18.163853] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90=
 90 f3 0f 1e fa 0f 1f 44 00 00 55 48 89 e5 41 56 41 55 41 54 49 89 fc 53 48=
 8b 3f <48> 8b 1f 49 39 fc 74 36 49 be 00 01 00 00 00 00 ad de 49 bd 22 01
09:13:40  [   18.184809] RSP: 0018:ff42b545c14e7b20 EFLAGS: 00010246
09:13:40  [   18.190638] RAX: 0000000000000000 RBX: ff2cd8a142f7ce00 RCX: f=
f2cd8a142f7cf00
09:13:40  [   18.198597] RDX: ff2cd8b088b74000 RSI: ff2cd8a142f7cf28 RDI: 0=
000000000000000
09:13:40  [   18.206557] RBP: ff42b545c14e7b40 R08: ffffffff907cca2c R09: 0=
000000000000010
09:13:40  [   18.214520] R10: ff2cd8a142fb06b0 R11: 0000000000000004 R12: f=
f2cd8a142fb5288
09:13:40  [   18.222480] R13: ff42b545c14e7bd0 R14: ff2cd8a142fb0410 R15: 0=
000000000000283
09:13:40  [   18.230440] FS:  0000000000000000(0000) GS:ff2cd8b046600000(00=
00) knlGS:0000000000000000
09:13:40  [   18.239466] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
09:13:40  [   18.245874] CR2: 0000000000000000 CR3: 00000001156cc005 CR4: 0=
000000000771ef0
09:13:40  [   18.253836] PKRU: 55555554
09:13:40  [   18.256851] Call Trace:
09:13:40  [   18.259573]  <TASK>
09:13:40  [   18.261901]  ? show_regs+0x6d/0x80
09:13:40  [   18.265695]  ? __die+0x29/0x70
09:13:40  [   18.269098]  ? page_fault_oops+0x15c/0x550
09:13:40  [   18.273664]  ? unregister_framebuffer+0x45/0x160
09:13:40  [   18.278813]  ? srso_alias_return_thunk+0x5/0xfbef5
09:13:40  [   18.284157]  ? vprintk+0x3f/0x70
09:13:40  [   18.287755]  ? srso_alias_return_thunk+0x5/0xfbef5
09:13:40  [   18.293097]  ? _printk+0x5c/0x80
09:13:40  [   18.296699]  ? do_user_addr_fault+0x47a/0x7e0
09:13:40  [   18.301559]  ? __warn+0xbc/0x140
09:13:40  [   18.305158]  ? unregister_framebuffer+0x45/0x160
09:13:40  [   18.310307]  ? exc_page_fault+0x7c/0x1b0
09:13:40  [   18.314680]  ? asm_exc_page_fault+0x2b/0x30
09:13:40  [   18.319347]  ? fb_destroy_modelist+0x1a/0x70
09:13:40  [   18.324107]  unregister_framebuffer+0x6c/0x160
09:13:40  [   18.329063]  devm_unregister_framebuffer+0x12/0x20
09:13:40  [   18.334408]  devm_action_release+0x16/0x20
09:13:40  [   18.338978]  release_nodes+0x47/0xc0
09:13:40  [   18.342965]  devres_release_all+0x9f/0xe0
09:13:40  [   18.347436]  device_unbind_cleanup+0x12/0x80
09:13:40  [   18.352196]  device_release_driver_internal+0x20c/0x250
09:13:40  [   18.358024]  ? srso_alias_return_thunk+0x5/0xfbef5
09:13:40  [   18.363367]  device_release_driver+0x16/0x20
09:13:40  [   18.368128]  bus_remove_device+0xcf/0x130
09:13:40  [   18.372599]  device_del+0x16a/0x3c0
09:13:40  [   18.376488]  ? srso_alias_return_thunk+0x5/0xfbef5
09:13:40  [   18.381837]  platform_device_del.part.0+0x18/0x90
09:13:40  [   18.387086]  platform_device_unregister+0x24/0x40
09:13:40  [   18.392330]  sysfb_disable+0x5c/0xa0
09:13:40  [   18.396316]  aperture_remove_conflicting_pci_devices+0x33/0x14=
0
09:13:40  [   18.402921]  drm_aperture_remove_conflicting_pci_framebuffers+=
0x19/0x20 [drm]
09:13:40  [   18.410899]  ast_pci_probe+0x2c/0x540 [ast]
09:13:40  [   18.415566]  ? srso_alias_return_thunk+0x5/0xfbef5
09:13:40  [   18.420914]  local_pci_probe+0x4c/0xb0
09:13:40  [   18.425095]  work_for_cpu_fn+0x1b/0x30
09:13:40  [   18.429277]  process_one_work+0x17a/0x3b0
09:13:40  [   18.433746]  ? __pfx_worker_thread+0x10/0x10
09:13:40  [   18.438507]  worker_thread+0x2a0/0x3a0
09:13:40  [   18.442685]  ? __pfx_worker_thread+0x10/0x10
09:13:40  [   18.447445]  kthread+0xe5/0x120
09:13:40  [   18.450946]  ? __pfx_kthread+0x10/0x10
09:13:40  [   18.455125]  ret_from_fork+0x3d/0x60
09:13:40  [   18.459112]  ? __pfx_kthread+0x10/0x10
09:13:40  [   18.463293]  ret_from_fork_asm+0x1a/0x30
09:13:44  [   18.467673]  </TASK>
09:13:44  [   18.470106] Modules linked in: ast(+) i2c_algo_bit drm_shmem_h=
elper crct10dif_pclmul crc32_pclmul drm_kms_helper ghash_clmulni_intel sha2=
56_ssse3 drm sha1_ssse3 nvme i2c_piix4 tg3 ahci nvme_core i2c_smbus libahci=
 aesni_intel crypto_simd cryptd
09:13:44  [   18.494181] CR2: 0000000000000000
09:13:44  [   18.497876] ---[ end trace 0000000000000000 ]---

--
Regards
Narasimhan V


