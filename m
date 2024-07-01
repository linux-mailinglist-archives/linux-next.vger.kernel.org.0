Return-Path: <linux-next+bounces-2763-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C2A91DC17
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 12:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5110281E86
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 10:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4979285956;
	Mon,  1 Jul 2024 10:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7QwhlzY"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E41412BF32;
	Mon,  1 Jul 2024 10:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719828538; cv=none; b=u8gYvXrS7/91zTn6fiq4Q7LggCgk4vU2oJXTLcB3B+CyPOZD1+jWphdP55jm/xLdjowBtyrrArC2cgB1se0kXyLefoZlVB51nhZUB7lXFp2iRj/AFI+7JJLYDLasakXEXwwAom2h9su67v4i3c7pkj5DDGzHXQF4raqtKEn0ZiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719828538; c=relaxed/simple;
	bh=jH3nearMFaAQlRhm+ugZS+3bjSfLjOJPX+r7dcSWXuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r70D9LjTaicX3OJqGDtQSaY23BFynTDj9W5Mva2OLFWq0RAfv5bnmmHKKIzHeIBsuD3FpCZNMNmlO+Bpu5UqcF/NNIbUZIpkGE9zAnz3007VqUEZHbnuudiuLo0YM4C/6ZxBumBEsRTcDXSqhDzloR4c8IC5F9a2YJ7wOEg9AkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l7QwhlzY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C37C116B1;
	Mon,  1 Jul 2024 10:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719828537;
	bh=jH3nearMFaAQlRhm+ugZS+3bjSfLjOJPX+r7dcSWXuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l7QwhlzYmn5KN8z7OP0jBE/CimXzbBKWObFyuQAEkcdTdgfIoHwmbutcDW4QocKfc
	 pls+raO8TxJdqu4mALYSqwhFeCFdgwBULoaf86ySStXqJtJJ80I0CQeslqPs6kIDAu
	 c4tlIGEcVRgZ8euR4ZZqS/+DXWlxJWZnB6lO4DjWLzN7ZNNqTCjvK2zS+AhEbcSqhP
	 /ILKBL2pLpPh8cckYr7l7txhpoarsQDELzwl2sBbGNbznFareoihFxb8HkOH3DRciX
	 To13StKSg65vbY3+x8jL4gvuMTqm13e7iiP4tzZzZSW2EDr0kUyyOHsUGEisJzCgRX
	 +C68+twjUjcVg==
Date: Mon, 1 Jul 2024 19:08:53 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>, Judith Mendez <jm@ti.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: Re: linux-next: manual merge of the counter-next tree with the ti
 tree
Message-ID: <ZoKANeudCKsjjYDQ@ishi>
References: <20240701163749.1cb88c8b@canb.auug.org.au>
 <d595b624-ef18-4aac-ab2c-bd36a8c4de3d@ti.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nnREai9O/od+bX6T"
Content-Disposition: inline
In-Reply-To: <d595b624-ef18-4aac-ab2c-bd36a8c4de3d@ti.com>


--nnREai9O/od+bX6T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2024 at 12:58:28PM +0530, Vignesh Raghavendra wrote:
> Hi Will,
>=20
> On 01/07/24 12:07, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Today's linux-next merge of the counter-next tree got a conflict in:
> >=20
> >   arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
> >=20
> > between commits:
> >=20
> >   3ad6579f106d ("arm64: dts: ti: am62p: Rename am62p-{}.dtsi to am62p-j=
722s-common-{}.dtsi")
> >   77044cfb9346 ("arm64: dts: ti: k3-am62p-j722s: Move AM62P specific US=
B1 to am62p-main.dtsi")
> >   ed07d82f9e3e ("arm64: dts: ti: k3-am62p-j722s: Move SoC-specific node=
 properties")
> >   84935117f25f ("arm64: dts: ti: k3-am62p: Add gpio-ranges properties")
> >=20
> > from the ti tree and commit:
> >=20
> >   131eaf47c4c5 ("arm64: dts: ti: k3-am62p-main: Add eQEP nodes")
>=20
> Could you please drop from your tree "arm64: dts: ti: .." patches, these =
need to go via TI SoC/arm64 tree.=20
>=20
> In particular
>=20
> 7fb9d8854fcf(Judith Mendez)6 hours ago  arm64: dts: ti: k3-am64x-sk: Enab=
le eQEP
> afdfe6439a6d(Judith Mendez)6 hours ago  arm64: dts: ti: k3-am64-main: Add=
 eQEP nodes
> 131eaf47c4c5(Judith Mendez)6 hours ago  arm64: dts: ti: k3-am62p-main: Ad=
d eQEP nodes
> ba5a251b1d53(Judith Mendez)6 hours ago  arm64: dts: ti: k3-am62a-main: Ad=
d eQEP nodes
> e2e1fce199b0(Judith Mendez)6 hours ago  arm64: dts: ti: k3-am62-main: Add=
 eQEP nodes
>=20
> Thanks!
>=20
> >=20
> > from the counter-next tree.
> >=20
> > I don't know how to fix this up, so I just dropped the latter chanhd
> > for now.
> >=20
>=20
>=20
> --=20
> Regards
> Vignesh

Hi Vignesh,

I have now dropped the "arm64: dts: ti: ..." patches from my
counter-next tree, I retained just the counter patches.

Thanks,

William Breathitt Gray

--nnREai9O/od+bX6T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZoKANQAKCRC1SFbKvhIj
K1jgAQCAqfAEjD9q5+cUSla7wIXytQE8E3rqtODn5ITHc+ImlAD/ZOl6Qoipad8I
FObVp6vumXMNs7gV8clo8HyJcs/cVg4=
=IFSD
-----END PGP SIGNATURE-----

--nnREai9O/od+bX6T--

