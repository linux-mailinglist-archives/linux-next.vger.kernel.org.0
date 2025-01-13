Return-Path: <linux-next+bounces-5166-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66900A0ADD9
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 04:23:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0D323A66B3
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 03:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F0E13AD26;
	Mon, 13 Jan 2025 03:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AT1Fq/xk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC1D632;
	Mon, 13 Jan 2025 03:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736738632; cv=none; b=NYjJSblYZpjfLvo4Oizr20zvU9HtdsyIWfxYDArVxJHeweKyc37p5G+KFl/qPf/vkqNHRpUXCwcHI4EgwNB19yYh6uGdccO9NAiz1eVPpP4To9DQ1Z7+ip+iw3Goz+oLO90cf0N348cUrsLvCfA8VTPyhv4JZm6yynQOc1C1RfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736738632; c=relaxed/simple;
	bh=Ju8Lf28HfxzcgmCdtByk0gtDyDu4QJJpHvdTzQJg/mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W+EuVAU0dYa0eZdq8IB5NC9XNRtKC7kw+C/ziY3MSg5MJ7ELKMjucVdkQBkEu+59wgt+FzH+5fdXp7eGPamvcUBeAzd2G5U0S0gvpvkYLhW+e4nxdQ8m/MuRqei/ejELGH/qqkk1Tij3FCKU7NRf6w5FvPtxSbgkr5L2wZOe2wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AT1Fq/xk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736738617;
	bh=85Zb66pBNyMy7o/7B8+/AQMMqMPRMt3RRk5FFkzXKxk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AT1Fq/xkl3TGVd9CH76/wlbTbLA/ZXjlW+JjBO3CzwTUzcT1RyAmHP6elVFDHTbdl
	 H144Syde1LBOWAUxdC5Pv1dD9I+Zdc7U+6lHHGZ8/nNs24HJUDVC+2n/t3VIjuMN/G
	 5jEdV1OOhG+49bZUo0lj9nqfo8mVtvl+atXttqtHRivzu7fycFv0GSmzgrbdswKE1z
	 Yd3ZZ97w7BU76P/jnpL6vnBgpwoHDDHeL8NO8sMB/iX+Pk9cU3mYYnN/73wGPe/bAp
	 Fc3OOGAGMsokDYVsynynyoxUiG3aw7yK8Bz+sdaPz7SzDYNajwMT4w5nHHwv0qJBpi
	 6NCD/HKJwoJag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YWczX37Ngz4wc2;
	Mon, 13 Jan 2025 14:23:35 +1100 (AEDT)
Date: Mon, 13 Jan 2025 14:23:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Jonathan Cameron <Jonathan.Cameron@Huawei.com>, Javier Carrasco
 <javier.carrasco.cruz@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the iio tree with the
 char-misc.current tree
Message-ID: <20250113142342.4578868a@canb.auug.org.au>
In-Reply-To: <20250106152107.2c0fc03c@canb.auug.org.au>
References: <20250106152107.2c0fc03c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Vn=Nttmew34mgwx9MPiGE1O";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Vn=Nttmew34mgwx9MPiGE1O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 6 Jan 2025 15:21:07 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the iio tree got a conflict in:
>=20
>   drivers/iio/adc/ti-ads1119.c
>=20
> between commit:
>=20
>   54d394905c92 ("iio: adc: ti-ads1119: fix sample size in scan struct for=
 triggered buffer")
>=20
> from the char-misc.current tree and commit:
>=20
>   2cfb4cd058d0 ("iio: adc: Use aligned_s64 instead of open coding alignme=
nt.")
>=20
> from the iio tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/iio/adc/ti-ads1119.c
> index c268e27eec12,0a68ecdea4e6..000000000000
> --- a/drivers/iio/adc/ti-ads1119.c
> +++ b/drivers/iio/adc/ti-ads1119.c
> @@@ -500,8 -500,8 +500,8 @@@ static irqreturn_t ads1119_trigger_hand
>   	struct iio_dev *indio_dev =3D pf->indio_dev;
>   	struct ads1119_state *st =3D iio_priv(indio_dev);
>   	struct {
>  -		unsigned int sample;
>  +		s16 sample;
> - 		s64 timestamp __aligned(8);
> + 		aligned_s64 timestamp;
>   	} scan;
>   	unsigned int index;
>   	int ret;

This is now a conflict between the char-misc tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Vn=Nttmew34mgwx9MPiGE1O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeEhz4ACgkQAVBC80lX
0Gx0aAf/dbRng+aqGpf68fiz0A98O3t5p6DbHUusjERQ5gq/+Ut6HJh5MvyGeULE
etZ3/2dcP8B4nIbYXkSdjk0JGnbRQbyRfCfmqeWClN1daNTNeZkC/d9855Y6+XbN
5dJbZ82Qfq6DoPCoupRuGOpeuIc0RgAAOXRMC1sMgNUU736U2EIVmDRquJdwLJmu
w+CdSnyMVuqPgDi6EslLPHGgO4gCbtvoX+p/ehQQ53Q9UWug/xAsEHDmaMAt2lRY
+Va1PO7daLm8xqy5tuUQX2DZcySB2A4vhm85WUcPpFFFfBzKSKdu4qF7/xVWcSCR
fIKOXRVLPLvAl3HIycd8LmqKWQO2Bw==
=tY/T
-----END PGP SIGNATURE-----

--Sig_/Vn=Nttmew34mgwx9MPiGE1O--

