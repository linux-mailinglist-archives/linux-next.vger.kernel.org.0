Return-Path: <linux-next+bounces-3984-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0D1987C37
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2024 02:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3547F1C226B3
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2024 00:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFAA1210EC;
	Fri, 27 Sep 2024 00:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Z+Be1s8z"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D3D1CD23;
	Fri, 27 Sep 2024 00:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727397997; cv=none; b=rngrt5CtB1uJ1hvZS9uUgnOf17fAneW+GQz4a6cDH8h4YEZwOH1X/Ft/51eAHBnxYBux7earO+SBF7D0cXrECktNEe/ETaZYIMHLe4Izer7ScLv/wtlZ3MAn1kJwMmwkv9u8JzD9arVsponfD+Wsw3j3xCG3i2LvzJ4oz9WosZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727397997; c=relaxed/simple;
	bh=f5CdAj7wO0aS2YYIpIN0BGV+mfuOKKc1eQbVTdnNyYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VbeOsbNuIJnU36MPx1fxFo2N1peLlBzcGgNU4HU4x0rbHx9mDC8TriUuyV2tdZCWZt/LHhxH4M36XlRmeLD20wT24z2VA58EHqRlwXOqEgMpNRgTCRs6cziy9GCGko8GT8uL+jQtPpKgvrFTpkqPO/FqJfseYRBXKs5c8m1riOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Z+Be1s8z; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727397989;
	bh=XVEoEgesWQ83ePKBrKT4S1RU/Hzvezx24SvewYaDZT0=;
	h=Date:From:To:Cc:Subject:From;
	b=Z+Be1s8zeeGGSDDITn6aBeV8NbnwdutJTTZQvURq5WzRuiFRJNjBvx1whvHxxQYBa
	 hKguvMtvT1dr+wZBf+QfLct2Wovgtj2qkYtvjnEJgpzxDLiYPumgQb6rtoNzfNPnd+
	 SeGdiTe4DIaY1ZR8VpZgzs2yikzWlGLlrspskymgJxG7gFMRv1MnPyvMAttY2JcYDx
	 QwwjVm4FtTWoqEB3M6Nyr8NAD+flCrNWoOf9zlB5Ogu2v1G1eSRNs3PutSDjojTJNf
	 FV08iAapNqziIWJpxW6JNMkP3yH4/jlHyHNtp42AW6fjWk9yV6ihC7VikHE4NToe+3
	 WiLXqtwhpvreg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XFBc470T4z4xNx;
	Fri, 27 Sep 2024 10:46:28 +1000 (AEST)
Date: Fri, 27 Sep 2024 10:46:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>, "Cc: Andrew Morton"
 <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the bcachefs tree
Message-ID: <20240927104628.2ca6ad07@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i8QpOE8ZEyt57fNB+h0B8zs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/i8QpOE8ZEyt57fNB+h0B8zs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the fs-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from fs/bcachefs/str_hash.h:5,
                 from fs/bcachefs/xattr.h:5,
                 from fs/bcachefs/acl.c:6:
fs/bcachefs/acl.c: In function 'bch2_acl_from_disk':
fs/bcachefs/btree_iter.h:896:44: error: 'PF_MEMALLOC_NORECLAIM' undeclared =
(first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
  896 |         typeof(_do) _p =3D memalloc_flags_do(PF_MEMALLOC_NORECLAIM|=
PF_MEMALLOC_NOWARN, _do);\
      |                                            ^~~~~~~~~~~~~~~~~~~~~
fs/bcachefs/btree_iter.h:878:53: note: in definition of macro 'memalloc_fla=
gs_do'
  878 |         unsigned _saved_flags =3D memalloc_flags_save(_flags);     =
               \
      |                                                     ^~~~~~
fs/bcachefs/acl.c:139:15: note: in expansion of macro 'allocate_dropping_lo=
cks'
  139 |         acl =3D allocate_dropping_locks(trans, ret,
      |               ^~~~~~~~~~~~~~~~~~~~~~~
fs/bcachefs/btree_iter.h:896:44: note: each undeclared identifier is report=
ed only once for each function it appears in
  896 |         typeof(_do) _p =3D memalloc_flags_do(PF_MEMALLOC_NORECLAIM|=
PF_MEMALLOC_NOWARN, _do);\
      |                                            ^~~~~~~~~~~~~~~~~~~~~
fs/bcachefs/btree_iter.h:878:53: note: in definition of macro 'memalloc_fla=
gs_do'
  878 |         unsigned _saved_flags =3D memalloc_flags_save(_flags);     =
               \
      |                                                     ^~~~~~
fs/bcachefs/acl.c:139:15: note: in expansion of macro 'allocate_dropping_lo=
cks'
  139 |         acl =3D allocate_dropping_locks(trans, ret,
      |               ^~~~~~~~~~~~~~~~~~~~~~~
fs/bcachefs/btree_iter.h:896:66: error: 'PF_MEMALLOC_NOWARN' undeclared (fi=
rst use in this function); did you mean 'PF_MEMALLOC_NOFS'?
  896 |         typeof(_do) _p =3D memalloc_flags_do(PF_MEMALLOC_NORECLAIM|=
PF_MEMALLOC_NOWARN, _do);\
      |                                                                  ^~=
~~~~~~~~~~~~~~~~
fs/bcachefs/btree_iter.h:878:53: note: in definition of macro 'memalloc_fla=
gs_do'
  878 |         unsigned _saved_flags =3D memalloc_flags_save(_flags);     =
               \
      |                                                     ^~~~~~
fs/bcachefs/acl.c:139:15: note: in expansion of macro 'allocate_dropping_lo=
cks'
  139 |         acl =3D allocate_dropping_locks(trans, ret,
      |               ^~~~~~~~~~~~~~~~~~~~~~~
fs/bcachefs/acl.c: In function 'bch2_acl_chmod':
fs/bcachefs/btree_iter.h:886:38: error: 'PF_MEMALLOC_NORECLAIM' undeclared =
(first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
  886 |         int _ret =3D memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEM=
ALLOC_NOWARN, _do);\
      |                                      ^~~~~~~~~~~~~~~~~~~~~
fs/bcachefs/btree_iter.h:878:53: note: in definition of macro 'memalloc_fla=
gs_do'
  878 |         unsigned _saved_flags =3D memalloc_flags_save(_flags);     =
               \
      |                                                     ^~~~~~
fs/bcachefs/acl.c:430:15: note: in expansion of macro 'allocate_dropping_lo=
cks_errcode'
  430 |         ret =3D allocate_dropping_locks_errcode(trans,
      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
fs/bcachefs/btree_iter.h:886:60: error: 'PF_MEMALLOC_NOWARN' undeclared (fi=
rst use in this function); did you mean 'PF_MEMALLOC_NOFS'?
  886 |         int _ret =3D memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEM=
ALLOC_NOWARN, _do);\
      |                                                            ^~~~~~~~=
~~~~~~~~~~
fs/bcachefs/btree_iter.h:878:53: note: in definition of macro 'memalloc_fla=
gs_do'
  878 |         unsigned _saved_flags =3D memalloc_flags_save(_flags);     =
               \
      |                                                     ^~~~~~
fs/bcachefs/acl.c:430:15: note: in expansion of macro 'allocate_dropping_lo=
cks_errcode'
  430 |         ret =3D allocate_dropping_locks_errcode(trans,
      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from fs/bcachefs/btree_locking.h:13,
                 from fs/bcachefs/btree_io.h:7,
                 from fs/bcachefs/btree_cache.c:7:
fs/bcachefs/btree_cache.c: In function 'bch2_btree_node_mem_alloc':
fs/bcachefs/btree_cache.c:807:31: error: 'PF_MEMALLOC_NORECLAIM' undeclared=
 (first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
  807 |         if (memalloc_flags_do(PF_MEMALLOC_NORECLAIM,
      |                               ^~~~~~~~~~~~~~~~~~~~~
fs/bcachefs/btree_iter.h:878:53: note: in definition of macro 'memalloc_fla=
gs_do'
  878 |         unsigned _saved_flags =3D memalloc_flags_save(_flags);     =
               \
      |                                                     ^~~~~~
fs/bcachefs/btree_cache.c:807:31: note: each undeclared identifier is repor=
ted only once for each function it appears in
  807 |         if (memalloc_flags_do(PF_MEMALLOC_NORECLAIM,
      |                               ^~~~~~~~~~~~~~~~~~~~~
fs/bcachefs/btree_iter.h:878:53: note: in definition of macro 'memalloc_fla=
gs_do'
  878 |         unsigned _saved_flags =3D memalloc_flags_save(_flags);     =
               \
      |                                                     ^~~~~~

Caused by commit

  87a3e08121cb ("bcachefs: Switch to memalloc_flags_do() for vmalloc alloca=
tions")

from the bcachefs tree interacting with commit

  0df1d8edfe8a ("Revert "mm: introduce PF_MEMALLOC_NORECLAIM, PF_MEMALLOC_N=
OWARN"")

from the mm-hotfixes-unstable branch of the mm-hotfixes tree.

I have reverted that mm-hotfixes commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/i8QpOE8ZEyt57fNB+h0B8zs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb2AGQACgkQAVBC80lX
0Gw2Vwf6Ap0xX636APFWEG/uC6rioHhMAgbFrcA8/NLp0rp1qzd6YSfd/yJgMXwa
PX27GQk2/6pwgkKWjtSvq+YsoF6fMVmQnbgVW0FtjSYTBqfs3fBgSvsvfd8hhHhJ
pQGptdgL3+Cxq3cUq4kZAtUodYXnJdjJyoFvDq8H0JI7TQAzhAmZDFP3rLHUEh/z
wj3p1OToI/bWSJTkH8rta0e/LO3GTiduBcCKXAp7mtyyR/eNpuEfTTa1nO/qSd0j
+fnMFQ7rpm8pxwSRwWuGnG9vdD6AqM3rYiUnxVtFfzB5odwdpHcxoAHd4cvmHXJ2
sp5GXcC+gC47jPm3HE9FNRy+iA062A==
=wNli
-----END PGP SIGNATURE-----

--Sig_/i8QpOE8ZEyt57fNB+h0B8zs--

