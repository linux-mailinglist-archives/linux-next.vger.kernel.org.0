Return-Path: <linux-next+bounces-8466-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0981B99018
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 10:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 768FC3A95C4
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 08:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD8D285C96;
	Wed, 24 Sep 2025 08:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mtBu/Sbc"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9349A2557A;
	Wed, 24 Sep 2025 08:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758704306; cv=none; b=WaIIs/c2wIVV/IjAUl5KnJ0hoNrgcHnSLmK1wZJpI1HBahTRfpSNrUp1rnBXzbsumyTp9NJFGU0G99opdghrZIadjH91yqugt3XKd1BmM6V+fGpoDaXZ8VMJlZpjsxgPFA3R+yiV2HfL/UgdvyGyIBmjgdzJYpDeAZhY68cRLQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758704306; c=relaxed/simple;
	bh=0omeMc22NP/7NB+DowBR4y34L81iR1qkN3L1b874FdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rUU2w/tBUn9YjsIB0cpehDr9vT0tD4eT8trynxsB26RXuL72rbLdrQh2CkXdzs22Jqx8Q5BP8TJ8HdvXCaRnk78zXiUSfg3FH1j09DxQEf42qE/LiICKTDQILdIPA3REdy57CKHDeQ7Y3yoNcMuRcWrt+oVQh2rJPY5vQOZZKPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mtBu/Sbc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1F2C4CEE7;
	Wed, 24 Sep 2025 08:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758704306;
	bh=0omeMc22NP/7NB+DowBR4y34L81iR1qkN3L1b874FdQ=;
	h=Date:From:To:Cc:Subject:From;
	b=mtBu/SbcmeJKEy0Ja0MR3ujiE1DRbXLN3jaQiDx+ug+lHtktk6gXzx+Tku4W+0Rdx
	 h/tqRIPWp06dQf16kYHtR9OxP0F8HxWbOhEbYMW58xYxcR5QCZx3jGsj/kJsxRoLF4
	 QCKaTWOtdMR3m7vg8o3bjGWvoUSRkNGu8hlSvxUmHS2QeZHvm5bxcpGsvzPHX9CK1E
	 dCWTu+o6/JzPJMK93h9kQqs0RRBwnh2onW2rRnT8ihlA/Gzhx7mfqLtRsgBxQB6e/H
	 a7ImyuAGclHtRWOf8hBKmjxqGTcFiTCWt1sLfTpjFq+4bDpxtgzE5WlBq4T2vq4MR5
	 3PGI6ZY7qFabQ==
Date: Wed, 24 Sep 2025 10:58:23 +0200
From: Mark Brown <broonie@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	NeilBrown <neil@brown.name>
Subject: linux-next: manual merge of the vfs tree with the vfs-brauner tree
Message-ID: <aNOyrz1bd1WTrZgc@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WKRWb4WDspm5S0NJ"
Content-Disposition: inline


--WKRWb4WDspm5S0NJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got conflicts in:

  fs/namei.c
  include/linux/namei.h

between commit:

  3d18f80ce181b ("VFS: rename kern_path_locked() and related functions.")

=66rom the vfs-brauner tree and commit:

  63dbfb077cdad ("done_path_create(): constify path argument")

=66rom the vfs tree (BTW Documentation/filesystems/porting.rst has a
user_path_locked_at() reference).

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/namei.c
index 507ca0d7878d6,ba8bf73d2f9cf..0000000000000
--- a/fs/namei.c
+++ b/fs/namei.c
@@@ -4254,9 -4168,9 +4254,9 @@@ struct dentry *start_creating_path(int=20
  	putname(filename);
  	return res;
  }
 -EXPORT_SYMBOL(kern_path_create);
 +EXPORT_SYMBOL(start_creating_path);
 =20
- void end_creating_path(struct path *path, struct dentry *dentry)
 -void done_path_create(const struct path *path, struct dentry *dentry)
++void end_creating_path(const struct path *path, struct dentry *dentry)
  {
  	if (!IS_ERR(dentry))
  		dput(dentry);
diff --cc include/linux/namei.h
index a7800ef04e761,75c0b665fbd41..0000000000000
--- a/include/linux/namei.h
+++ b/include/linux/namei.h
@@@ -57,17 -57,13 +57,17 @@@ struct dentry *lookup_one_qstr_excl(con
  				    struct dentry *base,
  				    unsigned int flags);
  extern int kern_path(const char *, unsigned, struct path *);
 +struct dentry *kern_path_parent(const char *name, struct path *parent);
 =20
 -extern struct dentry *kern_path_create(int, const char *, struct path *, =
unsigned int);
 -extern struct dentry *user_path_create(int, const char __user *, struct p=
ath *, unsigned int);
 -extern void done_path_create(const struct path *, struct dentry *);
 -extern struct dentry *kern_path_locked(const char *, struct path *);
 -extern struct dentry *kern_path_locked_negative(const char *, struct path=
 *);
 -extern struct dentry *user_path_locked_at(int , const char __user *, stru=
ct path *);
 +extern struct dentry *start_creating_path(int, const char *, struct path =
*, unsigned int);
 +extern struct dentry *start_creating_user_path(int, const char __user *, =
struct path *, unsigned int);
- extern void end_creating_path(struct path *, struct dentry *);
++extern void end_creating_path(const struct path *, struct dentry *);
 +extern struct dentry *start_removing_path(const char *, struct path *);
 +extern struct dentry *start_removing_user_path_at(int , const char __user=
 *, struct path *);
 +static inline void end_removing_path(struct path *path , struct dentry *d=
entry)
 +{
 +	end_creating_path(path, dentry);
 +}
  int vfs_path_parent_lookup(struct filename *filename, unsigned int flags,
  			   struct path *parent, struct qstr *last, int *type,
  			   const struct path *root);

--WKRWb4WDspm5S0NJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjTsq4ACgkQJNaLcl1U
h9BkFgf/RE69QQHHE3XskgrOADlIb/cb01uI+LR3WO2N2SzI0TbtF7Pj23dM4R/5
SoKEUabmiSAjTKJginNORtAdjNQB0a/iV3LjgPzXrgJievy3PtccWl8I/WiddLvP
CaKXkgasaHI2b2spJLOFxj0yLnQBD4z7a00DgZs3sePsmy5L+eiCsA6BZXeQyoBh
aRcY4CU3sRxEEFKu9EBu/EhDbaenDD7kCayujWPuu/b8joO5KY5InQSDJRG/FPvJ
DTggsjdnIY/lc3qebuEwPLErNFdboCAgWWOXNkpWiui2dV22B0lEEc8zGZ+W4gnt
jX/StvM8jGGX3aM+UY7W8nvQQbW00w==
=trHU
-----END PGP SIGNATURE-----

--WKRWb4WDspm5S0NJ--

