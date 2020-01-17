Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06E95140235
	for <lists+linux-next@lfdr.de>; Fri, 17 Jan 2020 04:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389224AbgAQDHY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jan 2020 22:07:24 -0500
Received: from ozlabs.org ([203.11.71.1]:51277 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388298AbgAQDHY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Jan 2020 22:07:24 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47zQw84kDcz9sR4;
        Fri, 17 Jan 2020 14:07:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579230441;
        bh=80Z0hOnY96gV+4RkbgY55wcUPIFju+0jbnugXVBJInk=;
        h=Date:From:To:Cc:Subject:From;
        b=bimbCbFuGG8iYLJz58tIFBNFLM3DBFIoYE9LBx0c9HStniQoyi6ScM+tk1p3g/YPz
         dT1fMNlo5ffwvqZzamiuMksFJ5gAZYP6WZgNsIuxXYAYzrkv6vHHfvB8QC+yxyl2id
         h8E0lhnROdWs1Hjas7519y6tlt9iGr+Is4iREacwubpGqreqmgZLZWV9uTMc01gAhv
         AEjtqu59OMlswOjZSvwSpK1vonpKiMou3fexjX9DSmcoYNqWqJkC4c67Bksfetsu6S
         QiEslE7KYPFYequD798AEuIcNMOq1Mqa/LHb0tp/Nj7kw9+CnOrWOgaR7j5+WEXqN+
         deggDviH2z7oA==
Date:   Fri, 17 Jan 2020 14:07:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the rcu tree
Message-ID: <20200117140717.35b9202d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MGGGDjpGt.O/SHJ9oXj.iUu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MGGGDjpGt.O/SHJ9oXj.iUu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rcu tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

security/keys/permission.c: In function 'key_set_acl':
security/keys/permission.c:273:2: error: implicit declaration of function '=
rcu_swap_protected' [-Werror=3Dimplicit-function-declaration]
  273 |  rcu_swap_protected(key->acl, acl, lockdep_is_held(&key->sem));
      |  ^~~~~~~~~~~~~~~~~~
security/keys/permission.c:273:36: error: implicit declaration of function =
'lockdep_is_held'; did you mean 'lockdep_is_held_type'? [-Werror=3Dimplicit=
-function-declaration]
  273 |  rcu_swap_protected(key->acl, acl, lockdep_is_held(&key->sem));
      |                                    ^~~~~~~~~~~~~~~
      |                                    lockdep_is_held_type

Caused by commit

  4414abf89158 ("rcu: Remove rcu_swap_protected()")

interacting with commit

  af94dc1ff4c9 ("keys: Replace uid/gid/perm permissions checking with an AC=
L")

from the keys tree.

I have added this merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 17 Jan 2020 14:04:13 +1100
Subject: [PATCH] fixup 2 for removal of rcu_swap_protected

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 security/keys/permission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/keys/permission.c b/security/keys/permission.c
index a651b3fd2007..f42e67b51aea 100644
--- a/security/keys/permission.c
+++ b/security/keys/permission.c
@@ -270,7 +270,7 @@ long key_set_acl(struct key *key, struct key_acl *acl)
 		}
 	}
=20
-	rcu_swap_protected(key->acl, acl, lockdep_is_held(&key->sem));
+	acl =3D rcu_replace_pointer(key->acl, acl, lockdep_is_held(&key->sem));
 	key_put_acl(acl);
 	notify_key(key, NOTIFY_KEY_SETATTR, 0);
 	return 0;
--=20
2.24.0

--=20
Cheers,
Stephen Rothwell

--Sig_/MGGGDjpGt.O/SHJ9oXj.iUu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4hJOUACgkQAVBC80lX
0GxAXAf/Ya47KgPGcGzaNjLpzlXKKP3v8mXb7yNyCDa+XI3QSV5vPr9m/ou4Mc9T
BY019W9IvO/hmH1lKafsV8i277dL7idmQfbt0+NvljHmn0txah5nm7qZ7o47a95S
JJ3yCu+HFO6TPWhTfNL/9Eni4sSDgV1UwI+c1qvFbSK8R4Q2CPcchtx2MMd6YBRg
5lqMLDCDVnSl610nn6hYNiW4eV4OAhqmHX/kOTWr09gs2QHba4sGVFDHY32cfRQ5
CEfYIR++khT6zJFObHtq08YDnh9a/Xy4TixUoVOnU5hybEnDARz6asJg4He57Aq/
S7YbMqDBkSfZQnf2gv/+Z/TcVVzYvQ==
=dZ2D
-----END PGP SIGNATURE-----

--Sig_/MGGGDjpGt.O/SHJ9oXj.iUu--
