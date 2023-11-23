Return-Path: <linux-next+bounces-37-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A99417F552A
	for <lists+linux-next@lfdr.de>; Thu, 23 Nov 2023 01:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCEDA1C20AAC
	for <lists+linux-next@lfdr.de>; Thu, 23 Nov 2023 00:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077A6179;
	Thu, 23 Nov 2023 00:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PRll5c2A"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B72DD;
	Wed, 22 Nov 2023 16:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1700698206;
	bh=F3hUK3Y0jf6mS8cm4SBZe1aq3dM/e7j0/uTA65TSOTE=;
	h=Date:From:To:Cc:Subject:From;
	b=PRll5c2AoJNykMGptGa6+/VDK3EWaqvRu1+ZgltEQee7Vhckm3AJji5OjOxetaOrD
	 pg3B6YD6FMrE76APsslOa8b8oONNzVtjF7yTKjjJrVjNbaj67l5jzaLt4BzAVaV9hT
	 J6JXLGr5VcZzVN9IxqcSI5X+l7UVpP3WBA8JsSTgDN/LQQbARhf+ERHWWd7QoHNn+H
	 TO5WUnw5RCYcUH9nM9xE9yBKUjQaHErdLU3BB5fyDnRzTe7pE/ydGcbBjN5iNXXDLq
	 noQamLNEI6k0eAMxFBGZT91M5d27ynztmohUeSzsMhyjEcax09fTiLAoTDgGhApITZ
	 njTGh6y1uoXVw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SbJQj6nrMz4wdB;
	Thu, 23 Nov 2023 11:10:05 +1100 (AEDT)
Date: Thu, 23 Nov 2023 11:10:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Paul Moore <paul@paul-moore.com>, Arnaldo Carvalho de Melo
 <arnaldo.melo@gmail.com>, Namhyung Kim <namhyung@kernel.org>
Cc: Casey Schaufler <casey@schaufler-ca.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the security tree with the perf-current
 tree
Message-ID: <20231123111005.432dfc56@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ka_w7hWow747h/p/rsdKFwU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ka_w7hWow747h/p/rsdKFwU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the security tree got a conflict in:

  tools/perf/arch/s390/entry/syscalls/syscall.tbl

between commit:

  d3968c974a24 ("tools/perf: Update tools's copy of s390 syscall table")

from the perf-current tree and commit:

  5f42375904b0 ("LSM: wireup Linux Security Module syscalls")

from the security tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/perf/arch/s390/entry/syscalls/syscall.tbl
index 86fec9b080f6,5a422443cb16..000000000000
--- a/tools/perf/arch/s390/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/s390/entry/syscalls/syscall.tbl
@@@ -455,7 -455,6 +455,10 @@@
  450  common	set_mempolicy_home_node	sys_set_mempolicy_home_node	sys_set_m=
empolicy_home_node
  451  common	cachestat		sys_cachestat			sys_cachestat
  452  common	fchmodat2		sys_fchmodat2			sys_fchmodat2
 -453  common	lsm_get_self_attr	sys_lsm_get_self_attr	sys_lsm_get_self_attr
 -454  common	lsm_set_self_attr	sys_lsm_set_self_attr	sys_lsm_set_self_attr
 -455  common	lsm_list_modules	sys_lsm_list_modules	sys_lsm_list_modules
 +453  common	map_shadow_stack	sys_map_shadow_stack		sys_map_shadow_stack
 +454  common	futex_wake		sys_futex_wake			sys_futex_wake
 +455  common	futex_wait		sys_futex_wait			sys_futex_wait
 +456  common	futex_requeue		sys_futex_requeue		sys_futex_requeue
++459  common	lsm_get_self_attr	sys_lsm_get_self_attr	sys_lsm_get_self_attr
++460  common	lsm_set_self_attr	sys_lsm_set_self_attr	sys_lsm_set_self_attr
++461  common	lsm_list_modules	sys_lsm_list_modules	sys_lsm_list_modules

--Sig_/ka_w7hWow747h/p/rsdKFwU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVemF0ACgkQAVBC80lX
0GzPuQgAkjP506h+ukQtYp4SvCpuCsXiZlPpImj4FpnNz3B2JVUYwi+c7//OOFx2
DasVpvnZdFfxjadZKM15HEeOpzVTi/Fe7MYjVTlzeKTMF3kto+4IwuvfkCoXEey9
fVr2so9Mndo1PHAZOoNGwoyTPpJNzq5pjv2WBRSWj8f2jpdebtwtENyBlNzOvQnR
H9gozjIYWD+7zSDqUWp7FiRT7WX+LMcTKcfsL2DJ0cX9hXNwhGufQgEgfcppFN6L
VUYN2M/Xmg2lb+Ht3ZJk+p7zw6OvzM+3cr6j0NMlyyyAazlPi09IQuclhet21pQS
5nT8EGvGJRmWwkCZ9bDI04Hzmy9ouw==
=uq7O
-----END PGP SIGNATURE-----

--Sig_/ka_w7hWow747h/p/rsdKFwU--

