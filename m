Return-Path: <linux-next+bounces-4959-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4A29F286E
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 03:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA2EB16435A
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 02:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2DA2CCC0;
	Mon, 16 Dec 2024 02:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IcIANeON"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0302AD2C;
	Mon, 16 Dec 2024 02:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734315322; cv=none; b=W8SS+i0sPFs13bXF1LKKqAZoJ5TQ75KGzpKfRKQtwo9qwt9QLro8l3xRH/PM11qfBtWp/WZ+udI7CVPmK5C6f5Sp3X/40WjTw14vkcRs7/p6eOyjXwqJS1nc9/TFubTsQm9Na1+qGgunFde2GjYHDr2lJMpXZ8XjDMETv1wi9ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734315322; c=relaxed/simple;
	bh=viMTA3KontE6bymRa2un1KK0eCHT3PdKd0fxyrsDGpc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nMZznEGiWp3KWbFoyi8qvCAIxeCh4lsq8ZLqiuYjLdMp+n1V1pgk5hzaEcfwdeZKXUDtGop0lj9e97XZ30mlx57h2nFMxUQg/QXSZ9tpqvA9pD7K1IU/dqDpb0aAitGZqQE/U/lSZa17M3unI1itL3BSvoerBAf5gK+9oc+m2G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IcIANeON; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734315313;
	bh=U69ogNzUgdNWshqhg3jvFGYJfG1yy7B46bJom/jIT4o=;
	h=Date:From:To:Cc:Subject:From;
	b=IcIANeONm4tHkQj4BZnzN/Ch9o9v+kcuA1GfBsa06vYdzgNApv/oNOLnBt1retEux
	 YZCIFB1jta4Mpv4s/P+NFHAwQXjAJ3mWuxd88PZtlopu2vPB2Ei1PoKMD6CiPD58cN
	 WoZJkKboQnYHdgcpCoJvlUSimTHbaZuZ5Q0hyLKAjLZgGiGslilG8vsPXOozB7qyeH
	 egeAGYuAN070Yf3peveSSiYlWv+VEnknVeGY1spccAVMlxG2b1ZfA9GSMKeTZQ278e
	 OxlVNpQpfRvyhYSbAt9x787gyL5jDU8tm+Dnx1FZyG6tCTG/azO6VrUI5qdpcry7Bg
	 igmk3uKBysCsg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YBNnY1bWLz4wc2;
	Mon, 16 Dec 2024 13:15:13 +1100 (AEDT)
Date: Mon, 16 Dec 2024 13:15:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>
Subject: linux-next: manual merge of the mfd tree with Linus' tree
Message-ID: <20241216131517.6413c3ac@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UuMtHmuv+b_=rBDhBaCBU8b";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UuMtHmuv+b_=rBDhBaCBU8b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mfd tree got a conflict in:

  drivers/mfd/cs42l43.c

between commit:

  cdd30ebb1b9f ("module: Convert symbol namespace to string literal")

from Linus' tree and commit:

  c5bb88eac10f ("mfd: cs42l43: Use devres for remove as well")

from the mfd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/mfd/cs42l43.c
index b5ab5e613db7,beb63c4efd21..000000000000
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@@ -1096,16 -1113,8 +1113,8 @@@ int cs42l43_dev_probe(struct cs42l43 *c
 =20
  	return 0;
  }
 -EXPORT_SYMBOL_NS_GPL(cs42l43_dev_probe, MFD_CS42L43);
 +EXPORT_SYMBOL_NS_GPL(cs42l43_dev_probe, "MFD_CS42L43");
 =20
- void cs42l43_dev_remove(struct cs42l43 *cs42l43)
- {
- 	cancel_work_sync(&cs42l43->boot_work);
-=20
- 	cs42l43_power_down(cs42l43);
- }
- EXPORT_SYMBOL_NS_GPL(cs42l43_dev_remove, "MFD_CS42L43");
-=20
  static int cs42l43_suspend(struct device *dev)
  {
  	struct cs42l43 *cs42l43 =3D dev_get_drvdata(dev);

--Sig_/UuMtHmuv+b_=rBDhBaCBU8b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdfjTUACgkQAVBC80lX
0Gw2tQf/SFIKyLQH7vUwpM1Valfhxeht4S1kBbmngW8BO3GlLMnQaX7Xhkpj1fPM
dglYwnz3YXC7Xpoa1dT1CtrHgG3sfplHLSS4RaS3kLy33B5PZT2sX2IHNwPqd3FN
rXKVaCEsZmo/eEkjj8VZNKMpBYpznUZioGtFDBTrBUln6pn8by7LWm4+5ELls4WS
o5nla2CkaQsBveB+M2BeNlFF6cbazYXgAqs1WHF/uk89kxKR3IiZ05jm9HkxiD9o
jCMOnyYYofKNZPEA2l810Ccxoln83om+GaciV7LIiQITgz1ZYW7Cpw6jnTb3Ooqe
luk7fBusuH3fWhHiaVVu6zsCIOW+8g==
=fhfk
-----END PGP SIGNATURE-----

--Sig_/UuMtHmuv+b_=rBDhBaCBU8b--

