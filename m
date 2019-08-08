Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9240D85753
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 02:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730601AbfHHAy6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 20:54:58 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42611 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730598AbfHHAy6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Aug 2019 20:54:58 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 463qf66Lb3z9sN4;
        Thu,  8 Aug 2019 10:54:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565225695;
        bh=fkz20jXNuUHMucSZ3cT6MAGxvP2OHER5/q4ViDdabN8=;
        h=Date:From:To:Cc:Subject:From;
        b=AYsoejlo8gc+3elhHVwNLrRwMqcnUBAZkQ0wdhJV4DU40ZxtqFL2tQO38N1psWOrN
         K65v/c87utrjQ8LnzSbF6qRMIYWtbGxymyM8SPgQivS+DqlvKjbNZoTgbrwnwhsOSc
         IJjcvPIUU1htUn1O9EvPr89rGEpfN/epNnB1EGDtjh+CdiIr3WYbnQtzbZGU9BxWpZ
         LkdeCHRB/Pl9ngS1DRy26h0lzkkDI8CPCDfYonZ+JOv4i+GZLnGFZEVU0Ijpg0biKg
         uw10EAf2bBZQaxUpCwkVKeloGG677HJnRy2ACbVvH1xvWo28BqgptOxRJDosnsA2rf
         poDTEQH5mG48Q==
Date:   Thu, 8 Aug 2019 10:54:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Filipe Manana <fdmanana@suse.com>, Qu Wenruo <wqu@suse.com>,
        Josef Bacik <josef@toxicpanda.com>
Subject: linux-next: manual merge of the btrfs-kdave tree with the
 btrfs-fixes tree
Message-ID: <20190808105454.7b09b26b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ay9WXvNInn/8fLpJN1fI5yX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ay9WXvNInn/8fLpJN1fI5yX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the btrfs-kdave tree got conflicts in:

  fs/btrfs/ctree.h
  fs/btrfs/extent-tree.c

between commits:

  d7cd4dd907c1 ("Btrfs: fix sysfs warning and missing raid sysfs directorie=
s")
  07301df7d2fc ("btrfs: trim: Check the range passed into to prevent overfl=
ow")

from the btrfs-fixes tree and commit:

  4dfbf33fbfb6 ("btrfs: migrate the block group lookup code")
  f35f767acec1 ("btrfs: move sysfs declarations out of ctree.h")
  76c49f86437b ("btrfs: factor sysfs code out of link_block_group")

from the btrfs-kdave tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

I also added this patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 8 Aug 2019 10:14:25 +1000
Subject: [PATCH] btrfs: merge fix up for "Btrfs: fix sysfs warning and miss=
ing
 raid sysfs directories"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/btrfs/sysfs.c | 52 +++++++++++++++++++-----------------------------
 1 file changed, 21 insertions(+), 31 deletions(-)

diff --git a/fs/btrfs/sysfs.c b/fs/btrfs/sysfs.c
index 600db4be740d..ee6f70e8f258 100644
--- a/fs/btrfs/sysfs.c
+++ b/fs/btrfs/sysfs.c
@@ -4,6 +4,7 @@
  */
=20
 #include <linux/sched.h>
+#include <linux/sched/mm.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/completion.h>
@@ -27,7 +28,6 @@ struct btrfs_feature_attr {
 struct raid_kobject {
 	u64 flags;
 	struct kobject kobj;
-	struct list_head list;
 };
=20
 #define __INIT_KOBJ_ATTR(_name, _mode, _show, _store)			\
@@ -819,33 +819,6 @@ static void init_feature_attrs(void)
 	}
 }
=20
-/* link_block_group will queue up kobjects to add when we're reclaim-safe =
*/
-void btrfs_add_raid_kobjects(struct btrfs_fs_info *fs_info)
-{
-	struct btrfs_space_info *space_info;
-	struct raid_kobject *rkobj;
-	LIST_HEAD(list);
-	int ret =3D 0;
-
-	spin_lock(&fs_info->pending_raid_kobjs_lock);
-	list_splice_init(&fs_info->pending_raid_kobjs, &list);
-	spin_unlock(&fs_info->pending_raid_kobjs_lock);
-
-	list_for_each_entry(rkobj, &list, list) {
-		space_info =3D btrfs_find_space_info(fs_info, rkobj->flags);
-
-		ret =3D kobject_add(&rkobj->kobj, &space_info->kobj,
-				"%s", btrfs_bg_type_to_raid_name(rkobj->flags));
-		if (ret) {
-			kobject_put(&rkobj->kobj);
-			break;
-		}
-	}
-	if (ret)
-		btrfs_warn(fs_info,
-			   "failed to add kobject for block cache, ignoring");
-}
-
 /*
  * Create a sysfs entry for a given block group type at path
  * /sys/fs/btrfs/UUID/allocation/data/TYPE
@@ -855,10 +828,21 @@ void btrfs_sysfs_add_block_group_type(struct btrfs_bl=
ock_group_cache *cache)
 	struct btrfs_fs_info *fs_info =3D cache->fs_info;
 	struct btrfs_space_info *space_info =3D cache->space_info;
 	struct raid_kobject *rkobj;
+	unsigned int nofs_flag;
+	int ret;
 	const int index =3D btrfs_bg_flags_to_raid_index(cache->flags);
=20
+	/*
+	 * Setup a NOFS context because kobject_add(), deep in its call
+	 * chain, does GFP_KERNEL allocations, and we are often called
+	 * in a context where if reclaim is triggered we can deadlock
+	 * (we are either holding a transaction handle or some lock
+	 * required for a transaction commit).
+	 */
+	nofs_flag =3D memalloc_nofs_save();
 	rkobj =3D kzalloc(sizeof(*rkobj), GFP_NOFS);
 	if (!rkobj) {
+		memalloc_nofs_restore(nofs_flag);
 		btrfs_warn(cache->fs_info,
 				"couldn't alloc memory for raid level kobject");
 		return;
@@ -867,9 +851,15 @@ void btrfs_sysfs_add_block_group_type(struct btrfs_blo=
ck_group_cache *cache)
 	rkobj->flags =3D cache->flags;
 	kobject_init(&rkobj->kobj, &btrfs_raid_ktype);
=20
-	spin_lock(&fs_info->pending_raid_kobjs_lock);
-	list_add_tail(&rkobj->list, &fs_info->pending_raid_kobjs);
-	spin_unlock(&fs_info->pending_raid_kobjs_lock);
+	ret =3D kobject_add(&rkobj->kobj, &space_info->kobj, "%s",
+			  btrfs_bg_type_to_raid_name(rkobj->flags));
+	memalloc_nofs_restore(nofs_flag);
+	if (ret) {
+		kobject_put(&rkobj->kobj);
+		btrfs_warn(fs_info,
+		   "failed to add kobject for block cache, ignoring");
+		return;
+	}
 	space_info->block_group_kobjs[index] =3D &rkobj->kobj;
 }
=20
--=20
2.20.1


--=20
Cheers,
Stephen Rothwell

diff --cc fs/btrfs/ctree.h
index 94660063a162,357316173d84..000000000000
--- a/fs/btrfs/ctree.h
+++ b/fs/btrfs/ctree.h
diff --cc fs/btrfs/extent-tree.c
index 8b7eb22d508a,ad15d05e256b..000000000000
--- a/fs/btrfs/extent-tree.c
+++ b/fs/btrfs/extent-tree.c
@@@ -8976,27 -8751,20 +8752,27 @@@ int btrfs_trim_fs(struct btrfs_fs_info=20
  	int dev_ret =3D 0;
  	int ret =3D 0;
 =20
 +	/*
 +	 * Check range overflow if range->len is set.
 +	 * The default range->len is U64_MAX.
 +	 */
 +	if (range->len !=3D U64_MAX &&
 +	    check_add_overflow(range->start, range->len, &range_end))
 +		return -EINVAL;
 +
  	cache =3D btrfs_lookup_first_block_group(fs_info, range->start);
- 	for (; cache; cache =3D next_block_group(cache)) {
+ 	for (; cache; cache =3D btrfs_next_block_group(cache)) {
 -		if (cache->key.objectid >=3D (range->start + range->len)) {
 +		if (cache->key.objectid >=3D range_end) {
  			btrfs_put_block_group(cache);
  			break;
  		}
 =20
  		start =3D max(range->start, cache->key.objectid);
 -		end =3D min(range->start + range->len,
 -				cache->key.objectid + cache->key.offset);
 +		end =3D min(range_end, cache->key.objectid + cache->key.offset);
 =20
  		if (end - start >=3D range->minlen) {
- 			if (!block_group_cache_done(cache)) {
- 				ret =3D cache_block_group(cache, 0);
+ 			if (!btrfs_block_group_cache_done(cache)) {
+ 				ret =3D btrfs_cache_block_group(cache, 0);
  				if (ret) {
  					bg_failed++;
  					bg_ret =3D ret;

--Sig_/Ay9WXvNInn/8fLpJN1fI5yX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1Lct4ACgkQAVBC80lX
0GwWoAf8DA0nnjmya8Zco+bYvxl3ARykzY7ARxBYan6UitapLvWK2sI5GPb014Zj
k66flp9m8mNxEteaKr7r2+0o4rx9DvuaOawiGeOX+tsH+J9OaTq86/lr4vlqHnQF
RtJTDHTsPr16jzn0QHRc9H5/bBJ3gbR9AaHhhThssUKrhUplC73PkypH50jAfU0n
PFzNyj/3YDs7HNmziuba6HLuJNcGM5/vNddsriAL1AWAntp0cogiewAZdoSdFREc
6IOnOrGOG9D4jwQta1UVJ2UZSFFgoWjjme2f7UkUFXr92naCDNjNfyAFbKZ4oM5W
XeNgl+45ZHlhXdu/Trd5Gwbk0MILiA==
=JYC3
-----END PGP SIGNATURE-----

--Sig_/Ay9WXvNInn/8fLpJN1fI5yX--
