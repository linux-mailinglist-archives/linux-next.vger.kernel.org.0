Return-Path: <linux-next+bounces-3142-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC6393E9FA
	for <lists+linux-next@lfdr.de>; Mon, 29 Jul 2024 00:41:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 692B61C20E3A
	for <lists+linux-next@lfdr.de>; Sun, 28 Jul 2024 22:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3915074E09;
	Sun, 28 Jul 2024 22:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oCAkK7mL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E443EA9B;
	Sun, 28 Jul 2024 22:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722206484; cv=none; b=aBf2vDrUlDdPn8/V62bMMz8AmWgJGLN+HhexbY3HZ4B9kP9LLsb5JF0Qiiqtj4SYO03mAgf+eLub8xoIjRKEGsZ1O93R5rcJ5+11zvzeqn0+0aDxydwYy/TwHHn6mMr4kUJiVliqSC7DXmdzmuY6UwEGayMu2sutA7dZgk0J3I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722206484; c=relaxed/simple;
	bh=7D6KoZVYr+auLXt0j8NYRAiaqlGm8/0a41LCaiYuzp0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=l8nqf+qzhfKkXOIlzhW1zvr6gSGfRRUlGE7RXR5gQyaBi7s9jJyHXhSDrOdUjb0pC4GJIfxzCUe/J3r6HFtTDL1IGgMxKPBPxXkCu8BzAmhLkVMuoGlRuOTIRd5fYgJwiUH8BN9r4Yw3h/Ka0Mdn8WHZEr/sJ8kBx09DDY870aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oCAkK7mL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722206478;
	bh=VUonGBtr1A2mAuJUZBpyXBeup+aCFkeySDkMnvzTBKU=;
	h=Date:From:To:Cc:Subject:From;
	b=oCAkK7mLoqwXyqQCxtJmqdOTrRRTpMHIrVw2KFG70bETYcxgTM2NYnF5G231XqTIa
	 LiAzbvsgKWcPnfTzJ5Tn/GgxgwxrASw5zLJkqPv2Mr7UVt2a1LSoyEclU+ErTy6GPN
	 pAfBFMM910Xj3SgqMT4I3FbmH8VFHmUYX37GK/bstBJ28udCZh9XWZEO0bP56+gM78
	 egeeHc5G+qvttkfCgeOltDEs+T9IKdp6Y2q9mi12q70+mViSpt8WE8Ww/P3NCeEc6g
	 6NxFwZT+ewXt6NhJn1Dlhnxqvgwbq3n4EpzYl6flMAw7w3cn3ipaqvpWlMhIr8idcV
	 Ai8IbBwMaNe/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WXGgK6fltz4x4c;
	Mon, 29 Jul 2024 08:41:17 +1000 (AEST)
Date: Mon, 29 Jul 2024 08:41:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Wei Yang <richard.weiyang@gmail.com>, Yury
 Norov <yury.norov@gmail.com>
Subject: linux-next: manual merge of the mm tree with Linus' tree
Message-ID: <20240729084117.3fd74b2c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xTab9U7+d6=TuYYo=pA9t=7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/xTab9U7+d6=TuYYo=pA9t=7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm tree got a conflict in:

  tools/testing/radix-tree/bitmap.c
(renamed to tools/testing/shared/bitmap.c in the mm-unstable branch of
the mm tree).

between commit:

  692a68ee9c3c ("radix tree test suite: put definition of bitmap_clear() in=
to lib/bitmap.c")

from Linus' tree and commit:

  28b9ae6595be ("tools: separate out shared radix-tree components")

from the mm-unstable branch of the mm tree.

I fixed it up (I deleted the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/xTab9U7+d6=TuYYo=pA9t=7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmamyQ0ACgkQAVBC80lX
0GyRowf9Eqb+6tqiubo9e3vm2ZEaf/13kb8aco2lRUFKJVeYUvTKVyn4guNrDYVp
QYJvQj+uyogvJFxbgOBUs8eCupCzn6mZ4gKz8GCsmBrdyZYauNkUoFhGtDj6Gz7s
8EEdz5k2VpCglGMZabDYU4mlHoSVpEmRSGaAcSoYDidS06Fg2ZnmUT/cDI0DE2Wn
eIF/RA/zft/tvEAlK1l10pOfPVRjLKUzw5p/jPEPYgmi53VrevspDuYZtSCDyKVw
MBIg2KGvhkGIBo2akz183+c8kMqjhgBWBaOk0xI2V4Bjkibu/JCLPOJdqaEweYFc
g8g0/HAy5j6FRjs7MlbObJ5Xx2ofnQ==
=7jPu
-----END PGP SIGNATURE-----

--Sig_/xTab9U7+d6=TuYYo=pA9t=7--

