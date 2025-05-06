Return-Path: <linux-next+bounces-6538-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78969AABB5A
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 09:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FE174A262A
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 07:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E591EB5DD;
	Tue,  6 May 2025 05:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DPDn3VVX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A72F2066CE;
	Tue,  6 May 2025 05:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746511054; cv=none; b=oqyJx/cr0nVf/vf51P4B9L2DX0qMrMoy52TgZTL+S7sz/DXVFsRVludxGDrR3j7V3NapRfrMgdIzwTYeODylOA/GNGTX3YlmSJz3/B87SSJJ5zUs8xcw5yzkGAq6yhq0krschRDJSjmbIcpgDzDZe0UDlpvEZ487j+D1SpuKX2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746511054; c=relaxed/simple;
	bh=djkSLeDcv+s8c5Tl/xYzCB+1NAe+TpkYc8O7FvBZk9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lXlGFFwQH751Y5n9cQpp4AdmeGmfgx6DdCvSWs8d5N0C/D84aMyBu1Hv9QFoAbJjwfCu5S66/PS5RSgVm7KCL32CpJSr3WO6mEF2/4LQJFUAWlp4MF34LHnYM/tkMnUsOYdXx9qCLyQ16gIw3jS4YnTDpipGKIYo0Y1uNe/J/zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DPDn3VVX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746511049;
	bh=M3FQmBK1zcYr7w8UGr8/0UxcGI0IS1gC0Y+Lqjp+IRU=;
	h=Date:From:To:Cc:Subject:From;
	b=DPDn3VVXuCzBDg3UAmT2bL0p5AQPRAOJMhBYOF5EpdGTwlKv3YxyESra+JApcK6JT
	 5OLIqQLxsIv3yhKyhcLhazF9c26Da7lQHamr32QMUVsvDHBGHPy7r6xw+XojDmnGiJ
	 5q+Q/EKMIKnur5rwmjwkFKLZltpqk3Al+numTrB7fLNP80FdWoIrTasglzwQOJgs26
	 0CtrOiNkOP/WXIIbdOfux12JaTXC+qDodRx+44G0uduR8ER3EP0b4NOH3VtGHqmGYz
	 wqgtIXp9ldPN1GC8weSVu2fExRijk4cq5cWwB3tAgEBfSBTqq/tthrRX7KeySj/hS3
	 3F751Rhwee9RQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zs72w4YhKz4wyh;
	Tue,  6 May 2025 15:57:28 +1000 (AEST)
Date: Tue, 6 May 2025 15:57:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: David Lechner <dlechner@baylibre.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the iio tree with the iio-fixes tree
Message-ID: <20250506155728.65605bae@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qo5jaeLfH_oN8c=8Y4vbYyf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qo5jaeLfH_oN8c=8Y4vbYyf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iio tree got a conflict in:

  drivers/iio/adc/ad7606.c

between commit:

  3f5fd1717ae9 ("iio: adc: ad7606: fix raw read for 18-bit chips")

from the iio-fixes tree and commit:

  3b5b55ca9407 ("iio: adc: ad7606: dynamically allocate channel info")

from the iio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/iio/adc/ad7606.c
index 8ed65a35b486,aa96247d6757..000000000000
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@@ -726,17 -657,20 +657,18 @@@ static int ad7606_scan_direct(struct ii
  	if (ret)
  		goto error_ret;
 =20
- 	chan =3D &indio_dev->channels[ch + 1];
+ 	chan =3D &indio_dev->channels[ch];
+ 	realbits =3D chan->scan_type.realbits;
 =20
 -	if (chan->scan_type.sign =3D=3D 'u') {
 -		if (realbits > 16)
 -			*val =3D st->data.buf32[ch];
 -		else
 -			*val =3D st->data.buf16[ch];
 -	} else {
 -		if (realbits > 16)
 -			*val =3D sign_extend32(st->data.buf32[ch], realbits - 1);
 -		else
 -			*val =3D sign_extend32(st->data.buf16[ch], realbits - 1);
 -	}
 +	if (realbits > 16)
 +		*val =3D st->data.buf32[ch];
 +	else
 +		*val =3D st->data.buf16[ch];
 +
 +	*val &=3D GENMASK(realbits - 1, 0);
 +
 +	if (chan->scan_type.sign =3D=3D 's')
 +		*val =3D sign_extend32(*val, realbits - 1);
 =20
  error_ret:
  	if (!st->gpio_convst) {

--Sig_/qo5jaeLfH_oN8c=8Y4vbYyf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgZpMgACgkQAVBC80lX
0GwF+Qf/aOLS8EIwkHsW7JQ38ny5sQPP3bztLPZwzx+US/Zz1bUM1HjK0xjKdgHg
AxvQW2z/57xitVTSphjFRoRVgGwKR4VXBXc3wp3oTR+UtZNpt2jjnO93LXIkfDy8
rAaIjA/+Tyl9QxYKpHINnbhj6XWkkD1SeItL94ePHcabpFbmeqYcik1VNWLIFixz
O9Da3pD1J4Whl3FZLi/iR9ntI1KuDKWwYE8mYtwkzJ/5yDpm5M1TY6hqrIPhWuNa
o730pNCR3SbmjsvDZlL7AE/cUBh9z7uRTV+ZOvK8ThqvWrKTv6qaPo/sfYYRO16x
xKpzXHrvOdRSrEMyIiAIreKTJjlNlg==
=OtX+
-----END PGP SIGNATURE-----

--Sig_/qo5jaeLfH_oN8c=8Y4vbYyf--

