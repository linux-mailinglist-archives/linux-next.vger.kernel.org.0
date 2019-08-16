Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3453B8FA01
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2019 06:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbfHPEsn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Aug 2019 00:48:43 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53969 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725962AbfHPEsn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 16 Aug 2019 00:48:43 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 468rS65lNlz9sML;
        Fri, 16 Aug 2019 14:48:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565930919;
        bh=7uFpYBopoEFnU39alW9GqwUFs2N+ir/l25ceAdqQz3c=;
        h=Date:From:To:Cc:Subject:From;
        b=ldNXdKo2nG0Kvns0howiRATobcA+YAmN/Pzj0qgdEUC8UVxs56l9CyS9L2vSA6OSR
         szstXEk28i+T/rfy2fl0kSvPkfWkxrvKKHfbdOGDAPcrruWK9jV/U/tijRC1glJL3Y
         piLJ+KUpqs2po+kgnwiXJEqikQ7Hp2AgIsoFIIgSN7ZOPl0iFw5bbQtpzO7nptPzqH
         ajDGI89bkhXRrkbukKfhoop/tXvwUmIZzbeOxDva4qN7VSVRHY7f9UPQc7EMM176N3
         RrkGc44WtgFbEatK/lcsfAQJ3+5lJNfHbO9ZfLHR5C2yoKO2gcaMSauzbKC5W55okn
         G+e4attNG8Tww==
Date:   Fri, 16 Aug 2019 14:48:38 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>, Theodore Ts'o <tytso@mit.edu>,
        Eric Biggers <ebiggers@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the keys tree with the fscrypt tree
Message-ID: <20190816144838.0d00027e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mYL2vOIShbGh.B9JRnP2n+u";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mYL2vOIShbGh.B9JRnP2n+u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the keys tree got a conflict in:

  fs/crypto/keyinfo.c

between commit:

  feed82586191 ("fscrypt: rename keyinfo.c to keysetup.c")

from the fscrypt tree and commit:

  f802f2b3a991 ("keys: Replace uid/gid/perm permissions checking with an AC=
L")

from the keys tree.

I fixed it up (I removed the file and added the following merge resolution
patch) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

Thanks Eric for the heads up and instructions.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 16 Aug 2019 14:45:08 +1000
Subject: [PATCH] fscrypt: merge resolution for "keys: Replace uid/gid/perm
 permissions checking with an ACL"

Supplied by Eric Biggers <ebiggers@kernel.org>

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/crypto/keyring.c     | 40 +++++++++++++++++++++++++++++++++-------
 fs/crypto/keysetup_v1.c |  2 +-
 2 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index c34fa7c61b43..fb4f6a44ffcd 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -127,6 +127,35 @@ static struct key_type key_type_fscrypt_user =3D {
 	.describe		=3D fscrypt_user_key_describe,
 };
=20
+static struct key_acl fscrypt_keyring_acl =3D {
+	.usage =3D REFCOUNT_INIT(1),
+	.nr_ace	=3D 2,
+	.aces =3D {
+		KEY_POSSESSOR_ACE(KEY_ACE_SEARCH | KEY_ACE_INVAL |
+				  KEY_ACE_JOIN),
+		KEY_OWNER_ACE(KEY_ACE_SEARCH | KEY_ACE_INVAL | KEY_ACE_JOIN |
+			      KEY_ACE_READ | KEY_ACE_VIEW),
+	}
+};
+
+static struct key_acl fscrypt_key_acl =3D {
+	.usage =3D REFCOUNT_INIT(1),
+	.nr_ace	=3D 2,
+	.aces =3D {
+		KEY_POSSESSOR_ACE(KEY_ACE_SEARCH | KEY_ACE_INVAL),
+		KEY_OWNER_ACE(KEY_ACE_SEARCH | KEY_ACE_INVAL | KEY_ACE_VIEW),
+	}
+};
+
+static struct key_acl fscrypt_user_key_acl =3D {
+	.usage =3D REFCOUNT_INIT(1),
+	.nr_ace	=3D 2,
+	.aces =3D {
+		KEY_POSSESSOR_ACE(KEY_ACE_SEARCH | KEY_ACE_INVAL),
+		KEY_OWNER_ACE(KEY_ACE_VIEW),
+	}
+};
+
 /* Search ->s_master_keys or ->mk_users */
 static struct key *search_fscrypt_keyring(struct key *keyring,
 					  struct key_type *type,
@@ -203,8 +232,7 @@ static int allocate_filesystem_keyring(struct super_blo=
ck *sb)
=20
 	format_fs_keyring_description(description, sb);
 	keyring =3D keyring_alloc(description, GLOBAL_ROOT_UID, GLOBAL_ROOT_GID,
-				current_cred(), KEY_POS_SEARCH |
-				  KEY_USR_SEARCH | KEY_USR_READ | KEY_USR_VIEW,
+				current_cred(), &fscrypt_keyring_acl,
 				KEY_ALLOC_NOT_IN_QUOTA, NULL, NULL);
 	if (IS_ERR(keyring))
 		return PTR_ERR(keyring);
@@ -247,8 +275,7 @@ static int allocate_master_key_users_keyring(struct fsc=
rypt_master_key *mk)
 	format_mk_users_keyring_description(description,
 					    mk->mk_spec.u.identifier);
 	keyring =3D keyring_alloc(description, GLOBAL_ROOT_UID, GLOBAL_ROOT_GID,
-				current_cred(), KEY_POS_SEARCH |
-				  KEY_USR_SEARCH | KEY_USR_READ | KEY_USR_VIEW,
+				current_cred(), &fscrypt_keyring_acl,
 				KEY_ALLOC_NOT_IN_QUOTA, NULL, NULL);
 	if (IS_ERR(keyring))
 		return PTR_ERR(keyring);
@@ -285,7 +312,7 @@ static int add_master_key_user(struct fscrypt_master_ke=
y *mk)
 	format_mk_user_description(description, mk->mk_spec.u.identifier);
 	mk_user =3D key_alloc(&key_type_fscrypt_user, description,
 			    current_fsuid(), current_gid(), current_cred(),
-			    KEY_POS_SEARCH | KEY_USR_VIEW, 0, NULL);
+			    &fscrypt_user_key_acl, 0, NULL);
 	if (IS_ERR(mk_user))
 		return PTR_ERR(mk_user);
=20
@@ -357,8 +384,7 @@ static int add_new_master_key(struct fscrypt_master_key=
_secret *secret,
 	format_mk_description(description, mk_spec);
 	key =3D key_alloc(&key_type_fscrypt, description,
 			GLOBAL_ROOT_UID, GLOBAL_ROOT_GID, current_cred(),
-			KEY_POS_SEARCH | KEY_USR_SEARCH | KEY_USR_VIEW,
-			KEY_ALLOC_NOT_IN_QUOTA, NULL);
+			&fscrypt_key_acl, KEY_ALLOC_NOT_IN_QUOTA, NULL);
 	if (IS_ERR(key)) {
 		err =3D PTR_ERR(key);
 		goto out_free_mk;
diff --git a/fs/crypto/keysetup_v1.c b/fs/crypto/keysetup_v1.c
index ad1a36c370c3..0727251be865 100644
--- a/fs/crypto/keysetup_v1.c
+++ b/fs/crypto/keysetup_v1.c
@@ -104,7 +104,7 @@ find_and_lock_process_key(const char *prefix,
 	if (!description)
 		return ERR_PTR(-ENOMEM);
=20
-	key =3D request_key(&key_type_logon, description, NULL);
+	key =3D request_key(&key_type_logon, description, NULL, NULL);
 	kfree(description);
 	if (IS_ERR(key))
 		return key;
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/mYL2vOIShbGh.B9JRnP2n+u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1WNaYACgkQAVBC80lX
0GwnTAf+KXmw1QMCtgAS6lyhLSF8r1T4L3Hp958f9nPh4dMvGi6nXPu4leRklQC4
+78oY5kTlSrIqAAkVrbUdAUjua0phFyUue15zRMMFawZbAmpu+JBHaJOaLn+wjHw
RP3M52W9gRXDaiF3t3QfosQtiPTNKJUphY33GcFeEM+MnOJLPX50eCSwMmEUQkgG
1UJUH0ZkH3HrPh/KUiTA0wKatDAQYoZ4N1zd8DdxKvIRQUle8WIhMA6FYzBh+O8T
dKgjEO8wlnn6bO/sePb3dlkZB99UNQygrdd60D3D8vYN6XCV4s+/G7oeF3FB3WCS
0/qbjBey9tGOHWCKazMMrAYYGDjvKQ==
=oEng
-----END PGP SIGNATURE-----

--Sig_/mYL2vOIShbGh.B9JRnP2n+u--
