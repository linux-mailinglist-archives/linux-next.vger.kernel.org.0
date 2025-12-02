Return-Path: <linux-next+bounces-9304-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C26C9C59A
	for <lists+linux-next@lfdr.de>; Tue, 02 Dec 2025 18:11:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3AA7E4E3246
	for <lists+linux-next@lfdr.de>; Tue,  2 Dec 2025 17:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDE392BEC5F;
	Tue,  2 Dec 2025 17:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Tfl7qh4d"
X-Original-To: linux-next@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012036.outbound.protection.outlook.com [40.107.209.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAD454774;
	Tue,  2 Dec 2025 17:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764695475; cv=fail; b=khvoPFB65kHjH235z5v8+TqiGBBAYXxYiWEt+U6veq5Sr7cV1zEfB+CdTRuEAgjsJDUYuhPyObWEwpjumhkqk/3+FPFB0KrAknX0ulUZUN3hy0vXIlC15hOivtog9PrA2F6dhDGNqLKI54qzrzLnW4pagTVzEC/g8vEzHiF/WcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764695475; c=relaxed/simple;
	bh=GhpUYNPZ8BxX5jL4FM0X1O5vRs+VcXa2BI0UUZZjevE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=utAG4cxwmFNILIAzooVduWJkLVNYYQaLruNa6HOCRlPa9Pk1WwEUV9pDNwalZZ70Obvx+jEdC3AtCmt6n4QQZmXz2cNeL9ZABzw4jqvBIVFPv/g4/QY2LDFl3583JkvZpqf40tJUpg13IRRIBGdliiv9aulNnDko1yvPlKuwly0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Tfl7qh4d; arc=fail smtp.client-ip=40.107.209.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJ0bTbbBwNDb2779Jfa1Lk1ukz3grDjk2olkJmm0u862jbIGSl/DcY+CV71/k/cNILFrydTsvzJ5evYjG9cnGdaKrlYuwdEvZ08ZumBTIuSVTrcNXE2M9P69zQk0UJCcWk6rCEThlXgj59JLYHcMe442R5O5SWCAftgp+oDJEU90maf+HmdwQdcLk2wBmWPJNN3/qhkHPFpkW8qNNSM3fa3Q8DQ21fTQgmixfM+x0AVzetznQCY0+vrPddESzAFf/d0Cwj+59/korLX128es9XIzRv7H/+wQgkMhOX7DamlUmTUyOslHfXqufFvRdnjBbSoI/QQwcHj9+kfGhf0VoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4rvz5E4rezoYV9MEHwnw+uzXwIXeComHO1X7peLEVU=;
 b=G+dQ9fKNDHJ8N0t+mrdXivKQIk3kezBfSrkpBMc2B9ioy7fvRFFBhLUg7Hf7NCTezbwjviSkATVD22jHG4ZMjysiHcYvssXhZUEUzUv6x2KDkYwk1dXxtW2vOcK/8cQ+757cHRqU3XAlTBvCgju7fCr0CFfBqm06cOw0tdhZ+9NImsYFK/+KZ+zGx51TBRu/k0m6d/Vkw3IWD1wVYPM4uOmBZ6dIhPGiaZJ3es7L8w1mc4OxNjaD8+dAATT+3V6yTesjbZjKagVDuIO453B7a7vRWRnV6lh6xgGN4LNw+u+tEAMuwetAzIt4FMHjJyyQwHuI0Gvz8Mi00mn1ScO09A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4rvz5E4rezoYV9MEHwnw+uzXwIXeComHO1X7peLEVU=;
 b=Tfl7qh4dQ0b0xruuNLOOe/OG9A55Zm8qJIeDqjRwZQJpA4GddYWDqqyClQuyWB8JwaL38jA088EawVo7Pro+sx7N+94ps7gCb+1YaoqvcUZFDY5lwXP23dTirjDyfawq3uIqwi+Cm6pFaNsLesqQPiX4lAgxDpZWmWWkbLqk9g5ISwsxpFD9r8cfbUbVGNUQNfT9vrhxkhYt7Xja2lZPucOx4zHS34K1lVfrZEEeefYraERV3VGzVCqb6LKZSjhKFNSJjtikSYVMmabk4E3wMwvW9TbrD7AfLYNC6aELU48857O8CEYZFC8+KIqpzAsX9a4DrMGzAwWYFt/xaMj5Vg==
Received: from SA1PR12MB7199.namprd12.prod.outlook.com (2603:10b6:806:2bc::21)
 by DS0PR12MB8456.namprd12.prod.outlook.com (2603:10b6:8:161::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 17:11:09 +0000
Received: from SA1PR12MB7199.namprd12.prod.outlook.com
 ([fe80::928c:89d8:e8d6:72dd]) by SA1PR12MB7199.namprd12.prod.outlook.com
 ([fe80::928c:89d8:e8d6:72dd%6]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 17:11:09 +0000
From: Ankit Agrawal <ankita@nvidia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alex Williamson
	<alex@shazbot.org>, Andrew Morton <akpm@linux-foundation.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfio tree with the mm-stable tree
Thread-Topic: linux-next: manual merge of the vfio tree with the mm-stable
 tree
Thread-Index: AQHcYluxR0eUHUdVhkO+e0OQMJFubbUOliq0
Date: Tue, 2 Dec 2025 17:11:09 +0000
Message-ID:
 <SA1PR12MB7199828D7A0B824E1781E161B0D8A@SA1PR12MB7199.namprd12.prod.outlook.com>
References: <20251201114439.4fab07f6@canb.auug.org.au>
In-Reply-To: <20251201114439.4fab07f6@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB7199:EE_|DS0PR12MB8456:EE_
x-ms-office365-filtering-correlation-id: bce5efec-3ad0-4dfe-9468-08de31c5c996
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?g+rBPRo4kxuJMFEchTs+LtTS8VRddPgWkdVynqVpXWTMsZXhLjLJQNlF31?=
 =?iso-8859-1?Q?iA8ESvcp/bIy4JrpI3iM9ss+YEOQJU8M9D8Cygf4yDer30k0kOOXe/F8Xc?=
 =?iso-8859-1?Q?rPLxv0ukUsQgHuM3WGlh2HkNeGu+GSzRPAS6f6qul61XODaE0ZTEB0cKk0?=
 =?iso-8859-1?Q?GJ76ygGo8rEDWrSeuw05/+9FMAi6KBgReX4HN4OT1FXRqAhb0UALY98Mwy?=
 =?iso-8859-1?Q?O/2In8q5qHzgPDj+d7vA8Zmo0pTDjCptu9bqjhY6r86yiKKWl7wKsz8fGS?=
 =?iso-8859-1?Q?f+1veFSPkOZQRJ3xB4OQTaCBHvqRS403jgEWGcBypG7YobzEdFfwjP9nA+?=
 =?iso-8859-1?Q?su7ZpMcgt7tTMyIjr0u+QkxOmBKMYTToPSsU0CdRp5Sx3Jr2zTun5xEOxJ?=
 =?iso-8859-1?Q?gnAZ0SKf/a/L8LXbPRrhnCOybbdUQqiOJ89DswPBG0KOOp+FA7rB72bEQg?=
 =?iso-8859-1?Q?JzKMEpoq/Sle2QzVIi8cM+Kfk9yU5q4j2MF9qi+hmNAXm+aVQq4psN3+f6?=
 =?iso-8859-1?Q?bv380rI3s6g70XfQrlDcQ/XEsUsM6hCdeW4C1HuXWGpMhWoZSErUplzsV4?=
 =?iso-8859-1?Q?1zUTwIkLACn/j4seXmq6utkvs7IlGyH9/2angvrElnp+CPqg0aNT3QHUWs?=
 =?iso-8859-1?Q?nzwS2r/mqhxtOp2ZUlIXPX6NQ9VXiKbKrArMJtLvqxB6wBGCVucbdQBr6q?=
 =?iso-8859-1?Q?FwdR2rmVrWLcybzKeMSvUsojQS8CDy/mIzG8uFsBI/SxB3dlMxFM5h4Vgx?=
 =?iso-8859-1?Q?8MTFwkfMKgYpcxNjJjqknbiKogVvxLoxBCqfn+jtKKOu/XSI+xaG1sfkkj?=
 =?iso-8859-1?Q?aeVHCfGkUEMBDVIRoBSH1RDtmLG8Vd0O0UMZsnUYd7qOHQGI4C3aAc05yS?=
 =?iso-8859-1?Q?3TdOr12EFucfC0cM4xixJASSqUr2If+Oy5C9wZmvoYBBjFeU92nl9kGdEl?=
 =?iso-8859-1?Q?WOVNwLrN/7R95LTHOFlvpNcGxntyvk+XpYbjrvjT3uefz8VOAxhIYB+Yx8?=
 =?iso-8859-1?Q?nYbuqHtr9urfjnbypk45Wt/vWeTMW0EhsLyAq/Culs3bDWlymmYB5qfg92?=
 =?iso-8859-1?Q?M1QKZhx803b5eJFpz5jYpc2enTqgOsvfu3QCteQq3JMhldTS6hglTYwpB4?=
 =?iso-8859-1?Q?lTUb1IlAjAQLM9pEcto/o+azDzy9dvukSmLtN7VmRIK3IFDeXue/PRK8Y+?=
 =?iso-8859-1?Q?+A+6pDt3bVVnr0JUcQMb2ls0H1cygQc5Gyg/UD0k/A09XHSiY+p4eyS090?=
 =?iso-8859-1?Q?VwOBIXl3xxrqI2QPsvBQhMgQU8i1r74lOkhMOpmMaOrDXoXQGEXa5YMvMy?=
 =?iso-8859-1?Q?G9+Hi1RJyhlYAusDg3WUcR2gQ2xljwMn/pYRrGleH4CXplp0Tx2p4gLXJN?=
 =?iso-8859-1?Q?dJm/L7tet91a+l4bAHTcCi/S3VMHxIe7219A+98TeoXzumTP7Qp+a0k/2r?=
 =?iso-8859-1?Q?wY3oaczB+m7dVKSYVcutV9h1ZSTnmVpGd9YvxCMyM1eqq3sHmT2noFRaJY?=
 =?iso-8859-1?Q?idGofl/omoZoUJ/yuLlcj8KKoq7S8yU9M9w4G3BsGLBOWG5sgbVkzXTBL+?=
 =?iso-8859-1?Q?8ue1ajNffV5c/BmxSgjfNWGEzLzi?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB7199.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?qWeXBP3DcsA/58LjvRuygVPgytipo6aP3sC5xVqadGaknpdAtub/slRbEH?=
 =?iso-8859-1?Q?Pk4F0XYhxJ6rhuL7+RfQoWcEoGUyd/WelkPtmhy+ACL22r8SmqCROkUEY4?=
 =?iso-8859-1?Q?feh8VaonJ4oKPLjNuUXzbo7D2sMkEWu9CJmZu65Pcoo2e5ALO8CDwrWf8/?=
 =?iso-8859-1?Q?tRfXadoxHuTLpkC/Lv4tVIwGIg9KdjH9995WR2mIt/VqYyB3LbvzQEoiOR?=
 =?iso-8859-1?Q?J5zDYkvVSon3ACJ1/daX+URZ0IlsP3+3OyKnwMhUJXH3ZAnFWswt6K8UZo?=
 =?iso-8859-1?Q?1omv4WHxEeUrTcoHHEUkcaKr/74WfgY8JD8iRVPIYImAJrGc3KBOf5EGM9?=
 =?iso-8859-1?Q?PrBU8ABZrrugni5/o/FO9zRPbpN+Ljtl+3YaA+1dQ0/j3gQoXYHtpHxT3J?=
 =?iso-8859-1?Q?8Ws+XzXevUd8sT+f5kJh15sK2sek569jDFxkf36VwhzgYAo0uEhacHNif+?=
 =?iso-8859-1?Q?7Mrub0kOn1AvGWMZlQdldena8Z9fKh1zQCIj5MmZHjsGVg7aYbCvX/y9G/?=
 =?iso-8859-1?Q?ekJeuPhHTuH/J6T8D9nChdJ8DEYrjHfWnojVFIFSfnYtZcwEn1WmK+zgDD?=
 =?iso-8859-1?Q?r+QOp6ztbp9Ch5dV1c7Hnnh88XMnf9+zw66/rJQVzI5Z+QYxzrdGsx5C3i?=
 =?iso-8859-1?Q?VfwQCS043YJnp0+O+jnY7DdThtMAP5wniQUB8MGEaW8qS/jI8ZSNLQrpNg?=
 =?iso-8859-1?Q?zifGPSdnK+zyJj+uKV+ezlVEo2xYNaT8aWAyAhSqsZkL6GP9Mx9JsRl04r?=
 =?iso-8859-1?Q?eZnYF55MlDkul+MpnSbJ4FDvgFEj+73Z1BdVa3QP8w8LfzZMN5XagV0dMl?=
 =?iso-8859-1?Q?N98p4f7cgKaY+HCsHyyhdNSgI91+37itduL7vCmZZGRnZc0Rwn6kV43nRo?=
 =?iso-8859-1?Q?wkvP7o0mJT5I9lUL7iq7uC7Y4yDwHWZVKwJHydS5XpXEf0/99V8vpTUelk?=
 =?iso-8859-1?Q?rSZp80lZ50MN5AEb0/pke5cRT/eXGkzyxGS0czZ7pjIE9lG7TyWEReI3gI?=
 =?iso-8859-1?Q?DKW4obWVnoG5sE6DL11Wobayr1XeW4ATvp3tBthUcWxXqucvbvsrJeH8DR?=
 =?iso-8859-1?Q?xGs9h4N8UKXZSFN+GqrM4paKylyj1uWD7ELXSHv7r8Urpvh8Wm2UgLv4Eb?=
 =?iso-8859-1?Q?KRzlpdLwPc6g+S+xqyxcNTtR55XM8FxjAmL4hDrwGvFazxwx1TlsWNmnMa?=
 =?iso-8859-1?Q?imVjdaeFXHqtGGNfKvK5SWSNYEvp7yB+yTGZEOdioMwF4FY6mlia4Rzd5L?=
 =?iso-8859-1?Q?1Xl7scXdpIvk+qIp4pMd0OqW+Sv/4UCCvIy6pudf6IohuY6PuSOpomiCkI?=
 =?iso-8859-1?Q?iwuHhwJmP2C0P2DufEAw/zOch6NZRHuGDo20YCtCnsBTkuA+Nd95OdG30Z?=
 =?iso-8859-1?Q?ugfEXQEbNgg10bDfVle+z8iMm8ITtX5msH1VVX1D9xOlHVq4vYaBcsuQNb?=
 =?iso-8859-1?Q?XpyadYmbrSAKNMGm7lvUZoaBUJeNhlZb6X1ZGjpq+32VF5GcfDqaZuFZEA?=
 =?iso-8859-1?Q?Am8iEhhfHxPQyH3GhcK+LKn/UQD5sWO3+Y5Dp2bR4JAyQ5On1YlI5Q2IMp?=
 =?iso-8859-1?Q?2kHgha6gdzYDTf3ewE5tjqqpyHOVgvtzxxmmvTiHbzfhGOYcfwCI7snt9w?=
 =?iso-8859-1?Q?DpHee5Aj4GRko=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7199.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bce5efec-3ad0-4dfe-9468-08de31c5c996
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 17:11:09.3390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aWltoGDQmaR+cP7olUqW7/P6CSA1uU6lh3XSJLcituctlHuNcwZCcMh2dI8lxm+NcjRRHm+a31uhBxk0vAs2Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8456

> From: Stephen Rothwell <sfr@canb.auug.org.au>=0A=
> Date: Mon, 1 Dec 2025 11:10:51 +1100=0A=
> Subject: [PATCH] fix up for "vfio/nvgrace-gpu: Add support for huge pfnma=
p"=0A=
>=0A=
> interacting with commit=0A=
>=0A=
>   ebb9aeb980e5 ("vfio/nvgrace-gpu: register device memory for poison hand=
ling")=0A=
>=0A=
> from the mm-stable tree.=0A=
>=0A=
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>=0A=
> ---=0A=
> drivers/vfio/pci/nvgrace-gpu/main.c | 1 +=0A=
> 1 file changed, 1 insertion(+)=0A=
>=0A=
> diff --git a/drivers/vfio/pci/nvgrace-gpu/main.c b/drivers/vfio/pci/nvgra=
ce-gpu/main.c=0A=
> index 4104f46fb378..c6eddb7b823a 100644=0A=
> --- a/drivers/vfio/pci/nvgrace-gpu/main.c=0A=
> +++ b/drivers/vfio/pci/nvgrace-gpu/main.c=0A=
> @@ -292,6 +292,7 @@ static int nvgrace_gpu_mmap(struct vfio_device *core_=
vdev,=0A=
>        struct mem_region *memregion;=0A=
>        u64 req_len, pgoff, end;=0A=
>        unsigned int index;=0A=
>+       int ret =3D 0;=0A=
>=0A=
>        index =3D vma->vm_pgoff >> (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT);>=
=0A=
>=0A=
=0A=
Thanks Stephen for taking a look at this and resolving the conflict.=0A=
However, there is a different change needed that I posted below=0A=
created over next-20251202. Let me know if you are okay with=0A=
merging it.=0A=
=0A=
Thanks=0A=
Ankit Agrawal=0A=
=0A=
---=0A=
 drivers/vfio/pci/nvgrace-gpu/main.c | 9 +++++----=0A=
 1 file changed, 5 insertions(+), 4 deletions(-)=0A=
=0A=
diff --git a/drivers/vfio/pci/nvgrace-gpu/main.c b/drivers/vfio/pci/nvgrace=
-gpu/main.c=0A=
index c6eddb7b823a..ed0c6a63e05a 100644=0A=
--- a/drivers/vfio/pci/nvgrace-gpu/main.c=0A=
+++ b/drivers/vfio/pci/nvgrace-gpu/main.c=0A=
@@ -77,13 +77,14 @@ static int=0A=
 nvgrace_gpu_vfio_pci_register_pfn_range(struct mem_region *region,=0A=
                                         struct vm_area_struct *vma)=0A=
 {=0A=
-       unsigned long nr_pages;=0A=
-       int ret =3D 0;=0A=
+       unsigned long nr_pages, base_pfn;=0A=
+       int ret;=0A=
 =0A=
         nr_pages =3D region->memlength >> PAGE_SHIFT;=0A=
+       base_pfn =3D PHYS_PFN(region->memphys);=0A=
 =0A=
-       region->pfn_address_space.node.start =3D vma->vm_pgoff;=0A=
-       region->pfn_address_space.node.last =3D vma->vm_pgoff + nr_pages - =
1;=0A=
+       region->pfn_address_space.node.start =3D base_pfn;=0A=
+       region->pfn_address_space.node.last =3D base_pfn + nr_pages - 1;=0A=
         region->pfn_address_space.mapping =3D vma->vm_file->f_mapping;=0A=
 =0A=
         ret =3D register_pfn_address_space(&region->pfn_address_space);=0A=
--=0A=
2.34.1=

