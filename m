Return-Path: <linux-next+bounces-3736-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AE99747ED
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 03:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01203B25385
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 01:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB1D21105;
	Wed, 11 Sep 2024 01:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RW+2cUnn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FED2AE93;
	Wed, 11 Sep 2024 01:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726019071; cv=none; b=ddBKMtt1HQrEFgtNjZKbHXCY6uELJEBET2W0htUGbsol088KTvLGPw3tyNSWRgs7VfVSzVTDRYIfq65Fy1uEDm7ufTrs/RidZ4vvQm7J8ifCW09jxem9vsqzot7xTzwgLWQQyflxFjcXycMAK7wTNcxvTuhZIzvpFGjdF5ogm7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726019071; c=relaxed/simple;
	bh=Zjpi/CUQVUtA+2XQBvMqVDioMcNtEZebdjqqHMehdfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UlVo897y3l9khEIKrOD2bjn1UbNgLeJugol2Gy0ovT7oR7Pzdjmgh32FHK+elLfV9uZnKLXEGhinzE5d+M7R8FTSpuSjwZ7Dn5GAzR6SfTyYEn4DETIROTJvd+O3f3Pk6sILAbyvSwNaQSWqqhOiwcoZ3U+RcF44fdUUhxMALPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RW+2cUnn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726019064;
	bh=9oZq9ILu/fsodtbLHfs9X+uTZXXAOXOZP0dEhiub/+A=;
	h=Date:From:To:Cc:Subject:From;
	b=RW+2cUnn0JylFiGptxcIqod2j89tnfaw1W/1RUZBL89Yyk8RffGZ++sjZJzPyAFLj
	 mA9HWiLFTDDRXkWc15WiKq4RJBNqYdzJlUZBVZDE6MBkxSXVn1tSCjPTxWFjRIg2qq
	 9ES/7tX1P+8LRaa02RpJcwIxUp05YAPVyNm7Om1oyPliKkPZ9UIa43HP2lPxOKfQTd
	 X9YUti54owHEkxkGIjj4WyTjXivoNeqNGkfMbkhDVTIOHOE5wXwhHR0sYigWx7knKc
	 Tielwfswk+xP0Dwc3eH5TD59g7Gka0uP2/Ta6PHAlqyXQ+wbHp2Wo6v9coYyjhofil
	 X3y5TFdSd0M9g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3NfJ0Y1sz4x0K;
	Wed, 11 Sep 2024 11:44:24 +1000 (AEST)
Date: Wed, 11 Sep 2024 11:44:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the bcachefs tree
Message-ID: <20240911114423.107865b6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6Mq96j8R=WQvgO25hA9DrGq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6Mq96j8R=WQvgO25hA9DrGq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bcachefs tree, today's linux-next build (x86_64
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

Caused by commit

  5b300a92b0b2 ("bcachefs: Switch to memalloc_flags_do() for vmalloc alloca=
tions")

interacting with commit

  cec97c753ffe ("Revert "mm: introduce PF_MEMALLOC_NORECLAIM, PF_MEMALLOC_N=
OWARN"")

from the mm-unstable branch of the mm tree.

I have reverted the mm tree commit for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/6Mq96j8R=WQvgO25hA9DrGq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbg9fcACgkQAVBC80lX
0GzV1wf8C36II/2HOd6WeLtbN55dV1nJKAqYMwcl4f/soLMoGJIK7Q28q5aS+RVv
0tPYdU2tiRjpD1HZMst4aO03MiSOaBwe3gM4OMHbZ7XysCB64RFDUmnLlg4lqu3A
ot5N5jwdiwAJQUCH2cVL8u8QAYFR1QTgQFwsHSuarJ+bIpZtSBXPvN72w9KOfQ9R
cWfMzEDDlDa9l/gF5/cMg1Zz2hbghHqZlymzHTnOzHlL5oQZmDr3AciJmWb/1/DM
uBZgJP+8yUe7g9JoNh38JnvWf9Clsq4heZXzV8QYXcgl+uOVBEWb2m2Ot33v+T0b
TRT39pQqzo/ZER06vyzTDqy2oOHOcA==
=2tvn
-----END PGP SIGNATURE-----

--Sig_/6Mq96j8R=WQvgO25hA9DrGq--

