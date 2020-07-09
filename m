Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5A0219662
	for <lists+linux-next@lfdr.de>; Thu,  9 Jul 2020 04:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgGIC6X (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jul 2020 22:58:23 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34107 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726107AbgGIC6W (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Jul 2020 22:58:22 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B2LTR0P3vz9sQt;
        Thu,  9 Jul 2020 12:58:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594263499;
        bh=fpKkrKE8IB2evZg7xDyDGYYwbjbsssLphcIryri7l/I=;
        h=Date:From:To:Cc:Subject:From;
        b=PesDYLn3YSAYbJnnkjqQ4RkIBbgNnD20JQAPqv/Vrj0FbFCzzCitco+vkR8xE/Nvg
         LwFhBTxXrh635CVYRWeIuxBPSjUq9n/k7f/0OZJcQ/VPuUfHuVgtnubb6ptGz+RyiN
         BHqUamVOzq7HaOKbKWRZyP+LDKc3dmr9PkSPOfoVBt0mvrIaQrPZCSie1VKLa5bekq
         I9vMQJFaDdXILmoeXqtLiywVCgMKfwiYgsw3vNu6F8G31tZKI+CKoz+5ADEKm58rJF
         BqgFcAT8V3h/4klvLKszOlflwDNstly3nMfUiaG/YecpwynP4DMG8SSI6SGHLBwcQi
         oqGyK5eU8MQIw==
Date:   Thu, 9 Jul 2020 12:58:16 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>, Qu Wenruo <wqu@suse.com>
Subject: linux-next: manual merge of the block tree with the btrfs tree
Message-ID: <20200709125816.4be1953f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L.aRLTf_qBA4bVcYzR07wj=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/L.aRLTf_qBA4bVcYzR07wj=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  fs/btrfs/disk-io.c

between commit:

  16e1dd6a777e ("btrfs: preallocate anon block device at first phase of sna=
pshot creation")

from the btrfs tree and commit:

  21cf86614504 ("writeback: remove bdi->congested_fn")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/btrfs/disk-io.c
index 08140caceb33,eb5f2506cede..000000000000
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@@ -1649,54 -1616,6 +1649,33 @@@ fail
  	return ERR_PTR(ret);
  }
 =20
 +/*
 + * Get in-memory reference of a root structure
 + *
 + * @objectid:	tree objectid
 + * @check_ref:	if set, verify that the tree exists and the item has at le=
ast
 + *		one reference
 + */
 +struct btrfs_root *btrfs_get_fs_root(struct btrfs_fs_info *fs_info,
 +				     u64 objectid, bool check_ref)
 +{
 +	return btrfs_get_root_ref(fs_info, objectid, 0, check_ref);
 +}
 +
 +/*
 + * Get in-memory reference of a root structure, created as new, optionall=
y pass
 + * the anonymous block device id
 + *
 + * @objectid:	tree objectid
 + * @anon_dev:	if zero, allocate a new anonymous block device or use the
 + *		parameter value
 + */
 +struct btrfs_root *btrfs_get_new_fs_root(struct btrfs_fs_info *fs_info,
 +					 u64 objectid, dev_t anon_dev)
 +{
 +	return btrfs_get_root_ref(fs_info, objectid, anon_dev, true);
 +}
 +
- static int btrfs_congested_fn(void *congested_data, int bdi_bits)
- {
- 	struct btrfs_fs_info *info =3D (struct btrfs_fs_info *)congested_data;
- 	int ret =3D 0;
- 	struct btrfs_device *device;
- 	struct backing_dev_info *bdi;
-=20
- 	rcu_read_lock();
- 	list_for_each_entry_rcu(device, &info->fs_devices->devices, dev_list) {
- 		if (!device->bdev)
- 			continue;
- 		bdi =3D device->bdev->bd_bdi;
- 		if (bdi_congested(bdi, bdi_bits)) {
- 			ret =3D 1;
- 			break;
- 		}
- 	}
- 	rcu_read_unlock();
- 	return ret;
- }
-=20
  /*
   * called by the kthread helper functions to finally call the bio end_io
   * functions.  This is where read checksum verification actually happens

--Sig_/L.aRLTf_qBA4bVcYzR07wj=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8Gh8gACgkQAVBC80lX
0Gxs3gf9G4+aKo4Lyrmf6KcbHgKgl9zunBAqrJEyPf2OQ6cMyzEE0WXbrWSKbbze
nKHiRS8obUTm84K14sy6F6/S3nn2sR5Ss2e3olz8CRaZoei9htIXAOPB1qsA7CJL
lxVYu2ZQEDSzoZ8aSsr+/kwTIO8C9GmZDXP/unv3EEb3Dgd/G1yDb3qQOkXEjYil
8NbbjhxpGAIv09uiMnI+Tf5+Fl9KGShzhMbSlD/Z1rQtXCMUg36h1NGL0BDola57
fD02tyjDdd1sT4uC+amFbWJp6RjYMZNRCLm2YWwAy6LYMYOdT7L/Wxet5hdwZy68
m9JXkdaTCmdUfTodkwiLEXY4pfNqzw==
=/P+W
-----END PGP SIGNATURE-----

--Sig_/L.aRLTf_qBA4bVcYzR07wj=--
