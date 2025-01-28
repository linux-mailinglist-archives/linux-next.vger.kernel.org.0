Return-Path: <linux-next+bounces-5335-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D342BA202B9
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2025 01:49:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 217827A1C1A
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2025 00:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70A31B59A;
	Tue, 28 Jan 2025 00:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZDjsU8Xj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AB94400;
	Tue, 28 Jan 2025 00:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738025351; cv=none; b=tvpsAo3G0LCIruLAboL1s/kJHhbfqKNVyX+/hdFOqyYKLnWkg3w//Lm0K3SPVoykS0NEF5Ncwz20nHpXG1aI8QzMCEggWO+fBa4jofEGPVkjc6bQ5db9PjIAss5okDvTUynJub4ISjo2qFCkhDkTIBTqbWl/0edgWgg0nJgbWm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738025351; c=relaxed/simple;
	bh=W7FruQtLWu/I7bzd4ZIxsy/GnBw3Xn5NX7db2dUyjS8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ciR7yBWgYYddIcCT2i7VjOG2rfofFbKdcEvGDMDWK5lyI9kAkENfUUPp42mGDPnDpbwXlSwQqNXVv1BogTMadzMQAd2hqzqeIVJr2VUf/9oxDIJ4yozWnmRT40ixY4IhoswTysAGlLPwY6/oAEzdPkNY60lK4mhjCY7Rl8FbA5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZDjsU8Xj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738025334;
	bh=uIRSnZRb0rURs4yRBdbBt9CdSMgxQ/+z1zJfNJcGJoo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZDjsU8Xjn6Ya+BfQ7AxqrNZfIOif282j+dTp7On44zZhhsMExdMrlJro4nlmwNhLr
	 4Kxn8A1uQ5xdZmqxPpCskYvUeVGMbs7OQxcIYhDDw2XYRYsaA87iIuoJljCBUDZJsz
	 i2TtJ3SufT3DFf3A744jQoZ3qrZ/C83dSc15ERaOH6bcAU5WmwvoEynkxhFU5XgivJ
	 NwortuAwnNjYHDXY9E3zLO+oTW6sF6kcVoa4Um0QMhoIcFrbh9bXU+8C/z5Pff6OHt
	 p7KTto1BMvGB5MGuYxI/dJCFfyiqLx/++JUJbDza9bMwRhCPU5RINniCYdq5R/eOQr
	 u4t74piGkJtNw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yhmr54J0vz4wcj;
	Tue, 28 Jan 2025 11:48:53 +1100 (AEDT)
Date: Tue, 28 Jan 2025 11:49:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Bagas Sanjaya
 <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: linux-next: manual merge of the v4l-dvb tree with the jc_docs
 tree
Message-ID: <20250128114901.17b5b765@canb.auug.org.au>
In-Reply-To: <20250123120728.5fb6e1b4@canb.auug.org.au>
References: <20250123120728.5fb6e1b4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cbpZU3XE1ULdgajX0xAweWQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cbpZU3XE1ULdgajX0xAweWQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 23 Jan 2025 12:07:28 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the v4l-dvb tree got a conflict in:
>=20
>   Documentation/admin-guide/media/ipu3.rst
>=20
> between commit:
>=20
>   3961fba7e1e9 ("media: ipu3.rst: Prune unreferenced footnotes")
>=20
> from the jc_docs tree and commit:
>=20
>   688c0a6907a7 ("media: Documentation: ipu3: Remove unused and obsolete r=
eferences")
>=20
> from the v4l-dvb tree.
>=20
> I fixed it up (I just used the former - it added one more line) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

This is now a conflict between the jc_docs tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/cbpZU3XE1ULdgajX0xAweWQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeYKX0ACgkQAVBC80lX
0Gzw+QgAk1gIUwoSsGmBhqjAQepVRvEFIuSxoyBvGeOJ8+tVGDmIt9mRUH7YAhz+
rUil2IoNng+B/E6D79TqLh1h9upNco3LbJzCRwH81EUorbY78aLR4ajUnTBqagyr
UwVUpC0Xfpx5x9qG6hZlDWPJn2wiaPitv5FtWuC5v3QHfpdHS8VqloUt+xSuO76g
FHlAWkqGBe5tCQQUvAhV0xQ9z9zKpoU23u8xFailnNt0rB3dMj2kZx+bNplPY2zJ
sDRiev/zHI4Z84HqVOHhqNNmtrmTyKHvAxRPgfkeP8E7ZHCKJmVBNz/NVaAe4aeX
I9LIuDpwcfdOH7+vtBDh8YWzFyDGwQ==
=x3/k
-----END PGP SIGNATURE-----

--Sig_/cbpZU3XE1ULdgajX0xAweWQ--

