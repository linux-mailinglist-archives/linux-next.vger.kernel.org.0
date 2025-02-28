Return-Path: <linux-next+bounces-5604-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA4AA48FD7
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 04:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9827216A8D4
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 03:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A6D77602D;
	Fri, 28 Feb 2025 03:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FeEH2h8I"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE18819;
	Fri, 28 Feb 2025 03:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740714565; cv=none; b=DyC909YYprDstM1R6Rmd+SYLlAGaYEux8DG3ITEt5ISJpV9QouqqRoXbuR5YTc0s0B0ct7/LoCGyvIInm6dWWi8dhOVctwqISRqARBf7xich9XaJsmHcZPc35K4rt8jkhsT0HMgXtWBG5O8iPLQkNhXvrkVciQdkrCq9a41ckT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740714565; c=relaxed/simple;
	bh=2JJRsSl9s1ShM7CmwpkQX5IijJd0EPLQAbxDyAdVct4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=r0rnlHffNcsyFm/euUZWSIAD9qWneIv+dfc9kP7ngmQ4KpXiTiAzWWnMRqWNvttQJOhGCxa6WGgXO5/6nJo/TW8Flh0uiIIxLBnSS76wxCk8ZpH6GZselQd97Xd5EwFqB47z6AfFraTvC6NVnuhBBUJAW0B7xdAFJAvV6dn0frw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FeEH2h8I; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740714560;
	bh=6E/Ll8VCwKDAYpHkrqT04AlysqffxMkMCwKN9pLzA5g=;
	h=Date:From:To:Cc:Subject:From;
	b=FeEH2h8IV3dCReCMxRFwMByCOCMc6evZ7cSXTQko/8Fyq/8YkH6kAeyWWWY3x973X
	 jRo6BXgCHwN95NvrOCPvkl4fvhcF+f/W1e4yM4jKSY9Uc8euiREMzXicwPFhX44ICz
	 Pth2x01tkfAVD/Gy9rmCDuY3E5+pekS9PQiJB4XLF5hq2bpMCReeUNXhK+uqLeIey+
	 7V/kjr8sM8fJ4M1AjeQFJEZc9LG2h0J4rCItcfZIdKXVPTTPqj0rfn5j07AweALIUY
	 FRPe2y2AkA+sXZ++JjWjDZAYy/cRW2JnLhP075DQuAU+gY1UOyBf+haepkqtxodWVY
	 Y+iocU/RCBk8Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z3vMz08wsz4wbx;
	Fri, 28 Feb 2025 14:49:17 +1100 (AEDT)
Date: Fri, 28 Feb 2025 14:49:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, David Wei <dw@davidwei.uk>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the block tree with the net-next tree
Message-ID: <20250228144916.3f5905cf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IqqFrWOlEanhzm3JG70FbSu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IqqFrWOlEanhzm3JG70FbSu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  tools/testing/selftests/drivers/net/hw/Makefile

between commit:

  185646a8a0a8 ("selftests: drv-net: add tests for napi IRQ affinity notifi=
ers")

from the net-next tree and commit:

  71082faa2c64 ("io_uring/zcrx: add selftest")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/drivers/net/hw/Makefile
index cde5814ff9a7,7efc47c89463..000000000000
--- a/tools/testing/selftests/drivers/net/hw/Makefile
+++ b/tools/testing/selftests/drivers/net/hw/Makefile
@@@ -10,7 -12,7 +12,8 @@@ TEST_PROGS =3D=20
  	ethtool_rmon.sh \
  	hw_stats_l3.sh \
  	hw_stats_l3_gre.sh \
+ 	iou-zcrx.py \
 +	irq.py \
  	loopback.sh \
  	nic_link_layer.py \
  	nic_performance.py \
@@@ -43,4 -42,4 +46,6 @@@ include ../../../lib.m
  YNL_GENS :=3D ethtool netdev
  include ../../../net/ynl.mk
 =20
+ $(OUTPUT)/iou-zcrx: LDLIBS +=3D -luring
++
 +include ../../../net/bpf.mk

--Sig_/IqqFrWOlEanhzm3JG70FbSu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfBMjwACgkQAVBC80lX
0GzgUwf/T+4bByxUtEmJQ/tSOYTLf+IKtgczZtQ1OgybowN4jSLUDPvIJvFEbPi5
l1nQ4BMJtoyL7TJFG7yStomvFNAZHXdFHBNDudzhlCAn9tKfOXYp3JquagO7dweT
p14NOW/TmDOACGBz+hrqB/hkGqLdwJZFDd3MZGhoGbBOz3Zt7iqEdTCU39pJCWA+
XcAdk3TgApsf9ta3Cw1EQSpnWWqhH3/0bQssJGzfg+MhtLJTt8Kf2o/SYrD1LQT6
26koynuAP+/v6Mm9+FqBH6VldKZxxMuGa0y8wALCtukXt86mZe+It45TkB8GzAQE
7JzDbPL1MYIYsufMF7eyRXfwZr1r/Q==
=B+NT
-----END PGP SIGNATURE-----

--Sig_/IqqFrWOlEanhzm3JG70FbSu--

