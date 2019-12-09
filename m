Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4C6E116482
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2019 01:40:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726665AbfLIAkz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 8 Dec 2019 19:40:55 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:56359 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726654AbfLIAkz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 8 Dec 2019 19:40:55 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47WPW60bhZz9sPK;
        Mon,  9 Dec 2019 11:40:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1575852051;
        bh=Y51mbICWbQ17qbJ6QVCrfYRSmYhrSCHqh5JKG2KaBK0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=niAoQnO2hWdI76DLX8hoQElOjmp4kJygaCT5YB23OsPIgrMh6g1qIvx2nwVifH7hd
         qvJDh45k9eV/Ger2HUns8C4Pb4fr84z6xHDqA7SPotzEfYt+pnGrkh1gz7Zn0qHjmG
         /Hfv+cv78o4zvKnTBU0SJW8SrVLZGGA88KiQyrKW0nx64bEsDvKUQ68OcZms5gGocL
         cT5jkzLlhovB6ngMh7+OyBz/Mmy/WmZHph5+qy3YMKd6uhpA5sV7T81tvpsbU6slFB
         WEXJe2AEJ2/j69UlvIlrUwUbBK2D0dFA6URtt2Ed+ybizAF8NcQHzWjEs7xHacDeyk
         MY1aKmQpAsobw==
Date:   Mon, 9 Dec 2019 11:40:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the vhost tree with Linus' tree
Message-ID: <20191209114040.65a1353d@canb.auug.org.au>
In-Reply-To: <20191204140052.69d4b164@canb.auug.org.au>
References: <20191204140052.69d4b164@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8OsldEOC2m4rmi1f+N_KPvm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8OsldEOC2m4rmi1f+N_KPvm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Wed, 4 Dec 2019 14:00:52 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the vhost tree got a conflict in:
>=20
>   drivers/net/ethernet/ti/cpsw.c
>=20
> between commit:
>=20
>   c5013ac1dd0e ("net: ethernet: ti: cpsw: move set of common functions in=
 cpsw_priv")
>=20
> from Linus' tree and commit:
>=20
>   29fd1db09264 ("netdev: pass the stuck queue to the timeout handler")
>=20
> from the vhost tree.
>=20
> I fixed it up (the code has been moved, so I applied the following merge
> fix patch) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be mentioned
> to your upstream maintainer when your tree is submitted for merging.
> You may also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 4 Dec 2019 13:55:43 +1100
> Subject: [PATCH] netdev: fix up for "pass the stuck queue to the timeout
>  handler"
>=20
> cpsw_ndo_tx_timeout() was moved
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/net/ethernet/ti/cpsw_priv.c | 2 +-
>  drivers/net/ethernet/ti/cpsw_priv.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/ti/cpsw_priv.c b/drivers/net/ethernet/t=
i/cpsw_priv.c
> index b833cc1d188c..4205c52ea86b 100644
> --- a/drivers/net/ethernet/ti/cpsw_priv.c
> +++ b/drivers/net/ethernet/ti/cpsw_priv.c
> @@ -272,7 +272,7 @@ void soft_reset(const char *module, void __iomem *reg)
>  	WARN(readl_relaxed(reg) & 1, "failed to soft-reset %s\n", module);
>  }
> =20
> -void cpsw_ndo_tx_timeout(struct net_device *ndev)
> +void cpsw_ndo_tx_timeout(struct net_device *ndev, unsigned int txqueue)
>  {
>  	struct cpsw_priv *priv =3D netdev_priv(ndev);
>  	struct cpsw_common *cpsw =3D priv->cpsw;
> diff --git a/drivers/net/ethernet/ti/cpsw_priv.h b/drivers/net/ethernet/t=
i/cpsw_priv.h
> index bc726356a72c..b8d7b924ee3d 100644
> --- a/drivers/net/ethernet/ti/cpsw_priv.h
> +++ b/drivers/net/ethernet/ti/cpsw_priv.h
> @@ -449,7 +449,7 @@ int cpsw_rx_poll(struct napi_struct *napi_rx, int bud=
get);
>  void cpsw_rx_vlan_encap(struct sk_buff *skb);
>  void soft_reset(const char *module, void __iomem *reg);
>  void cpsw_set_slave_mac(struct cpsw_slave *slave, struct cpsw_priv *priv=
);
> -void cpsw_ndo_tx_timeout(struct net_device *ndev);
> +void cpsw_ndo_tx_timeout(struct net_device *ndev, unsigned int txqueue);
>  int cpsw_need_resplit(struct cpsw_common *cpsw);
>  int cpsw_ndo_ioctl(struct net_device *dev, struct ifreq *req, int cmd);
>  int cpsw_ndo_set_tx_maxrate(struct net_device *ndev, int queue, u32 rate=
);
> --=20
> 2.24.0

I still need the above merge fix up.
--=20
Cheers,
Stephen Rothwell

--Sig_/8OsldEOC2m4rmi1f+N_KPvm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3tmAgACgkQAVBC80lX
0GysHQf/ZBLlS7lpCpNNWO8/prp0iN6v+tVZ5MQ2HEDN18ehqi5HI+EJsXYt+2ye
yLhoqgVFFeW3CIfHoSa/xQSGduEocJOszP1W9kq2Dpq7QtIUfGp5Ph/wIFMZ0o3g
OEUJuOXWXTVtCR+hfQGKT4VniqAoEGEADn5w2WDB8kHLt/MZRwtdkF6IdbGLn6Nz
KLJXUgb91cr4t7pFwzNuBrRsWOU8XoVBTkBbAXFgDPTjbvfVI6C/kxZVXZdAUpH+
FmY42hmGIpMh5UrTSrC17trl9dDRuQuQtc4Oxd0ZO5Y0iFQKkMcinID0AVU4lGzw
FynEfEmYIrDMMNKXVPsZ6x4tWDGvfg==
=kIhA
-----END PGP SIGNATURE-----

--Sig_/8OsldEOC2m4rmi1f+N_KPvm--
