Return-Path: <linux-next+bounces-8467-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2F0B99064
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 11:04:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7164A7A2D8C
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 09:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB032D4B6D;
	Wed, 24 Sep 2025 09:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IxKDe58I"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142802848B2;
	Wed, 24 Sep 2025 09:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758704648; cv=none; b=RNwpWmS3uNmRKjECRmOhqM7H9cX8EodXC7kjeiFuqrISNq2dBIfm9DwLuBco3y9vPA2yT9wBKuIzkfpUU07Kq5vnfFaBmb/bG2oopPzi0rPA4Zqxk5A4PKTVX3x5rxT1qHnoD3XZfvBCRIn0OhKRivSy+KgrjPo8YLa359kXOns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758704648; c=relaxed/simple;
	bh=tOLRAerNfsa2S/nN/3Xd095wA6twFInA/0Hb6wbi7Go=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y9eWt2LmHA5KOrE4By3pPcdFPSw6VluuSW1KavRmoy06X8bFVllYf1w7HHgFszYGzLAV7Vnw4Xtaz+j7Q7uh77tvrzKdUvj/rByXU3v0ri4PnQVXGF+gGldNQKciz5E7UHwln6ukRUODQCZwXaZfa5TY3uExj91z5ekBi/gSPKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IxKDe58I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04BA8C4CEE7;
	Wed, 24 Sep 2025 09:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758704647;
	bh=tOLRAerNfsa2S/nN/3Xd095wA6twFInA/0Hb6wbi7Go=;
	h=Date:From:To:Cc:Subject:From;
	b=IxKDe58IN639YGaukKK1JIfohPFTR2WcdfKgCGqRQhcj/vLIEhRO0f9pfIX9+n15L
	 U9ZmliuUbQ+/qtFqdQ0wAw8FTcxcmbi9TUoFEB9/ODPIphaD8vS154HG6Mk8OFgs1R
	 UZdfc4qrRFskdJ9IyzlSwqX8G9/WSPLtHXk3pFgXVz3MD69r6xqogb14AfX+n+lNOH
	 rGlT/SkHQ82P5Ule4LFezQuFI+UDcMvd5NWzyMuUvg0GjJ6EJRtmOyZLXaLqqRTJ0M
	 Zhm+p/gEk8QFTZQlKB37OfFbWzU0n5iSs7sQS5oC+0CAtMWBBqUA2sNXODftyY6HdI
	 UohZL1tdJWvCQ==
Date: Wed, 24 Sep 2025 11:04:04 +0200
From: Mark Brown <broonie@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs tree with the vfs-brauner tree
Message-ID: <aNO0BKAXphoFEgUk@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="51BpZmKHHxqjyAHL"
Content-Disposition: inline


--51BpZmKHHxqjyAHL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/namespace.c

between commit:

  59bfb66816809 ("listmount: don't call path_put() under namespace semaphor=
e")

=66rom the vfs-brauner tree and commit:

  2aec880c1cdf1 ("path_is_under(): use guards")

=66rom the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/namespace.c
index ef64472c4e15b,b9430a5cc987f..0000000000000
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
@@@ -4205,14 -4241,7 +4170,7 @@@ struct mnt_namespace *copy_mnt_ns(u64 f
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
@@@ -5897,22 -5900,12 +5827,23 @@@ retry
  	return ret;
  }
 =20
 +struct klistmount {
 +	u64 last_mnt_id;
 +	u64 mnt_parent_id;
 +	u64 *kmnt_ids;
 +	u32 nr_mnt_ids;
 +	struct mnt_namespace *ns;
 +	struct path root;
 +};
 +
+ /* locks: namespace_shared */
 -static ssize_t do_listmount(struct mnt_namespace *ns, u64 mnt_parent_id,
 -			    u64 last_mnt_id, u64 *mnt_ids, size_t nr_mnt_ids,
 -			    bool reverse)
 +static ssize_t do_listmount(struct klistmount *kls, bool reverse)
  {
 -	struct path root __free(path_put) =3D {};
 +	struct mnt_namespace *ns =3D kls->ns;
 +	u64 mnt_parent_id =3D kls->mnt_parent_id;
 +	u64 last_mnt_id =3D kls->last_mnt_id;
 +	u64 *mnt_ids =3D kls->kmnt_ids;
 +	size_t nr_mnt_ids =3D kls->nr_mnt_ids;
  	struct path orig;
  	struct mount *r, *first;
  	ssize_t ret;
@@@ -6040,8 -6012,9 +5971,8 @@@ SYSCALL_DEFINE4(listmount, const struc
  	 * We only need to guard against mount topology changes as
  	 * listmount() doesn't care about any mount properties.
  	 */
- 	scoped_guard(rwsem_read, &namespace_sem)
+ 	scoped_guard(namespace_shared)
 -		ret =3D do_listmount(ns, kreq.mnt_id, last_mnt_id, kmnt_ids,
 -				   nr_mnt_ids, (flags & LISTMOUNT_REVERSE));
 +		ret =3D do_listmount(&kls, (flags & LISTMOUNT_REVERSE));
  	if (ret <=3D 0)
  		return ret;
 =20
@@@ -6124,14 -6093,12 +6055,12 @@@ void __init mnt_init(void
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

--51BpZmKHHxqjyAHL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjTtAMACgkQJNaLcl1U
h9AvNwf/fxkmCW1vGHlqpkQNi10L91krOVGTIu9v4jqqD85R/Scf9f7r+cFcRSe5
2Hn+P5WqO5EQ4sPLXJ147DLJwCCD9+Kuuaubz9zdtPnKOEqk/KyDbGMsHhMM5RLB
oQt+ng2X3NkTAz7ftq+iTR1vUyUYLPMWeJSRgdH/APE5d4ab1HW1dkrRFFgNaqtV
6P3F+C05SFIGs1RTgxnCTI81DbCwjeCJGUgz/KuQVaQs/kTMfk8Oh3Vo4011EFvE
WWBTr8Amm9tytA7/lp1+0zc7ZOiRR4PHKiUzorYyF+yOtwAfvx6oNd7MSfBsAoqi
zXJm+3/LM/9/ZWCXkCMKMUhHCrEYig==
=YPHY
-----END PGP SIGNATURE-----

--51BpZmKHHxqjyAHL--

