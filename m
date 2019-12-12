Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CD0211C1BC
	for <lists+linux-next@lfdr.de>; Thu, 12 Dec 2019 01:59:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbfLLA7G (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Dec 2019 19:59:06 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:52091 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726791AbfLLA7F (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Dec 2019 19:59:05 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47YFmk24gsz9sPL;
        Thu, 12 Dec 2019 11:59:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576112342;
        bh=q29hxPkZ81zqhm8TCiG1DkHRYda5aQynV71wQB7CmII=;
        h=Date:From:To:Cc:Subject:From;
        b=mpmFQMBquXMfKteBipHrly0/ZE7VLcyjgblIOhtdRx27viHxk53IscP+onNLVHn2q
         20pgZlqIPgAdgcnH6g0RFBXO7/XrWL6cB4h+4v0WLQSyMjyGn0625Rhp+cjl125qZ9
         llRL7zgUny/cQLIGquneYKBwGj5W0LFnd95a50hNUANHsUO934TiTZC3Sj6JET8IHJ
         MydYJ8vfnTWEXQCQV+rp8BiqLd14XT+a4+ec20w91yZ3ZM7JLXK4SEBmzuFmesR5Xl
         Xxw0ar9XI1HPefOopy4vz9l1NteUiTjRemd2il52NNVyoArrg9C9ZKCUw8zkjSwu5n
         wNmzAenbwzcLw==
Date:   Thu, 12 Dec 2019 11:59:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failures after merge of the keys tree
Message-ID: <20191212115901.221d8ba1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iFdWzqfb3Y03+bLckGVND9j";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/iFdWzqfb3Y03+bLckGVND9j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the keys tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/keyctl.h:11,
                 from include/linux/key.h:35,
                 from include/linux/key-type.h:11,
                 from fs/crypto/keyring.c:22:
fs/crypto/keyring.c: In function 'allocate_filesystem_keyring':
include/uapi/linux/keyctl.h:52:24: warning: passing argument 5 of 'keyring_=
alloc' makes pointer from integer without a cast [-Wint-conversion]
   52 | #define KEY_POS_SEARCH 0x08000000 /* possessor can find a key in se=
arch / search a keyring */
      |                        ^
      |                        |
      |                        int
fs/crypto/keyring.c:208:21: note: in expansion of macro 'KEY_POS_SEARCH'
  208 |     current_cred(), KEY_POS_SEARCH |
      |                     ^~~~~~~~~~~~~~
In file included from include/linux/key-type.h:11,
                 from fs/crypto/keyring.c:22:
include/linux/key.h:390:20: note: expected 'struct key_acl *' but argument =
is of type 'int'
  390 | extern struct key *keyring_alloc(const char *description, kuid_t ui=
d, kgid_t gid,
      |                    ^~~~~~~~~~~~~
In file included from include/linux/keyctl.h:11,
                 from include/linux/key.h:35,
                 from include/linux/key-type.h:11,
                 from fs/crypto/keyring.c:22:
fs/crypto/keyring.c: In function 'allocate_master_key_users_keyring':
include/uapi/linux/keyctl.h:52:24: warning: passing argument 5 of 'keyring_=
alloc' makes pointer from integer without a cast [-Wint-conversion]
   52 | #define KEY_POS_SEARCH 0x08000000 /* possessor can find a key in se=
arch / search a keyring */
      |                        ^
      |                        |
      |                        int
fs/crypto/keyring.c:252:21: note: in expansion of macro 'KEY_POS_SEARCH'
  252 |     current_cred(), KEY_POS_SEARCH |
      |                     ^~~~~~~~~~~~~~
In file included from include/linux/key-type.h:11,
                 from fs/crypto/keyring.c:22:
include/linux/key.h:390:20: note: expected 'struct key_acl *' but argument =
is of type 'int'
  390 | extern struct key *keyring_alloc(const char *description, kuid_t ui=
d, kgid_t gid,
      |                    ^~~~~~~~~~~~~
In file included from include/linux/keyctl.h:11,
                 from include/linux/key.h:35,
                 from include/linux/key-type.h:11,
                 from fs/crypto/keyring.c:22:
fs/crypto/keyring.c: In function 'add_master_key_user':
include/uapi/linux/keyctl.h:52:24: warning: passing argument 6 of 'key_allo=
c' makes pointer from integer without a cast [-Wint-conversion]
   52 | #define KEY_POS_SEARCH 0x08000000 /* possessor can find a key in se=
arch / search a keyring */
      |                        ^
      |                        |
      |                        int
fs/crypto/keyring.c:290:8: note: in expansion of macro 'KEY_POS_SEARCH'
  290 |        KEY_POS_SEARCH | KEY_USR_VIEW, 0, NULL);
      |        ^~~~~~~~~~~~~~
In file included from include/linux/key-type.h:11,
                 from fs/crypto/keyring.c:22:
include/linux/key.h:256:20: note: expected 'struct key_acl *' but argument =
is of type 'int'
  256 | extern struct key *key_alloc(struct key_type *type,
      |                    ^~~~~~~~~
In file included from include/linux/keyctl.h:11,
                 from include/linux/key.h:35,
                 from include/linux/key-type.h:11,
                 from fs/crypto/keyring.c:22:
fs/crypto/keyring.c: In function 'add_new_master_key':
include/uapi/linux/keyctl.h:52:24: warning: passing argument 6 of 'key_allo=
c' makes pointer from integer without a cast [-Wint-conversion]
   52 | #define KEY_POS_SEARCH 0x08000000 /* possessor can find a key in se=
arch / search a keyring */
      |                        ^
      |                        |
      |                        int
fs/crypto/keyring.c:362:4: note: in expansion of macro 'KEY_POS_SEARCH'
  362 |    KEY_POS_SEARCH | KEY_USR_SEARCH | KEY_USR_VIEW,
      |    ^~~~~~~~~~~~~~
In file included from include/linux/key-type.h:11,
                 from fs/crypto/keyring.c:22:
include/linux/key.h:256:20: note: expected 'struct key_acl *' but argument =
is of type 'int'
  256 | extern struct key *key_alloc(struct key_type *type,
      |                    ^~~~~~~~~
fs/crypto/keysetup_v1.c: In function 'find_and_lock_process_key':
fs/crypto/keysetup_v1.c:107:8: error: too few arguments to function 'reques=
t_key'
  107 |  key =3D request_key(&key_type_logon, description, NULL);
      |        ^~~~~~~~~~~
In file included from include/keys/user-type.h:11,
                 from fs/crypto/keysetup_v1.c:25:
include/linux/key.h:321:27: note: declared here
  321 | static inline struct key *request_key(struct key_type *type,
      |                           ^~~~~~~~~~~
drivers/md/dm-verity-verify-sig.c: In function 'verity_verify_get_sig_from_=
key':
drivers/md/dm-verity-verify-sig.c:38:8: error: too few arguments to functio=
n 'request_key'
   38 |  key =3D request_key(&key_type_user,
      |        ^~~~~~~~~~~
In file included from include/keys/user-type.h:11,
                 from drivers/md/dm-verity-verify-sig.c:10:
include/linux/key.h:321:27: note: declared here
  321 | static inline struct key *request_key(struct key_type *type,
      |                           ^~~~~~~~~~~


Caused by commit

  068df091816a ("keys: Replace uid/gid/perm permissions checking with an AC=
L")

I have used the keys tree from next-20191211 for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/iFdWzqfb3Y03+bLckGVND9j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3xkNUACgkQAVBC80lX
0Gycvgf9EwK6ivtSGRXCNrbIPSNf0N51zwzJyNj0T1uFMWq8yZdMmosP6cMVgUgm
lA01WPbMajunv2hTmxwb1DstCc6wZunpfAZroDZVhoTCLIwt1/+vLq7fo1ROQdzh
BGdgErQ28o0On/OZ4EN3kb38MYFP4WHzecaAvczZo8HpQy0efxlcFLN0T0lHdtkq
X99T/IZTGPD7SR0Y9J3Tt0YPBDrUExYxtMrzfL4mR7d/fnV4B7N/gx3vt5MhUsE0
VnumDGvjcdquEIuF1tun3AGSUNPX/sbKLYhSX5L40Npauxu3XY+Y63Us7ORTGuU1
X6fn9tKLl+nLuz5F14CqkwnM0IQ2IA==
=HzoL
-----END PGP SIGNATURE-----

--Sig_/iFdWzqfb3Y03+bLckGVND9j--
