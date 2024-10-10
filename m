Return-Path: <linux-next+bounces-4205-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE59997CB9
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 07:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9890282EDF
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 05:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD351925AF;
	Thu, 10 Oct 2024 05:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lZ5b/2nF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E395B632;
	Thu, 10 Oct 2024 05:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728539424; cv=none; b=aj3DSi79Sr5ctVdOjjYLtTHSH2guDlNLNSrWFFTMZJ71QnL9DIemRhVaGZzwicJNcD3Cm5RPCrIPa8IxnF/INkYGe+keNFQsj98jfyeY7rBRL3wOBnNfFJ3svl7TJijAOgpwiq32yUMDK0Aku/ZPhBAo7Xt6sVDGNZOqRtXWs24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728539424; c=relaxed/simple;
	bh=ftoZxzmF5Na2la2gqE0Z/8nTwbS6Rcf580or7HnPy6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j/VBuRVtjIRjQy7NkjYPIL8IwbulYzNU+116/H0G9bSzT72Kum36p3b4LtGxWO3DDjIUk0sjpawHCt9UNtre0d4VN1b3ZS6a3RBx1cooYU0tfHBdZJilsiq0pR2l6GglA5sEpSLorQqUO5UNm1JncAf4u9JsoxjJgd8ivyN3KFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lZ5b/2nF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728539419;
	bh=MBZYT1jBI/jxq3UXzURix8IRER1S6YdO4CgkXCDVt48=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lZ5b/2nFwLf22I3OzrMk55Z4RG3hieSEug6PpEiJHLLEgFMpWWaueDh/SVeM49M1y
	 OIPrdK2yjb6bFbblixupSXeucWBxUtzRJQUwGQPbAFlNrplaZHStuMuJgebTlklgAe
	 4mrbGhYAVi0KlPinqgur1Hr/2XkVQEhdoiRZ/A2BtIQqu6me8dKvgFrm/XMj2P1xgc
	 Ot5D55ccf85S9qrLupJYmIKR8fEpR+3BpXbApM/g31mmBpL0ilniQcA8Rjm22U2sQN
	 EpVELCx+DS6RU2cY8nOUMzMS0VLUYVo8JYKmT4tWK7p2Xgcta9ZGnedLr4otzIpdkJ
	 ePCOz3/AjuU2w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XPJkg1SFwz4wnw;
	Thu, 10 Oct 2024 16:50:18 +1100 (AEDT)
Date: Thu, 10 Oct 2024 16:50:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: "Andrew Morton" <akpm@linux-foundation.org>, Michal Hocko
 <mhocko@suse.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the bcachefs tree
Message-ID: <20241010165018.47b3fe1d@canb.auug.org.au>
In-Reply-To: <20240927104628.2ca6ad07@canb.auug.org.au>
References: <20240927104628.2ca6ad07@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1oc5fIaTq9Pu1p5TUoAKBMI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1oc5fIaTq9Pu1p5TUoAKBMI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 27 Sep 2024 10:46:28 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the fs-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> In file included from fs/bcachefs/str_hash.h:5,
>                  from fs/bcachefs/xattr.h:5,
>                  from fs/bcachefs/acl.c:6:
> fs/bcachefs/acl.c: In function 'bch2_acl_from_disk':
> fs/bcachefs/btree_iter.h:896:44: error: 'PF_MEMALLOC_NORECLAIM' undeclare=
d (first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
>   896 |         typeof(_do) _p =3D memalloc_flags_do(PF_MEMALLOC_NORECLAI=
M|PF_MEMALLOC_NOWARN, _do);\
>       |                                            ^~~~~~~~~~~~~~~~~~~~~
> fs/bcachefs/btree_iter.h:878:53: note: in definition of macro 'memalloc_f=
lags_do'
>   878 |         unsigned _saved_flags =3D memalloc_flags_save(_flags);   =
                 \
>       |                                                     ^~~~~~
> fs/bcachefs/acl.c:139:15: note: in expansion of macro 'allocate_dropping_=
locks'
>   139 |         acl =3D allocate_dropping_locks(trans, ret,
>       |               ^~~~~~~~~~~~~~~~~~~~~~~
> fs/bcachefs/btree_iter.h:896:44: note: each undeclared identifier is repo=
rted only once for each function it appears in
>   896 |         typeof(_do) _p =3D memalloc_flags_do(PF_MEMALLOC_NORECLAI=
M|PF_MEMALLOC_NOWARN, _do);\
>       |                                            ^~~~~~~~~~~~~~~~~~~~~
> fs/bcachefs/btree_iter.h:878:53: note: in definition of macro 'memalloc_f=
lags_do'
>   878 |         unsigned _saved_flags =3D memalloc_flags_save(_flags);   =
                 \
>       |                                                     ^~~~~~
> fs/bcachefs/acl.c:139:15: note: in expansion of macro 'allocate_dropping_=
locks'
>   139 |         acl =3D allocate_dropping_locks(trans, ret,
>       |               ^~~~~~~~~~~~~~~~~~~~~~~
> fs/bcachefs/btree_iter.h:896:66: error: 'PF_MEMALLOC_NOWARN' undeclared (=
first use in this function); did you mean 'PF_MEMALLOC_NOFS'?
>   896 |         typeof(_do) _p =3D memalloc_flags_do(PF_MEMALLOC_NORECLAI=
M|PF_MEMALLOC_NOWARN, _do);\
>       |                                                                  =
^~~~~~~~~~~~~~~~~~
> fs/bcachefs/btree_iter.h:878:53: note: in definition of macro 'memalloc_f=
lags_do'
>   878 |         unsigned _saved_flags =3D memalloc_flags_save(_flags);   =
                 \
>       |                                                     ^~~~~~
> fs/bcachefs/acl.c:139:15: note: in expansion of macro 'allocate_dropping_=
locks'
>   139 |         acl =3D allocate_dropping_locks(trans, ret,
>       |               ^~~~~~~~~~~~~~~~~~~~~~~
> fs/bcachefs/acl.c: In function 'bch2_acl_chmod':
> fs/bcachefs/btree_iter.h:886:38: error: 'PF_MEMALLOC_NORECLAIM' undeclare=
d (first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
>   886 |         int _ret =3D memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_M=
EMALLOC_NOWARN, _do);\
>       |                                      ^~~~~~~~~~~~~~~~~~~~~
> fs/bcachefs/btree_iter.h:878:53: note: in definition of macro 'memalloc_f=
lags_do'
>   878 |         unsigned _saved_flags =3D memalloc_flags_save(_flags);   =
                 \
>       |                                                     ^~~~~~
> fs/bcachefs/acl.c:430:15: note: in expansion of macro 'allocate_dropping_=
locks_errcode'
>   430 |         ret =3D allocate_dropping_locks_errcode(trans,
>       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> fs/bcachefs/btree_iter.h:886:60: error: 'PF_MEMALLOC_NOWARN' undeclared (=
first use in this function); did you mean 'PF_MEMALLOC_NOFS'?
>   886 |         int _ret =3D memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_M=
EMALLOC_NOWARN, _do);\
>       |                                                            ^~~~~~=
~~~~~~~~~~~~
> fs/bcachefs/btree_iter.h:878:53: note: in definition of macro 'memalloc_f=
lags_do'
>   878 |         unsigned _saved_flags =3D memalloc_flags_save(_flags);   =
                 \
>       |                                                     ^~~~~~
> fs/bcachefs/acl.c:430:15: note: in expansion of macro 'allocate_dropping_=
locks_errcode'
>   430 |         ret =3D allocate_dropping_locks_errcode(trans,
>       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from fs/bcachefs/btree_locking.h:13,
>                  from fs/bcachefs/btree_io.h:7,
>                  from fs/bcachefs/btree_cache.c:7:
> fs/bcachefs/btree_cache.c: In function 'bch2_btree_node_mem_alloc':
> fs/bcachefs/btree_cache.c:807:31: error: 'PF_MEMALLOC_NORECLAIM' undeclar=
ed (first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
>   807 |         if (memalloc_flags_do(PF_MEMALLOC_NORECLAIM,
>       |                               ^~~~~~~~~~~~~~~~~~~~~
> fs/bcachefs/btree_iter.h:878:53: note: in definition of macro 'memalloc_f=
lags_do'
>   878 |         unsigned _saved_flags =3D memalloc_flags_save(_flags);   =
                 \
>       |                                                     ^~~~~~
> fs/bcachefs/btree_cache.c:807:31: note: each undeclared identifier is rep=
orted only once for each function it appears in
>   807 |         if (memalloc_flags_do(PF_MEMALLOC_NORECLAIM,
>       |                               ^~~~~~~~~~~~~~~~~~~~~
> fs/bcachefs/btree_iter.h:878:53: note: in definition of macro 'memalloc_f=
lags_do'
>   878 |         unsigned _saved_flags =3D memalloc_flags_save(_flags);   =
                 \
>       |                                                     ^~~~~~
>=20
> Caused by commit
>=20
>   87a3e08121cb ("bcachefs: Switch to memalloc_flags_do() for vmalloc allo=
cations")
>=20
> from the bcachefs tree interacting with commit
>=20
>   0df1d8edfe8a ("Revert "mm: introduce PF_MEMALLOC_NORECLAIM, PF_MEMALLOC=
_NOWARN"")
>=20
> from the mm-hotfixes-unstable branch of the mm-hotfixes tree.
>=20
> I have reverted that mm-hotfixes commit for today.

The mm-hotixes commit is now in Linus' tree so tomorrow I will have to
revert it from the bcachefs tree merge (in stead of the fs-next tree
merge) unless someone comes up with something better.

--=20
Cheers,
Stephen Rothwell

--Sig_/1oc5fIaTq9Pu1p5TUoAKBMI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcHaxoACgkQAVBC80lX
0GwMVQf/auOTmBVsMfVAewsr5OJArdRnet0nK8c1AlLBw7/KikGuotngfCbw/Dbe
M6o6aEJkYijx3sdsrwyXEY4+Q/d5kaQXf6+eq7hv/1PvF3YwW2qKmyIsJoUqJWon
pxTGEzlb348by+N6cUFDwLmhrvFTy6b0KI6zRKB9PnhpBikkA4dl2J/BlugBkc/l
j1fk/5NvG+v/4mkgQFlNKGkFZrgb22RQOBYUiTA0klmV3aoVDw08J24m36HTiuhF
DXOs3nh+5IVc4FchaizE/FC3X8fkRodu+F7tVl8Dg9RW1tuuDavSgjmk9jnDhn38
dF9RoWWBcq5RGzczYUt8Wzu7d1RBXg==
=YQEX
-----END PGP SIGNATURE-----

--Sig_/1oc5fIaTq9Pu1p5TUoAKBMI--

