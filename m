Return-Path: <linux-next+bounces-8468-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F09FB99683
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 12:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ACB019C6CDD
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 10:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05FE32DEA6A;
	Wed, 24 Sep 2025 10:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7wrUCIW"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03AF2DE71C;
	Wed, 24 Sep 2025 10:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758709289; cv=none; b=PFJ1+WQPCYCMpfs6FHSO9SnSFdMO0t62JC7DHqB1or5mpnwJlZ+m3L5TXvSWNFYh/eCkzv3D9xiAh99vG/5h4lmrHx7o1ekF20QgBVq/1YkXdh4k33pECtpJ0HcrGVAO7THH20VNxfmhUAQ65yUw3EX03GjbHrep8MCMoMWklCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758709289; c=relaxed/simple;
	bh=ftOMjFTzb+MRY7H2S+QVmnCC9sAkrD5ND4i1QkcR1Hg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I0ug8QLjLnDml/o6yVJjfG/yRsYKFNTnYng9muRyfcRZq/tboR0zMIgTD18YDGQ/DB8UYNoJW2xrNl2NsAXWpXQKhs9rSvcp2FP9dThiHLUZfL7s2h/c4/m/fNYOjWy3U4ds1kNYZ4WMxHTB6t1Ve/iZNR9DgENovO4iohl5bvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7wrUCIW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3CCC4CEE7;
	Wed, 24 Sep 2025 10:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758709289;
	bh=ftOMjFTzb+MRY7H2S+QVmnCC9sAkrD5ND4i1QkcR1Hg=;
	h=Date:From:Cc:Subject:From;
	b=G7wrUCIWuvhO9RKW4uQryJtc+jJzQ7gr83WlfoqfIOpqFsMTRpRwnUkFFRL145tYo
	 gpcHG6qxK+XvepRjtPNAqc/z8EO0Rukj8tDjy/Syh5NHZzzDlXrDTuN7pNvAnVAwGy
	 uSeWfwXDgwkRIcFsvDjoOIiOAWtrEDp9Q+r4L2EQWCk1dlINLlPX84c+3SjvGA19PN
	 R5R8cCz/5cWyXS0JmImeyovWho900UvmUbk5e/ucXWPjnar1FbqaP4XeamzRZ2ScmB
	 Z1SU/Ux3S+n+8hFdtxEQ7s5xMwS1LQpd1rWX3WgSvOS1iMcp9gFN+nTq1Vy2eyEtkA
	 HHahj5R7lyepQ==
Date: Wed, 24 Sep 2025 12:21:26 +0200
From: Mark Brown <broonie@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	NeilBrown <neil@brown.name>
Subject: linux-next: manual merge of the fs-next tree with the mm-stable tree
Message-ID: <aNPGHEYMk-6vFJlW@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FwExP171YsXSxZfv"
Content-Disposition: inline


--FwExP171YsXSxZfv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fs-next tree got a conflict in:

  Documentation/filesystems/porting.rst

between commit:

  fa2d97ad06d27 ("doc: update porting, vfs documentation for mmap_prepare a=
ctions")

=66rom the mm-stable tree and commits:

  3d18f80ce181b ("VFS: rename kern_path_locked() and related functions.")
  b28f9eba12a49 ("change the calling conventions for vfs_parse_fs_string()")

=66rom the fs-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.


diff --cc Documentation/filesystems/porting.rst
index 6743ed0b91126,359b333e89c5a..0000000000000
--- a/Documentation/filesystems/porting.rst
+++ b/Documentation/filesystems/porting.rst
@@@ -1286,7 -1286,24 +1286,27 @@@ The vm_area_desc provides the minimum r
  to initialise state upon memory mapping of a file-backed region, and outp=
ut
  parameters for the file system to set this state.
 =20
 +In nearly all cases, this is all that is required for a filesystem. Howev=
er, if
 +a filesystem needs to perform an operation such a pre-population of page =
tables,
 +then that action can be specified in the vm_area_desc->action field, whic=
h can
 +be configured using the mmap_action_*() helpers.
++
+ ---
+=20
+ **mandatory**
+=20
+ Several functions are renamed:
+=20
+ -  kern_path_locked -> start_removing_path
+ -  kern_path_create -> start_creating_path
+ -  user_path_create -> start_creating_user_path
+ -  user_path_locked_at -> start_removing_user_path_at
+ -  done_path_create -> end_creating_path
 -=3D=3D=3D=3D=3D=3D=3D
++
+ Calling conventions for vfs_parse_fs_string() have changed; it does *not*
+ take length anymore (value ? strlen(value) : 0 is used).  If you want
+ a different length, use
+=20
+ 	vfs_parse_fs_qstr(fc, key, &QSTR_LEN(value, len))
+=20
+ instead.

--FwExP171YsXSxZfv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjTxiYACgkQJNaLcl1U
h9ByCQf+MEDPuJ/o1s9gPPKtb2r12bCAEzQSL69uCUv2rW4/FIxKDjAyW0oh8zcQ
noD137GCxghfFRVjSN1EaOG7vhWF0kYI8xOhKAJRB6hnTaa8Mm9v0txtvz6ecVUY
aXXNchCuj8Uc++7NL4S5aVhqhuZi5DHhgvFfMRIE5xwXDo8vyjlXPomoDgozIDbt
uxuOgr73uYNXfyMUfJL1hdjNDhOO1mvgnAcRkET22dAd0QLYOQvd5GZhe/KjSbNy
yMNNaoxQjqYcJ56YTwfsVoRWaQ84ulEoCFEXM8qL/LrBJ+8McthoohIF0EA9XhNp
cBMi7S7VJWSOV+voo9bC2t8i/NbU7g==
=gWTs
-----END PGP SIGNATURE-----

--FwExP171YsXSxZfv--

