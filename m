Return-Path: <linux-next+bounces-8411-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1302B8FAA0
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 10:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5C483BFBD9
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 08:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E2F277CBF;
	Mon, 22 Sep 2025 08:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pu/lwCDA"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EB421B9DE;
	Mon, 22 Sep 2025 08:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758531537; cv=none; b=cz92d8gW68xaa9rG0L1Nf4ZwdbeMIpRCYoCmR5nECyvdOiXjvmwCnXQWEOsEJE52RjWHECKgW6LSzt9P2C+EdDW1/7sQI+GwfHtRXlj84hju0VEbcTb0frfFKDrg4uJPekPD/2pqkkdfTk4YKTz3gF+AlBiQ1MP/MeAQDf7riuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758531537; c=relaxed/simple;
	bh=x+9ic0HXk43B7VfA2TmZHAO2sD8IChCOaDJn1dv1xLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KbX36y/xPgXA5eCM6w6xp0nXEnMRN32lMbvmVc48UBEuVsLXGcP7abFsdAm99zYABD1lQYSm2wbeWWi16Hsa73V24jDwnWZnJut2jDkssMTxiJBqsP5jhrfGMv6GiUeygejO5TcMwgAEYIqjs6afNuou0XzHw+ykr2okymP/MuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pu/lwCDA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A6CC4CEF0;
	Mon, 22 Sep 2025 08:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758531537;
	bh=x+9ic0HXk43B7VfA2TmZHAO2sD8IChCOaDJn1dv1xLw=;
	h=Date:From:To:Cc:Subject:From;
	b=Pu/lwCDA5u7mNtEQQql9DMrftgs4WZQgMQ3ZDhnCHcxslx94tkztpdKKWFkDJ+Jgc
	 ImkmHKPh0xQot6Q5fwZRoxLivuwKbSPDMu/wPFVneU6gczMgu5yQbb752Y2JDulWwK
	 pnoYuoNM+RySzbgjMYQSa503FEVgACEqq0RPMabaZAW8iSLq3gc9MfXCoM2tM395rF
	 QCN8Sa3+ZPOoc6lXFAF7UH52sJZdMzFZ6aAgV0qGzcEjGquVaX+AmQSKgrsfWHTGzE
	 uVam3uVmkWxKXpebXt3S2t8K4tAG8GCNuGOYGY4hvpz1iHyVKdJXDIh/mLbbTEMur1
	 4JNc1TUClYBYQ==
Date: Mon, 22 Sep 2025 09:58:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs tree with the vfs-brauner tree
Message-ID: <aNEPxbts2exyK_2A@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FzUWitXpJsmngAC3"
Content-Disposition: inline


--FzUWitXpJsmngAC3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/namespace.c

between commit:

  be5f21d3985f0 ("ns: add ns_common_free()")

=66rom the vfs-brauner tree and commit:

  7bb4c851dcb7a ("copy_mnt_ns(): use the regular mechanism for freeing empt=
y mnt_ns on failure")

=66rom the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/namespace.c
index 880cbabe6f957,b9430a5cc987f..0000000000000
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@@ -90,7 -80,16 +90,15 @@@ static DECLARE_RWSEM(namespace_sem)
  static HLIST_HEAD(unmounted);	/* protected by namespace_sem */
  static LIST_HEAD(ex_mountpoints); /* protected by namespace_sem */
  static struct mnt_namespace *emptied_ns; /* protected by namespace_sem */
 -static DEFINE_SEQLOCK(mnt_ns_tree_lock);
 =20
+ static inline void namespace_lock(void);
+ static void namespace_unlock(void);
+ DEFINE_LOCK_GUARD_0(namespace_excl, namespace_lock(), namespace_unlock())
+ DEFINE_LOCK_GUARD_0(namespace_shared, down_read(&namespace_sem),
+ 				      up_read(&namespace_sem))
+=20
+ DEFINE_FREE(mntput, struct vfsmount *, if (!IS_ERR(_T)) mntput(_T))
+=20
  #ifdef CONFIG_FSNOTIFY
  LIST_HEAD(notify_list); /* protected by namespace_sem */
  #endif
@@@ -3229,7 -3304,7 +3244,7 @@@ static int do_reconfigure_mnt(const str
   * If you've mounted a non-root directory somewhere and want to do remount
   * on it - tough luck.
   */
- static int do_remount(struct path *path, int sb_flags,
 -static int do_remount(const struct path *path, int ms_flags, int sb_flags,
++static int do_remount(const struct path *path, int sb_flags,
  		      int mnt_flags, void *data)
  {
  	int err;
@@@ -4164,10 -4204,7 +4133,8 @@@ struct mnt_namespace *copy_mnt_ns(u64 f
  		copy_flags |=3D CL_SLAVE;
  	new =3D copy_tree(old, old->mnt.mnt_root, copy_flags);
  	if (IS_ERR(new)) {
+ 		emptied_ns =3D new_ns;
 +		namespace_unlock();
- 		ns_common_free(ns);
- 		dec_mnt_namespaces(new_ns->ucounts);
- 		mnt_ns_release(new_ns);
  		return ERR_CAST(new);
  	}
  	if (user_ns !=3D ns->user_ns) {
@@@ -4205,14 -4241,7 +4171,7 @@@
  		while (p->mnt.mnt_root !=3D q->mnt.mnt_root)
  			p =3D next_mnt(skip_mnt_tree(p), old);
  	}
- 	namespace_unlock();
-=20
- 	if (rootmnt)
- 		mntput(rootmnt);
- 	if (pwdmnt)
- 		mntput(pwdmnt);
-=20
 -	mnt_ns_tree_add(new_ns);
 +	ns_tree_add_raw(new_ns);
  	return new_ns;
  }
 =20
@@@ -6095,14 -6093,12 +6027,12 @@@ void __init mnt_init(void
 =20
  void put_mnt_ns(struct mnt_namespace *ns)
  {
 -	if (!refcount_dec_and_test(&ns->ns.count))
 +	if (!ns_ref_put(ns))
  		return;
- 	namespace_lock();
+ 	guard(namespace_excl)();
  	emptied_ns =3D ns;
- 	lock_mount_hash();
+ 	guard(mount_writer)();
  	umount_tree(ns->root, 0);
- 	unlock_mount_hash();
- 	namespace_unlock();
  }
 =20
  struct vfsmount *kern_mount(struct file_system_type *type)

--FzUWitXpJsmngAC3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjRD8QACgkQJNaLcl1U
h9CdTgf9Hsv4XDFO8VrI+1Rl2xZr8hyij4qAuhj/HLJ4t8jOyDONfhK1lznqtLlO
gsAVqifT38xmFOWmz+xo9bcSQW7lh1vWcV6VjusVNJjbm5thpVr0KKamp7VbIvm7
wZkel+dAOC/Et1LspwZmaheuyKyvZdzWM/QzrMCPovVV4r+ql6lcjdP7rfzdeBj/
dqITubxBKsfQZryIFBboPwFbwgEGZFYjhvEMkexDuRkzLZguOTxG/Hf9KrUk+zIL
5XRTHD0Hk+hXk6AyuOoavAztqm/QYxOzQMSztImTDEiuHHy1wvdpV9zRlCQVebnL
K8qR7k5kGqZsWVK9SM2p76TlPKRLeQ==
=Yquq
-----END PGP SIGNATURE-----

--FzUWitXpJsmngAC3--

