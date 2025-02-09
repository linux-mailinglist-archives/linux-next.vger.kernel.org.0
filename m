Return-Path: <linux-next+bounces-5396-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EA715A2E138
	for <lists+linux-next@lfdr.de>; Sun,  9 Feb 2025 23:39:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C3AC7A2783
	for <lists+linux-next@lfdr.de>; Sun,  9 Feb 2025 22:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF391ACEAB;
	Sun,  9 Feb 2025 22:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="myVq9YZd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0575C82488;
	Sun,  9 Feb 2025 22:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739140783; cv=none; b=lNIcSyYrpPVAzhHNFhAXLAfCjMwyQGbhf/C2KUUqz8VzFy3HGKuC9cGjlXj6Nrwc0A2fR7PdxQjH2/7X/M7La8f1au+TD/4/onm7dO5mljFGzR20GbVgY4JCORH8cTipwLnFb6TiCXceIOXo7ltzkRtZzxnZm9AuWvoJdAo5D9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739140783; c=relaxed/simple;
	bh=CR8awdPeVLEdGlEoVqZF90F8Cx6eoLGNFON6XRSiB4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NBKlxVaEHs3WWjV5sjHApc22o5YIFF62rVtc4uq2dPGKMRiotDL9vAcK3vM7l5aMqwrCkwPj9af0Sf1qmf4DLKWqpsBkzEWFbP8lP+kVUTlO7og68ZAlUvxZnt9BtXckVnNRo518C4IQ1+Rt5nsrsz7ha2YjQMPVcKH7wEJc7fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=myVq9YZd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739140775;
	bh=ee4CvhgOw0QWfBCiNfu4SmGWiVD+M08IcesX1yfz5ws=;
	h=Date:From:To:Cc:Subject:From;
	b=myVq9YZd6J7jc1dUnogAvYSQLj/yS/q/4tcq9B2a+B+sbDxpL7kxrGcbWqVoMX0m4
	 VW1Y38T3Ajx2ctbaORtgMBD/uHofwVoXKeczMAZEfeF0IE+JFecB23IfpVVc14fEWy
	 Z4j1LBkUQasu9xEj46arlyxT0r0/fvfJ9UmjLaiJE4MLFkz0teqp3xt1sgWmW/OPEa
	 PeX9S/Ux58MXR8vCLVA2gcFNBKXIzUnPEdLSKa5iIAjbuBtpXGNTzOdt5yOTlTMQPB
	 puPivBHZt70252iwEdB5zGwcecYrTm27bbzMUdcX/p6kfv2MrLBbbz159A9sNgG2JS
	 ADaJ+usUwHQuA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YrjLv4q63z4wbn;
	Mon, 10 Feb 2025 09:39:35 +1100 (AEDT)
Date: Mon, 10 Feb 2025 09:39:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Uros Bizjak <ubizjak@gmail.com>
Subject: linux-next: manual merge of the mm tree with Linus' tree
Message-ID: <20250210093934.07a303c9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DaWv.a_l70pmoXlkHOMIVrb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DaWv.a_l70pmoXlkHOMIVrb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm tree got a conflict in:

  include/linux/compiler.h

between commits:

  cb7380de9e4c ("compiler.h: Move C string helpers into C-only kernel secti=
on")
  20e5cc26e56d ("compiler.h: Introduce __must_be_byte_array()")

from Linus' tree and commit:

  a7d395568dd3 ("compiler.h: introduce TYPEOF_UNQUAL() macro")

from the mm-unstable branch of the mm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/compiler.h
index 200fd3c5bc70,a892c89ac28a..000000000000
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@@ -191,25 -191,26 +191,45 @@@ void ftrace_likely_update(struct ftrace
  	__v;								\
  })
 =20
 +#ifdef __CHECKER__
 +#define __BUILD_BUG_ON_ZERO_MSG(e, msg) (0)
 +#else /* __CHECKER__ */
 +#define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_asse=
rt(!(e), msg);}))
 +#endif /* __CHECKER__ */
 +
 +/* &a[0] degrades to a pointer: a different type from an array */
 +#define __is_array(a)		(!__same_type((a), &(a)[0]))
 +#define __must_be_array(a)	__BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
 +							"must be array")
 +
 +#define __is_byte_array(a)	(__is_array(a) && sizeof((a)[0]) =3D=3D 1)
 +#define __must_be_byte_array(a)	__BUILD_BUG_ON_ZERO_MSG(!__is_byte_array(=
a), \
 +							"must be byte array")
 +
 +/* Require C Strings (i.e. NUL-terminated) lack the "nonstring" attribute=
. */
 +#define __must_be_cstr(p) \
 +	__BUILD_BUG_ON_ZERO_MSG(__annotated(p, nonstring), "must be cstr (NUL-te=
rminated)")
 +
+ /*
+  * Use __typeof_unqual__() when available.
+  *
+  * XXX: Remove test for __CHECKER__ once
+  * sparse learns about __typeof_unqual__().
+  */
+ #if CC_HAS_TYPEOF_UNQUAL && !defined(__CHECKER__)
+ # define USE_TYPEOF_UNQUAL 1
+ #endif
+=20
+ /*
+  * Define TYPEOF_UNQUAL() to use __typeof_unqual__() as typeof
+  * operator when available, to return an unqualified type of the exp.
+  */
+ #if defined(USE_TYPEOF_UNQUAL)
+ # define TYPEOF_UNQUAL(exp) __typeof_unqual__(exp)
+ #else
+ # define TYPEOF_UNQUAL(exp) __typeof__(exp)
+ #endif
+=20
  #endif /* __KERNEL__ */
 =20
  /**

--Sig_/DaWv.a_l70pmoXlkHOMIVrb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmepLqYACgkQAVBC80lX
0GyeHQf/TekNR7qBGz5v8NWPMTsP2c2DvPeyxrlLLEeqDP/1cWZxY7cSDbZMhGpT
eP22KeTj1nSQPkG3YNPXArEEYlF3O6Km5/LUyA83EXd1hfuMTEyiU1oMz+e6P/nc
ys5umKvKj9ScQtbcFuyyGbJOtya3MuJJvDXZfHKSIZU4KhGrpHyaj7UUm9ehDA06
aI6IDWPFiONC7bgEnwQfkYsRkelBDr4NBBNcJlgH/OLu6x32uFThjnFe7cqfXVUQ
pWGKsMyUYwWyDNFquTP9VjRh3NIH/KWxdPgefRIX8/Laeu4qPY0w1eNlSyRGznxE
1tfTXsbHQIOqS3xZ1Ux9IXrWoMHitA==
=dPwE
-----END PGP SIGNATURE-----

--Sig_/DaWv.a_l70pmoXlkHOMIVrb--

