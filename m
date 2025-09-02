Return-Path: <linux-next+bounces-8161-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAACB3F476
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 07:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5D364830D6
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 05:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4642367A8;
	Tue,  2 Sep 2025 05:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lgq1t5z0"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DD154652;
	Tue,  2 Sep 2025 05:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756790708; cv=fail; b=FlGSZ1vnAOdBkp3olRPtCVD7a68g36X/+XRT7ZAa0pzXe9re98SZ8G7fmnk6aibEfe+gR34eQKYsY5SW5Fjuh7cY0L4ZZF60303M/qI2BlBKHJ/5H70xZwiDuMULOL3QNFYWpNs7Wb87a0DBCU4ACUYqkEv6WtzMBsEjL87/Vas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756790708; c=relaxed/simple;
	bh=ZEl3PKCILlfaWUQPvkB7NCeR7Ub0cYv2EfsReduK9+M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=drjDvJf91tINl8swHgDj4huEEWdmyYcs5jZUOXwB/CI1pFCkXPnBKmngyIm8EkX1iTU5INpXyd7ft6v5Bg9UvFTFwZaJiDnCa/WlGReqjwuNqjcBYlzOOufONLdBWgAM4gThRozwJj4sPly8Ab/vaAXiz2w5KWjZG4PBhs5g1dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lgq1t5z0; arc=fail smtp.client-ip=40.107.223.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFwGarP8tqhEq1fp4Vs6OAu4qcsvImo6/hC+9ymtBPiBnoB4ws9txwyMHzKcqzZviZhiOiUrMTkGTp9hROHMH4KYpsjsZB2VPWYpabMJivHnPUV0rc5A6VHs8e7kPbZCcDzRACRdNrn9e5d9Um/1MUow2ePz6zy4oAITEwlRy3L01p3gA2qsRhKHa6k/CSgrpAuRciA1/uq6u/B9q1FZvMEfn1COCTAXMvWXApklye+5AQUHBqf5bQWwcdoFsTwWTYNpzA9woVcVl5lSa2qkr2ILWZauUO5D7+1t5oYT5miVDeN7osQfWcujhxHLZujlr4ZyRjbuvTY+uS+BqmgduQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcJVnvNXDoOE/E6Witao8dzX8AXdG0IZJ5nin7bVAvU=;
 b=vxNEjXtebAGNI5wBhJJI5LnAGSSr/Y7UwbotraIM57RXRqCm+i47DohiihUvNamXdVvrW2MVcaatAMICs2Ht/jLWDipiJUZHuVM9pwp75EzoFBBMXNPse3x4h3YUuSayPwLzLD4P8uaMC+vhxRLUrnYbasn+j+hPTNP50EV8fFR6x84aKzahd8YBPXZA/1cfUKfdsC5sY0s3D+wG74s38BZy0/FGJsKtzXu6BBH/tNl50bCJ1M84bLyVkKtfRW/fQc6nAHYCcpcXrNaBdm0fjf0N1TyJk2J9DXSqO62Kz0JUVYSt/iKmJSzYNRy6Xe3VbzQJYQfQ27cJlYWvOF0jtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcJVnvNXDoOE/E6Witao8dzX8AXdG0IZJ5nin7bVAvU=;
 b=lgq1t5z0qnzEBz0L9HSzKGBvKDpWUZrYeIElhZJs8DTAWhTjAFpg9iBSkZ9PI85iGOomRK85QIUSzMT7X/yQFo60AYFXqiDm2bWRusi7elp3PzzmY/tAnzEhQVCscZ+HJ9hMJDxooZC6hv97DnxJ7bNSripGv0pztoqO/1ftt+k=
Received: from IA0PR12MB7699.namprd12.prod.outlook.com (2603:10b6:208:431::7)
 by DS7PR12MB8274.namprd12.prod.outlook.com (2603:10b6:8:da::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 05:25:04 +0000
Received: from IA0PR12MB7699.namprd12.prod.outlook.com
 ([fe80::7ed1:80d:75c:f1aa]) by IA0PR12MB7699.namprd12.prod.outlook.com
 ([fe80::7ed1:80d:75c:f1aa%3]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 05:25:04 +0000
From: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Richard Weinberger
	<richard.weinberger@gmail.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: RE: linux-next: build failure after merge of the mtd tree
Thread-Topic: linux-next: build failure after merge of the mtd tree
Thread-Index: AQHcG66M21g6xJzqekGC7jopSx4PyLR/V4Sg
Date: Tue, 2 Sep 2025 05:25:04 +0000
Message-ID:
 <IA0PR12MB76998C672B82567715227485DC06A@IA0PR12MB7699.namprd12.prod.outlook.com>
References: <20250902120852.3dd6f0d6@canb.auug.org.au>
In-Reply-To: <20250902120852.3dd6f0d6@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-09-02T05:07:12.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB7699:EE_|DS7PR12MB8274:EE_
x-ms-office365-filtering-correlation-id: 36ac81ce-b62f-4da1-64c8-08dde9e1126f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Cw1pnkQiKOYdF5W/uCF9nt9kSA7oeeiX4DOUfi5O6HIRSs6RpTTJGr+JrYPX?=
 =?us-ascii?Q?+retGD4/Sz917QdkgCHWa71pYDT2kDs6yA2y+jdMHW+D275354cZhRtII0Cq?=
 =?us-ascii?Q?/0nNTwzk573CiYkIKf3/12boc6T93gbnziyLHkkldbAObqFuooYk4ZRVIVZU?=
 =?us-ascii?Q?MqWSQvmGIAePi9RJlUlXta4XPeo8Aqg5gqsAJm4y4NbOZ9jhZz+5S/2N2HoD?=
 =?us-ascii?Q?meYofDb6KZj47dXaU0vbQg6ulH+fVdWC8CCI6G95W6j5CinGAGZyqGaXRSFK?=
 =?us-ascii?Q?MWfRFSlRbgsRbAJof/YdaddRzeAzOTgo2SfKoNbl4WbD4B6lvnydJZRDEguz?=
 =?us-ascii?Q?NnwXkLkYmmZnGC/uqobZ9HEJewLpZjXvP5Q7EH4UAuG53lBoh6NCbyWjTU3/?=
 =?us-ascii?Q?fBdNDLcCWHrNeJq3Az2lkhqxwF6xlllRb2jGXryUy6qRlqbtnBb78d15a/Kq?=
 =?us-ascii?Q?C0LYnXNDM/vJFAPKLNTFHLJ/592j0+HJcypaJCSo9roKfAo/79zrgR68Mu3w?=
 =?us-ascii?Q?GRNhrfIfbfDCaEv/vuTwRCJCE0TlbSxGZrG0iYYbfr4k+tTqhuK3Zvl8mbjE?=
 =?us-ascii?Q?MHmRBttLgByggJ3cFVdZXQ3lmpow4PkuPBxfZ2MvHeyILOvXvGKUMZ0J3cNl?=
 =?us-ascii?Q?iZSWqJzHOY7hYi4vfN3A0MtANAUryfQec8McWeS5k7i4HeWFsCuloQ9o0C6r?=
 =?us-ascii?Q?EvRtUDxGdkggYFrZp+oK3sPBQ2rhKpv5tkEulmL2sDE4En5QmmJNozChipr+?=
 =?us-ascii?Q?I1Z/ByjisZJQPzrUR9v/iF+v7XPRnhY4LAOv5lYsDr/l89BxmymtQOXrSZq8?=
 =?us-ascii?Q?yRh+xRrzLZuPhbYHcHjdEXrWiyGtCj4Vvp9V+BptHfoHblRuJNEbrdqdWvLN?=
 =?us-ascii?Q?wFI2fGNcrX8MxW7iVFP99M3nsIQAxLc3k+iIV3+/Lg8EaP74A9N1Dpjv1CFM?=
 =?us-ascii?Q?mFUvGofaNSLZ2+x6LZD01WUrgKp/Y7nyyCr8jRMOY/vqrVYV7ciR/Y7ne0Ba?=
 =?us-ascii?Q?WDjH+nNlX0TMMjqIckm6lpfgWguOxI7SkOX9OtYxlEC2SEMxamHi2Ciuq96B?=
 =?us-ascii?Q?275wRe0uzp10oEHeiL6lM1V4m6X2/4Xeiko1JzQo/J+WQxlsSqoFPL8jelIM?=
 =?us-ascii?Q?7fGOkLNIwnflWC4LyEP8ftna6D0WcHZlio9K9t5b2Y8SOQytbkzkwkPa8C9X?=
 =?us-ascii?Q?gZvKC4Uvau9yLBGM7/RbdWQxcvSGHANZhKiI4OMJAlv4XJjKg60gROTdFaGv?=
 =?us-ascii?Q?x+a09oNTn9djgv05t9udr9ZxHkJ68ykzXp3fP220RURV7P1K+Wt5U3LV6vJs?=
 =?us-ascii?Q?NZKKwzY0MajPUXeXlkVjjw6Sn8ltvdDvqWmkvAFj67vpz/54aFlq6tISIipq?=
 =?us-ascii?Q?WWQKgwWWFXzaM8APNPEfuKV0GA/tPXqk/VVTYz8SxcVyI+BzZQef06or2hI1?=
 =?us-ascii?Q?emKlNaTn0QX9d6RCvaSSgfPcgjCHSZMV4CLA0Svddnrfz1svz5FKrg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB7699.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+63SI0o5+w/kGqX/HSZB2LA19Eujhi18vLbXztlCu5U2RX2dlwHXgwMHRE9N?=
 =?us-ascii?Q?VCEKQnDt/LOh8we+EVQglQ33Sfr5P/aMjIb6mrF/5T0eWXM5Z5sAAt+AGHVA?=
 =?us-ascii?Q?nkB1hpKfQy2/zYkIN9bmjeTCZwFCvGRqpCO9d1HplgydPU8mG6c7mNqFL713?=
 =?us-ascii?Q?zYxyVnJBeHR59ZWffFyoqY7K9cE+sSLzYG/AEr1XkOAJcGaDJ65ci9qiXcJl?=
 =?us-ascii?Q?qjdDo7EuI/R3htiiN7HhSZ9iUkxeLpnPLjncyoVYPJAft11ec3cRNQS2Q1iy?=
 =?us-ascii?Q?M8HO4IN5u2Md11kYhkvM+00sgSFo2Hzt2Pj/lN0BSH/mBzYlDs9zkBR4nFHf?=
 =?us-ascii?Q?5HpxD3BPuPTv059aBiqZsFiU/Qx10C+6+vqUiiF3otLxOOUWOK9FxtCDUdx+?=
 =?us-ascii?Q?a+txWjZCIP6LU7t4Sq3rje8wtxCeXU57C8OqvShbufuMDoAQWTPUEub/XNzm?=
 =?us-ascii?Q?JsVGt39ZdDkAltw1gR4dNblmRyMgytxhL+Jm6lluaIgCWIie9biUqVwd+fKG?=
 =?us-ascii?Q?HPGNfOLFPGG1NQ5VYU2zmLy4JBeFMPCYMJuIzoRLbNNZhTt/PJ/usloN+8vX?=
 =?us-ascii?Q?oRGQkUJkbDD4wscorv+ScOXmzDrgbC0TVETX4OXN9X0aR6LUO2G0JPgX25j9?=
 =?us-ascii?Q?9728rD55kNUY0bcTpdTiRycT1tVoX+cvScBOlWiRQd7PXRgVFfoI8Lg3HfM8?=
 =?us-ascii?Q?EowkGdW3Z+KKJ4D7sWuTE5OAkfnn+lVDy4LzihP0jJARxK8lMIpx/Udyswr+?=
 =?us-ascii?Q?GSoC8qbxUPdr8L8h4zVTBBP49NV0M6I1pSDWRtP62hLaeUaJKud6bza6eD2F?=
 =?us-ascii?Q?hZzQ12MocEX3z34xeZMoCOrhyBu7eKIOTF0VoEULvYNAAH/e6xw+NvJk8WVT?=
 =?us-ascii?Q?OuZeXSKODsUANuZ7Clz9UMYSEh0S7JwYgrb9nIPozLhBczsL9ms95PNeiaZ9?=
 =?us-ascii?Q?iuepT9TV9dcdStxJpRS5vIZWv9hVuOUMRFq8pPexYD/KyN3tybV31VFNc4Mr?=
 =?us-ascii?Q?AxGTPvM1gEvyUXhcjH854knkfU+lJEAU5mVUU0HJWhFtyvRcwwe8gMF7WWgy?=
 =?us-ascii?Q?K5IwxmOm/C9ppM8AMBL7icD9IobUaS8p1rsLhWzx0tzN4udWNxmkxtCt3dms?=
 =?us-ascii?Q?BfcrgNdhfzupgIqccPGtHSV8RsA45qbrW+GMTIhewRGmvBY4D51vhzh49bV6?=
 =?us-ascii?Q?LPhQnLSEotpMDW33GbCWAyV2rcLzrLNnitGQaQFOa/otnA3eKybwKnq8MqeL?=
 =?us-ascii?Q?F1OrFSuztVaVKc0dmTS4fjSK4JUD0cp28T1vuusUTvkQO71P7G8H8JS8fW7Z?=
 =?us-ascii?Q?cNAztkc+8sW9JdP8qrgvS9HZbJtbKf8Ib8gvUbL/ZRoSdaJaS/pQez4HcWkY?=
 =?us-ascii?Q?4S0p435Npabc4jh3TQL6ni14UdOToJCpH8RW3kfiC2mlvPR1Co2VV+fytkyG?=
 =?us-ascii?Q?5I8/A7TUgsZXMTzIhwLpJSPcyDsMmbYjFJtwjZheXb/MwqMdiba00BGJN3E7?=
 =?us-ascii?Q?k1MYNcKRFY+V3jRCMI4uVOT2kC7HSjZodsb7E+1ze2flD+Uw4ChpkXHsGhqu?=
 =?us-ascii?Q?nMxp+c3BrdHglMVdwjI=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB7699.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36ac81ce-b62f-4da1-64c8-08dde9e1126f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 05:25:04.2590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RcuhqdeGedF4Ovdq4ncNqMmDO6Z0E41zP+UFXQ2Z61FDPoRzKCi/+POXTJYoCOFOCG8+wntVfkUlbvfwqlIvfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8274

[AMD Official Use Only - AMD Internal Distribution Only]

Hello Stephen,

Could you please share the tree you are using along with the build steps yo=
u followed that resulted in this issue?

Regards,
Amit

> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: Tuesday, September 2, 2025 7:39 AM
> To: Richard Weinberger <richard.weinberger@gmail.com>
> Cc: Mahapatra, Amit Kumar <amit.kumar-mahapatra@amd.com>; Miquel Raynal
> <miquel.raynal@bootlin.com>; Linux Kernel Mailing List <linux-
> kernel@vger.kernel.org>; Linux Next Mailing List <linux-next@vger.kernel.=
org>
> Subject: linux-next: build failure after merge of the mtd tree
>
> Hi all,
>
> After merging the mtd tree, today's linux-next build (x86_64 allmodconfig=
) failed like
> this:
>
> ERROR: modpost: "mtd_virt_concat_node_create" [drivers/mtd/mtd.ko] undefi=
ned!
> ERROR: modpost: "mtd_virt_concat_add" [drivers/mtd/mtd.ko] undefined!
> ERROR: modpost: "mtd_virt_concat_create_join" [drivers/mtd/mtd.ko] undefi=
ned!
> ERROR: modpost: "mtd_virt_concat_destroy" [drivers/mtd/mtd.ko] undefined!
>
> Caused by commit
>
>   fa47dc829519 ("mtd: Add driver for concatenating devices")
>
> I have used the mtd tree from next-20250901 for today.
>
> --
> Cheers,
> Stephen Rothwell

