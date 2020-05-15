Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6B761D4975
	for <lists+linux-next@lfdr.de>; Fri, 15 May 2020 11:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727977AbgEOJZr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 May 2020 05:25:47 -0400
Received: from ozlabs.org ([203.11.71.1]:45893 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727116AbgEOJZr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 May 2020 05:25:47 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Njgq5ZcLz9sSF;
        Fri, 15 May 2020 19:25:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589534745;
        bh=muRLTUUOnYbHS5PIqo+UvMZCb0F7z3QuHuwqATdQsjY=;
        h=Date:From:To:Cc:Subject:From;
        b=cXzxL1TscSm0gRAqy2KIZOL2igmFAa9KmiNN0sKEH9T+raSu5iLJx70KhcCFOJo7b
         SKYYyfzl4da5wQw0LHjWKMmPq/yuiXdqCaIogXvnPmfT02pPyn0/WsC3RIFMi5ep+6
         d7uaq7VyMTmoh7WUvfuq+iYH4UMRU8h20gqHkHBEb5GG0ysSUprQpRs3wUih69E1Wz
         1uf+d/tZjCRXpVvO5IsxzRiT78g8PpFRFzCoA9bUexIWcNnilQ20T+lEqfuERdd1Li
         trtI9QWMWxp1lLyYnDJ4nkxFlP92Pej4vBQtnl9zV5Dzx+Pjz6oEqlj025IQJr1Vsa
         DUjWm5qh2pUyA==
Date:   Fri, 15 May 2020 19:25:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>
Subject: linux-next: manual merge of the notifications tree with the vfs
 tree
Message-ID: <20200515192541.41b263e9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vRB8DqTHPTLJVuIbUWj=jR4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vRB8DqTHPTLJVuIbUWj=jR4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the notifications tree got a conflict in:

  fs/mount.h

between commit:

  9f6c61f96f2d ("proc/mounts: add cursor")

from the vfs tree and commit:

  cd7109637b0b ("watch_queue: Implement mount topology and attribute change=
 notifications")

from the notifications tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/mount.h
index c7abb7b394d8,9a49ea1e7365..000000000000
--- a/fs/mount.h
+++ b/fs/mount.h
@@@ -158,4 -161,16 +165,18 @@@ static inline bool is_anon_ns(struct mn
  	return ns->seq =3D=3D 0;
  }
 =20
 +extern void mnt_cursor_del(struct mnt_namespace *ns, struct mount *cursor=
);
++
+ #ifdef CONFIG_MOUNT_NOTIFICATIONS
+ extern void notify_mount(struct mount *triggered,
+ 			 struct mount *aux,
+ 			 enum mount_notification_subtype subtype,
+ 			 u32 info_flags);
+ #else
+ static inline void notify_mount(struct mount *triggered,
+ 				struct mount *aux,
+ 				enum mount_notification_subtype subtype,
+ 				u32 info_flags)
+ {
+ }
+ #endif

--Sig_/vRB8DqTHPTLJVuIbUWj=jR4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6+YBUACgkQAVBC80lX
0GyKYgf/VYfmeQnDJWjVMtojtpnAKXS38U7KlUREBn7Ok6croZHAoIjKI/gR8Lrm
xLIaXcfCMmrJKS0XcUVcCyDLCnSoqt2JF7VfmPEy9vfPdBOOQt1wyZ6Z5eje1Ss7
MvQBXBbSndEQS3cEY7rtWKfWmgiDBOQbq4MXRaKdmsFyBKY5Twib1LGyNUSCdSlI
ra5i9q1vffXuoSdCUts3dHarwUjX0zCsgmgBmGOgTSFNeWFFNeE4dxBMl+Ma4Ss1
aqQewcLptnBKnaSEsgc7dPhh53KWigSSreKGvmpNrumenCakF/mTK7zI27hbre+B
jTlVnps+prSsYzcb5mnFH9ScyC6p9g==
=oo3F
-----END PGP SIGNATURE-----

--Sig_/vRB8DqTHPTLJVuIbUWj=jR4--
