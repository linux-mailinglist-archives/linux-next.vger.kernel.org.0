Return-Path: <linux-next+bounces-4102-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB3898FD41
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 08:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31CDC1C20F5F
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 06:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D706F305;
	Fri,  4 Oct 2024 06:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Sc9S3YiG"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2086.outbound.protection.outlook.com [40.107.100.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A13E4DA00
	for <linux-next@vger.kernel.org>; Fri,  4 Oct 2024 06:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728022964; cv=fail; b=st04sWLmrXkbJIRKkt9iU8GxRCA7ieKUNkgjetSNQ9iiq++XBNGM2RfzeaqteDJ5P9i+YiyPfVH3FwCpNb/NB/I86CXSQi9n5374YjpHhzyGkUIadUtMN3X2a0C2HaxSUa/YYyKcn0ffwqQcKSdSk+VxTsFiN7sg12HX+gOyPtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728022964; c=relaxed/simple;
	bh=TIFQ90Tvi8iMSmHzlDyKcdIwQ4ngZUf8DWHpIH2cOkw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=q/pUI8Ijc4Gwk1Z3wwufI+zGKAna1pO+1500uDvAtO3NjA8Lluf5x5dkSV1oobYg9CBnW6P6fWA8PI7AOmlZbnoBNSfhDcRQB7FBDj8eFUT1Nsfkdra6vxApl9ORJyFDzE/xijU7/g+620wqLcZNdXv2IkC2VkgcMygrBqFJKAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Sc9S3YiG; arc=fail smtp.client-ip=40.107.100.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dgmrr7Ls8vRHvmSsWyilPZhPydBJLZUl+Z43hYztlSaQyWqPvXzA9CibifGFD7Uif9X9qbD9eWyEonhj9BS/q+izJ074kDad9UQvCaTCzXK3tPzQVbYd5PmohZILrMv/PGO1a7PEm3cxNtX6n53MsVnzK9v9veXEiaxRADjp/4MxghiduHoLGFFHDuM8zGy8GtlOXF6a6fD20Lt9Bzzxda8dZAEno0SODCfj121SORi5ZswxtlPJnEmOFdio0/3Qm2aDXMbSdV7eO7Fo2CLL95numBBymoP9dTJe/7PV74ABUhgxZpelAYHfPaK1frpa5Vvu9je1FNb6a5jlsevoCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3ACckL9QWJMVkZYc5joqBSypoVoyroYEX6tybgisW8=;
 b=UJXpeulrOTGuM9hM/M4AlB4zS2GPzuKbedtYQfuoHrru6/XAFUnB3abZXfciiAWNEIeKnnEDHFWRGN/5bkju4cP5oPGEm68TwPw3ib8TVE+T3tk9zaMWea1lE2xGtdctxOdo7UVQRC+8CH3dnA7nTVM+EMQSpek18oI86uH4NjfDzTezjFoLOV5ioX+ewGoTEKVYIa1Q5aSfEepr1ipgC5PXeZQLLdus0M9bJFufNH8WObfKLaT01AlQCQqfJdLCf/soTp4rFHEM6wTbwV24tNKV1g5egoqHy1/Zgkne3pY/TFxNGr/C1Jv5VgpvS+8DI64Jc4Kxi7p/LblFiDhQHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3ACckL9QWJMVkZYc5joqBSypoVoyroYEX6tybgisW8=;
 b=Sc9S3YiGmR/trFD9S3Wy8aJAJ0YlEP0mME2CONQ9YAXlkDBYJBRiQAnyiETLK1sf1m+QCUVyPhU99JuFVqsRUTbLbvKH4JA9AxSSboDJoliGHCdw/vUcXCONhLGwOeJ9Se6U92V6BtGpZ99bw6sV0qTkCJPlySfQOco1AKcHX5E=
Received: from DM4PR12MB5086.namprd12.prod.outlook.com (2603:10b6:5:389::9) by
 MW4PR12MB6898.namprd12.prod.outlook.com (2603:10b6:303:207::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.18; Fri, 4 Oct 2024 06:22:38 +0000
Received: from DM4PR12MB5086.namprd12.prod.outlook.com
 ([fe80::70cd:b5c2:596c:5744]) by DM4PR12MB5086.namprd12.prod.outlook.com
 ([fe80::70cd:b5c2:596c:5744%7]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 06:22:38 +0000
From: "V, Narasimhan" <Narasimhan.V@amd.com>
To: Linux Next Mailing List <linux-next@vger.kernel.org>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>
CC: Borislav Petkov <bp@alien8.de>
Subject: WARNING: CPU: 43 PID: 2254 at mm/slub.c:4655
 krealloc_noprof+0x2c7/0x300 with next-20241003
Thread-Topic: WARNING: CPU: 43 PID: 2254 at mm/slub.c:4655
 krealloc_noprof+0x2c7/0x300 with next-20241003
Thread-Index: AQHbFiWr6FFoq7Vs+kSCatt2SUYCVw==
Date: Fri, 4 Oct 2024 06:22:38 +0000
Message-ID:
 <DM4PR12MB50866964E5363920F072737589722@DM4PR12MB5086.namprd12.prod.outlook.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-10-04T06:22:38.231Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5086:EE_|MW4PR12MB6898:EE_
x-ms-office365-filtering-correlation-id: 04cbd9e0-6de2-4f30-0b0b-08dce43cf1ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?2Tzc53PTwOwvLWO+n20ad6nzsjNhMGfAWohSYUUWCf1qTNNZS1hAN3TZ2M?=
 =?iso-8859-1?Q?aV9F2auFkXhjuUfPGnhPYaT3I/a9jv9UNkyhGso5uQ0rsKwl0Rwhkc33JA?=
 =?iso-8859-1?Q?NTILdMOA2CnfW1l19HxQBlGNPcQgbjmWMz7IlnrIZEgNfi85+uwc5YvMH8?=
 =?iso-8859-1?Q?+WiCAR9d1NU494eiDlJRs7RoFzYS2Y1PjcWoWx2h9Gmd6bFVIQ1LhOmU6l?=
 =?iso-8859-1?Q?I33Ypr1C3R5INgn+FWKn6De0yvsdbdL2yp4a45gMzNiuk2XYjVS/UjvLj0?=
 =?iso-8859-1?Q?SaGJBaEArzfuVE4y24aWk6q463uhA+B3KuIcuhGiqpaeRdtRy9RnIGje6u?=
 =?iso-8859-1?Q?0OUxDX1iT2VyxFTVTCTes4S7WBGPi536GYaX01/Tk1z4/kbhSL9AQLKmNB?=
 =?iso-8859-1?Q?m9Z5jQ4IAIRe6MEoBLilOW/zQFWOSZaJHx4YSOxbUXUkL/Mr1Jy26xgjTJ?=
 =?iso-8859-1?Q?xnIoBdSxrd+wp3/sQTi7aALPFYiWm4ZB9u1vO4DvTAsoCs/4erNRYOpLPQ?=
 =?iso-8859-1?Q?Ki03lWAa62+q5Q0XVxGP2zfgUMegnBU+ani4HnGpLA8dLhVb9J4xN1UKa8?=
 =?iso-8859-1?Q?oHiZK2hhstSbcHxMk1QOpdvzA/yWf13GdZPkZAYHcnhplEQJ+atLcbmAI5?=
 =?iso-8859-1?Q?HiVBpQXauDoO2R9tFuVKIaLzP7HokcA9VLxgtd1Pr9Mesb1LOxWk0sRMPx?=
 =?iso-8859-1?Q?TFmfQGgjrrSniioYBAEiV/iyAUuzZ5ZXe1WwVM7rHDlecVN7OJLX/NzLih?=
 =?iso-8859-1?Q?NcNBTaXqualRCQMMXgO2djhTEp6GeGmrAyioZdN97pIzRdU/hgx+S0eMEe?=
 =?iso-8859-1?Q?KWoM63W4f5XtzWND4oqfe2guO00iwjROOQ3Pq4TiSW59jmRWllBx0PdEPL?=
 =?iso-8859-1?Q?L68mMyM4YDCDD50ZqfR99fiuYzHL45tKUvJK17s4KNuabLRTTyclR7wrxA?=
 =?iso-8859-1?Q?W37vUgTBe4IG+pxwFk6OYzJSywJ8ezynMPz/neEEiGGlqa3YBP0fmUj6Pe?=
 =?iso-8859-1?Q?2mSYz+HxtUKTWyyaq7/0JyqojrDfrb2UXO8nLxKY74GEzpD4vybW3RPDT7?=
 =?iso-8859-1?Q?a2ZnZyT+aoeA50yjknJgwNi2ojLOjG6yxK1X2hq34i9zqiKq0ItpMYZiQ9?=
 =?iso-8859-1?Q?Fvr0a5hKToKgeY+vQS7hjuOVAP82QSTHLmSr4zWzqrOEa9fx1mOUUJAlui?=
 =?iso-8859-1?Q?KEXx9XNXD8HhAmBS57/lIRIy+jyPU4FfA901MlJPTAFIPcla/vPWO9QOGA?=
 =?iso-8859-1?Q?dsiIgE+7uqG7jMhl97PFAYWRwIfUI5DBkfvOgOsgZzobz4t9lBXnLulDKU?=
 =?iso-8859-1?Q?0QHhOelkIdV6aLqVGa4DJilNKabOegVlEVVDOSDsyWwm4KdWSMrxuBQlYn?=
 =?iso-8859-1?Q?lDhbc4oXXsdyvkW8OAerHzzGRQviMGwg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5086.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/zzmRUby1RTqVkgrmI77OVqkB7xi0/gfZ0ViByBGKwFaJ6H3HXGRTHuKB0?=
 =?iso-8859-1?Q?YekF5lkcz/pFN0J5c8KeTunUtnUabjYtrFwrDncFrDq+8yPFFDwfQT9S5J?=
 =?iso-8859-1?Q?Zgr0elwgmxYbatx4lQg7rmf9zRPHa53oBBnojYjLyIOR3WDMszeKqptvsr?=
 =?iso-8859-1?Q?IFvZ0ojuxqGedD3Vy+Ljz3vIXe/7m5fKxWoNYEV1PwsRW9db3arfi20uiB?=
 =?iso-8859-1?Q?CwjO2l5QSvqbJNq1hRFyNfuYCsi2CodPNqzRaIdsaHI5bDxCw81E1r36pq?=
 =?iso-8859-1?Q?cpoMq0drPbqQ+A+RPyxFxGlTsd/StCzFqP8oCdERpioNbeXctkXDvKJ9Ku?=
 =?iso-8859-1?Q?zb4eMKeC95Sn3OQA/bI+WAM4fr0eLunKE6O1XoYM8JoJZJOrpTB35+5H1R?=
 =?iso-8859-1?Q?Ff6CBHiqIl8QSrMGAyzUxmq45W1Xca11CMR5srXTCzkS/wpVMOB/9TNkY4?=
 =?iso-8859-1?Q?Xv0Ou0RLMnwkOQrlYNPV3mvE2ppl/Uruw47UZbkOt4KNyCQDhi0DQHRJGv?=
 =?iso-8859-1?Q?H2qRwvMlfbbXzpJ7YYuIyDRBT/8q9x1qtWojko9h9IRjLJE/xDK80Mb7v/?=
 =?iso-8859-1?Q?p3i7zKKI9S90VvjF6xrsdFSjF2V43o+y5cJYJnp61FupOQ8yr8rYPnMR34?=
 =?iso-8859-1?Q?zpPt12hOaGriusrEfTot+8zBcd9HbCz1HlK7pn+/PQvQ5OZ9Yw+gKzjz7J?=
 =?iso-8859-1?Q?DaR/keLvVM3af09pjB5NBCWdqvyn1KPSMhlDLKCDZ+IjxK0stcIIincPHk?=
 =?iso-8859-1?Q?kiCeU0ogDAUjY8c3Ppo6awvI2P3S+hOadKrfmDSPmG09uc/Kj/cGuMMwhw?=
 =?iso-8859-1?Q?PmYXNvQ7jjs0S5XeFvHVN7KG4/z35QpcZGojZ074vcKrfRYs49v77uDhTB?=
 =?iso-8859-1?Q?G8BHlz7UFYWXkXbYllAf3NNbMb4NKxLuIXVEiuA05gYkuwJA32kxEmzizp?=
 =?iso-8859-1?Q?XKYglj9sGsbgaoqVia/dbuXZ7nTQ8D5gBEIvwUIs0pA/2QfFZyw7Pwm2gg?=
 =?iso-8859-1?Q?B4tqOiISVg1n3zT3/sC7CNWJ0DMa6uRRIDqU7j3blw6tDoTAZclrUSW8I6?=
 =?iso-8859-1?Q?BjUiLfgA7AmCIrYKDbKEUaMKj9CEbZcr4Qjn0H8rXdbkUIMPEZis9lVHkv?=
 =?iso-8859-1?Q?9Nt+KeEW+1iHP/iICVH/MxN5fi8s3dRelsixBEcYTFWzq8B6XPxs4pSu4n?=
 =?iso-8859-1?Q?orXzBdqTeZRnS1Z4ti5VvRkzYihGex0tbpZ8x6sLfqYQ5p/XHu18U5s1dQ?=
 =?iso-8859-1?Q?MCzFSMlzTB+EmsMogmIdTyMk1KRG7LMakjz/wOI4TQNYDJNvf/t2hRnsT2?=
 =?iso-8859-1?Q?B80i8Or4NRDOVcoPQwaQBR1010t/5rCdyKMLg8IbEIdPh1lwNWoVIYe8qY?=
 =?iso-8859-1?Q?/TbZiysb1nEQb9fGYQOpzGEM1GwNHjD5q5xMivEPJvXoUa9NNcS+hKdUZp?=
 =?iso-8859-1?Q?dtA8ehtrXWkgE3u4Wb9roYrzCkcSSdFbhMZxPACZ9+Z407hHTAA7Dkbq/a?=
 =?iso-8859-1?Q?beQCE1M6adf2cXpQMpJN2vPfl4WI9ixtmYJaxwuhgctqCwtTi7N8zbcWUI?=
 =?iso-8859-1?Q?PhycFgAXCYQpWpOMYTAsOFMw5AlagwnBnJ05wIOe6nyMp/pfKIEkJ5weP1?=
 =?iso-8859-1?Q?2VjLSd/qk5Gw0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 04cbd9e0-6de2-4f30-0b0b-08dce43cf1ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2024 06:22:38.5218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2qHp0ZQaguoVMdWm0IV+JPltq9UzwhklKJxQGdTy7VdFeqFviUuZu0qZJrh+2xR7XC531De09EjgJB994vVFyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6898

[AMD Official Use Only - AMD Internal Distribution Only]

Hi,

Seeing the following bug on boot with next-20241003


[   22.919976] BUG: kernel NULL pointer dereference, address: 0000000000000=
01c
[   22.919976] WARNING: CPU: 43 PID: 2254 at mm/slub.c:4655 krealloc_noprof=
+0x2c7/0x300
[   22.921382] ipmi_si IPI0001:00: IPMI kcs interface initialized
[   22.928902] #PF: supervisor read access in kernel mode
[   22.928905] #PF: error_code(0x0000) - not-present page
[   22.928906] PGD 12e148067 P4D 0
[   22.928910] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
[   22.928913] CPU: 60 UID: 0 PID: 2258 Comm: apparmor_parser Not tainted 6=
.12.0-rc1-next-20241003-1727931325865 #1
[   22.937555] Modules linked in:
[   22.944047] Hardware name: AMD Corporation Shale96/Shale96, BIOS RSH100B=
D 12/11/2023
[   22.944050] RIP: 0010:krealloc_noprof+0x8f/0x300
[   22.949780]  nls_iso8859_1
[   22.955504] Code: 8b 50 08 f6 c2 01 0f 85 14 02 00 00 0f 1f 44 00 00 80 =
78 33 f5 0f 85 0e 02 00 00 48 85 c0 0f 84 05 02 00 00 48 8b 48 08 66 90 <48=
> 63 59 1c 41 89 df 4d 39 fd 0f 87 8c 00 00 00 0f 1f 44 00 00 48
[   22.955507] RSP: 0018:ff6bbed6c1c0b8e8 EFLAGS: 00010202
[   22.955510] RAX: ffe388b6044da000 RBX: 0000000000000001 RCX: 00000000000=
00000
[   22.959108]  amd_atl
[   22.964542] RDX: 0000000000000000 RSI: 000000000000183a RDI: ff4164e8136=
80000
[   22.964545] RBP: ff6bbed6c1c0b918 R08: 0000000000001833 R09: 00000000000=
00000
[   22.964546] R10: 00000000000050c1 R11: ff4164e81368183a R12: ff4164e8136=
80000
[   22.964547] R13: 000000000000183a R14: 0000000000000cc0 R15: ff4164e8268=
00000
[   22.964548] FS:  00007f678de21740(0000) GS:ff4164f70d800000(0000) knlGS:=
0000000000000000
[   22.975899]  intel_rapl_msr
[   22.979296] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   22.979299] CR2: 000000000000001c CR3: 00000001131e4004 CR4: 00000000007=
71ef0
[   22.979300] PKRU: 55555554
[   22.979302] Call Trace:
[   22.979303]  <TASK>
[   22.979306]  ? show_regs+0x6d/0x80
[   22.987946]  intel_rapl_common
[   22.993089]  ? __die+0x29/0x70
[   22.993092]  ? page_fault_oops+0x15c/0x550
[   22.996110]  amd64_edac
[   23.017059]  ? do_user_addr_fault+0x47a/0x7e0
[   23.017062]  ? srso_alias_return_thunk+0x5/0xfbef5
[   23.022892]  edac_mce_amd
[   23.030838]  ? ZSTD_compressEnd_public+0x2c/0x170
[   23.030846]  ? exc_page_fault+0x7c/0x1b0
[   23.033278]  kvm_amd
[   23.041237]  ? asm_exc_page_fault+0x2b/0x30
[   23.041244]  ? krealloc_noprof+0x8f/0x300
[   23.049201]  kvm
[   23.057154]  ? zstd_compress_cctx+0x87/0xa0
[   23.057160]  aa_unpack+0x688/0x700
[   23.065120]  rapl
[   23.074145]  aa_replace_profiles+0x9e/0x1130
[   23.077257]  wmi_bmof
[   23.083666]  policy_update+0xd9/0x170
[   23.091629]  acpi_ipmi
[   23.094639]  profile_replace+0xb0/0x130
[   23.094642]  ? srso_alias_return_thunk+0x5/0xfbef5
[   23.097365]  ccp
[   23.099701]  vfs_write+0xf5/0x410
[   23.099706]  ? srso_alias_return_thunk+0x5/0xfbef5
[   23.099708]  ? putname+0x5b/0x70
[   23.103499]  k10temp
[   23.106897]  ksys_write+0x6b/0xf0
[   23.106901]  __x64_sys_write+0x1d/0x30
[   23.110305]  ipmi_si
[   23.114858]  x64_sys_call+0x1685/0x20d0
[   23.114865]  do_syscall_64+0x6f/0x110
[   23.117579]  ipmi_devintf
[   23.122427]  ? srso_alias_return_thunk+0x5/0xfbef5
[   23.122432]  ? srso_alias_return_thunk+0x5/0xfbef5
[   23.127775]  ipmi_msghandler
[   23.130688]  ? aa_file_perm+0x12f/0x500
[   23.130694]  ? srso_alias_return_thunk+0x5/0xfbef5
[   23.135945]  mac_hid
[   23.140312]  ? srso_alias_return_thunk+0x5/0xfbef5
[   23.140315]  ? do_syscall_64+0x7b/0x110
[   23.142752]  sch_fq_codel
[   23.147409]  ? srso_alias_return_thunk+0x5/0xfbef5
[   23.147412]  ? generic_file_read_iter+0xbf/0x110
[   23.151884]  dm_multipath
[   23.153915]  ? apparmor_file_permission+0x79/0x190
[   23.153919]  ? srso_alias_return_thunk+0x5/0xfbef5
[   23.158586]  scsi_dh_rdac
[   23.162360]  ? ext4_file_read_iter+0x5f/0x1e0
[   23.162366]  ? srso_alias_return_thunk+0x5/0xfbef5
[   23.164505]  scsi_dh_emc
[   23.169262]  ? vfs_read+0x259/0x340
[   23.169268]  ? srso_alias_return_thunk+0x5/0xfbef5
[   23.171799]  scsi_dh_alua
[   23.175866]  ? ksys_read+0x6b/0xf0
[   23.175870]  ? srso_alias_return_thunk+0x5/0xfbef5
[   23.175872]  ? syscall_exit_to_user_mode+0x57/0x1b0
[   23.178501]  msr
[   23.182762]  ? srso_alias_return_thunk+0x5/0xfbef5
[   23.182765]  ? do_syscall_64+0x7b/0x110
[   23.182767]  ? srso_alias_return_thunk+0x5/0xfbef5
[   23.182769]  ? do_user_addr_fault+0x55e/0x7e0
[   23.182772]  ? srso_alias_return_thunk+0x5/0xfbef5
[   23.188116]  efi_pstore
[   23.190155]  ? irqentry_exit_to_user_mode+0x33/0x170
[   23.190159]  ? srso_alias_return_thunk+0x5/0xfbef5
[   23.190160]  ? irqentry_exit+0x3f/0x50
[   23.193860]  ip_tables
[   23.199186]  ? srso_alias_return_thunk+0x5/0xfbef5
[   23.199193]  ? exc_page_fault+0x8d/0x1b0
[   23.202794]  x_tables
[   23.205223]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   23.208919]  autofs4
[   23.213083] RIP: 0033:0x7f678db14887
[   23.213088] Code: 10 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f =
00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48=
> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
[   23.215526]  btrfs
[   23.219797] RSP: 002b:00007ffda7e7dc68 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000001
[   23.219802] RAX: ffffffffffffffda RBX: 000056055a182dc0 RCX: 00007f678db=
14887
[   23.219803] RDX: 00000000000050c1 RSI: 000056055a19e0b0 RDI: 00000000000=
00007
[   23.219804] RBP: 00000000000050c1 R08: 0000000000000000 R09: 000056055a1=
9e0b0
[   23.219806] R10: 0000000000000000 R11: 0000000000000246 R12: 000056055a1=
9e0b0
[   23.223890]  blake2b_generic
[   23.226802] R13: 00000000000050c1 R14: 000056051da91c5b R15: 00000000000=
00007
[   23.226809]  </TASK>
[   23.232152]  raid10
[   23.237488] Modules linked in: nls_iso8859_1 amd_atl intel_rapl_msr inte=
l_rapl_common amd64_edac edac_mce_amd
[   23.240703]  raid456
[   23.244971]  kvm_amd kvm rapl wmi_bmof acpi_ipmi ccp k10temp ipmi_si
[   23.250320]  async_raid6_recov
[   23.252748]  ipmi_devintf ipmi_msghandler
[   23.258095]  async_memcpy
[   23.262363]  mac_hid sch_fq_codel dm_multipath scsi_dh_rdac scsi_dh_emc =
scsi_dh_alua msr efi_pstore ip_tables
[   23.265285]  async_pq
[   23.270625]  x_tables autofs4 btrfs blake2b_generic raid10 raid456 async=
_raid6_recov async_memcpy
[   23.275780]  async_xor
[   23.278691]  async_pq async_xor async_tx xor raid6_pq raid1 raid0 ast dr=
m_shmem_helper i2c_algo_bit drm_kms_helper crct10dif_pclmul
[   23.284046]  async_tx
[   23.289383]  crc32_pclmul ghash_clmulni_intel nvme sha256_ssse3 drm tg3 =
sha1_ssse3
[   23.292308]  xor
[   23.297157]  ahci i2c_piix4 nvme_core libahci i2c_smbus wmi aesni_intel =
crypto_simd cryptd
[   23.302509]  raid6_pq
[   23.305326] CR2: 000000000000001c
[   23.309217]  raid1
[   23.314552] ---[ end trace 0000000000000000 ]---

--
Regards
Narasimhan V

