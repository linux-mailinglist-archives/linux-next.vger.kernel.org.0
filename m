Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60F3D13D192
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2020 02:36:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729631AbgAPBgY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jan 2020 20:36:24 -0500
Received: from ozlabs.org ([203.11.71.1]:59705 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729195AbgAPBgY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Jan 2020 20:36:24 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47ymxZ6wdlz9sR0;
        Thu, 16 Jan 2020 12:36:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579138579;
        bh=3QgTtxEuHnvoA7D2nU9hi3dlGTa5xpKg0k5M4dwrBcM=;
        h=Date:From:To:Cc:Subject:From;
        b=cGAmr6kRoOtgu1YBjBeAoJsO93EJhWjCKymmC7Msrdb9Z2d1F9WCSgZU6sjKWW8ze
         brJ8kyTOrMzND20wcAtNekEa3w1eorKUkj3YPmbqYhPUOKK1RVcnfZo1u1rwxG/Pah
         o+bNyIdWovOXWdGGB6ga3YuQ/cQ28cLgUzqWx+uGHYzu31BVhyvYURdnoqY1HURWhm
         cx06/0X3vE/SKEN98tq/pNVcBFoPO2SAn7SE4ACc6NB4oZLwgDQyWi8ysX357GWqTP
         JPrwLPDDfg0xfee/k4mCnTCUyiXDput0L1sSZCjrl7EtlPpyLs4xOcLx11WdidLAuv
         93SUyQZoRd9eA==
Date:   Thu, 16 Jan 2020 12:36:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the keys tree
Message-ID: <20200116123617.4a4b10f5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_CCL_Rl.YScGtz_kpkrvag_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_CCL_Rl.YScGtz_kpkrvag_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the keys tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/keyctl.h:11,
                 from include/linux/key.h:35,
                 from include/linux/cred.h:13,
                 from fs/verity/signature.c:10:
fs/verity/signature.c: In function 'fsverity_init_signature':
include/uapi/linux/keyctl.h:52:24: warning: passing argument 5 of 'keyring_=
alloc' makes pointer from integer without a cast [-Wint-conversion]
   52 | #define KEY_POS_SEARCH 0x08000000 /* possessor can find a key in se=
arch / search a keyring */
      |                        ^
      |                        |
      |                        int
fs/verity/signature.c:140:25: note: in expansion of macro 'KEY_POS_SEARCH'
  140 |         current_cred(), KEY_POS_SEARCH |
      |                         ^~~~~~~~~~~~~~
In file included from include/linux/cred.h:13,
                 from fs/verity/signature.c:10:
include/linux/key.h:390:20: note: expected 'struct key_acl *' but argument =
is of type 'int'
  390 | extern struct key *keyring_alloc(const char *description, kuid_t ui=
d, kgid_t gid,
      |                    ^~~~~~~~~~~~~
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

Caused by API updates in the keys tree without fixups of their uses.

The keys tree is now based on v5.5-rc3 ...

The callis to keyring_alloc() in fs/verity/signature.c and
fs/crypto/keyring.c were added in v5.4-rc1.  As were the calls to
request_key() in fs/crypto/keysetup_v1.c and
drivers/md/dm-verity-verify-sig.c.

I have used the keys tree from next-20191211 again today.

--=20
Cheers,
Stephen Rothwell

--Sig_/_CCL_Rl.YScGtz_kpkrvag_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4fvhEACgkQAVBC80lX
0Gx9fgf+PEfKld65lctjHtkk8fkHMzqY6r7oLl/plq8UxvmvBJK7RF935zoFNUox
/IhxTH+x4Q4f6szBIky9loq/ktOFOAydalo9+skYbnvb1cT9mIbH0cn6eq0quI7M
ZmTJPhpZI2OtSu8tDHfHtHt0hYPkPcUAOkc0lSYXLjipk88WNXOBg4F9QQXlbZFq
S5CC0k445EaiiuiBbXiHj31VzuHZbobQAFYVLyRvx5Dxt9DbgKZT+RbvVSgyAEXm
TY9xAj5r86WeGaNlJ8kfIHLjYKkjzBqk1zZISUzWwi2uUwitzz3z8ibAnbKtQ9mZ
Jt18qVpuMEBapTNgqhAFf+uVW9jSkA==
=eB00
-----END PGP SIGNATURE-----

--Sig_/_CCL_Rl.YScGtz_kpkrvag_--
