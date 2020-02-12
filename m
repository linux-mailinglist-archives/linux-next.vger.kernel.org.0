Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0197215B413
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2020 23:48:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727692AbgBLWsr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 Feb 2020 17:48:47 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:49387 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728603AbgBLWsr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 12 Feb 2020 17:48:47 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48HvvK0qmSz9s1x;
        Thu, 13 Feb 2020 09:48:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581547725;
        bh=7MTWO8ALLh5y8cP63+tLZI7W7tp7MQmmOxjTpe7xR0g=;
        h=Date:From:To:Cc:Subject:From;
        b=SjLXJ7pz8/Nw5+xF6FxqIZ2pz4/k1iZb4aYDmEbXiC2I9KooYmyuHr1nTlmVjP3K8
         XyFHF2BMUipcKXq7mF2gOatlcyGPypFXBW5F1WjXJnc3ncNwZgEn4Ds+adRvVXWPg1
         w2Ijpbs0xYq6UNPqs3pzwFb+qPfTiTsw85aq8+ZqE3H0QIqzACRTaiKStfgG26kfIN
         L0geQ9S3zJi5ax3sJWslxiJQlnsqVSKIS7pk79+bIxMUuN8BUoGdAF+OaTtvB++fxi
         JLaRZmI4uM0oj8vgyPKe3zO2KWuU/vq5TH3ZbULjXJ8vy+R+yHRbIRxbIS8CAry3Ex
         x/Gw/jZLZvw/g==
Date:   Thu, 13 Feb 2020 09:48:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paul Moore <paul@paul-moore.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hridya Valsaraju <hridya@google.com>,
        Connor O'Brien <connoro@google.com>
Subject: linux-next: manual merge of the selinux tree with Linus' tree
Message-ID: <20200213094844.6bafd9e1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//+TgZ+HvOmgRa9/AjaIXjhj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//+TgZ+HvOmgRa9/AjaIXjhj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the selinux tree got a conflict in:

  security/selinux/hooks.c

between commit:

  a20456aef80f ("selinux: fix typo in filesystem name")

from Linus' tree and commit:

  4ca54d3d3022 ("security: selinux: allow per-file labeling for bpffs")

from the selinux tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc security/selinux/hooks.c
index ae891d712800,44f6f4e20cba..000000000000
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@@ -698,7 -701,8 +701,8 @@@ static int selinux_set_mnt_opts(struct=20
 =20
  	if (!strcmp(sb->s_type->name, "debugfs") ||
  	    !strcmp(sb->s_type->name, "tracefs") ||
 -	    !strcmp(sb->s_type->name, "binderfs") ||
 +	    !strcmp(sb->s_type->name, "binder") ||
+ 	    !strcmp(sb->s_type->name, "bpf") ||
  	    !strcmp(sb->s_type->name, "pstore"))
  		sbsec->flags |=3D SE_SBGENFS;
 =20

--Sig_//+TgZ+HvOmgRa9/AjaIXjhj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5EgMwACgkQAVBC80lX
0Gx69Af/dhdVp6t5LRp4/xZFS0/el+Mn5fKJK9YUfJkBANCOqMkdfm2Bh+FHaWzH
k06M/rsAMAt3LzA6ceT2seOO/hA31z5trnQT/Vdh/tOdviSTXHM8w4aYE26aYWDk
QVS/TdpKgDDIVLtHvC9D0YH9rBsGQQFxkNjeV8NsNbY12yu3JSTeBdk3i2E1Hs30
0t0fzvXt3r+4QyCCXX/5i/aJKhr84WQWtGbpeLdBfCu+hciSBxW10LbGqMAJizk4
cquK83PpZ0I19w16DowU/eAlBQu0a3qdPdkce9OAfqZEjqMcZ0fxpur/BgLNnSMd
lwTrxRM5JML/9JesetLtuufhp7F70Q==
=PEHO
-----END PGP SIGNATURE-----

--Sig_//+TgZ+HvOmgRa9/AjaIXjhj--
