Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0A321121AC
	for <lists+linux-next@lfdr.de>; Wed,  4 Dec 2019 04:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbfLDDBK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Dec 2019 22:01:10 -0500
Received: from ozlabs.org ([203.11.71.1]:35801 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726482AbfLDDBJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 3 Dec 2019 22:01:09 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47SNsF3HKFz9sP3;
        Wed,  4 Dec 2019 14:01:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1575428466;
        bh=uD790YV9lLc8UOd6dYTKCT9GhFlkeZ7msSgxLLS2K9s=;
        h=Date:From:To:Cc:Subject:From;
        b=nDMijWZjI45a/5P2ZADfoa3YxKKbYq7g045tMnZyfGkGAfG/Stn2cC8KDhcfxfHm5
         Moea0EfwzCd/36DrBA772cOWNbPrddkVNBWQ2vAAmX+SrbrYGg6J0kdOzEJLK2ybjO
         RGUIXBJ1fISxUZirBy+FBu8HQrnT9V815iBOsyXtDPoJymgapU1iQG5KZCyFihIGx2
         j4q7IJbLglNxzP7KNVm9Mkp5NMDJg5IcD52L9/MUv9TxmVIMuYFKpheBdl2FBmZh+d
         xkgVXIIe1nnyxpdZsDL/r84Av8MmZLDk7qoSqoaO1mUDkMOz2s9V4QxrwSgBqQCFlf
         gRBkWGCPQ9sYA==
Date:   Wed, 4 Dec 2019 14:00:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "David S. Miller" <davem@davemloft.net>
Subject: linux-next: manual merge of the vhost tree with Linus' tree
Message-ID: <20191204140052.69d4b164@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mn0WCoZc9syp/B/hk4q3FrI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mn0WCoZc9syp/B/hk4q3FrI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vhost tree got a conflict in:

  drivers/net/ethernet/ti/cpsw.c

between commit:

  c5013ac1dd0e ("net: ethernet: ti: cpsw: move set of common functions in c=
psw_priv")

from Linus' tree and commit:

  29fd1db09264 ("netdev: pass the stuck queue to the timeout handler")

from the vhost tree.

I fixed it up (the code has been moved, so I applied the following merge
fix patch) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 4 Dec 2019 13:55:43 +1100
Subject: [PATCH] netdev: fix up for "pass the stuck queue to the timeout
 handler"

cpsw_ndo_tx_timeout() was moved

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/ethernet/ti/cpsw_priv.c | 2 +-
 drivers/net/ethernet/ti/cpsw_priv.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_priv.c b/drivers/net/ethernet/ti/=
cpsw_priv.c
index b833cc1d188c..4205c52ea86b 100644
--- a/drivers/net/ethernet/ti/cpsw_priv.c
+++ b/drivers/net/ethernet/ti/cpsw_priv.c
@@ -272,7 +272,7 @@ void soft_reset(const char *module, void __iomem *reg)
 	WARN(readl_relaxed(reg) & 1, "failed to soft-reset %s\n", module);
 }
=20
-void cpsw_ndo_tx_timeout(struct net_device *ndev)
+void cpsw_ndo_tx_timeout(struct net_device *ndev, unsigned int txqueue)
 {
 	struct cpsw_priv *priv =3D netdev_priv(ndev);
 	struct cpsw_common *cpsw =3D priv->cpsw;
diff --git a/drivers/net/ethernet/ti/cpsw_priv.h b/drivers/net/ethernet/ti/=
cpsw_priv.h
index bc726356a72c..b8d7b924ee3d 100644
--- a/drivers/net/ethernet/ti/cpsw_priv.h
+++ b/drivers/net/ethernet/ti/cpsw_priv.h
@@ -449,7 +449,7 @@ int cpsw_rx_poll(struct napi_struct *napi_rx, int budge=
t);
 void cpsw_rx_vlan_encap(struct sk_buff *skb);
 void soft_reset(const char *module, void __iomem *reg);
 void cpsw_set_slave_mac(struct cpsw_slave *slave, struct cpsw_priv *priv);
-void cpsw_ndo_tx_timeout(struct net_device *ndev);
+void cpsw_ndo_tx_timeout(struct net_device *ndev, unsigned int txqueue);
 int cpsw_need_resplit(struct cpsw_common *cpsw);
 int cpsw_ndo_ioctl(struct net_device *dev, struct ifreq *req, int cmd);
 int cpsw_ndo_set_tx_maxrate(struct net_device *ndev, int queue, u32 rate);
--=20
2.24.0

--=20
Cheers,
Stephen Rothwell

--Sig_/mn0WCoZc9syp/B/hk4q3FrI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3nIWQACgkQAVBC80lX
0GwNVAf/RJIsa2GxVJUsyIhjVIZYyzLBX9NHukT+jzMWIh1R4ZIIoXEoRwQlNa0d
qfDkVTtibdsWkpnnAsjDLIx7OVIkL05UPZJMNFM5NSWj6mmauxll6QbyALdL/Qpx
R9fZ8otf8myPvA4O/DGVlFPI7Amr0iT77mJEA5WDZI0nDzVjq4ihwuhP44WMHdDJ
hgs65nq2TUjUm6skxKgbMLFENuRuAikhwAcOcjy+oP1VvNjDULK0ljGzl1nZJnro
gHF4m+e1X9Apow2Pd/F6Thx3UidxWvIzK5E0HlrpLL/Bw+c7EOQk1f6coBN1yWK7
pv7/YHjst8S2ImxqzM3dvUEp7N78Cg==
=+oaZ
-----END PGP SIGNATURE-----

--Sig_/mn0WCoZc9syp/B/hk4q3FrI--
