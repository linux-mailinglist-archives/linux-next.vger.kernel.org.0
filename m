Return-Path: <linux-next+bounces-5810-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A025FA645B7
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 09:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F0843A520E
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 08:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A18E21D3D6;
	Mon, 17 Mar 2025 08:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SrJ9y8rU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B04191499;
	Mon, 17 Mar 2025 08:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742200591; cv=none; b=DfzlRDLyxshKzVlUVzesX0anuFPbs2RJzznY5keFXrUbDkHIndxQ/nrV78fgTE/g6EYWysGwJ5C9IXyEuAU8M3+BHtBmz2HJF3hTRTI/IuDFXYPN1F1kLDr/X5aWQ7r5C5K5Zapw3LRQnUyUfBSfPQC2XFfguaNFq4sTyp/N1x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742200591; c=relaxed/simple;
	bh=UyhuXGln5+ft1pHnigfzjGcRIc5uKiAk+wUegpAjsWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TX6y9tpuCe2wt2uZ1Rq+DpQaDyIys8xMImnLV3SgTGrQUn6a//oJxl78ksAvLOKvRwlWBvgaHs/9gFEz2+Zwp7maFlXg+9hQa+CFxw+PMhrtTNn7Mw7Clmm9g4p5zf3YMLA9mS3HRqbNT9uEoUb2oh9g3SWK7OAa3YXCoSrKlhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SrJ9y8rU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742200583;
	bh=IlfGdgJfr6ZKNTbJzXvUWKXaP17H/CCBQIKz//mIQUo=;
	h=Date:From:To:Cc:Subject:From;
	b=SrJ9y8rUvMqGAYe4zCOIMoEri5bXSJa+ibKim4l+9avRSb4foS9OiLqBxxIKYBOSw
	 fbt5gY/CUFGbeU0QdV5hXXyTK8eOmdQG5VelBgyWX9l7e7QIycTJfCBUo4b0jqxFxa
	 NQ5EIj7rZH/shro/c1hf/2byHxDSwm5/Qo23zj9hZHw/mqbiShizkls4hggCz2hVPq
	 lZqaWT7OKOvly8IAEM33kfgEBm2q/mGCT5FyRsE+4JG9I8gVQtAHyiKNdGmvm7/tgN
	 HwOM1YaHrvN2GoEGNg5B6mL6D9nTc0+eJQgWMWpTWervwdAvPtMC/CFewyZfOi+z67
	 H6opdCmvPiZKQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGSxL4DJCz4wcZ;
	Mon, 17 Mar 2025 19:36:22 +1100 (AEDT)
Date: Mon, 17 Mar 2025 19:36:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shuah Khan <skhan@linuxfoundation.org>, Brendan Higgins
 <brendanhiggins@google.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Sergio =?UTF-8?B?R29uesOhbGV6?= Collado
 <sergio.collado@gmail.com>, Shuah Khan <shuah@kernel.org>, Tamir Duberstein
 <tamird@gmail.com>
Subject: linux-next: manual merge of the kunit-next tree with the net-next
 tree
Message-ID: <20250317193621.4b4db936@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/076mAxA_l.m86nRuWPP6JiL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/076mAxA_l.m86nRuWPP6JiL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kunit-next tree got a conflict in:

  lib/Makefile

between commit:

  b341f6fd45ab ("blackhole_dev: convert self-test to KUnit")

from the net-next tree and commit:

  c104c16073b7 ("Kunit to check the longest symbol length")

from the kunit-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc lib/Makefile
index 66e44569b141,e8fec9defec2..000000000000
--- a/lib/Makefile
+++ b/lib/Makefile
@@@ -392,7 -393,8 +392,9 @@@ obj-$(CONFIG_FORTIFY_KUNIT_TEST) +=3D for
  obj-$(CONFIG_CRC_KUNIT_TEST) +=3D crc_kunit.o
  obj-$(CONFIG_SIPHASH_KUNIT_TEST) +=3D siphash_kunit.o
  obj-$(CONFIG_USERCOPY_KUNIT_TEST) +=3D usercopy_kunit.o
 +obj-$(CONFIG_BLACKHOLE_DEV_KUNIT_TEST) +=3D blackhole_dev_kunit.o
+ obj-$(CONFIG_LONGEST_SYM_KUNIT_TEST) +=3D longest_symbol_kunit.o
+ CFLAGS_longest_symbol_kunit.o +=3D $(call cc-disable-warning, missing-pro=
totypes)
 =20
  obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) +=3D devmem_is_allowed.o
 =20

--Sig_/076mAxA_l.m86nRuWPP6JiL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfX3wUACgkQAVBC80lX
0GxZ6Qf/YnRsriB0q7CmcrCIeHwVxkGTJqlm6L6TY0FG9rK3ef3TiQ6ey6zvOQIN
iwCs0PeK0YT31xf5hqVXyrXcJPj++ikGocTBmRm+OxbSBl1eyeTKoQLggZDmtBLf
HsJBKVxAmCQ8fH49jknv+OThgC7dcUij3Z5j86i8J2X3fNpbx4vvLQAF5y7eybCh
xSxzKsU75Io8P+34bG9T00M6DYt04HO3amGbYBBhwQuqDZ74Q2QAAkxKTFGPq/Ct
mhyS232pNuT1sJ6IXisTHkTkPJ2FBcK5DAY9Ar4ARllIPM7u7tqc2pRz5dQD71lk
7wZ6IiTHL4OiAoXZrSX2Su+/rWjDbg==
=Mtze
-----END PGP SIGNATURE-----

--Sig_/076mAxA_l.m86nRuWPP6JiL--

