Return-Path: <linux-next+bounces-5882-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34884A68896
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 10:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB5384262A7
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 09:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB789252915;
	Wed, 19 Mar 2025 09:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NafZvUFF"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AB7250C12;
	Wed, 19 Mar 2025 09:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742377134; cv=fail; b=NgInW5+lbSg2bnsHe/sfpf+a8e1ngy6G4+SJGOD3UQuS/jjq7BupFw7eQnsb3d43nTAvENvg+G47LXFtyuZj10HiP/Y0OxqlPp0vXUZmEl8wxrQ9WpoIf7LxA2O3T/Env+lX8hJOc6Qds+9cENULFFtEYp4Ngdhh5I7+psck/fI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742377134; c=relaxed/simple;
	bh=lQ+ozyF2pUnvy/WdMnTNHJzR/q4VWRPEzDcr8YUwZ34=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UD5xvw+rcurP7u6V6HI24Y8SMfaZgL6hxgKcfjtsxgecN7dUyOeW40uKhoHYhBs6ya/ESgnxavE6FvYY/RdY6P0oWMHzzcoRUVhj3bc0pr1r6aFlomhYNitZ0Q48nG7YmsMxEWB3BRdTBVLF73nTrmFLJoo5vmA07HtYeWZl9Bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NafZvUFF; arc=fail smtp.client-ip=40.107.93.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HCjFtYXB7QRg8DkJtNZx63rwPaL6Yz43t9dsO78b352CAqxFBXV4i4bF0SoBKguIIg6JsvSHf5D9z+q4jR5Fqfwco/18ioURPnQIwx7/JHHzIruSWJS/hUZT6xvdvCkFPc8lO6R+ZyWIc06roF8EKhzJ6gDzAqfg9ktH85IgFfIYHTMHe0fWsxKsIGdgYQjUrYrwkf/cO3dOC9N7WLZRW+LgAivEgohasdeKhhFLa2YPG2JiVQ+6qQq5e3s3c0mDEjrW39MoFFouGnwFAQs0pTpa2hf7R6So7YNgORcglbjHIjqdG2g/S7kQJ1W8VFJXV6PqqNMFSZ0+MQlUOOvxIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXpsSNODXKmtRuezAeFI/Q6tt5Xi8d1MmOfr+mW/wlc=;
 b=pDGSyZvfh/P+uCoNtUAsj+4qk3WbYinMsf3f00vMl6qnB/GW6jFIzed8WHzgG59vxhPn/8N65YTlxGaPEhE/vGTc7gcH7Zpn78fuUNj1zW8fXYVxVp3qdsE/MoeAkKqH1Xpsb0mFLCFTG8CAGyMOZO5G5lHk6XrdBwlNOuJerWD4Cnq9O4WZfwhZvwhcTFhvSXFN8L3ELYU6GmMaYAoA8dCgAz1xGqiHurUnNcivkr5GEP0AdQUaH0vnvz0pxrbya7U5lxLCYmgnErs7yPUcwbL6iRyJhcAran6iG0TOMXM1fl7gbW0HbVFtQNQoFCTv/vAheLYx/bNjb5HwMcdevA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXpsSNODXKmtRuezAeFI/Q6tt5Xi8d1MmOfr+mW/wlc=;
 b=NafZvUFFDYVYslWvesfGybtBUOjjNd0ahoNdJfdA3Tst1TgML7wHMctUxD/c+N3h6ljUQMIaJIQmNEBzQs9AKwzgMakOrMwlpuEbCtb0/Z8TUQUGBqcVW1a846rL2/zIGssYlk9fPiJgIhhn7W1ggk1TuUdil3tO/N5R8EKMpJ4=
Received: from LV2PR12MB5798.namprd12.prod.outlook.com (2603:10b6:408:17a::6)
 by MN2PR12MB4157.namprd12.prod.outlook.com (2603:10b6:208:1db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 09:38:50 +0000
Received: from LV2PR12MB5798.namprd12.prod.outlook.com
 ([fe80::6f3e:b003:209b:9c9f]) by LV2PR12MB5798.namprd12.prod.outlook.com
 ([fe80::6f3e:b003:209b:9c9f%3]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 09:38:50 +0000
From: "Kaszewski, Dominik" <Dominik.Kaszewski@amd.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alex Deucher
	<alexdeucher@gmail.com>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: RE: linux-next: build warning after merge of the amdgpu tree
Thread-Topic: linux-next: build warning after merge of the amdgpu tree
Thread-Index: AQHbmLItYB1lWj/+TkuBSnfih77gVbN6M4jQ
Date: Wed, 19 Mar 2025 09:38:50 +0000
Message-ID:
 <LV2PR12MB579836A210FC20C79513D268F0D92@LV2PR12MB5798.namprd12.prod.outlook.com>
References: <20250319203449.386f9e00@canb.auug.org.au>
In-Reply-To: <20250319203449.386f9e00@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=6786f4ce-e264-44b9-8fd2-95b4b798f2a1;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-03-19T09:36:59Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5798:EE_|MN2PR12MB4157:EE_
x-ms-office365-filtering-correlation-id: 9cf100f3-c54b-4f83-69c8-08dd66c9db07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?j6gd43mdkW9pjTexVW5Jgsk9D+VMXjqBwQRiSjuqkSHLlobqtdZvDd1r3jOk?=
 =?us-ascii?Q?qMQGV/GQIPFiyghM/HcwMMzZfLgdPAlxgJZzYRYQWEFDR7rHViVzmcdOYWuN?=
 =?us-ascii?Q?w0IQXmM7dBrM+MIvPz6++Zr4jnh7XsCgSyqURCNcoy1X4eJP132TbNmpRnOn?=
 =?us-ascii?Q?oC8f/mK7Eqk8P9bXLIJ91IkpVynVaEIWgHdiwcPAL9KhC1EchgwVyfyIlgNz?=
 =?us-ascii?Q?8XkDS/8i7vQJMzyUjMBMMwXf3I8FIn3BEO3y009IJ6RE2YFakVCAssbx9eSh?=
 =?us-ascii?Q?MD5d4laEA8g+O3Ngr0GMVaWnHZOZZLVd6CJNdC2JZE6l5PzZYs6BeWaXvlaj?=
 =?us-ascii?Q?bHsyxqX09LMuXZGUzOd5QB65pzmhQjBTU1D2Fgf894VyfVXsuKz0pkrn7nlT?=
 =?us-ascii?Q?MYsSiVnFxUq50SeTS+NMCOPGIiZLMoPk3NFH8Vc6aB+r9vz05HD3zA2trlRa?=
 =?us-ascii?Q?XJK4NsTgSooOcEz+oZa993CaM1lSP/60xVvuJeFKD/G+o8FUybDBxlTY1iuH?=
 =?us-ascii?Q?51q9BbrKbSV6FE1DzzRkUV7IZCnNNotcBHXiblGm80fxhJJPvI3oRdIOg1tX?=
 =?us-ascii?Q?k4iAdL0LlsSBe9wYwMnO/MKNsDljdMRWZarmxi6QfkJZzSDUZ6VaALh2Lzja?=
 =?us-ascii?Q?7kdQe/7AyG/F4NJjIEq1IFMGVEDkSmxGoJaWlD/ftY5XH9jVW/52Dfj1kRmi?=
 =?us-ascii?Q?FM3N1W5DxXELaRRXwsvySrN0cQ7RMEhiQop23ZjSKbHYSnVc0QW6onCzuPBx?=
 =?us-ascii?Q?PdKg9W0CI1RCA99cQxFhmN3t0hQYN9Xfp0JdxySQ7gwviIP+B7EWrGPH5Tml?=
 =?us-ascii?Q?ooViKOZPQomBVLRWfAJojP/Z5zdaeSZ0FrSb6dXNeQUN7IYNFpUQ/v9kvL+v?=
 =?us-ascii?Q?2HjdjxG0pob4QQPs68fWIkwtfdvTSbf0o7aITRZ7bSBou4WHfwRYt0bj6+rl?=
 =?us-ascii?Q?q7Ovrex3FRDj45yWQQJwgiZLG6LQDN1I3w75SFTeZinbg5VMvCdf3Blm57v8?=
 =?us-ascii?Q?XOWvokXeRXp4xsG0+/WaR0looC+53qLMGPllovvCAgmBBeKwKouOLlGj79ds?=
 =?us-ascii?Q?EcMy01k/Q/BZ2az/ucbAOJ0H2vtfKfmWilLI+1TZZHIYmtYr9kfOzi5JG+0O?=
 =?us-ascii?Q?L3RRzapZOEodf0DU6kszSNjrgvJxtYQPUymhBWhq2aNPnZr9ol52xuRdul0O?=
 =?us-ascii?Q?7PsFDO6cJ+ZDpx0I89bF5TmtFOEqhNBgUrhq5kL+z0wqu//w3eHh+e/Sk8/I?=
 =?us-ascii?Q?qIebktLOFihAyToPTP6cvZauwQQxSk20qZNLHBN/tevI9sg8W272YxW7qWOm?=
 =?us-ascii?Q?IB5lkex9HjmUWOzniMY2pjRDG/yzEk/qNldCF1dRodOxoU3Ht1mk9Rd4+2X6?=
 =?us-ascii?Q?taW1FriiivxX6yd7JSfjIxf5nlhO3tNTOQZPJaTRLDkQWlTn5/6lmei9K+MF?=
 =?us-ascii?Q?4YO5J2oHIVh7o0JeT50K+UWevpazeE1s?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5798.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?duwxI5gl9CNOiwqraU5CSglxiGr+EZG0NIvKloQJFtgJaDC3WucpYg9L5jUg?=
 =?us-ascii?Q?TCh7wWw3J9ndEDcaUxfmzf5JEqaNlfcsrYyq9LMnp+1vaEtx73E1vLMrtJcw?=
 =?us-ascii?Q?ys2ySA7Sr+7bPHNDU7MkSdmGdjrsrOCDivIyeChOLtOJKwo4lhVZC+HDA2zQ?=
 =?us-ascii?Q?BdT3pld9XdOVCta1SacIsJ2OZT/r87EILYzfgAfaOn3+JOq5YbDcWMYTRVBz?=
 =?us-ascii?Q?r7fUHvySdGH7WEHqyHRnu1ZgrgA10ub2LkBspG8bTZfXV0sAVrHuaBZextUs?=
 =?us-ascii?Q?VMBcBJY/hVGqMiGOf71/EDbf25b/ITa6s3zoxYIzzpssSvCaOQDxjlu+jelr?=
 =?us-ascii?Q?Wl4mnr5GGExbQOHTq5IlBPc47VGS7SWmwVUAvptdMbinW78vQT2fKdUPpm3W?=
 =?us-ascii?Q?h7dp8JM/sFtl9NN7h+HoRmj2H+ZuO9DE4H2GW523KCceckgQX51arMr9QnvB?=
 =?us-ascii?Q?zk1jZDUxYojjo5rUJQ+h6tJHFfoWqwG/ehLOG1IyuNBRns3IFuzvmac+rFm0?=
 =?us-ascii?Q?NrV8hMZ7i/QfoFRgc3NZowhYCUt4FA6hR9HjDuYUG0gzF4DaD813yZ9b0XFe?=
 =?us-ascii?Q?glacahoRWbl59C1WPolMdPGeJOUUWlmbzXxWMZz+k4rIkgwKMp6y2686qkN0?=
 =?us-ascii?Q?q1FSf9iBD3SOFXY3eeq1rkZa/s69buHUeR9VIna2xjy3rkvZTu/EMgUQTLeR?=
 =?us-ascii?Q?VZfiMwnKRX0crUbUiAhe8yzm/sy8vQEl2isHIU2HkAcL+thZZna/1BQkesGp?=
 =?us-ascii?Q?10XJZXCsDR8skG4h3x94Xyuilq5Wr0W0YqpbtO5BQQucTau1kXaFmdVUCTqi?=
 =?us-ascii?Q?VzOuW+Wca27ZRNd9nNUCht1RWOXvUIkdcaVVWTKFA0oiM4S0w09im2zdBjlM?=
 =?us-ascii?Q?aFAj06nzvr9IV6fxI8NEeYdhnse2Gr6J+cwkC3iIImgs3r2LJH949mQDOOD1?=
 =?us-ascii?Q?jINH+vqIgYZXicaLskuE4nKHDApjLJ/QZMv3AzWGOxU7L5R0ImB5c7/i3pdj?=
 =?us-ascii?Q?9BhRCv+MK5ZckJ5NTCipBGKVAbh9ByxBDFm383zDehkLHMGmSTrPv7eYhILq?=
 =?us-ascii?Q?LCeymTwOZ46si7aTe8ji19huabFdJrYg+qLFN18eDPuLuibPy+/cjfuDrB0m?=
 =?us-ascii?Q?+jlkQ9e9/LrWp8ItQQvt6oIwcACk3fl+9HBpEG2gPBTplA5HsPNKlcAcUuj2?=
 =?us-ascii?Q?+xOJt11U51LGStiFfeM1zpFJSsIjcdNxW1aV4C6sI1N5Pp9p6ChHZZdQdJTe?=
 =?us-ascii?Q?ubINn5SqKJ19k3q05tRc7c4oCC+BsSzxReFn+QgZsShuJUElMNo6bguaB5vJ?=
 =?us-ascii?Q?rNdwOFUqPMBQVuwdq5yzjFi9YiUQam351pu2bavxFe9VB/vO5zIcQgvZoXZR?=
 =?us-ascii?Q?CUOgDvZ8IBOUCJVWuk1wLHt3u6hLvZp4NPXm6oJiIX8kgaSMZc6tPc/ZnlI9?=
 =?us-ascii?Q?3pBpgT+XXzoqoWKn9OG2G93pHqJFMLaiUeCQp8GXdpvAm1Y4/G6KlZaVJiRy?=
 =?us-ascii?Q?gPd3ateKfWZNP70MDs/DurS4lifTFnL3zzDzdS5kDrQ6OVg1b5eGp76VNP/R?=
 =?us-ascii?Q?wEIGzCGOBH35CvSzaWg=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5798.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf100f3-c54b-4f83-69c8-08dd66c9db07
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2025 09:38:50.5175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: waPWcLefAcUssisBYRnkn/pmbZlvMydz3sBRwiKQMjFvhiZ/n/gCuAy76TZ4MmZcFWoRjvFeYZS+tUjTAUjESQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4157

[AMD Official Use Only - AMD Internal Distribution Only]

Hi,

I don't understand this warning, the enum it cannot find has been introduce=
d in the same commit immediately below:

+       /**
+        * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check =
FW
+        * path failure, retry using legacy SW path.
+        */
+       DC_HDCP_LC_ENABLE_SW_FALLBACK =3D 0x100000,

Could it perhaps be about the missing colon before "If set"?

Best regards,
Dominik Kaszewski
Senior Software Engineer
SW - Display NPI

-----Original Message-----
From: Stephen Rothwell <sfr@canb.auug.org.au>
Sent: Wednesday, March 19, 2025 10:35 AM
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Kaszewski, Dominik <Dom=
inik.Kaszewski@amd.com>; Linux Kernel Mailing List <linux-kernel@vger.kerne=
l.org>; Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs) produced=
 this warning:

drivers/gpu/drm/amd/include/amd_shared.h:369: warning: Incorrect use of ker=
nel-doc format:          * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP=
 Locality Check FW
drivers/gpu/drm/amd/include/amd_shared.h:369: warning: Incorrect use of ker=
nel-doc format:          * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP=
 Locality Check FW
drivers/gpu/drm/amd/include/amd_shared.h:373: warning: Enum value 'DC_HDCP_=
LC_ENABLE_SW_FALLBACK' not described in enum 'DC_DEBUG_MASK'

Introduced by commit

  84ff5895399c ("drm/amdgpu: Add debug masks for HDCP LC FW testing")

--
Cheers,
Stephen Rothwell

