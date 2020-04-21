Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 057841B1AA3
	for <lists+linux-next@lfdr.de>; Tue, 21 Apr 2020 02:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgDUAZ0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Apr 2020 20:25:26 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59393 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726056AbgDUAZZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Apr 2020 20:25:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 495kqQ2mtrz9sSJ;
        Tue, 21 Apr 2020 10:25:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587428722;
        bh=4xUTtO2SNg9WQdVKIwgg2gtvt0w/E4L61n7U8thqfQg=;
        h=Date:From:To:Cc:Subject:From;
        b=QdQMa4F34NML50do8dWrNfJ/nsvl9l37tEH/H3Fg3cAf3p4Z1tT/ElD6LZriXVR8Q
         sUuoEiJnomz6gLn4zQVhalmAHSLz7gUWiokNIBdQMggvfzoA6vEpjlYMq5Rb+9YhUa
         fpRm4sNylMZEQ90qfJalJRZ99Q6weN9LsgfcNiDFoLOfGB5bb90PpvzNSlIMT6W+NV
         AblhaCO/RHZHEsQ43GMKzJM92mhSDQyTk111SYXnnw04JaE2DVuV7uivZ/sMw6LaFD
         po9zSWyMnKyfr/oRQfCgv7enzp66DvEi+afhwFzwfnc8pR1fZXz/N6+t3OvHTLbwED
         xhGtup6S7htyg==
Date:   Tue, 21 Apr 2020 10:25:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Qu Wenruo <wqu@suse.com>
Subject: linux-next: build failure after merge of the btrfs tree
Message-ID: <20200421102520.53623f09@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kpltGz3om1ny/1TFa7uFp9Y";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kpltGz3om1ny/1TFa7uFp9Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the btrfs tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from <command-line>:32:
./usr/include/linux/btrfs_tree.h:1127:2: error: unknown type name 'u8'
 1127 |  u8 tree_root_level;
      |  ^~
./usr/include/linux/btrfs_tree.h:1128:2: error: unknown type name 'u8'
 1128 |  u8 chunk_root_level;
      |  ^~
./usr/include/linux/btrfs_tree.h:1129:2: error: unknown type name 'u8'
 1129 |  u8 extent_root_level;
      |  ^~
./usr/include/linux/btrfs_tree.h:1130:2: error: unknown type name 'u8'
 1130 |  u8 fs_root_level;
      |  ^~
./usr/include/linux/btrfs_tree.h:1131:2: error: unknown type name 'u8'
 1131 |  u8 dev_root_level;
      |  ^~
./usr/include/linux/btrfs_tree.h:1132:2: error: unknown type name 'u8'
 1132 |  u8 csum_root_level;
      |  ^~
./usr/include/linux/btrfs_tree.h:1134:2: error: unknown type name 'u8'
 1134 |  u8 unused_8[10];
      |  ^~
./usr/include/linux/btrfs_tree.h:1148:2: error: unknown type name 'u8'
 1148 |  u8 csum[BTRFS_CSUM_SIZE];
      |  ^~
./usr/include/linux/btrfs_tree.h:1150:2: error: unknown type name 'u8'
 1150 |  u8 fsid[BTRFS_FSID_SIZE];
      |  ^~
./usr/include/linux/btrfs_tree.h:1177:2: error: unknown type name 'u8'
 1177 |  u8 root_level;
      |  ^~
./usr/include/linux/btrfs_tree.h:1178:2: error: unknown type name 'u8'
 1178 |  u8 chunk_root_level;
      |  ^~
./usr/include/linux/btrfs_tree.h:1179:2: error: unknown type name 'u8'
 1179 |  u8 log_root_level;
      |  ^~
./usr/include/linux/btrfs_tree.h:1188:2: error: unknown type name 'u8'
 1188 |  u8 metadata_uuid[BTRFS_FSID_SIZE];
      |  ^~
./usr/include/linux/btrfs_tree.h:1192:2: error: unknown type name 'u8'
 1192 |  u8 sys_chunk_array[BTRFS_SYSTEM_CHUNK_ARRAY_SIZE];
      |  ^~
./usr/include/linux/btrfs_tree.h:1283:2: error: unknown type name 'u8'
 1283 |  u8 csum[BTRFS_CSUM_SIZE];
      |  ^~
./usr/include/linux/btrfs_tree.h:1284:2: error: unknown type name 'u8'
 1284 |  u8 fsid[BTRFS_FSID_SIZE]; /* FS specific uuid */
      |  ^~
./usr/include/linux/btrfs_tree.h:1289:2: error: unknown type name 'u8'
 1289 |  u8 chunk_tree_uuid[BTRFS_UUID_SIZE];
      |  ^~
./usr/include/linux/btrfs_tree.h:1293:2: error: unknown type name 'u8'
 1293 |  u8 level;
      |  ^~

Caused by commit

  8d80a063d508 ("btrfs: move on-disk structure definitions to btrfs_tree.h")

They should probably all be __u8 ...

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 21 Apr 2020 10:19:20 +1000
Subject: [PATCH] btrfs: uapi headers should use __<type>

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/uapi/linux/btrfs_tree.h | 36 ++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/include/uapi/linux/btrfs_tree.h b/include/uapi/linux/btrfs_tre=
e.h
index a02318e4d2a9..1adf5971a966 100644
--- a/include/uapi/linux/btrfs_tree.h
+++ b/include/uapi/linux/btrfs_tree.h
@@ -1124,14 +1124,14 @@ struct btrfs_root_backup {
 	/* future */
 	__le64 unused_64[4];
=20
-	u8 tree_root_level;
-	u8 chunk_root_level;
-	u8 extent_root_level;
-	u8 fs_root_level;
-	u8 dev_root_level;
-	u8 csum_root_level;
+	__u8 tree_root_level;
+	__u8 chunk_root_level;
+	__u8 extent_root_level;
+	__u8 fs_root_level;
+	__u8 dev_root_level;
+	__u8 csum_root_level;
 	/* future and to align */
-	u8 unused_8[10];
+	__u8 unused_8[10];
 } __attribute__ ((__packed__));
=20
 /*
@@ -1145,9 +1145,9 @@ struct btrfs_root_backup {
 /* The super block basically lists the main trees of the FS. */
 struct btrfs_super_block {
 	/* The first 4 fields must match struct btrfs_header */
-	u8 csum[BTRFS_CSUM_SIZE];
+	__u8 csum[BTRFS_CSUM_SIZE];
 	/* FS specific UUID, visible to user */
-	u8 fsid[BTRFS_FSID_SIZE];
+	__u8 fsid[BTRFS_FSID_SIZE];
 	__le64 bytenr; /* this block number */
 	__le64 flags;
=20
@@ -1174,9 +1174,9 @@ struct btrfs_super_block {
 	__le64 compat_ro_flags;
 	__le64 incompat_flags;
 	__le16 csum_type;
-	u8 root_level;
-	u8 chunk_root_level;
-	u8 log_root_level;
+	__u8 root_level;
+	__u8 chunk_root_level;
+	__u8 log_root_level;
 	struct btrfs_dev_item dev_item;
=20
 	char label[BTRFS_LABEL_SIZE];
@@ -1185,11 +1185,11 @@ struct btrfs_super_block {
 	__le64 uuid_tree_generation;
=20
 	/* The UUID written into btree blocks */
-	u8 metadata_uuid[BTRFS_FSID_SIZE];
+	__u8 metadata_uuid[BTRFS_FSID_SIZE];
=20
 	/* Future expansion */
 	__le64 reserved[28];
-	u8 sys_chunk_array[BTRFS_SYSTEM_CHUNK_ARRAY_SIZE];
+	__u8 sys_chunk_array[BTRFS_SYSTEM_CHUNK_ARRAY_SIZE];
 	struct btrfs_root_backup super_roots[BTRFS_NUM_BACKUP_ROOTS];
 } __attribute__ ((__packed__));
=20
@@ -1280,17 +1280,17 @@ struct btrfs_super_block {
 /* Every tree block (leaf or node) starts with this header. */
 struct btrfs_header {
 	/* These first four must match the super block */
-	u8 csum[BTRFS_CSUM_SIZE];
-	u8 fsid[BTRFS_FSID_SIZE]; /* FS specific uuid */
+	__u8 csum[BTRFS_CSUM_SIZE];
+	__u8 fsid[BTRFS_FSID_SIZE]; /* FS specific uuid */
 	__le64 bytenr; /* Which block this node is supposed to live in */
 	__le64 flags;
=20
 	/* Allowed to be different from the super from here on down. */
-	u8 chunk_tree_uuid[BTRFS_UUID_SIZE];
+	__u8 chunk_tree_uuid[BTRFS_UUID_SIZE];
 	__le64 generation;
 	__le64 owner;
 	__le32 nritems;
-	u8 level;
+	__u8 level;
 } __attribute__ ((__packed__));
=20
 /*
--=20
2.25.1

--=20
Cheers,
Stephen Rothwell

--Sig_/kpltGz3om1ny/1TFa7uFp9Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6ePXAACgkQAVBC80lX
0GzFcQf/cv7+mEE+TzG7VPcJbkUZeJYwrzfeH5ZQgRdF9Qmi395GrBjH2LRuHVkO
lWDFwNmH1oyJBn1DQdw1TNs5E/lh3aQjgakcNkvxDOSRd4iqDlme6Es9aeHm+esT
9vm/F8CI2Pxb+sp8RNnT1fhe2u+KH5+vua7u7vw14Ee1F/UpeeE4jOPUj/fQmI2a
/kt4iy8X+8TBu3NlZaiz8HpB5qYUZQfiyJIpuJE6Ehsuk19tBWq5CbdkSSPDjcqm
r9l9jAomze8muEciYRDOtj28MOb3hQp+moSSHkPJEPaO1shQPo5wlspMNClT1lah
E79GupaY2w34nHfUTsjsKOlBwgah5w==
=jjgi
-----END PGP SIGNATURE-----

--Sig_/kpltGz3om1ny/1TFa7uFp9Y--
