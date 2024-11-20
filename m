Return-Path: <linux-next+bounces-4810-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA759D3165
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 01:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 067391F2319B
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 00:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BFBEAC6;
	Wed, 20 Nov 2024 00:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mc2JLndg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D53FF9FE;
	Wed, 20 Nov 2024 00:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732062626; cv=none; b=EMl29rcmeCdJl8WcqUo+4mIKTdlH93qMXLZjPl/UadcYKPhwLb/8s08kqI0tCZod5ufv1pJhR3xosPMepntGlZdyK0VGjDUX+ukbB5ILwNFIAhInZAlEssTsG3/0JmlbYd0TP+YRAc5qOUJLxfrMHq5FxH77jQH0Y+yY+aKRLZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732062626; c=relaxed/simple;
	bh=Tj39gEQRUnuZujqX2/SNkK2rF5SE+IM6h9lUEGWn254=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lG/8RRa2c7qhNal61PZq0swEVbu+fDQTVrHHrh7my7VjDHft0Y1Jn6A7XxZVWHFRUrF39Lh7HlwH4Kx81C3GBRDkQNDbzo4KTKUjVnPjvwfWcjgXxEOnX4hg4lUPb44PB5kxQ2y6SIdaDB/ib31lUa40kD0IIA+o7jJJmCsfm2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mc2JLndg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732062614;
	bh=xgE8VEddh66b6D5zGoRX/UR/hABPOyWddRiDV3o9Iqc=;
	h=Date:From:To:Cc:Subject:From;
	b=mc2JLndgDTR8x68KMC8rykavNvJ3fiwGig9qJ0Mx9UA5PA4C7DQ6dOlU2Cgwykfg1
	 7pmf3wKU3QJl5Os4iSFtV/DGVXptML1tYstxxm9CI1MKdFREMdHMKR9wFy2mpUqwQX
	 pJvCOFNg+dqXyQME9QxnPhccO8Njb1BzJ0AnjodP4Y/s05dDTmRWYsFci5/1byFj4R
	 yVdXFleOrbSOwtMyGrYjePp0y7hDjIAO7/3GE02C6BfBlYduzWZGafwjCF+/zDefdH
	 eLPx2l2P6EGC5WMU+IUnxbasmQOo06zaU9fJyP3f6Sas1EtrrjRWraKuOxK/SbJUKj
	 KoB0H+BlAGX8w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XtMhP2JjKz4w2L;
	Wed, 20 Nov 2024 11:30:13 +1100 (AEDT)
Date: Wed, 20 Nov 2024 11:30:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jeff Layton <jlayton@kernel.org>, Ilya Dryomov <idryomov@gmail.com>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the ceph tree with the net tree
Message-ID: <20241120113015.294cf1d2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DaF8sq.aa1GmhT4rubJOvbh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DaF8sq.aa1GmhT4rubJOvbh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ceph tree got a conflict in:

  MAINTAINERS

between commit:

  4262bacb748f ("MAINTAINERS: exclude can core, drivers and DT bindings fro=
m netdev ML")

from the net tree and commit:

  6779c9d59a07 ("MAINTAINERS: exclude net/ceph from networking")

from the ceph tree.

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
index 54fc0c1232b8,3771691fa978..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -16235,7 -16179,7 +16236,8 @@@ X:	include/net/mac80211.
  X:	include/net/wext.h
  X:	net/9p/
  X:	net/bluetooth/
 +X:	net/can/
+ X:	net/ceph/
  X:	net/mac80211/
  X:	net/rfkill/
  X:	net/wireless/

--Sig_/DaF8sq.aa1GmhT4rubJOvbh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc9LZcACgkQAVBC80lX
0GyhAgf/XHLwOcd9hP83RfBiS+nYp/gLhU5fkhsyd8y6YM/RHAhgpEj0+TzFrW+O
ClwWaVIebEE3x2KOgw6QuPXQmvi+AJ0YJz+ZNTkxGXVb8cAL8Gi6RnP8xwlepxoE
jAVH93XesiKQIrzTOMxdhP7+3De+Bs42Zz/nO/V2GqGbcSDOm/p7RnLgZE5Hv8ZG
bn6rpZLS1SFjqcCc/TxnxjT1g0kLIwNUBZ7s/CTugcKQ9LAmQ+nQ/k7zzriNqbPb
rBbI2tHM8x9JrDhahrItOcS3bedhayknnG48kKBG3mAtR8/ZVQ+eZst37kKMKclJ
uBhxbupBrVkiFjYWK5LfMolRA2+J2g==
=Dpml
-----END PGP SIGNATURE-----

--Sig_/DaF8sq.aa1GmhT4rubJOvbh--

