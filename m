Return-Path: <linux-next+bounces-8299-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 594E6B5820A
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 18:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1AA51B208ED
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 16:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25EB284889;
	Mon, 15 Sep 2025 16:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qI0Hr66S"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A0D27E05A;
	Mon, 15 Sep 2025 16:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757953703; cv=none; b=lZA5ckIWESAfLdeio+QmnLQwt07hJysq6osIdmmnxjLsaDfgEVLcJ9j+l5p06Z3EPj9NPAFEq4J8sOEDU0bSRIfn0Tzb5Y6G+4lCtrFuwwSF+ElnV0qeC80s8c6mhSI5B2Oirj5KNwpvIe4zIkPJPmFEVtnOEJd/YGWD0U5qNoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757953703; c=relaxed/simple;
	bh=wIrItACSO6xpqEsoeRFwFKh9DWmDR0g6UY9Xw3JMGRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pwP9Xog38ibeNIfWuRZg4UmSBl7MeNKi/ddJIa4LRZOdqL92UkgFG8H5j/JMcUL4AUdXNG/fa0VbDSY6kjgju3aXNmpPHC2Ez4iPhwKZ1Luw7dObc37klHV0l1iIvnpuNArgnMiK8TegDAhhFmWHn4u9+xkDngCthUUH6TwjZ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qI0Hr66S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 149F0C4CEF1;
	Mon, 15 Sep 2025 16:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757953703;
	bh=wIrItACSO6xpqEsoeRFwFKh9DWmDR0g6UY9Xw3JMGRE=;
	h=Date:From:To:Cc:Subject:From;
	b=qI0Hr66SOioC4CuFeml2EWgsCft9xE6mTt3CSJhPKyKyrg316haKVvf9PbRWnsN1a
	 virXl3k1Ji+2dV0ptXKGlD3iHDV+sQJLa77xJMPBkFZhrscOuDERPQqz0n/CpyWlGr
	 30DufI6nNSsewQKdp/oYwMIvHOJ9+/jRdFTrvsMdBc2cLuO+6LHYUS8YKA0+PgkQBS
	 mUvKIGHcDCVwfYHLUPROB7MuUuDXW+z7WlWMqq/lMbfV+GRs1uVFR0EQyITGLmtyv2
	 h1Rvl6W10WAR/fStlY5bimWSvFN6aQPKiwdI6HWu5lKtmMBIq6HQsNh++Cqf41esx2
	 J0e1n3MblVgMQ==
Date: Mon, 15 Sep 2025 17:28:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs tree with the fs-next tree
Message-ID: <aMg-o7KPAkDmqQN8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yPaLQWwmGrOURL3O"
Content-Disposition: inline


--yPaLQWwmGrOURL3O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/afs/internal.h

between commit:

  09c69289a2730 ("afs: Add support for RENAME_NOREPLACE and RENAME_EXCHANGE=
")

=66rom the fs-next tree and commit:

  09c2e9069e0fb ("afs_edit_dir_{add,remove}(): constify qstr argument")

=66rom the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/afs/internal.h
index 444a3ea4fdf65,1ce5deaf60193..0000000000000
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@@ -1099,11 -1097,11 +1099,11 @@@ int afs_single_writepages(struct addres
  /*
   * dir_edit.c
   */
- extern void afs_edit_dir_add(struct afs_vnode *, struct qstr *, struct af=
s_fid *,
+ extern void afs_edit_dir_add(struct afs_vnode *, const struct qstr *, str=
uct afs_fid *,
  			     enum afs_edit_dir_reason);
- extern void afs_edit_dir_remove(struct afs_vnode *, struct qstr *, enum a=
fs_edit_dir_reason);
+ extern void afs_edit_dir_remove(struct afs_vnode *, const struct qstr *, =
enum afs_edit_dir_reason);
 -void afs_edit_dir_update_dotdot(struct afs_vnode *vnode, struct afs_vnode=
 *new_dvnode,
 -				enum afs_edit_dir_reason why);
 +void afs_edit_dir_update(struct afs_vnode *vnode, const struct qstr *name,
 +			 struct afs_vnode *new_dvnode, enum afs_edit_dir_reason why);
  void afs_mkdir_init_dir(struct afs_vnode *dvnode, struct afs_vnode *paren=
t_vnode);
 =20
  /*

--yPaLQWwmGrOURL3O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjIPqIACgkQJNaLcl1U
h9C/Wwf+OYy/4uf6MBZTi3RMH16np/z4n+1eUp0aBFe/mpTrDHIxes3YgFMLlt3v
M5X2FnA7JFP2BSoJZwgcs5+tZnZN/Fd8uDT9HzSX6sCZ6HrBym74zeijkA5irUV3
+jQZs8LelgxkNEy9ccU8KntA/GjxFwJgFFtCJ3FZi0l+ClOuc3YWVBqFSgl/x+Wv
/t9G8VsmRE/F1bjuUX/TMD6U5I2rN8zup1nW5nIOv0cCIBlh3ajE8tL7WM8mGXPI
lPr/JHWTWlRWePNPDD4eDf/wCuRwae+0yDwEraKMRtfTAvHEbfhaUThby/V21FOO
EBmz8MphXDfxyvsX8WRCiaqPhhM8lA==
=otWZ
-----END PGP SIGNATURE-----

--yPaLQWwmGrOURL3O--

