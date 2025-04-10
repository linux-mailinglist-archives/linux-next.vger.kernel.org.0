Return-Path: <linux-next+bounces-6200-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F9EA84C9F
	for <lists+linux-next@lfdr.de>; Thu, 10 Apr 2025 21:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F60519E61CB
	for <lists+linux-next@lfdr.de>; Thu, 10 Apr 2025 19:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC28828D853;
	Thu, 10 Apr 2025 19:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aEWh8AIv"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21181FC10E;
	Thu, 10 Apr 2025 19:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744312287; cv=fail; b=APkqB0PHNzQDw+5GJx1H/uKx5/h4IRzUtcDVM+jEJk11HVvON+VBXkf3O1Mi23s+dTCNWNiiTtK+nKBbknLPr+n4EjPqQSp+Qu7H45MTOhtfKkuqZj8y2L36LwyAG95lJ22CVgThzxwVe5NxcvKmLRFPqPAH8be4rBBfnaAERtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744312287; c=relaxed/simple;
	bh=G60e7IFdfsibiCY0ct8laSG0LwOJHtAdNmjaOWU5idw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EUSmedCxjOqswASk2VWe58WzUp3Y+BmR139PajswIqy7UrVamHKgVzd3Op1SK/kSn/GebfZWAoifm+nWLyy9KtSUuJSLoQSEl/TZ9JEctu6D3+iNQhlzVNa421L4t5biqNHMsxbxwoSgSFTF1BbiW9T5DeCStAqVH2t+DKPrh4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aEWh8AIv; arc=fail smtp.client-ip=40.107.244.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JO+n+SpqjztiYm/uKTWdsd37mVSCq5G0ZurkEerg5GF0JjuT5bhvudJ9zjhsA4D6Rw42Ejov8OBSfkw5nMLdyAgUqkfDO+LtjF9jTLVhIRb0UJG/qzFtk+nvZ7wMM7sojCYEqx01QMa31pJczlCe13IPEZjFi4ogT+dWUwc6/JjA0DYN6k/2R2qoPD5V8c7drHuwgg0fNa/0le5ATAY4BgsQvXw7A5TS7NKbc84LR0p+TYAeqVpGu4CcJEcD7mwF/hph1vuMyNI4u7Hc+UHvnA5htZ3MM25fNTbUizA675nYAhk5zCGyJS7jNFOdCeoTNBKtNwLeYDS0uw1w9ciilA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7UgB5nUC8oXMwdXMBYZ+w4DCR8AmM+S6ryk3A08VQk=;
 b=CEg/vpeTnu/fMlW4/j+Z6mUiZq3GC3heN8T9IFsEY5W/v5RUn1gmzU7/fH4xeXZC2VS29dEvlO/aFC2ougn3oh0/Ls7poR0gdVSFfIuhC4+Z0b08E2SY5fxbYGCRC5SFIQepiKNQ2j7yUMxplBsACYGQS7FbTDAgrVez/YyAHjSU3B3VYyYr+c9/6s7ZUTa6OMCayKMCz+zagHtdlRropc0z07iJ6epXw0uT/qPKpP4dN99QIKT1rjuAlwijVVtprDZtgXZ0ZOZmUe4SJwaHvxxmuz4McIIfTMn/85o/H3zddb0zQvEcT79a0VdP6uLuCHUUrLDdZ606TsKxoRZUXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7UgB5nUC8oXMwdXMBYZ+w4DCR8AmM+S6ryk3A08VQk=;
 b=aEWh8AIv6zxRwux+h1+hsnbs0h9/bNm5WADL01wIDmxyz8bsommEzIQNdbTmQMlokyElEJVoHVMPVYtsUMim2g2U59dmpLVtNglqBbVkA33+897R6qkZ+kPZfHygao8/h4H925riNP5VQBBtbJCc6SmZcXRqOj8O0jqTYSIaIks=
Received: from CY8PR12MB8193.namprd12.prod.outlook.com (2603:10b6:930:71::22)
 by MN2PR12MB4373.namprd12.prod.outlook.com (2603:10b6:208:261::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.24; Thu, 10 Apr
 2025 19:11:22 +0000
Received: from CY8PR12MB8193.namprd12.prod.outlook.com
 ([fe80::9edb:7f9f:29f8:7123]) by CY8PR12MB8193.namprd12.prod.outlook.com
 ([fe80::9edb:7f9f:29f8:7123%5]) with mapi id 15.20.8632.024; Thu, 10 Apr 2025
 19:11:22 +0000
From: "Li, Roman" <Roman.Li@amd.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alex Deucher
	<alexdeucher@gmail.com>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kaszewski, Dominik"
	<Dominik.Kaszewski@amd.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: RE: linux-next: build warning after merge of the amdgpu tree
Thread-Topic: linux-next: build warning after merge of the amdgpu tree
Thread-Index: AQHbqPz9msGJoMKKfEWxW2osdXFO3LOcU04AgADyjtA=
Date: Thu, 10 Apr 2025 19:11:22 +0000
Message-ID:
 <CY8PR12MB81938D741C6DF7994A7F928989B72@CY8PR12MB8193.namprd12.prod.outlook.com>
References: <20250409131035.1df305e3@canb.auug.org.au>
 <20250410144010.502f7802@canb.auug.org.au>
In-Reply-To: <20250410144010.502f7802@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=759f74aa-0b98-441e-aa36-2699ed6a24c3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-04-10T19:08:30Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8193:EE_|MN2PR12MB4373:EE_
x-ms-office365-filtering-correlation-id: bf822ea1-1034-4b72-fe22-08dd78637b6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?pYW+xLd7YyjnH2i9uc7mHO4ZobNQVa8wgx/zpZb77EkrN81rdSp50PwTbzyt?=
 =?us-ascii?Q?OPYe4BEN7KXJoM+JHUqbjsyZaR0SL8uvh8vK1k1egTtnfazk0a1G20IrK2s8?=
 =?us-ascii?Q?aXckBGlPw3A6VPfWzux7xgq9Pr/Px6nyCTORh9vBNHt7EtS+CMGTUXffU9GJ?=
 =?us-ascii?Q?9M7scN8k9v07Q0UNfVLHN27Si2AlP/4VpJWSFdYF/jRKdYqmDBlhSkcIKoLE?=
 =?us-ascii?Q?X7DcaXJiI7uX2rSYsv2RgaX3FKrgb+cGzU3+4w94WNcBX5hi5hOC7g4aDFgf?=
 =?us-ascii?Q?+4p3WY20Gp/zrwUyhcLY0pDe5ThCl4myGEeQgSjwXrBnUedji/nEgDfhWfTe?=
 =?us-ascii?Q?d8Doss/o7Y+BuyP4vL8LbYhfvkKsZu+BF0+mBG7GVKBYyQkIxH62fhjUfDgS?=
 =?us-ascii?Q?SndR99DugxRpxG2w8E6PThvtcre2CEXs1prfEbsTK/Po8OULE2t/RR4bN4uP?=
 =?us-ascii?Q?/huqMHSOiCz2ZzJ7DJt+xkxe0AszS1tieVrLJgUl4HRk33sYHuHvk+NvFl/L?=
 =?us-ascii?Q?D4+BWiHdjpfqTnnUpIgACx4MWvZ+MctBd8CDQ1CmRpdmSPxDTeO7WkO5VTXN?=
 =?us-ascii?Q?v0dmGnJ2/+hzCgFBGlxu1v/Mt5JyJ1rRholVgvfF7Ot0XkhDriGZWe5oKEEf?=
 =?us-ascii?Q?RezgZjn91aDVkvgV2ykZ4ZvATv0Ho+/j6iSt2TeFagAi2DxhYrfgSvDhjBE4?=
 =?us-ascii?Q?FrnOal22ri3nU60tNdKBCRvxDrJH9hLv8OSoLp65Fsrol9xIHajg2+L7axvm?=
 =?us-ascii?Q?fh5q3CEHXj6Wpdzm6L4YNkArypgEG92esPiusC4B/McGiXCdp+IdX7Yu0KEd?=
 =?us-ascii?Q?nimVrX2Decr7x6scPnb5p7CgNFJHgjHD0p/6Kg+SgA78CAbnPVxsoyViFCS8?=
 =?us-ascii?Q?l7dI4XWx564i8pJz4V/3gdeFk7G2AMqFOucbi1ekw6JMCd1/zH+6P+wxBbZF?=
 =?us-ascii?Q?W3xGx2vjxeox4OETZxjJ4QaLoHFDD/XlXSHriFSCzIXOTOctzCTDqjNzSFdT?=
 =?us-ascii?Q?oC8LFKscZARfc9dPhsENMDP/Rs9VDxfMe8txHvksH8DHhODG3ZYQWvnma2m3?=
 =?us-ascii?Q?KSZm7bUmmlR3ZH93MRJtT7DdmKPEMGeH4fSU26ghjWKSv1fBM4zPDFT4bR5d?=
 =?us-ascii?Q?vanr15gAe6WqmfXn0T2M2nvtRujNsS2N9rOz9XIbkawm1AkWhZu+LQar5H6b?=
 =?us-ascii?Q?Bx6nfRDDn/ZLgQoGVgYNCuUvA17tjwQ36l/3XN4rSV5m3iuihaTDZ+wmOOdp?=
 =?us-ascii?Q?uPgcczyrQ2MK5O/0pwbvbX6zrZtsMynMzQ4DF3woK76VfAXgkG2z3+WzUk/L?=
 =?us-ascii?Q?aAZk1FwFW/lVfNjY71WslXFU4+nUNzZ/qTE3RyIGj3scLyVqP7Iet45MAY+/?=
 =?us-ascii?Q?vgdu7W1onaK82jvM8ShCSDrjQb6GxZ/e0A2TQ2kkw3040yAsbg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8193.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Oze6Cx/GVJJ6TkXMO1z1VqD2bcyo4Fzi8Pl2XKMEYjy6DW1y3g0w+LYV4YWv?=
 =?us-ascii?Q?w2DqdzBuo/mKI2veG/VU8kPHcmk4LjGZQz51gQacoZMCz+82vYddd1f0gzxE?=
 =?us-ascii?Q?Y4pm1UBFvTBx4jUDLFmRIAWap16Ph3w2l/Y8t8gzx3zaAnMns6STVJ0pK99h?=
 =?us-ascii?Q?R4vyScSkW9p24uLy1WYVtmw2QrTiimQ+Md2cpw2gCv9l9otp6O0e5twaA2Tx?=
 =?us-ascii?Q?QOIGcwLXO+Ega5NpH/e2NaOcg8mhRFjNqYKY/GVsl/NR8GyIVmjU7mwMT2D4?=
 =?us-ascii?Q?fbjk2NcnOKiUxRYa1ihij9uXJhdkJ4iK8kp9Ai4qd6+uv545m+JP6MkyMABY?=
 =?us-ascii?Q?nZHqSy06V6ZYc81GjODWvFFlBBTfFKpK/LSMpFAl1mlq0gLb/q3SCTcx11jb?=
 =?us-ascii?Q?kWvJLkzVX7qDiow7amFdtzT0exyAlPr2CwI6eirtldniEukKv9pP8FAK4cy2?=
 =?us-ascii?Q?Q98q/sKWCk2umusWEOY+sCmkFpJ+YcVcylx33wBs90bB5X5FEE87Nz/0fZUY?=
 =?us-ascii?Q?givIwAJ8Yjy/BBl7VQQHggtGi25cOeM4oGPZl60cAB09O0QDWBtDucz+B8H9?=
 =?us-ascii?Q?rAhQVXsR7KbyUUDZyifhvuqc6vf7AwGIwgQK8uLQ31GJWeqqjIvWEYc2TkvM?=
 =?us-ascii?Q?AHDC3Z/EizFOW2GEXyU31BJRo/NhSeSvjqzudTU5cAA7GiVGSwXxqh1hDkzv?=
 =?us-ascii?Q?mVD5I0gif+tBoqD4gyx1I+5JzcPozPdoo7Bjoo43ZXzQ879/Pa/3vtGoV9/U?=
 =?us-ascii?Q?qr+MQOs1D3TtDnOzMBoaQRqxGJhTxx/DvozBOVs10m4xJg8M0injwJ4Ybyi+?=
 =?us-ascii?Q?KaJzhp8aEVgKH5UL/L4CtlcHORu6qSBkeIyZOZAAaXWcB6h+7f273/D0Z1oT?=
 =?us-ascii?Q?lblrTMxz3lSaugklOFXAfL9mp6j39ehnRuLD4qXnwQQBOvv5wR3YhQ1eAB31?=
 =?us-ascii?Q?bKLdgqmA+YRbuEnK2UWdTeAbYCyP5Er5dwD3SnMi4eRer2fNOklDQ7s3bFHv?=
 =?us-ascii?Q?rMETqC+TwwkyzCOXFA0k2h23AX2KvkN6fEY3+EuxtDeCPdOmt/DSIetxX1iV?=
 =?us-ascii?Q?JuVnR8gFtMn0JAeYfdfu+stJBotvTp8j7bg+VzKf9C+WFdlncoXH01F6yoKh?=
 =?us-ascii?Q?D5ao061oEhXhGrpxyx9G+T6k1BtIZ3e0YeCkshy/Zj7ESEgzhHT9KM+PnvRN?=
 =?us-ascii?Q?QLXUKtXLWnnXt6ZhvBy8+55/YCMHBZRgwt7q8GbdEKasf8O3q9vjfuvdWJcJ?=
 =?us-ascii?Q?BjLAdq0bK4iqooOYzYaIb7j5yMmQoX5C4UR+3YdVwrk3+PBCdbB3QO7S51PY?=
 =?us-ascii?Q?4x+q/udkWGUIcNm5NyjRbi7g/wRykHz9qpn1+k2GifARceaOCOKJU0z64qpc?=
 =?us-ascii?Q?INUzTFypRvtVatGiHhQ+a70v7jKwUJes69Yg06MjtH3fpHpzimQO3YSVl9ie?=
 =?us-ascii?Q?dMjJqSawarYKPQO1BV/MGvFi0RA0FwKAAl8rhmN/7RaydcvEcOhyD+WLnUtp?=
 =?us-ascii?Q?zsgwR8DwGLAwkPGfJ443KaOEoVd1Lu0g35XzsGdlv4qz21vFma8bV/Am4UbT?=
 =?us-ascii?Q?VrZ4blIRERX49AX4QkE=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8193.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf822ea1-1034-4b72-fe22-08dd78637b6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 19:11:22.4289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nnCW+0sIwG9kjuH3i92IjRJX6Qty+MrfhVTnU9OBYp7cCX8wpL6PFg/KNvoCEWar
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4373

[Public]

Hi Stephen,

Thank you for reporting. The fix has been merged to amd-staging-drm-next:
https://lore.kernel.org/amd-gfx/CADnq5_MMGJFebpbjEZ_cX_sL8XFtGyt8mM+dYj9Y87=
zkCxvFrg@mail.gmail.com/T/#t

Thanks,
Roman

> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: Thursday, April 10, 2025 12:40 AM
> To: Alex Deucher <alexdeucher@gmail.com>
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Kaszewski, Dominik
> <Dominik.Kaszewski@amd.com>; Li, Roman <Roman.Li@amd.com>; Linux Kernel
> Mailing List <linux-kernel@vger.kernel.org>; Linux Next Mailing List <lin=
ux-
> next@vger.kernel.org>
> Subject: Re: linux-next: build warning after merge of the amdgpu tree
>
> Hi all,
>
> On Wed, 9 Apr 2025 13:10:35 +1000 Stephen Rothwell <sfr@canb.auug.org.au>
> wrote:
> >
> > After merging the amdgpu tree, today's linux-next build (htmldocs)
> > produced this warning:
> >
> > drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:646: warning: Functio=
n
> parameter or struct member 'fused_io' not described in 'amdgpu_display_ma=
nager'
> >
> > Introduced by commit
> >
> >   ce801e5d6c1b ("drm/amd/display: HDCP Locality check using DMUB Fused
> > IO")
>
> Today, due to changes in the kerneldoc software, the warning changed to:
>
> Warning: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:645 struct
> member 'fused_io' not described in 'amdgpu_display_manager'
> WARNING: kernel-doc 'scripts/kernel-doc.py -rst -enable-lineno -internal
> drivers/gpu/drm/amd/displayamdgpu_dm/amdgpu_dm.h' failed with return code=
 1
>
> --
> Cheers,
> Stephen Rothwell

