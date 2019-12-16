Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF24E11FC87
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2019 02:23:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbfLPBXi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Dec 2019 20:23:38 -0500
Received: from ozlabs.org ([203.11.71.1]:50125 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726299AbfLPBXh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 15 Dec 2019 20:23:37 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47bk784hz8z9sP6;
        Mon, 16 Dec 2019 12:23:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576459414;
        bh=bFoEp0Oze1uoHC2r3Fp1CEYcJF/UHb71fRXsGtfYZIY=;
        h=Date:From:To:Cc:Subject:From;
        b=isCPi/8AXANwUAv7CIHOP3YyUqe1M13CxS7FNwVn5LSnOYxaShAHu6U4KV7L8BEiI
         kCBNwYRS40ivvFQUmwcR7LZjzhhddVeBBkJaPj1MkaMBsBgoGVDQwvqOwxNW6G96x/
         0+LbVYrLtZhQo12LRpH75E0gr4AkkwSfufYRTZjnL1KceqqeJ11wUU82rC+vaKg32Q
         3KyGMKSI0kfWHS4dz62eEMLjq15DkSfKyOWtklUXKi44Ng1u2FmxDh/V3xrHIiNnC8
         4C6DjdvGRFSa27gZ1U9G2vVNi7pLyVNp2L0QmhRfYIRxqQn8zBilHXJhk19SZxz36s
         Zbp884+wsJXZA==
Date:   Mon, 16 Dec 2019 12:23:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Icenowy Zheng <icenowy@aosc.io>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20191216122331.43c766f1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zeyYGkAXi=.XMxUHhTLcnmI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zeyYGkAXi=.XMxUHhTLcnmI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/bridge/analogix/analogix-anx6345.c: In function 'anx6345_i2=
c_probe':
drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:738:30: error: implicit =
declaration of function 'i2c_new_dummy' [-Werror=3Dimplicit-function-declar=
ation]
  738 |    anx6345->i2c_clients[i] =3D i2c_new_dummy(client->adapter,
      |                              ^~~~~~~~~~~~~
drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:738:28: warning: assignm=
ent to 'struct i2c_client *' from 'int' makes pointer from integer without =
a cast [-Wint-conversion]
  738 |    anx6345->i2c_clients[i] =3D i2c_new_dummy(client->adapter,
      |                            ^

Caused by commit

  6aa192698089 ("drm/bridge: Add Analogix anx6345 support")

interacting with commit

  2c2f00ab1641 ("i2c: remove i2c_new_dummy() API")

=46rom Linus' tree.

I have applied the following fix up patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 16 Dec 2019 12:11:19 +1100
Subject: [PATCH] drm/bridge: fix up for removal of i2c_new_dummy()

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/g=
pu/drm/bridge/analogix/analogix-anx6345.c
index 9917ce0d86a0..56f55c53abfd 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -735,13 +735,13 @@ static int anx6345_i2c_probe(struct i2c_client *clien=
t,
 	/* Map slave addresses of ANX6345 */
 	for (i =3D 0; i < I2C_NUM_ADDRESSES; i++) {
 		if (anx6345_i2c_addresses[i] >> 1 !=3D client->addr)
-			anx6345->i2c_clients[i] =3D i2c_new_dummy(client->adapter,
+			anx6345->i2c_clients[i] =3D i2c_new_dummy_device(client->adapter,
 						anx6345_i2c_addresses[i] >> 1);
 		else
 			anx6345->i2c_clients[i] =3D client;
=20
-		if (!anx6345->i2c_clients[i]) {
-			err =3D -ENOMEM;
+		if (IS_ERR(anx6345->i2c_clients[i])) {
+			err =3D PTR_ERR(anx6345->i2c_clients[i]);
 			DRM_ERROR("Failed to reserve I2C bus %02x\n",
 				  anx6345_i2c_addresses[i]);
 			goto err_unregister_i2c;
--=20
2.24.0

--=20
Cheers,
Stephen Rothwell

--Sig_/zeyYGkAXi=.XMxUHhTLcnmI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl323JMACgkQAVBC80lX
0GxN4QgAj7cSKYl22karaXz89XosCJqL4gvGd9bkeZ5Xb+s0IxEa+wWqHBlypzSK
CgwKRM52IvdDillgu4OrUswwU3uOnGVwpDzhaAEPud2MlVHwW8FUVpVWXMS/R0T9
ioq2BZghynAVV4bk7BtJbqGT4/NWyLOLqMNRJc87ab314NQ/ndHVhND9dRRnarka
iDuQJA9LeT8a2nAVjK7h3eaX2kwBVOARZuOY5nODMeRyKzaYyWo4RVn4B5bCR+gY
wBugDDotCKnOgI3ZwdLySA9A5cPbySMuIXK5d30QDptp6vH0YzbI8nFc+/S7XFQm
RnTk93uuVVln84h0daNEeovw8VE/nQ==
=ycV+
-----END PGP SIGNATURE-----

--Sig_/zeyYGkAXi=.XMxUHhTLcnmI--
