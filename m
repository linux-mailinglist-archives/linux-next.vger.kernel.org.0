Return-Path: <linux-next+bounces-8343-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6B7B5A426
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 23:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 297FD1C04D2C
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 21:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2182F5A34;
	Tue, 16 Sep 2025 21:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cCgJD2C4"
X-Original-To: linux-next@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012001.outbound.protection.outlook.com [52.101.43.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB419276022;
	Tue, 16 Sep 2025 21:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758059205; cv=fail; b=XGs7M7xoDEypQDFSbBUDE+STHwQIxztySU58/Ji3YQWgRB/T4WpZM6dtj9x6vWGpEGAoGHw1q6vdjum2DvUngilO7gbl6Sktzoafla5FMEhG7GJSBYma2mduhR+g2NuryWw1bdB0/zl1IpD8dm5Zh2Vj4NNNhofAevNya4yMKfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758059205; c=relaxed/simple;
	bh=xZYFxyHB38t5Z2fydO+CaOIHJ/fkA5tSz4Q58004JcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KUg/wTfjlr1u9Bqaz/82pLeM7xx0Udd1UjuAcH3Ko83hAZYzd6qgqwJ4bDO/cnSsJ0CUlHAtDugrUopiybdB6ZaG1/Ywx4ZLmckOiZco0G/4jv7RbW4vvFwYZ/fjdzYXW4iwPjlFRqsAmu5rtz4ZM5gBC/NAdedMe59CM8YcMDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cCgJD2C4; arc=fail smtp.client-ip=52.101.43.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lSez+poGGGIWRgbLaMLWnP9yudJzuEHe+lt0G/cStTMPnJXEfhfuAn/7mQkozSi2gP38Z6wbLJU5Io9eqCDmz4GRlZI+xxJegNYRN58MTisiE6n95YLjNSGKdYqvxqKGgtDS4qQYih2FVnaf5qBYhNfICbQ1cLDfn3wtPtNJ1SluqX9rTgin+A9AaWjEjkWyIRPZM2E8medAGPAKghl37qpLHWmqPOPkWOfFuSzwIeNdy4gnk7Wyj+qHKxb9bcGdHHVEQsDBFvNSLZ06Wr40ZW69YcxsQP5pphl5DsCie66gxgwDLimNENWS0rBrjAOCkTb+F40BgiguhBOSiz+SgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzYn6suwl1Y7iFd2kxDdlabKU0IG8KEFdIuNf4CXq3I=;
 b=snRBeIWe9GaZJN0hiVbHsbf+kc2HH9/OHrVwEl0JKL1VO8Y5XSLYDBYWfITrB6SH1ue336vn2sY0n+wlWDyGdS1efDsipQnvuq0D5HX0+rTXf5E1HX9ASur66lnrR8GIICHzF8Q7TTMdpKitk54gwgswim75K0aO30zbhJgj6ObZbT/g0DouVnln4/0YEyoCfoDQ6LY4F71zBTHTniqd4DWX5T2+e62KN/NmcV6HRFEmlClbonL/rHoD9ixiQedUxZULKUc56u/r1xY5Ep5xyKJvbZzicsT0BiXjYcOzX1OuIJHREap6ia2UfOJNE0qpryFYLb3pam/CvtcsmuoAWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzYn6suwl1Y7iFd2kxDdlabKU0IG8KEFdIuNf4CXq3I=;
 b=cCgJD2C4S/QZLLhAs570fYN20E7hfdf4RDckX47u1wnrLwCM6ObF6pUX9abwVfkjKRtb9Xh3ml75U2dL80V89Orkm3uvDgmdDrUrzVy4n4q62sAPM3kTOv4i5UDzd6cbKEzS40yoocOPHkYDz1/yIQ8atydOcfycvf3ikpbstJhK1G/r243Hdsumi+6cecxNIoaCBQPy1LrTEbQVVASraJn4/JkJHMsBW1ZqeH+XXI3PEd1O8etMhA2jZ2adMeqhlATTxAcMoYw/Stl4y8QH7eXL2NEEfPlsGq5ek25oOBNQ/OwMVPHXnzVf+NCu0Li19yVZgk7SgYWbznMd3na2Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8317.namprd12.prod.outlook.com (2603:10b6:8:f4::10) by
 IA0PPF6E99B1BC1.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 21:46:36 +0000
Received: from DS0PR12MB8317.namprd12.prod.outlook.com
 ([fe80::8ca4:5dd7:f617:f15c]) by DS0PR12MB8317.namprd12.prod.outlook.com
 ([fe80::8ca4:5dd7:f617:f15c%6]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 21:46:36 +0000
Date: Tue, 16 Sep 2025 23:46:30 +0200
From: Thierry Reding <treding@nvidia.com>
To: Mark Brown <broonie@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Wolfram Sang <wsa@kernel.org>, Akhil R <akhilrajeev@nvidia.com>, 
	Kartik Rajput <kkartik@nvidia.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the i2c tree with the arm-soc tree
Message-ID: <ofp27qiwsw7jj5ne3y7kp2lpycwg37bvhswidwe6jfazs2czzp@76gzsofmliyc>
X-NVConfidentiality: public
References: <aMhR9TJm5V5EqaoC@sirena.org.uk>
 <aMh_eKWqkuLODo2r@shikoro>
 <e70f4454-d0f5-4b3e-9751-730781f056f9@sirena.org.uk>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6lqxeyrn23wgxklf"
Content-Disposition: inline
In-Reply-To: <e70f4454-d0f5-4b3e-9751-730781f056f9@sirena.org.uk>
X-ClientProxiedBy: FR4P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::10) To DS0PR12MB8317.namprd12.prod.outlook.com
 (2603:10b6:8:f4::10)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8317:EE_|IA0PPF6E99B1BC1:EE_
X-MS-Office365-Filtering-Correlation-Id: 171a62f2-0788-4908-08a5-08ddf56a8226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yiIW5+YTs0MOXx4Ut3RML7kGbXw/iktOn3Fn0SBrw7/iEo5f38XctTvPed2I?=
 =?us-ascii?Q?KUkEEzNpe6HpA9joYW7GHRdbjIW8EAVWA6ezthiw17kxp7xpqmNCmGdCPA9N?=
 =?us-ascii?Q?qaf9wOBXuct5Il8IoCyAsYCiUZw9ZhOtlU83Ot6ug0dLdzGF3ZaGowsv1YIo?=
 =?us-ascii?Q?SKw1b168fKT9q/9gVjHbfaTwmyTgA+bF5s/cUVN7LtO7jDTY0uTFUA7Qh0ub?=
 =?us-ascii?Q?oyDy3hp+fVRj1xnMnpCqjNwQHMqAIIVnDG1PxKVJ/b8QC8atnxyV9zBEHURP?=
 =?us-ascii?Q?6p0Wi/QrubkGS+Bn7OBIvzCKZ8MAjoij67mWp3uWRRR7eyLJDBc/BglH7Ant?=
 =?us-ascii?Q?9f31Jt8mOUelRBResA1Czq97eSc7k5kUs5v5HRQQkuQU8YJGNoCshJqutCBq?=
 =?us-ascii?Q?WiFkbfr3YJhIpt/6OzqtUUKdBhb1431s5ZJ5KUcX4Mo8wdnp4JpVQCxucD3t?=
 =?us-ascii?Q?koz7dFOdiwFW8pRvM2HA0M37W6p3xMCI9HZ118eMBcr7DCeAlQ0apRHTMlEj?=
 =?us-ascii?Q?B/e2whhw6wFzkG7eMJfeObnoaVYoBe/BQEMvv4uvuHsHn/l6gqUwEe0Bt2l8?=
 =?us-ascii?Q?3bTypIP3IUl7EBzFSyeX8D+i8CNmxAq/CY5qY14afnlw80m4sYQVliVBSBOi?=
 =?us-ascii?Q?Btpiy3KEf1PoiMGAUgF1ct+CAYcRSVrxBthlrXzEiNz2pB3BOk6aQVOWjWrj?=
 =?us-ascii?Q?0ywA5tGb+tKYZvvbwpqyih9fY7SE2IlAPG6fhUgOyGsJ9v7vh9IyMujdKAA9?=
 =?us-ascii?Q?l8bIbJRo/rCnutea8xUZDlUQADHri4OPX706r65sM5v4fFBVfxkhV51xAf4C?=
 =?us-ascii?Q?zv0miBVLEhgxzUKqaeVEt4XCYyRDKJNqzyMFiWS8VnSPtFebr6GbnCRtooiw?=
 =?us-ascii?Q?/FDNd8gmSJLluv+bHKlziKKD/W1N94Ps4smWZWtbavVf15goNU8tsST0iHNE?=
 =?us-ascii?Q?GrWPAmF/iyKA+I3i2psbiGSUxZF5b29wC+Zf4eoNqowAOaYV8Bve7ZEMACYD?=
 =?us-ascii?Q?QrW9ebge1j9Z35lvk/y0yJkFuPqBDLN2BT/B+tDrsPXPVeSbzz/J0b8xsnk4?=
 =?us-ascii?Q?yd2QbItyyUwd3azNzV1afGoaH1z8M+qNg1LvNHNELHeCx02setp7ssCpCAZ8?=
 =?us-ascii?Q?kmAiHuyXTWxbyXg2DZ5JX8azWnWGKZHNTjTpXqY5RTtxR0IeRv8cy9Ssvwuo?=
 =?us-ascii?Q?npu1wkiAuAoIs+nu4fPR7QW8UTQn4uDsZuGShjFKqUxK6fNrpGMTfd/KyeKP?=
 =?us-ascii?Q?FRMRhyBGEng/dGk/+niXyoHsiBx0RwcEmnHyG52FkWo5mMtRixciaQv3cYyd?=
 =?us-ascii?Q?fUJUurtO/c8DeUXjWAl64nV3/jwtYLeGTP/T7K+wg2Q99zoVfcX41vf09iEc?=
 =?us-ascii?Q?SXWv4qTo+A46XVxRBN1GN67f/7cphxgpCC38UkzH4DsaJIIyr8OmOoXhbMll?=
 =?us-ascii?Q?lQNQoMR8x7s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8317.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YcbnSEoIiCSfysZqa6hGcAmvUju7fcL6xX/6drdUNr1cMEBSJOJWfdmO/FG9?=
 =?us-ascii?Q?/FrgllZ5/bat51ftoKjHzg+a9i2rV2uInb56f0+Q2SC5/CqATOX9Qd++rijH?=
 =?us-ascii?Q?9FeL0AWU5XkN/9PXcv+NNKpmvDoEQ/+bv8k+le6hngfHy4q/hjS5Gn4Lv934?=
 =?us-ascii?Q?xKYTNxK2ay8Stz1So60n89vV7sIxppjq0ztnB2QUjOMTPTGlL69+H1jXX7Lp?=
 =?us-ascii?Q?VKX7t2KvhQt3hebdg+qYN/wqju3YFPtRhUHfc4vrx2lRqa4Q8iPiA9/2rXby?=
 =?us-ascii?Q?w2xEbp5RTd4jR1Us7XDvWfV3IS6l/EWuKPVjsfLvUlRXCF3ptR0tVJU/YU2W?=
 =?us-ascii?Q?qd1Kn6j0XatBO03j37fXoJA/qEUmWh1AMnsKr4m5q4GDx3Q7cmmJHneqGE1s?=
 =?us-ascii?Q?tGneJEo6dRMtfAIjJfWw8ThediAJ76nx/4UxU6F4WWS9770XUQqmVlOPp2Wa?=
 =?us-ascii?Q?xVdTo74/dhEw6e5cLWt1MRap/1kYa2FOlFNFMc2nOPlohVbVP2hw08Evejsa?=
 =?us-ascii?Q?4NVfVAHitpRJst5LJpGUSRHsO6BPWu9BuUYN1RfWCsy7ZM6ZfxQRJ5oDnoxb?=
 =?us-ascii?Q?frlDgKBx2f2ZMHiLNTH4Su9B98WHkBySjgE1unitjmmTAxAjBUZ8UB/BnZDb?=
 =?us-ascii?Q?YPl1VvEQGx9jj4Wf3fT+X4zxJl4DQTek8CR7Lccvm1Go/FoG0gOj/f5YlBpo?=
 =?us-ascii?Q?/sydhVDtJuG8exT/4G3FI0mUj9KFKJr2+E+pC0HZXYbVs3hDt3uZHRCv9ljJ?=
 =?us-ascii?Q?2kn6TpHcQ6u8IN8cFmQm7GNGjEfQJ7YtON+qBW25HGhNdDN6cTXfRUjz3xy5?=
 =?us-ascii?Q?CjTSpwIQCvBigzx62IxFgbLT9CPzqGjLgcfcb3Gt92hBNbyF6+6j7mXpooDJ?=
 =?us-ascii?Q?hsi6BlUw8izAWc0jyN5jtla1VXsSlVl2NeTvtZp3UfYF6trD0JJCcmZcnoeX?=
 =?us-ascii?Q?6fAH1Ta/3DgiZdIREvOLVzydDOJdj/1MuF+IIVyE+uNsnefCQ0CSNDpfqbxW?=
 =?us-ascii?Q?1e9//gZwZIAiNoUPZXGJ9qBiUElPNQuZox3uutDvagibhCK8awTWETBJ6BF/?=
 =?us-ascii?Q?ybc5YSYx0FXgdfiWby1Sz7bqTsn0fnDAIT1sCJxFa4MV6XV9J6jIvkhxp/hE?=
 =?us-ascii?Q?WwRNSU0GkgoXYSMRFxR8N55PhHJKAEJF2RjTw8CQ3f71R03ym79LkPSZ4xtM?=
 =?us-ascii?Q?ShDptodcC1PvMYUAkeNrdRad/1J+kyaNTGj2KIfvT5Akz3Q+V6wJLf/Ql2aw?=
 =?us-ascii?Q?bgPkIbfncGP348h5NBaeIU+CWumLEEAVKVS8B/Ygg+FGivaA5+fu93iu2YC2?=
 =?us-ascii?Q?LkHXG3HfEQYk5Fky0iD1490RhjZ9Or8e7U1AShd/RbZT8sq9z9iJH0kfcmlq?=
 =?us-ascii?Q?Cf1sJyQvwgfi+DiemymI32hLHzxIc88oXIqv4UEf0wPDVRClxT/apKNC4DbF?=
 =?us-ascii?Q?K6gyQjY7HN/O2G/q/cMisPmp3apEPd99frnW5TFkbYeNn0IlGop6Yf0i48Ok?=
 =?us-ascii?Q?jo2cF+8ir80NVxtpY+wg0crvaDHL45YPOmYK4o7rSke6p4qPEhP6nzt1zjBf?=
 =?us-ascii?Q?El/BUHnAUu6aLdAdKgx2Hxk7VVBAObd71C/kX/cARDob9Ckbs8qW9YRaY5wX?=
 =?us-ascii?Q?/eyQdWmsxIIjjnag2Nf+JplglT8PgDHoXQtj6+Zz+5t5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 171a62f2-0788-4908-08a5-08ddf56a8226
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8317.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 21:46:35.7329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oDzeZ85b8yqiC2AQh0oWCOs9b4SwB3W2lV2AsTHRIvxkKyM0MYU9C/KniuORDgPqsnSe1jeISntqVjnfLAiitQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF6E99B1BC1

--6lqxeyrn23wgxklf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: manual merge of the i2c tree with the arm-soc tree
MIME-Version: 1.0

On Mon, Sep 15, 2025 at 11:13:06PM +0100, Mark Brown wrote:
> On Mon, Sep 15, 2025 at 11:04:56PM +0200, Wolfram Sang wrote:
>=20
> > > 's linux-next merge of the i2c tree got a conflict in:
> > >=20
> > >   Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> > >=20
> > > between commit:
> > >=20
> > >   804ebc2bdcc85 ("dt-bindings: i2c: nvidia,tegra20-i2c: Document Tegr=
a264 I2C")
> > >=20
> > > from the arm-soc tree and commit:
>=20
> > ? Usually such patches go via I2C? And v6 was still under discussion? Do
> > i miss something?
>=20
> IIRC it came into arm-soc from Tegra but ICBW there.

In the past I've usually picked up DT bindings patches into the Tegra
tree because they are needed in order to validate the corresponding DT
changes.

Note also that I only applied the DT bindings patch from the v6 series
because it was already acked by device tree maintainers and there have
not been any objections to the DT bits, nor are they relevant to the
driver changes still being reviewed.

In the meantime, we have follow-on patches for Tegra264 that are being
blocked by the lack of I2C DT nodes. In order to unblock those I want to
get the DT bindings patch merged along with the DT changes for v6.18 so
that we can make progress on these other patches.

We'll continue revising the driver series and address all the feedback
that's been provided.

Thanks,
Thierry

--6lqxeyrn23wgxklf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjJ2rYACgkQ3SOs138+
s6Hzww//SzLMck9Gak8isXp78gw5qweuMI+JN2m6uL51ZUzatFh46iapEhmUfCB9
A7mSr8LYnb9Df2xA8cE6vCXoXmf1cZW2nBk37BysD50eS8yfsyHrADSi4QgABGjK
0SkjfaYvi+wy2DDMLmsX3+RTjm+bWx67hXUCZWJU9Or1j75Ogaxf70EAAZwKehBR
y8D8rcxlymKFFMur+9WVQRVA1HFpTuRvxUZUPBCdNTa93vCVbXrtzJecDzq9svWv
PzWXNjcakwpDA9V0vdma1t+cv783WLxFeawK3NJMtSYtVgMYq6L1HrMvQcpUwprd
vLSn31U36mT4sWWadt6BJgOuPQ4aJyujIp7b2p0cbVbSDh169K3NIFUIEaGaqPGq
6/zA5ENrJWjiNf+k+59hKE1HZugV64sh52kpluXnEKFKKVGX1nqTprAx2/xTCVIV
OzpngJhb17W0ewLqVaahj6bo/eKQCvByUe3jwIVD48bMxeBGVXgOoGNBXWOxG4IL
wPbj7gM7d3qWMtCIBA6xyH5ivd2VmUaT3xHBxy7AYgxjAT6msX2Q1ZaJGk2MbE/Q
Iu06ohzyMuMb81sAA7I8pnbJdBuKXhj/e8yxGMDKv/0XyXapvfeiqY0s8ATaRsx4
MK2dRmSqqp+YbwOQrmXAnOrSCvdPVNBWnVwAIMv5uDFf1f8W6iE=
=iWq3
-----END PGP SIGNATURE-----

--6lqxeyrn23wgxklf--

