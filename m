Return-Path: <linux-next+bounces-8429-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB59B9107F
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 14:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F34027A84AC
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 12:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A310418EFD1;
	Mon, 22 Sep 2025 12:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YciYDy3H"
X-Original-To: linux-next@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011068.outbound.protection.outlook.com [52.101.62.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2603208;
	Mon, 22 Sep 2025 12:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542599; cv=fail; b=B3zd3RJbjKoa6RnTUwgqP61t4/IE1d4VNKJuTbfvsaeqgHgTs2eSLNBm2HkNvzjo3kcxIbFJm8wDOQsdysDpLKa9t6+CNrzxUqi1v+FPLdC8Dm/jAdIWEMOKdg21JaKGgAjl2mJFGC7206YwloqRH3v4km7p0yp7xAWyLaFDXM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542599; c=relaxed/simple;
	bh=yP+HtVklrsF/QMp4GJAumAU7oGfykv+pURefLjrE5W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HQHjHR3d+cIoZtVTV7Z4MLNh497z7XhUZqMphpCKPnm0RTaSnQBkbfG57mbxTUMC7urmleW4XAdHomkLA+bjgtQGS/i/cINkjEK5eYS5i5rGlWl+8clQCAMbZ1IHYL1aMPjU3mAhNeNEU2nfOuS82I1pxHM0HkPIKGISBW6ba+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YciYDy3H; arc=fail smtp.client-ip=52.101.62.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFU4AcfKz7xA24UsFaOSE0RXMJ4srkDwwRKwGaPLeMOJf8+3pUYzQt+8jzei2TBal2Y19wDI6mEDh2DglawkzfQUsTJijUobEdGhmhnrcIvzg2JKIG63AhE5MZ/FhthCyOhXuKiyXKLh75H1Va9WwWivXzshsxs4xGiM5WZolSWxeUKoBqFJ01BjLXtRNQ2dCScGxCNdQmjn5U/D8I5/3MdzSjJtwcqRHFjEJCvlc10VjZAUjAs8deDPmg1hm7y94U1qS/HYsMROyh6F9l5GrGtgvcLVqXgnBIegjFJZcU+QodZWLm4oHG2ZLAJuvW1Lc4Yzam8/UYCm1UmNHFQPLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yP+HtVklrsF/QMp4GJAumAU7oGfykv+pURefLjrE5W0=;
 b=FOehTYp5GRcMNt68tFj7rXYm/jEsZsARmt7hB4Yo7A+nWgurtZ4RZU1tf3Jn+CFcVbbffiYxAKNkbolNVSvchcCxqItzLdEGGnQE9lnvsizV5vNiRhzLR5+jTkdWEU5DlLfPJxWrp6t5DNYcGebcSeAVC7Kc1KHIE3gqSHnUh9ySYSQl0FWOAcOMZUyL6dIyU5Ys58CqkAsRdKxgiZ6NDxqTKGzGqb/4rDQt060yNur5I/FG+g3QEu32hWvd2nBV9JkzsUdbRjed4vBxByU6EjUAoa2PSIwg0HT0mD3ZXHJLzfbTDJMbFo+RgzF8ntrPhJAfFowL1e8Xs74A3zMXXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yP+HtVklrsF/QMp4GJAumAU7oGfykv+pURefLjrE5W0=;
 b=YciYDy3H0//IBml6QGbU7l1/GlMDH+eltc+e2Um146GIPXqV2qe/WKkQdcl1RTipEt+kcR9mjpc7v59KiB6gsoWObh9HN4n1RHmr6/8Gg4bJ69BPyiPzRjr8p9Gqr8RCCB4KP4LH5KWBXdVmg2M5wUcoSD4F7DLUPgo7zbOQk6QEOdjcJf5B27svcrgp7egrln+1EtiJATL9ZxvLKSnddqZvs2y2gzt5txVMM7UkK2q6Qs8EWUd5q0yts4ggafn6hzRjijkDxp+Bil62YeOtaUvuJlm73Isx2HixvQ1dZkkZMKKNcIawq9C63H0yCuoqpx7qzjKVtENtggP/KexOBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8317.namprd12.prod.outlook.com (2603:10b6:8:f4::10) by
 SJ5PPFA5F0E981D.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::99d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Mon, 22 Sep
 2025 12:03:14 +0000
Received: from DS0PR12MB8317.namprd12.prod.outlook.com
 ([fe80::8ca4:5dd7:f617:f15c]) by DS0PR12MB8317.namprd12.prod.outlook.com
 ([fe80::8ca4:5dd7:f617:f15c%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 12:03:14 +0000
Date: Mon, 22 Sep 2025 14:03:08 +0200
From: Thierry Reding <treding@nvidia.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>, 
	Akhil R <akhilrajeev@nvidia.com>, Kartik Rajput <kkartik@nvidia.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the i2c tree with the arm-soc tree
Message-ID: <ainub5g3brbi2xma2d2mz67edjfgrsgmzyrhbb4ot55p6ilko2@gr7gpjcj6rkh>
X-NVConfidentiality: public
References: <aMhR9TJm5V5EqaoC@sirena.org.uk>
 <aMh_eKWqkuLODo2r@shikoro>
 <e70f4454-d0f5-4b3e-9751-730781f056f9@sirena.org.uk>
 <ofp27qiwsw7jj5ne3y7kp2lpycwg37bvhswidwe6jfazs2czzp@76gzsofmliyc>
 <aMskxYrDxyzXPsBy@shikoro>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t766vxyjf5hf2g7k"
Content-Disposition: inline
In-Reply-To: <aMskxYrDxyzXPsBy@shikoro>
X-ClientProxiedBy: FR0P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::12) To DS0PR12MB8317.namprd12.prod.outlook.com
 (2603:10b6:8:f4::10)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8317:EE_|SJ5PPFA5F0E981D:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bd0e949-8693-462c-16bb-08ddf9d00212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HJMKSV36YQwhU7VdgHicQ3SzoDLXRwKN8b3VB3Q29ZXeLj5IpCJfKbtUUPub?=
 =?us-ascii?Q?lYNZ0ozDLmgxr8fpLHlRIj0JNrWKa6JYU6lCw+OYhblTYWikIP+73m6Qi6rA?=
 =?us-ascii?Q?foDGluK+7YtJZfkgLnA9c3dSIJ3uRT4JrBup5gNvtEuTn47HPvDmTxC8CgTy?=
 =?us-ascii?Q?jAtW9/MlE1tQMO2Yqpsg9tbyBiO/cVJrfiqiwgKhe539SZ2quaKlChUnvHLG?=
 =?us-ascii?Q?qunL/cL0pQ1oQkuX8f1aaTgNGcLI/RIiLtmWCa02dawW2wEISMyu3AZfXzvD?=
 =?us-ascii?Q?fRZX5T+PdFt9vQR8ehKmQfgM548EuBUQwiJTyc+PDf2bcdvgY2ArsH86PWu3?=
 =?us-ascii?Q?HJHuopv94o3/9Qz6SS9Zx4l0RBcaT0BpolvbzpLQSDGl8vc+F6tq39DdV1bq?=
 =?us-ascii?Q?U0DdhRUAmfYgLRyclitPUj/VDfz8Ucs2Zqk5GqttHLoWYLRHw5sw61vonqwB?=
 =?us-ascii?Q?VU7oW7k20hg3r+oXiHu3gb4H9Y/jR5UzD88V+1KPJaIsyxobwhxuHAe6WisH?=
 =?us-ascii?Q?wJ5hLDhMz8zNAffj8UYp/WARLjLY4F6pHDA5UEI5FBSdAO45SwkVrXTX7kOC?=
 =?us-ascii?Q?ynn7wWsH55JLARfMgaEVIsF5XQGGDGMCPQj98KzdhGC+czS4OiJv8Iz1oAXg?=
 =?us-ascii?Q?tNQfQ3fiaV5BFSlwuWmYMHUmJMtA2xGdL/RxKUxwIBNwT7/U2v+Q49RO7aWA?=
 =?us-ascii?Q?XUkUT81dqB7d1EbseCpZ7bmUy7n5cYWOYXXPNBLaZs8jUwJ/FPmHCE5i0Sqt?=
 =?us-ascii?Q?/hwbQFR9UyLwfG8UeL5Gyo6sHIkcZS+EJk62zcg1C0xd3LryTlhVOWc2l+PE?=
 =?us-ascii?Q?KR1OjUkzOOraCHbbpsHWmGdPWS4STwvRgRnXVDXjuz1HtuJpNGPSjtx8WEtX?=
 =?us-ascii?Q?XpbGhAtOKP7X4xopyn/YhwziOHW2mF5PbqMWIOpr12Rr0aHbni0pI/UlRlXP?=
 =?us-ascii?Q?Q5I8Gr52mr9NG1CDUoaXOXRPc/0HGCwHWnAJ7ZCQUus57OaybDKT4+ODyikW?=
 =?us-ascii?Q?/+16pocnLgEC/Hb3FrO03K/IYy3Zr1UupunVKddGXZjdW/V7eYP9HerYpZvG?=
 =?us-ascii?Q?CWtFkASqsRuPnC1Y8GLA1RnzPaUOKLLPV7pzSHEXEWubISwIksswKsN53brH?=
 =?us-ascii?Q?Xk93E1caL6Ik7d4yzd6t8AWPoKyCXlkg+bd+bO0aIW1cNgLs8mGh4XFLQ2+P?=
 =?us-ascii?Q?gk/j8zjEdjR3Fk+vqpsDg1evfTPrgNxAvMEaHa9JOzMYBJfu+2hBQQbaaSZ4?=
 =?us-ascii?Q?2BICFNGnLMbulINpTI5re2rDh6RB2c4WlcQNZkkQdvuSGLGpwpCEmTmI4aPR?=
 =?us-ascii?Q?mSWgC+HTDQZcBCP7yzUNZNEO/odn6UKhXDa0S84YxiSf6CuXWtEmBCj2gUQH?=
 =?us-ascii?Q?nxjZr2Hm1EjCeMSi1CKU7TIZlmaVYGcCedp0t1DSBeGSc306BmZdVJA+jKad?=
 =?us-ascii?Q?sFbovmwJA+o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8317.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fghYhjxLkrDHSmikn1V5naeT4KWW39iwgpzL3/yArh1c0thGsuo4hxckNHbb?=
 =?us-ascii?Q?Z8Jgqv5lluU3oBl7gxS4l6gTQUzx2sp059/TkMVcbqEQ6DSnSMhmle0OE/9D?=
 =?us-ascii?Q?kx618ooybZEskbJHh9A9qVPv0x0LC+Fw5ovzj7ZgzA9ElO3OS3SXhf5dPawG?=
 =?us-ascii?Q?A+vka4C8a78y07fpcwhrI4Los453fQTzKVgwG0IRkiykfOt6qhtZO/H2qNSt?=
 =?us-ascii?Q?uzyqWqfVS/iqxmebB8+d6GcxJzv5O4dtc0FjXrRst2TYTNsyuCcpk0SFuGEd?=
 =?us-ascii?Q?W24LHiutRPO+DPoquG49BtInaBEiqt72NuZX+kJ79BNIwrCODox4YxYQfO6I?=
 =?us-ascii?Q?1qYPgo8MkEF20/OrBSABykMtBDjA1CB2m77Wr0W/Qt30GQIONWwuIRgeY6ss?=
 =?us-ascii?Q?pCCAd7fuJu6yQSqhGhIri9BRB8f8tDOlsVq9IviYyrPrevwL0mf0nnJG/sJW?=
 =?us-ascii?Q?9U7mwY821xEFqH/Ke7bevGywUr64kZQbZKBSNa7VYCJZJQe/bWSBTxEPvjhr?=
 =?us-ascii?Q?b9KGXEgjGoDdzgH+UEqFWSHk3nBQCgEaUG5kbe4yY9t3YdaV1LS3NitIXjH9?=
 =?us-ascii?Q?+U2P7Ej1U8/of71GZS6AAqOdzZntspmBPP/AIq3wMHCneaScwm8AmhkBsiC1?=
 =?us-ascii?Q?WUD8pIRpD/izVLRXimqyG5UaHXdss8SENI1doLL5HjuZ9RX5wyfNxeaupH+7?=
 =?us-ascii?Q?2olPh8Q5Jxd0TEamIjWTyTXWOlouQLq1LGido8IkmSFknqCCjbQ/x0a63pAi?=
 =?us-ascii?Q?Q6vw1BmpfhgIWmo7RWEuKzBRGQo9QuXsJSvS80+x2tWw7ZNYzUTIgH1w29X8?=
 =?us-ascii?Q?5OEXUbslW/APTV5H1I9HVAfnmwaptVKvxWONslNHDF0VY7IN15ypeBK1VRot?=
 =?us-ascii?Q?TfUiJHpIFIogwcOZLyxpe0sWOBVvJRHejC0UGdSAdsmQLMABPiNy05T2xPha?=
 =?us-ascii?Q?pkCgMpMBeoq49TUsklpO5wQBzqaCiX7y8DSFkazO4naEtzZ9hINTa+E/Dskn?=
 =?us-ascii?Q?74bPopUbx3/a/3Y3hw1UogLzYEUexQN7/8PwKaxWmdUfQHVuSnwxXanukIae?=
 =?us-ascii?Q?WfUY+JgqkgdukmrC2RNdxO8dY3qSpaU/4LdlGCPUTltQj/7CZEYD4jpRU0Pl?=
 =?us-ascii?Q?reAqNCv626mKRjoq2GEXmcpH6r3hX09hxrn9ON7zg3bC1GUnGwAHw2GENL2B?=
 =?us-ascii?Q?o2foXE43HxVmcl4J+W0smpR2Paz9+fJMH59jhGgwLZXaaHlUUiVDoeTIuxLT?=
 =?us-ascii?Q?8yXWNoMKq5QkGNSZU3X7Kj+s0Eo1jKZjWDzee4fXiIMJYWB42ZjvOy6j8YKc?=
 =?us-ascii?Q?DRSjIbt59RFTM0euwJqbBYC96pfGQ0/JrlcA46ZD1bTzKGyYHHgyOg5KLU3a?=
 =?us-ascii?Q?U2PgDFG7oJxr2IiIb0SoVkEAEnzOvUlVxuADiSN8EP3UelkISbxh3NxsTkqz?=
 =?us-ascii?Q?qDS9YvPaxtW2DIQ7bmk/JT1oUCtUinPJzSa7ArOrjFbXXiU95RiU9F8vkU0u?=
 =?us-ascii?Q?Ypby5f3qHXqTTScEKM994gopS62fK7ElCfbVS1JzWbUZ+sEh3d4BabsW4cE2?=
 =?us-ascii?Q?UF3pyYrCiILR538WyuG2XoTN5QZ0cI967SoRXL1RLpe8nekHA/Cnx2R5ymqP?=
 =?us-ascii?Q?+nS4lUKQsDLQs3hTV5lXu1yEzYMnGhPowGBYrcGJIjrE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd0e949-8693-462c-16bb-08ddf9d00212
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8317.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 12:03:14.2063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wlWmXya8r1hFMawPjRIpxp+AFj2ZJpmo84Z7E+TvZToiDT/SUu1VAOxs5QY8J270VKMrB5iWEYpDUREmn8U17Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA5F0E981D

--t766vxyjf5hf2g7k
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: manual merge of the i2c tree with the arm-soc tree
MIME-Version: 1.0

On Wed, Sep 17, 2025 at 11:14:45PM +0200, Wolfram Sang wrote:
> Hi Thierry,
>=20
> > Note also that I only applied the DT bindings patch from the v6 series
> > because it was already acked by device tree maintainers and there have
> > not been any objections to the DT bits, nor are they relevant to the
> > driver changes still being reviewed.
>=20
> May I suggest then to send the DT bindings patch seperately next time?
> We can apply it earlier then, so you can continue your work. I prefer to
> take binding patches via the I2C tree so I can chime in if necessary and
> also to keep the merge conflicts low.

Yes, maybe sending DT patches separately is a better approach. I'm sure
somebody else will find that objectionable, but... oh well.

checkpatch also tends to warn about patches using compatible strings
that it cannot find any trace of, which has always been a good argument
in favour of sending series with all of the pieces.

So if you were to pick up the DT bindings patch, then I still cannot
apply patches to the Tegra tree that use compatible strings introduced
in that DT bindings patch because it'll cause checkpatch to warn about
it. I can of course ignore that warning, but the warning causes things
like b4 to fail, which then makes all of these tools almost pointless
to use.

Honestly, I don't know what the right solution is here. Seems to me like
no matter how you do it there's some downside.

Thierry

--t766vxyjf5hf2g7k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjROvwACgkQ3SOs138+
s6G5ShAAlVr4rMgZamL7kPXkUfA0cErcKM1A3pduZycyifKAWeCxsqC9LSXXHMBk
+hwO7CPG5KBESFFzuK34f8hrXHt95K/mhwWpKgNaU+1vOtjSlL0v12glFFjUcURQ
Lv4v70WkDjkDuF4HgpoEDi2iPp9lKK6ohG0j4DwTah4ku9afotkAXAqyDQadzz6n
7pHG9+oo2NOyVEdfiita3nWk3ljWE/NtFVERBC+/PZ5tEeI9CO57rvFMJFrG+XjS
Om+f6nIFFAwUfr56vtInVyNFQAABLHR1xwFKfptzSJBtafg5T1tdnNyw4aRWhn6u
OReD8f/z6GgMnpysHeSleygqpQMzkQyRRVDLYpA8Ro6wVzGrKfTCtswNr8BZ8xgQ
ZV+QjwCTexjL2/agOS5hUM7IuKZ8O74eRNqF4kMM1MCikp4DymZVLETqD+lg8JFZ
59RsitYuKqDZAHL7AXIffA9fvlHfnawrlgipgKxrtR9EcOoT32ecAcEax+d7g8Ou
XnUQJNv2Q+9vLFlHPIp6lIR6DwdJYU+LpR0r7h+ubMxNutj/hbciiAB2bh3p+dFk
aBWtov9+V+Rf42fuHG93yVr2lHRDxdr9+gitjiQ9IVQRY5++xDEoyLG7NAvaNeyl
CSUJXqJSE2+RYM9m2giMNUeD7Y49YzIHTkkR86LUiUYYR2V/Y4E=
=rPgt
-----END PGP SIGNATURE-----

--t766vxyjf5hf2g7k--

