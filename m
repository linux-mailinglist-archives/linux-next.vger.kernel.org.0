Return-Path: <linux-next+bounces-3952-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE03983B9F
	for <lists+linux-next@lfdr.de>; Tue, 24 Sep 2024 05:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 385211C22431
	for <lists+linux-next@lfdr.de>; Tue, 24 Sep 2024 03:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F132F14286;
	Tue, 24 Sep 2024 03:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Eos4ZXoO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B004A1B85D0;
	Tue, 24 Sep 2024 03:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727149473; cv=none; b=JcZsrhQYTvwFSJykHUrypMQPJOq0aLM0N0HjXiip9G3ECigoZukQjW2OqkkMl0p6dhmSpWInNsyfegshkv9aBhOAo65OI9XTpPYv6xh3Z1e/8eTY/Tu8FWyVUfy+IMzoJvxrLNfylNDxQmd+Q/tYHzBmQbcs/SEVufDeNk2HfQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727149473; c=relaxed/simple;
	bh=emO77E2EVvCmNLtl3xie0zn9Lo/O2GECe8fTKjaJXPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mEKYYyq3AZ1xZIae19nXVLIhCv1Q8FOY1BNpchSbRgOgKoeVYi4RCZm6F+D9fuZihZ2d3YnUSZwUWSxq7W0eNHdAFitn0zP9vBQZ1Icv5qXOVq9o0H5GWFg0EuS0njRzn99f4/P9ZwDhiJ4QiIvN54u/jb+OlLUhGwTid93d19A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Eos4ZXoO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727149467;
	bh=P5vZfM/lrcisDFYTToXc0ksdmeJAJd6iM1cGDFHLUx0=;
	h=Date:From:To:Cc:Subject:From;
	b=Eos4ZXoOXNlj8zZkh1NoDETB6fkkA53s9xkzCpSs0sxHbOLQ9b3VFAdkDDztOy9Zn
	 qX/fyajqHFIHAzNMlgzpOaO0450JHbcSUzejW8bjZGYr+8fW5iGXVF8PLvfL7A++w2
	 Dn+K+I0zVWDikk5sAqHiNhofQu/PocBVWGcngCsuAO2Zn+X2AV51yJibURnlCwXKpq
	 muOx2Cfd+3CYBvIgX513uBMvJ+pQo8faF8R/CHNH9T/2If7SavZfVw5OlBh2xCMvAq
	 4hVeq2QkjhB0gUVU6U9ivV7DXoG3AT2fFHvIuJAy5SUEAfnCiIGfozIF3J+0vETwwl
	 vNM9GFoQ3l9CQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XCQhp1qpmz4x7F;
	Tue, 24 Sep 2024 13:44:26 +1000 (AEST)
Date: Tue, 24 Sep 2024 13:44:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mike Rapoport <rppt@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens
 <hca@linux.ibm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, Wei Yang
 <richard.weiyang@gmail.com>
Subject: linux-next: manual merge of the memblock tree with Linus' tree
Message-ID: <20240924134425.077c9402@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8650Sg8FsFJ23ru1k.Uum+U";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8650Sg8FsFJ23ru1k.Uum+U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the memblock tree got a conflict in:

  tools/include/linux/linkage.h

between commits:

  f8d92fc527ff ("selftests: vDSO: fix include order in build of test_vdso_c=
hacha")
  e08ec2692855 ("tools: Add additional SYM_*() stubs to linkage.h")

from Linus' tree and commit:

  d68c08173b70 ("memblock tests: include export.h in linkage.h as kernel do=
se")

from the memblock tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/include/linux/linkage.h
index a89620c550ed,20dee24d7e1b..000000000000
--- a/tools/include/linux/linkage.h
+++ b/tools/include/linux/linkage.h
@@@ -1,10 -1,6 +1,12 @@@
  #ifndef _TOOLS_INCLUDE_LINUX_LINKAGE_H
  #define _TOOLS_INCLUDE_LINUX_LINKAGE_H
 =20
+ #include <linux/export.h>
+=20
 +#define SYM_FUNC_START(x) .globl x; x:
 +#define SYM_FUNC_END(x)
 +#define SYM_DATA_START(x) .globl x; x:
 +#define SYM_DATA_START_LOCAL(x) x:
 +#define SYM_DATA_END(x)
 +
  #endif /* _TOOLS_INCLUDE_LINUX_LINKAGE_H */

--Sig_/8650Sg8FsFJ23ru1k.Uum+U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbyNZkACgkQAVBC80lX
0GxcaQgAkNpxVQX88hxniYLTKFXExWz/zqgBmybVygV2jOnfI+WeHJCEQkuLTvbk
bBBNh7ZkP5IgiyYKcoJGVwMlfm0DUFJw+FlwLrDOdsACc8BMmRdn4ulBY8jbUpgH
ITVEqeFpChIuXyNoEkN8MBs1FRVpdYMQR1RIwd/Exsje9cuU+nUjSEJnDEFqwT3i
KWjzukp0erTvKj+GyPmu4ZlXmsMSAzaJQkugIyWM8LoXTY2gH4NqZAm4E0veoSPy
VtO2RIQQvEa9wmM3wy/CHpc1GeGICE9m0IA4gzU5vZM86F5S7DMd9EXN21Wa9by7
NyN1987uY2obBi8qTYTSzZ7rX1ubEA==
=3OLs
-----END PGP SIGNATURE-----

--Sig_/8650Sg8FsFJ23ru1k.Uum+U--

