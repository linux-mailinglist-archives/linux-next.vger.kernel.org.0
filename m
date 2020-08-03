Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E961C23A183
	for <lists+linux-next@lfdr.de>; Mon,  3 Aug 2020 11:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbgHCJFi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Aug 2020 05:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbgHCJFh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 3 Aug 2020 05:05:37 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C40C06174A;
        Mon,  3 Aug 2020 02:05:36 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BKsRd4QTSz9sR4;
        Mon,  3 Aug 2020 19:05:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596445534;
        bh=KdYluAI+KMRarj97US9aAlaVreQwO+eq+4a6Oa2C32k=;
        h=Date:From:To:Cc:Subject:From;
        b=s00Ind70Kt/BJ8X7eLncZlI9GMjdfCf7c/DDihqmO7CHGdDM8sDuL8aAjZyjtvlZu
         Ji5q+1z3aLDPgqmCYYbVvaeWrVa5of1xSJn4mgA4YvkwyFsu6EUXeyTVyKUogLZPxs
         GlTHI9j2++RnDt4qJoFsFE6V0hwceT+TLEVMFYkCCRw5nAzrfzSy/8dEJ1azGQphe+
         XY0G+KFXAitAR5RGkpEzNGhkkw0Xs3sbnpa3cD8sUKIV0rEoDXhu9/pbgplGRjdGgR
         UkM8dHQNMXC2LiCQTBakkpRTduFL9p8TQhqBNtnundKiuHXR13T8fVMAmen3jXipgL
         jD6j96rGWXOCQ==
Date:   Mon, 3 Aug 2020 19:05:32 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: manual merge of the fsinfo tree with the vfs tree
Message-ID: <20200803190532.5b69d3f4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wjCIlNx8lZNqmVQenV.yCsP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wjCIlNx8lZNqmVQenV.yCsP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fsinfo tree got a conflict in:

  fs/internal.h

between commits:

  c60166f04283 ("init: add an init_mount helper")
  09267defa36a ("init: add an init_umount helper")

from the vfs tree and commits:

  8c62d62ddd1f ("fsinfo: Allow retrieval of superblock devname, options and=
 stats")
  df9f487eeb11 ("fsinfo: Allow fsinfo() to look up a mount object by ID")
  0a83b1d9fdcd ("fsinfo: Allow mount information to be queried")
  969ba80e4121 ("fsinfo: Allow mount topology and propagation info to be re=
trieved")
  a177ce034bec ("fsinfo: Add an attribute that lists all the visible mounts=
 in a namespace")

from the fsinfo tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/internal.h
index 10517ece4516,267b4aaf0271..000000000000
--- a/fs/internal.h
+++ b/fs/internal.h
@@@ -96,11 -95,15 +102,20 @@@ extern int __mnt_want_write_file(struc
  extern void __mnt_drop_write_file(struct file *);
 =20
  extern void dissolve_on_fput(struct vfsmount *);
 +
 +int path_mount(const char *dev_name, struct path *path,
 +		const char *type_page, unsigned long flags, void *data_page);
 +int path_umount(struct path *path, int flags);
 +
+ extern int lookup_mount_object(struct path *, unsigned int, struct path *=
);
+ extern int fsinfo_generic_mount_source(struct path *, struct fsinfo_conte=
xt *);
+ extern int fsinfo_generic_mount_info(struct path *, struct fsinfo_context=
 *);
+ extern int fsinfo_generic_mount_topology(struct path *, struct fsinfo_con=
text *);
+ extern int fsinfo_generic_mount_point(struct path *, struct fsinfo_contex=
t *);
+ extern int fsinfo_generic_mount_point_full(struct path *, struct fsinfo_c=
ontext *);
+ extern int fsinfo_generic_mount_children(struct path *, struct fsinfo_con=
text *);
+ extern int fsinfo_generic_mount_all(struct path *, struct fsinfo_context =
*);
+=20
  /*
   * fs_struct.c
   */

--Sig_/wjCIlNx8lZNqmVQenV.yCsP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8n01wACgkQAVBC80lX
0GyU1gf+MA4fdo6539hXHeYld5YXI7zZEHrUYWIJDn36VQlvRmSw/Sqr0BU6FFYH
Hjovb4stMy+CQ/DHS4Y3fWAr4Pj7jencQX8e5WlUulF2Qa9mee4zPW+clorwf574
8ByAePcGMq/z+4syYXOwAP1nKQQAsRJ8dqG49bSyoUQeyAiQ1Jre3s0tI8FYOsrf
He78vMMO4z2TZm9SMZauu1rRJDG1l7GbZksSEgBsI5kYq5WJo/u6ET6+eWRLrVy8
FZDX6k5nU6GrhY9Bg9F47Epj5+wCNh+t5r/5tFtESKs1FCVRwclI7S6Dcv2uZ4Xr
kLthAq96/ZxnDTYj9k7RGI78J6PS4A==
=HSkG
-----END PGP SIGNATURE-----

--Sig_/wjCIlNx8lZNqmVQenV.yCsP--
