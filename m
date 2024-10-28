Return-Path: <linux-next+bounces-4504-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B243D9B3E11
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 23:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E34441C222AF
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 22:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAAB1EE010;
	Mon, 28 Oct 2024 22:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PkO9USVS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C24018E049;
	Mon, 28 Oct 2024 22:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730156141; cv=none; b=OoaK2DnnMXnERj0JIwaMx4R/UmnxoscB7lDUc7zq6zC8QGiCZ7Gr6rOjQ8UAP9RS2PtrKBijmmeZhw2iDs2nnplh9QimocGf6VQcspBlKNlUXQw1vm9BbNxohO5O0rvA/re/nC8BN4cgESG8mVYFNMu7XnaR9UMaKa+3du+Kn8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730156141; c=relaxed/simple;
	bh=se5Ecczs7QJZwexBNFOQl8XDU7+R9ykDZwoDzqe+mpc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BiGxCMmekrXZbmHPaZqdSP7D0xW5kNA+pCbyUPbXSQZQ52rgmO+nbjGlMNKR9yxjdi17Z6Trg7oaxpvIEwZoHCwr3Bqirx6zhumx2We9K4sSENRlvNheNMNaeWF/L6IgZ/JBDC64qA9p633BErJ2WJr8K3qWnURKslPz8/3wlPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PkO9USVS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730156126;
	bh=9hyetCs1EXUdVrvgmm3jEvbyrHoswYGva4KRe0L/v+Y=;
	h=Date:From:To:Cc:Subject:From;
	b=PkO9USVS6CS0xpGV9GINAQEAvIgSgAmKmGOy5jbhBDY3dmEP82XW/TgSab9cKPHa/
	 LO4JmA0dytiuJb2Pjv91NwIxPZv7ujL6DoD/IRVwLyN62rXNoYvErkI+L7DPZHn286
	 b1I8Cx3TlTWZNxblLv6HiFVQATn2c1sGRq3xFaLqLZYXmrr7StIs7gu2xvEvriljCG
	 fnVLi3kWpTbbxQY0P7+6vRXyv77cXvOi+wR5rzjaR1h4EUojh+gShi4yqJo/gqaM01
	 jS1Nh1slpXwfjbb90z69X7u0XFlmHWaH7DsmovahBEG7PJWoFzRB81xH3Gp+mR0LFh
	 5KRa8B0bb0u9g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XcpdB2TX1z4x3J;
	Tue, 29 Oct 2024 09:55:25 +1100 (AEDT)
Date: Tue, 29 Oct 2024 09:55:25 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: Julian Vetter <jvetter@kalrayinc.com>, Kuan-Wei Chiu
 <visitorckw@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the asm-generic tree with the mm tree
Message-ID: <20241029095525.0fba9d23@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KH71GUNKK6P_SPn1O9g/CWE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KH71GUNKK6P_SPn1O9g/CWE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the asm-generic tree got a conflict in:

  lib/Makefile

between commit:

  2ff14c29323d ("lib/Makefile: make union-find compilation conditional on C=
ONFIG_CPUSETS")

from the mm tree and commit:

  b660d0a2acb9 ("New implementation for IO memcpy and IO memset")

from the asm-generic tree.

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
index 1eb89962daef,db4717538fad..000000000000
--- a/lib/Makefile
+++ b/lib/Makefile
@@@ -35,12 -35,10 +35,12 @@@ lib-y :=3D ctype.o string.o vsprintf.o cm
  	 is_single_threaded.o plist.o decompress.o kobject_uevent.o \
  	 earlycpio.o seq_buf.o siphash.o dec_and_lock.o \
  	 nmi_backtrace.o win_minmax.o memcat_p.o \
- 	 buildid.o objpool.o
 -	 buildid.o objpool.o union_find.o iomem_copy.o
++	 buildid.o objpool.o iomem_copy.o
 =20
 +lib-$(CONFIG_UNION_FIND) +=3D union_find.o
  lib-$(CONFIG_PRINTK) +=3D dump_stack.o
  lib-$(CONFIG_SMP) +=3D cpumask.o
 +lib-$(CONFIG_MIN_HEAP) +=3D min_heap.o
 =20
  lib-y	+=3D kobject.o klist.o
  obj-y	+=3D lockref.o

--Sig_/KH71GUNKK6P_SPn1O9g/CWE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcgFl4ACgkQAVBC80lX
0GyK1AgAiebQzY/Q5h4PwjZVs4qA5GClqi3B8TRyrmStHrl3fzPuBIkA46U2Gib8
oMciWU0uL6+kn3i7i7xCDKNXQo9ZRt+OqP1XFF4gUN1AvsvTy6BN9WTe2bBV4NLZ
brTOpjA2lPX5+6Qk1iWhkHH+wMzKxCJMGB30XwX1VCtAgWbiCUu9pkQ7FhpTCaFi
ZYaT2S836VgSMqW6ZTNp3V9Hd0YAM84SWOZxt0HwSWWuX7RYsF5i8WFYygswQqgP
axM5SmufTtouSHzK5OlX1ionDSNAA7vmUGquDaiJ+IAESX9aGdHOjIqwMQ6DT+yw
rU0zgZsNwuB3lubts4JmJdGC1iPgEA==
=UkQ1
-----END PGP SIGNATURE-----

--Sig_/KH71GUNKK6P_SPn1O9g/CWE--

