Return-Path: <linux-next+bounces-8301-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62431B582A2
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 18:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BF613B521A
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 16:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47EF827A103;
	Mon, 15 Sep 2025 16:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kv1MgRPw"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4E71E50E;
	Mon, 15 Sep 2025 16:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757955453; cv=none; b=TVXMq/FHt3eE3qgw5jXfWQLUUUkDOqqm72xpZmDDI04jYMTk6Cmxd4dmxSER9cN9Gyma2F3VjlUCSdeIP+0WCDnXUTXflsJoADMfJ+hd4NdzZWZByRfFTpnr5wiyuDX04QQJ+Y5R+5EyhtUUjbLhxc1PyVzmYAx0qAfEPn2P31g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757955453; c=relaxed/simple;
	bh=KSBDwLPy2x6t0WiHDEURMXiA6bwd5BAK0QgGgy61VjY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fJauLgND7ItC9ibfzGLenhAY3fIj4qoOTZwLSoaykr30bNaNveinXhIY0RufZesfzWRq3UkNeMBBklWjgnGOWq1fa0xY6+nm/QpqunDSxRHVaAsPDMmbaozGeA70eL/99Mm9NMRR/dL6PpdN+FhE2W+td9phAkEKcsnYp6CabAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kv1MgRPw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D2BC4CEF1;
	Mon, 15 Sep 2025 16:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757955452;
	bh=KSBDwLPy2x6t0WiHDEURMXiA6bwd5BAK0QgGgy61VjY=;
	h=Date:From:To:Cc:Subject:From;
	b=Kv1MgRPw7ZRxEuUjgGF/YTqxgCsSXrZefC3Wp/jYW9wNiGvqnnekca9q7oopApVzt
	 RE+HMygc3swppx6S/i3E3GHUc6c3xt8auNAWPDn8K1fNdOKonQOUmU4V03CyccaUy7
	 BByUOewoefuoV6IqI/d5KGAZmRfHcjo+Z1n0vbEj0w2rXF+HwKDJLaI9P+rn4AKjtX
	 DSTiyrUCo8u8pdYSnE2FPa/5EDj5f/LuVHaqMgpuTpJD9t2yhWpwNaj/Y0Qal1XaGe
	 sgohB0/mk7dAkkLYWhdBQyu2zRXxD8nkqgWt8x0LScIGx7ZkOLaJeapHtbzXyamJ4O
	 qtvdUyk8gqy4Q==
Date: Mon, 15 Sep 2025 17:57:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Aleksa Sarai <cyphar@cyphar.com>, Askar Safin <safinaskar@zohomail.com>,
	Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs tree with the vfs-next tree
Message-ID: <aMhFePOxxlOtQwU2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J4aiT/eBKQxTMcDA"
Content-Disposition: inline


--J4aiT/eBKQxTMcDA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/namespace.c

between commits:

  1e5f0fb41fccf ("vfs: fs/namespace.c: remove ms_flags argument from do_rem=
ount")
  807602d8cfc8b ("vfs: output mount_too_revealing() errors to fscontext")
  96ff702edaec8 ("mnt: support ns lookup")

=66rom the vfs-next tree and commits:

  ead5706f63cd8 ("do_{loopback,change_type,remount,reconfigure_mnt}(): cons=
tify struct path argument")
  5423426a79dd4 ("switch do_new_mount_fc() to fc_mount()")
  9d84d519f9fe4 ("copy_mnt_ns(): use guards")

=66rom the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/namespace.c
index e3ac6e06be70d,aeeb33bf3e7b3..0000000000000
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
@@@ -153,10 -195,26 +161,10 @@@ static void mnt_ns_release_rcu(struct r
  static void mnt_ns_tree_remove(struct mnt_namespace *ns)
  {
  	/* remove from global mount namespace list */
- 	if (!is_anon_ns(ns))
 -	if (!list_empty(&ns->mnt_ns_list)) {
 -		mnt_ns_tree_write_lock();
 -		rb_erase(&ns->mnt_ns_tree_node, &mnt_ns_tree);
 -		list_bidir_del_rcu(&ns->mnt_ns_list);
 -		mnt_ns_tree_write_unlock();
 -	}
++	if (!list_empty(&ns->mnt_ns_list))
 +		ns_tree_remove(ns);
 =20
 -	call_rcu(&ns->mnt_ns_rcu, mnt_ns_release_rcu);
 -}
 -
 -static int mnt_ns_find(const void *key, const struct rb_node *node)
 -{
 -	const u64 mnt_ns_id =3D *(u64 *)key;
 -	const struct mnt_namespace *ns =3D node_to_mnt_ns(node);
 -
 -	if (mnt_ns_id < ns->seq)
 -		return -1;
 -	if (mnt_ns_id > ns->seq)
 -		return 1;
 -	return 0;
 +	call_rcu(&ns->ns.ns_rcu, mnt_ns_release_rcu);
  }
 =20
  /*
@@@ -3229,7 -3310,7 +3250,7 @@@ static int do_reconfigure_mnt(const str
   * If you've mounted a non-root directory somewhere and want to do remount
   * on it - tough luck.
   */
- static int do_remount(struct path *path, int sb_flags,
 -static int do_remount(const struct path *path, int ms_flags, int sb_flags,
++static int do_remount(const struct path *path, int sb_flags,
  		      int mnt_flags, void *data)
  {
  	int err;
@@@ -3669,30 -3720,20 +3660,22 @@@ static int do_new_mount_fc(struct fs_co
  	if (IS_ERR(mnt))
  		return PTR_ERR(mnt);
 =20
+ 	sb =3D fc->root->d_sb;
+ 	error =3D security_sb_kern_mount(sb);
+ 	if (unlikely(error))
+ 		return error;
+=20
 -	if (unlikely(mount_too_revealing(sb, &mnt_flags)))
++	if (unlikely(mount_too_revealing(sb, &mnt_flags))) {
++		errorfcp(fc, "VFS", "Mount too revealing");
+ 		return -EPERM;
++	}
+=20
  	mnt_warn_timestamp_expiry(mountpoint, mnt);
 =20
- 	error =3D lock_mount(mountpoint, &mp);
- 	if (!error) {
- 		error =3D do_add_mount(real_mount(mnt), mp.mp,
- 				     mountpoint, mnt_flags);
- 		unlock_mount(&mp);
- 	}
- 	if (error < 0)
- 		mntput(mnt);
+ 	LOCK_MOUNT(mp, mountpoint);
+ 	error =3D do_add_mount(real_mount(mnt), &mp, mnt_flags);
+ 	if (!error)
+ 		retain_and_null_ptr(mnt); // consumed on success
  	return error;
  }
 =20
@@@ -4202,14 -4247,7 +4175,7 @@@ struct mnt_namespace *copy_mnt_ns(unsig
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

--J4aiT/eBKQxTMcDA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjIRXcACgkQJNaLcl1U
h9CzmQf+NDA4AxtEL8iv1jgg2huysWw2t1Lj5iwtCtAUSToM6DUv/4pmSmXOnKuM
sbmwlThizKuryr8YWqSVHGzDLm7GBsOCf/q3fyqPCYNXz1qqDyKjOgUvD8y0Ssj5
5723/kd3RgSFPzt5d7gXqVqdAxCHr1BNGzg0rf2kpKo2b8dS2I2tEiHYY6FtxDoT
AfM9cXFYLNpACpwEHLt8omwcDtr05zCDdBAcD5qtVlfOpmyL7DY2tc//aGxovbXp
YWvajtf3JXTj+AJ+bMuPkr/OxXTU5Kuh6jQnukWHwNLy2Eq6uhb3OqxQvJjLRS44
yOhPJgam+ydc+j52c5pPcizgxqY6mA==
=XZQK
-----END PGP SIGNATURE-----

--J4aiT/eBKQxTMcDA--

