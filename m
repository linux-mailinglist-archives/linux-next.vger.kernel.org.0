Return-Path: <linux-next+bounces-6151-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6BCA79BC6
	for <lists+linux-next@lfdr.de>; Thu,  3 Apr 2025 08:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB7E918906C0
	for <lists+linux-next@lfdr.de>; Thu,  3 Apr 2025 06:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A48F19E98C;
	Thu,  3 Apr 2025 06:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="k92Na10M"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC45F746E;
	Thu,  3 Apr 2025 06:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743660487; cv=fail; b=WJHUd3drsmRNmoXUYdY4or7FcJdGpmzViHEK/Bfnqr36w4FVyvljbam+RmGIWTs6qaZnKWCi26gl+Toi86BEhvzwKF+Fo6Pag+0biscXavpUZZDyZWwq635UtOdKtYJcZgbQ93GIBg0RFJQ1tnB3GuBsQXjsuTS22TPuc4QqhvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743660487; c=relaxed/simple;
	bh=JW61rHA9pfWQ8chX6x4Uw4uDfONKGZGeYJCN/aXPH48=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eer/Q6sGb0L03kr63vXEM7CSfDM3ufPgtkkTwdHBiFJoMNb1jjYXZ/lWIqmXJsiQi98gJdSmrAD/ZHpfkV26e9S9WiByhqpNR8AaqcP76ZyXlQOicT9dth4jiNIFQUxWkpG4PKo6M+ZXefuPKM5SsoKtP3p1Vc2ukP8LzlUYwAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=k92Na10M; arc=fail smtp.client-ip=40.107.243.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5Rj97Pm29F0CLMCkPYXpP08IJwf1SC67ULAPlMXhsnx+SEO3nYzOoUmnaYN4x1o4V6eDw5/a6Jt8eVBjGEQImvgH2VOwpZ1u7kMVS+xW9SSL4S0P1jigbmhpnqjfhqQRsTli96cKvqMESXrd+8Py07Kb7lKU6fuhN1xwzMOq69Bh2mYLOMrmxa3lpzhewwdpTJBPygnoXzNelSFgFgIg1OFya2VkZ+fVrtq5c/EyNZwTaV3Nmq4qfnWZXyS0/pvdWLBmUykNIC8Ip0VCPFo0GqExO15dPbBgKdY+NY1vDWxusjI64ePim0GpD5kbGindvG5HRuR67xRDnu0nKcvNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2DLHTShggAXu3Nz3KUM+KLlp98uV3OAEbBsRiDNdKY=;
 b=cvH4tDSnoy15LNd3lOav++x1tZGora7So8dMy6LlUMyWIolfSp4R3vqJCdhC+j2+yf3x2yClu3wFv1HPKNaBVovAmnpZA3Wy4uJVDoU3DRH7X7NNsRzn5WluyvFppBx1m25r7dxcJEbapXrvcPa/Bc50uW+feyTqbynXkzq2AEwBbypHOIQz9xf2stINstJ83hH/OrxKrivfTTWdMeJg6y8Lf8OdNK3LON+5GwHT0TJYoe4KYBj1OBv4ulC3J2GsI4GXDofsdaEvaC526inMMvCjYO3M55oM5VeePoTQqaQE9cYUbZnyP+gd1rPI4xTyXopK2kcMk1K2z30DHgjvyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2DLHTShggAXu3Nz3KUM+KLlp98uV3OAEbBsRiDNdKY=;
 b=k92Na10MNt8UQ/D4smSDDTFM7tXDmh4n2BGl82of8QL4daAFmRmkuUTaYyacrX0fMbXnpNMfxwQv95Tadqj6xxxQ3jD6apdYpUbQuj4GS2VqErFC8d4Vc9doC/2uMFrH2Uwrkg/wZvjgOEL4z6KLmwwegso9+3xY/bIpNKuUAw8=
Received: from LV2PR12MB5798.namprd12.prod.outlook.com (2603:10b6:408:17a::6)
 by SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 06:08:02 +0000
Received: from LV2PR12MB5798.namprd12.prod.outlook.com
 ([fe80::6f3e:b003:209b:9c9f]) by LV2PR12MB5798.namprd12.prod.outlook.com
 ([fe80::6f3e:b003:209b:9c9f%3]) with mapi id 15.20.8534.052; Thu, 3 Apr 2025
 06:08:02 +0000
From: "Kaszewski, Dominik" <Dominik.Kaszewski@amd.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Pillai, Aurabindo"
	<Aurabindo.Pillai@amd.com>
CC: Alex Deucher <alexdeucher@gmail.com>, "Deucher, Alexander"
	<Alexander.Deucher@amd.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: RE: linux-next: build warning after merge of the amdgpu tree
Thread-Topic: linux-next: build warning after merge of the amdgpu tree
Thread-Index: AQHbmLItYB1lWj/+TkuBSnfih77gVbN6M4jQgBdWyACAAAFYYA==
Date: Thu, 3 Apr 2025 06:08:02 +0000
Message-ID:
 <LV2PR12MB579831B9500F1EDE3D2CC6CDF0AE2@LV2PR12MB5798.namprd12.prod.outlook.com>
References: <20250319203449.386f9e00@canb.auug.org.au>
	<LV2PR12MB579836A210FC20C79513D268F0D92@LV2PR12MB5798.namprd12.prod.outlook.com>
 <20250403170134.504f5801@canb.auug.org.au>
In-Reply-To: <20250403170134.504f5801@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: Aurabindo.Pillai@amd.com
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=698d27aa-109f-4b57-a0bb-fe41521ce746;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-03T06:06:22Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5798:EE_|SJ2PR12MB9138:EE_
x-ms-office365-filtering-correlation-id: b7209e05-ee51-47a3-5746-08dd7275e459
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?JVCdsHWsyCQAfQW4u4iEx6qVxD5d4JJ2FnGqzQUnkCiCxBdM/8pi58sHDRaC?=
 =?us-ascii?Q?X8n+HJp4vQc2NPuYQzLqsD0xB5r1GWG9bfdmP/Wmejah4Hpe0GOMer6m/osN?=
 =?us-ascii?Q?/Fe9FO5xfFO/waCa4dVMkLUmbiKl1pFGUwPBwtwfX1RXAHdvy3eu2CdBFSkP?=
 =?us-ascii?Q?m7DEhvZbQicHYDvQb9sLIGfPb15bRaJ5gls2zfdleVtAEoZtCLwrjhP/BC9A?=
 =?us-ascii?Q?r00aB35lWQHDDpqrrSZw8jcnueMjDQMzgDiMX8PUxKRS0JdPM/dPMXqiqVlo?=
 =?us-ascii?Q?+Gs4mrkAp94hNNudEK6gH/HNtmFdkuZ/i+ntgd+BOfT5LYCNgcbdNkYE0bi8?=
 =?us-ascii?Q?lLcqIbsb6xDTBGfkDWZA5lWye3Yy7ry1KdW/ubLL/4ux13msqCv9b6Rr+S61?=
 =?us-ascii?Q?Cqc7fefleB8+NDYzBBSWMAFEuRdYN3nU4yKeyzpIdX8WaAaokjVH0r/cCAFK?=
 =?us-ascii?Q?Yaud/xNOHpG4+FI5cP6LBJQMlnWLOeLO9PHwABlwK20lhNKNDqhqsdDvIXNa?=
 =?us-ascii?Q?rRnlK8GQ8fF8BktwrDrQwx3HmzCroCZsJfAoXzS7uxVhA6I/tFKZAWdPykia?=
 =?us-ascii?Q?D5fY27PSuJ1J4OrJhAO3lGmAm4Kbd5BKtAmhHmRFOUhTdNF0UYKpOlw3kSu7?=
 =?us-ascii?Q?KwRXcwFtsasfhlwyJwXacUV/ckMiJRxs9MAxXtMUTBTQ2uZnbeUGAHWsEyRx?=
 =?us-ascii?Q?qsGCN7RQba2iPuqMYcpXMMumdXdLhJ4zWMr6VUekPnUAE8+2LRwHhbuHjrFc?=
 =?us-ascii?Q?2YET69aM4HOhiMQ2MHpHFxqsaofRRg2zwi72IbzzrRiOld3wc6prme+VyHGK?=
 =?us-ascii?Q?Qvaqa02YE4F2899xaTOiubX9gB8fm7ThumZlNay37wUSZvDHrfp24HObqrR+?=
 =?us-ascii?Q?Yg1khe0XgKp85VWbpTaF0tiUt5GIHodmh80W6DmV1kOs5ihgSmGvhUIFKJ8+?=
 =?us-ascii?Q?svbASUNTtqJZdtfSkLoVwNxVnqQQU90clC7WHQNo32pCxKmrbvDMJveDhqtk?=
 =?us-ascii?Q?snvcIehLLc4ZOtPLvh8efbvtmbdy0uZKqG4kvU8wDFD2HWP+ihWWYmyymOpH?=
 =?us-ascii?Q?lmBOzRl8Bu8BiWugJOX3Z+gUoUIliXBko2De/Z12vNFB5mpbtYS9Cuw7HKlJ?=
 =?us-ascii?Q?TELrLf+LVIxqZnVkeFuuMMCP8gz1C/bOwAtDSZaqi3OAfou1/H7L8OGuHSh6?=
 =?us-ascii?Q?oFZnzpbXk48DnRCdrIQ++IgbmX5UTw2qc7IcnimdvWm1BE/WLAP/EVoxYeZ+?=
 =?us-ascii?Q?aKXTMmq5xBkAwvUt+iR+NQgbzwISNLc4ZhCpZsbz4wQYx6A3NowoMV3xjOE1?=
 =?us-ascii?Q?aD7TZHGqf4yjKdK6TBbZATA4HpatGBZcZe7Rp1Rk7BRAWkCMxBCrmafsVccj?=
 =?us-ascii?Q?5Rawp18d0FQlLowCRSWyffqhG4cQUBr5NJ7QDw/IKkfKb1JfFYwcyFq1hhl7?=
 =?us-ascii?Q?46rfI1zQ+HKn02I/ZErP1h+Qx/EYjedw?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5798.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DuQSwiz8anxC6Hde/R7n6drITIUeAl4Q4Qp4c+h00F4GoM8Js3qg8YTWy7ck?=
 =?us-ascii?Q?ZNC7BrB2tBR4GEM9GZlVuph56Dcu5SXQflXxlqHO06IR+m+b+iApESwJm7eT?=
 =?us-ascii?Q?fkFSso3IWqNPoC1yy+jqz3HSGTJQ5Fb0pqNLvAATSMV5eBchX+5pSq9lrgk0?=
 =?us-ascii?Q?sVyb7ZifAie5of/8sbWuq1ebSrhRg56Vv0usJPPiTqOLqSVobz413fwO0Dps?=
 =?us-ascii?Q?v2CD7gIk8ujAvOsT6NrQFacWo82kh9QHJJH0Q0wb/To6kJFSXXs9ZE1ZlrjE?=
 =?us-ascii?Q?0XB0G9PVqenS6UcjM9s4vfJUKVaSbgxOLuqmcXf0DX7fnlgEkdwQEpaQnlY5?=
 =?us-ascii?Q?/kpxEMp4dKT79vNJs4ivLmMhmwJpzTTKTwVC2a4835P2rRIvkwKTS/dVgT+7?=
 =?us-ascii?Q?8e3cp9uOfrjrl9ymz4k5MGQ85F3RPz3+PxoGyK0BY11zsVKuls6r8PdeYK7x?=
 =?us-ascii?Q?jx/8lAFtDx293ypM2Be2GYqm+whEXRt7VsR2u3Xf2DF4+8dnbj1XxHICB09+?=
 =?us-ascii?Q?X2acw+ddAh2P8k7f6dFHrw4L402iLJqH+49xLDQAnCndF9r/Kwl3iMxsiZ7F?=
 =?us-ascii?Q?+axuQGhlDKa3OPTdbuW7KBicaMmIKshYaoiBLuxB7ZukSsGbWiTNTGSrGcwf?=
 =?us-ascii?Q?nYG3blf2L1STpPV0OfWAraudEjPxdcWY/v4E9cfygYPqFtBJWLyln62X9eqr?=
 =?us-ascii?Q?1jD/0tID/oJWoo4z/+/dYR1eVmH0eoiP3Pv1o9wdcfjke5TKOouCF9KUq9/X?=
 =?us-ascii?Q?U3islckhpa0uRAj2aLsHK/gAnF4avVEKoa/q+NCjZ2zlzxDyacRQf/mEfv5j?=
 =?us-ascii?Q?4ECG+/vbApn2jYPIq/wdnl+MVgfD81hcGjlLs9CGNUe+KH6jlIcim5Pj4DZS?=
 =?us-ascii?Q?inlBiIDafxj3OnHcIXZOqSrMgT30RRM0ygQiCorv3oTPYTfByhbOUlM/uNXb?=
 =?us-ascii?Q?rczW0NXTjl5OdgMrCaA0Zhf2Bl1S3X70lY3h0Vc1eBfObFW6b0lYTNGF+Oq7?=
 =?us-ascii?Q?dzn4IV0oJsHzdPyUdeaEHLvU7jSAXpHqHWqhyNy9azcv8SmkBne/uE+4p2na?=
 =?us-ascii?Q?2bk715NZRy3TL1L8ZGX7eOSv2ZlEm+oWf2BAHGg7zTCLYIW+WqW/Nw9qwI1P?=
 =?us-ascii?Q?lD/Xo5nHw/QtGNPCg2/GAxcu7Tth+8x8kv0prZHhFG963Ty6UW723sxQ+RaX?=
 =?us-ascii?Q?ur8pSv/W94Lk+UrNPdhvC5t0AyynP13ZdeN9gAb4ckI5bhUeIcRoQgzjMGpF?=
 =?us-ascii?Q?xzVX+Ttafeb40q4C0r5A1FitRzUK/JR9ib/+b1ESNDdqDW4RvIUql4uOKAc6?=
 =?us-ascii?Q?O9n/VyYqkaihEqepfUrNPfarl0NHlZBv9nSBmhhQA7K1SZ78WgfoJ9DmccIZ?=
 =?us-ascii?Q?9Wm9eMu14HrjsmJBgwnYaQXdFN3hbiYJ3ZxPjrrbGwlvQ+DjqXFiPFydkl6W?=
 =?us-ascii?Q?1GqhRA6xGwp8uCQ9iZL1fZl1ex+ua/yDBoE0JrAlyMo/d2daV4lvkkTAoPiP?=
 =?us-ascii?Q?VfLYzQVdAoTPvzYmaqj4k998A5AAoLgI09WLHMwI+60SS01oQq53dY6zRKxQ?=
 =?us-ascii?Q?IF7AkYxXY2OESnlfCSk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b7209e05-ee51-47a3-5746-08dd7275e459
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2025 06:08:02.4215
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GsjAl0Bs1BMx/5JHdwHr1CO0ltFnVlT9Fdt1QDzQEgWlAvL/PEvMrajX9m7TaBga75KwJc14KDvo8xmcuS0OWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9138

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Stephen,

I have sent out a patch adding a missing semicolon a month ago. I did not g=
et any notification that it got merged, I am not familiar with AMD's upstre=
aming process.

+@Pillai, Aurabindo

Best regards,
Dominik Kaszewski
Senior Software Engineer
SW - Display NPI

-----Original Message-----
From: Stephen Rothwell <sfr@canb.auug.org.au>
Sent: Thursday, April 3, 2025 8:02 AM
To: Kaszewski, Dominik <Dominik.Kaszewski@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>; Deucher, Alexander <Alexander.Deu=
cher@amd.com>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; Li=
nux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree

Hi Dominik,

On Wed, 19 Mar 2025 09:38:50 +0000 "Kaszewski, Dominik" <Dominik.Kaszewski@=
amd.com> wrote:
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
> Hi,
>
> I don't understand this warning, the enum it cannot find has been introdu=
ced in the same commit immediately below:
>
> +       /**
> +        * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Chec=
k FW
> +        * path failure, retry using legacy SW path.
> +        */
> +       DC_HDCP_LC_ENABLE_SW_FALLBACK =3D 0x100000,
>
> Could it perhaps be about the missing colon before "If set"?

Yes, probably could be.

> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: Wednesday, March 19, 2025 10:35 AM
> To: Alex Deucher <alexdeucher@gmail.com>
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Kaszewski, Dominik <D=
ominik.Kaszewski@amd.com>; Linux Kernel Mailing List <linux-kernel@vger.ker=
nel.org>; Linux Next Mailing List <linux-next@vger.kernel.org>
> Subject: linux-next: build warning after merge of the amdgpu tree
>
> Hi all,
>
> After merging the amdgpu tree, today's linux-next build (htmldocs) produc=
ed this warning:
>
> drivers/gpu/drm/amd/include/amd_shared.h:369: warning: Incorrect use of k=
ernel-doc format:          * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HD=
CP Locality Check FW
> drivers/gpu/drm/amd/include/amd_shared.h:369: warning: Incorrect use of k=
ernel-doc format:          * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HD=
CP Locality Check FW
> drivers/gpu/drm/amd/include/amd_shared.h:373: warning: Enum value 'DC_HDC=
P_LC_ENABLE_SW_FALLBACK' not described in enum 'DC_DEBUG_MASK'
>
> Introduced by commit
>
>   84ff5895399c ("drm/amdgpu: Add debug masks for HDCP LC FW testing")

So, I am still seeing this warning and that commit is now in Linus' tree.

--
Cheers,
Stephen Rothwell

