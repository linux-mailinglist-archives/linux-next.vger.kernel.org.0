Return-Path: <linux-next+bounces-9229-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5652FC8C60C
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 00:46:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F3B61342B91
	for <lists+linux-next@lfdr.de>; Wed, 26 Nov 2025 23:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3082D661D;
	Wed, 26 Nov 2025 23:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="T3+T8/TW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C746F7D098;
	Wed, 26 Nov 2025 23:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764200765; cv=none; b=WoejvQXWRS+rkYVVNTZacWuzTHLz9Zh78h+J6XgBFkikdVDKj5yGIwEBuAUVcFlWAHh0YEMQ9XsnpVnNMajtT4RlbIR5OHtdzGEBKT8/feLCj2tgRN6VX5GbD1NRJzglZmx9JWYcLCrPejcFTy46bRutMvf4CcNSiN1IMTBvnK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764200765; c=relaxed/simple;
	bh=pVNu0FQG4ub5+0Oo2x0thYrvoFO5NMadB3Eo2lougus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JRPJr077BmzJ/WfXWgDgwLHzS+VlnJF/2AWGzQsBh3i05I8/4XjlWxWL+Qq+KqZBthpXHLmQ2Pu8/Z5f2sH6N3rbQVk51D3N1YuCkwGUdHiQV6QBxf3TCzDcloRayQlsK6Mu4eKaLHnTFNEVNT5aLIoLc5MTb8tiptM6Tn4R0B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=T3+T8/TW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764200759;
	bh=LWugZvP3R74wVDbxsPJh0LrDpH6ckYlQiAJN4xMDWYM=;
	h=Date:From:To:Cc:Subject:From;
	b=T3+T8/TWC8YUSELFX/h6a39AIga7Nukxzw6DrXONldGVdwJUWtaAkljcrou/KOAtq
	 3dvAcKn6yLWKXF1KGB4P9CpcWwAP/2FIbB12VMjZZ5OgoJpasDWwknQDpzFSqw/GTw
	 l6zEkYG/50DQhtEJRNbQ3B+wzgyrDYfJ9kumMtye39aWf3pCWnGP99qVtD5y5LGk2m
	 kB9iIpF3CaHyP1A2DWGMPOV7i7XwKN8BOVhp2kCzmqlx2ruEKYQJoiU+F59WqZHA7r
	 Lbp2EeQdRI8ErqpkGuYYliP65a1LXIb2wQ4irxrEJVve09wNfD7tV0yM1fdXmzCe8C
	 Eq3rCTMkvZTcw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dGx5g2N8dz4wGt;
	Thu, 27 Nov 2025 10:45:59 +1100 (AEDT)
Date: Thu, 27 Nov 2025 10:45:58 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the pci tree with Linus' tree
Message-ID: <20251127104558.31eeb5bd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BHgMnC3Sn4+yXB2rl7DKDWS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BHgMnC3Sn4+yXB2rl7DKDWS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  MAINTAINERS

between commit:

  2b6d546ba83e ("MAINTAINERS: update my email address")

from Linus' tree and commit:

  010515bd2d47 ("MAINTAINERS: Add Manivannan Sadhasivam as PCI/pwrctl maint=
ainer")

from the pci tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 2fcbda2fdca1,c61750164ba9..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -19955,7 -19886,8 +19971,8 @@@ F:	drivers/pci/p2pdma.
  F:	include/linux/pci-p2pdma.h
 =20
  PCI POWER CONTROL
 -M:	Bartosz Golaszewski <brgl@bgdev.pl>
 +M:	Bartosz Golaszewski <brgl@kernel.org>
+ M:	Manivannan Sadhasivam <mani@kernel.org>
  L:	linux-pci@vger.kernel.org
  S:	Maintained
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git

--Sig_/BHgMnC3Sn4+yXB2rl7DKDWS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmknkTYACgkQAVBC80lX
0GzodQf8DYAvxTT6bFwvnNBwO9zTBDk0xmwOhuGIcOVWNdXri5Kgvj0WJA+pzxtb
CbavAFOqyFH6tZzWucNvzYfRkXlrWKBZ+2AfpiahmWJu15oMs8+B7Ymv6m6fflPG
CEIxWIVG06G1anT9fbcuWOv01gQINk7TL5C9pd1VsVnrlo2DFjympxrYlMvCwvE0
0cJcpKwnbcTc3AEAaa6EXbRl6wJ08PgY0kyGE+8fPoo6sn+iUo1xcawXhesckPcn
Xci4LNZ0IqVwhQDV5NgGCozECZvVQWxiWp8LiQKUakdWtrsdWYkgDLWs6/wpRMiU
fZkCpAw2qrx+svc/A3TdZ9eW3OgcqA==
=Jl9E
-----END PGP SIGNATURE-----

--Sig_/BHgMnC3Sn4+yXB2rl7DKDWS--

