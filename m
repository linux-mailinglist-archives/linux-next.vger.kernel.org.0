Return-Path: <linux-next+bounces-9123-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 131FCC76DDE
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 02:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 5A4092B6BE
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 01:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE3620C001;
	Fri, 21 Nov 2025 01:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dTtH+23C"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F366165F1A;
	Fri, 21 Nov 2025 01:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763688916; cv=none; b=lVRwdw0yGIPSN0RNeNWa88Y/yhw6bU/LywszTH94UL+tFjoE2wfF0B/riCYmGzEXV/yBEXBKTo3fACTBzzBnnTzRz3p8K6xutT6zHWEqPoYQPgGWKhjn0KdkeEaDUpczdjnqjHQb1PGm3k1lCqrLu/4G3jGBJ8v0Z6S7JEKaSWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763688916; c=relaxed/simple;
	bh=kS2ofSOhGmMFYH9zGR2qGRKe/MsORwCEovyiu8LJB1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bq/Y6fogahHepxsbptiqK0Orn+ARoZ6Cg5L1tUGMEKvPbTAYpERM6+Ghzej01M/uKKioJANSb0d6xysCkNhWbeN7pnaKgPiJg9RDve5xd/hXtLvW52axPSJbuYSIWI51tqWhLfagW6Xk9EmvyvK8WNKjMFgqQ+YQ/XzuOmi7zm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dTtH+23C; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763688911;
	bh=If92lfRPzD0LhlgpaDS36W/p/KyiBxB2kOQa1cbeLnc=;
	h=Date:From:To:Cc:Subject:From;
	b=dTtH+23CcUY9BjfBwr/pk/7/dDvHydOrJUlAoJv/OCGw/ZgtKthEOcGfRyPHoagyu
	 fCQIy1E/EyORkmf0WbU8XZr06S9G504nXLvLM4IM26KZr/sAPLZiiHGAw4h4mTy3wX
	 DNrY6Zvp9u5sH0wclWR0kLsoknL1lFEsLHptgQp+lsNXw5qfZiEgbdGDynwK8nWKZ0
	 aTpCfhJ+RrRi82I3esCsQUQh5Tasi7zKQbafDivPaUv2qMqLRXKU8EA8J9aS7d85LI
	 qnTtV3nuQFjlzBE8iHXtFEQjC9ObAbuTWQfxReSOzYQCvjKDtyAHyTsEfdvf4mGU6P
	 GIQZBbO44kb6Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dCHpQ3fxNz4wH7;
	Fri, 21 Nov 2025 12:35:10 +1100 (AEDT)
Date: Fri, 21 Nov 2025 12:35:09 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Gopi Krishna Menon
 <krishnagopi487@gmail.com>, Ivan Pravdin <ipravdin.official@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Tomas Glozar
 <tglozar@redhat.com>
Subject: linux-next: manual merge of the ftrace tree with the jc_docs tree
Message-ID: <20251121123509.5f07d818@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oUJmY=U_LfvX8ULOlsIFo.q";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/oUJmY=U_LfvX8ULOlsIFo.q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  Documentation/tools/rtla/common_options.txt

between commits:

  96b546c241b1 ("Documentation/rtla: rename common_xxx.rst files to common_=
xxx.txt")
  198fcc7cb832 ("Documentation/rtla: Mention default priority")

from the jc_docs tree and commit:

  90241d14a726 ("rtla: Fix -C/--cgroup interface")

from the ftrace tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/tools/rtla/common_options.txt
index 1c4f3e663cf5,edc8e850f5d0..000000000000
--- a/Documentation/tools/rtla/common_options.txt
+++ b/Documentation/tools/rtla/common_options.txt
@@@ -46,9 -42,7 +46,9 @@@
          - *f:prio* - use SCHED_FIFO with *prio*;
          - *d:runtime[us|ms|s]:period[us|ms|s]* - use SCHED_DEADLINE with =
*runtime* and *period* in nanoseconds.
 =20
 +        If not set, tracer threads keep their default priority. For rtla =
user threads, it is set to SCHED_FIFO with priority 95. For kernel threads,=
 see *osnoise* and *timerlat* tracer documentation for the running kernel v=
ersion.
 +
- **-C**, **--cgroup**\[*=3Dcgroup*]
+ **-C**, **--cgroup** \[*cgroup*]
 =20
          Set a *cgroup* to the tracer's threads. If the **-C** option is p=
assed without arguments, the tracer's thread will inherit **rtla**'s *cgrou=
p*. Otherwise, the threads will be placed on the *cgroup* passed to the opt=
ion.
 =20

--Sig_/oUJmY=U_LfvX8ULOlsIFo.q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkfwc0ACgkQAVBC80lX
0GxCtAf/bNfGOmHtYYbemSdofxiVc070/vmGIcTRDrGcUW+Ct9QfwDbAQClXvsxV
fCkkngIIlk3ykjt2QKTK3/qAnvP3wARL/ySLLZSrFg0aVgLweCO1P+7oqadVlCZk
QphA4hIeVsXZLrpqlaC3gUJuV1IOHnrsURDwz2+8gKZxdb9+SlM3b/Fvrgwm1J2s
cOb6Y8DecbKY4LGRYtLiNqpfn3yPjOEksNjRQ52VryA2bz0318IDe2ORaBNge4MU
7EORbtnRC7MjzvTEIhU4gTCfPxASzT8lmqfEMpEGm23n1j/bsVN4b/1jD4o9S860
vsCYnV2OB3Jh+jBAsDD2azk/phMmOw==
=S8au
-----END PGP SIGNATURE-----

--Sig_/oUJmY=U_LfvX8ULOlsIFo.q--

