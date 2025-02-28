Return-Path: <linux-next+bounces-5605-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C426A49077
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 05:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B42C1892CDF
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 04:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F9F1AB52D;
	Fri, 28 Feb 2025 04:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PUE4cBXN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE49214F123;
	Fri, 28 Feb 2025 04:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740717801; cv=none; b=p3EPNu4xETnJGY7JVDovRVeVNyMbggEAx1wUTyAW8+914Bt6xy0ayos7naYANrkIcXn5g9Pa3VLM+mbjqXtV91WeDH09myfdEkwA/C5YNts8tVbEt4r9j7+FiNrOCWsFjvNre8hHbtrRKXeAWm7VpfAAPREDPBnHReOXxPT0SZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740717801; c=relaxed/simple;
	bh=0N4TbmZGbN0SHE942YFD6uYcwAcKZIM6w74i0k8Y+dw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QD92c2mxjydrn/dQq/M00h/oA66SpalHHKmX6x8sbSvlyUglYGo0yi1tB17ZizPTuScWJKdbs9a5HL4tC//JWCLp2gvSLhsRl1W3lRf0ZDCT1hBO1Gx/RZYxPkxwJjOhHydpcM0DxhHG3WBTP9ZwE8/qS0heCx3X5sa9dzi5GfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PUE4cBXN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740717795;
	bh=8EMGGRzxcTX5hhHQPzSdcdShMMtpdv8HtQEK9QRH1dg=;
	h=Date:From:To:Cc:Subject:From;
	b=PUE4cBXNZBR4Ao5YN5B1TAeIf3Yofha0kCx1x6Idq4xpNG1W7ArRg5icGpRnjLt45
	 e0/rDe94KlN+5KPNxur2hJj8CFeS4WqMSRMIwXCRbu+bhWyymFrLrAmpMTXoDE4JP8
	 6CDjdATCx/rd2ITTZJ/Ightqzoaj3MbqLBwz36Sh7mTFVLPhmhVJzEhvfhdSGiBTvi
	 nNfeAlDbdUQ4f7nhE2tPKi5aNbTPKbKrZrv4UCz2L9y3J3LM8Wq1kbHQD7WJ27QuDQ
	 ooZWtiZlJ9+H3K28ElbKrDwQ2SQK8HKVHGsXE4irib4/lFENjBZRX1dNKXS6XQmbYB
	 9g/raZO4OJEbw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z3wZ95Ql5z4wbx;
	Fri, 28 Feb 2025 15:43:13 +1100 (AEDT)
Date: Fri, 28 Feb 2025 15:43:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Alexander Lobakin
 <aleksander.lobakin@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nam Cao <namcao@linutronix.de>
Subject: linux-next: manual merge of the tip tree with the net-next tree
Message-ID: <20250228154312.06484c0d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DsYYD8AMqPTWvnemQm1S/X8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DsYYD8AMqPTWvnemQm1S/X8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  net/core/dev.c

between commit:

  388d31417ce0 ("net: gro: expose GRO init/cleanup to use outside of NAPI")

from the net-next tree and commit:

  fe0b776543e9 ("netdev: Switch to use hrtimer_setup()")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc net/core/dev.c
index d6d68a2d2355,03a7f867c7b3..000000000000
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@@ -7169,10 -7013,11 +7169,9 @@@ void netif_napi_add_weight_locked(struc
 =20
  	INIT_LIST_HEAD(&napi->poll_list);
  	INIT_HLIST_NODE(&napi->napi_hash_node);
- 	hrtimer_init(&napi->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_PINNED);
- 	napi->timer.function =3D napi_watchdog;
+ 	hrtimer_setup(&napi->timer, napi_watchdog, CLOCK_MONOTONIC, HRTIMER_MODE=
_REL_PINNED);
 -	init_gro_hash(napi);
 +	gro_init(&napi->gro);
  	napi->skb =3D NULL;
 -	INIT_LIST_HEAD(&napi->rx_list);
 -	napi->rx_count =3D 0;
  	napi->poll =3D poll;
  	if (weight > NAPI_POLL_WEIGHT)
  		netdev_err_once(dev, "%s() called with weight %d\n", __func__,

--Sig_/DsYYD8AMqPTWvnemQm1S/X8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfBPuAACgkQAVBC80lX
0GxEMQf6AkrTCvKQRGNrcAyfYIKWTOhE55YlcO77c0Y9t51Ra0mQo1yszfI4GyJs
6gxoaf5ExBknlaPxbz6WcPKls0BSSbWitQr7BR7eh8WXSSt6HO1EddX+nddFWGzD
6p37hR+Y0rtyXlurb7mMq6M6qe312doFzscsJn19uzzVgiKbyflhx22fmOXAtf8V
td+amO9NvympSWtdhHqJjfoxjg6Kh4TFMY0o1YHpRciL9OK1S2EVJnkmNBA7AfaN
IO5/xVDdBHGjSEr4mIOgNBtAUiz5TMUYsuogqUgOxxqEGnJS+zpkHxRAxvZ60z3X
rMz3JdzIKE5E36D7mboMCumscX7uDA==
=GOGY
-----END PGP SIGNATURE-----

--Sig_/DsYYD8AMqPTWvnemQm1S/X8--

