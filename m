Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4295115FDC
	for <lists+linux-next@lfdr.de>; Sun,  8 Dec 2019 00:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbfLGXpK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 7 Dec 2019 18:45:10 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:48763 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725847AbfLGXpK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 7 Dec 2019 18:45:10 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47VmKH54Vzz9sPn;
        Sun,  8 Dec 2019 10:45:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1575762307;
        bh=9QoTIi5oN0qeJMYv2TmpsX7SXOD92vZOtvoCMKpDJhU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tvz2jTpEE9puJKwkcKG0fGWUbpnDrIw7IyUURf+ssnK7jGk4iadcmYBDCDaN91sXP
         Fx8RWfO7kBGn286V0E+K+GzPnn0pGI3r3kccbCGHVOZoGNY1fh4wMzgyXePbjGACWr
         gUhF2OWqdt7PwOU+M8h/AbpMHqMutAlawRi6/LLft2Nz1vfe7bQ5hnKgCLXWV4MN/H
         T8DKt+3UGHx9tOF1K9e2iGLq/8hxSXQ88itP00B5v/lQBvxDMnxcU37J1tENERRk27
         4dVPRQufzmLHIcwm0kZ/JDDfsjUQYkenuIWTfWzp3ZhdXulYb7sWVdTVa+8Fy8l/CS
         G6oZDWo/5HvzA==
Date:   Sun, 8 Dec 2019 10:45:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vhost tree
Message-ID: <20191208104500.59e5c6a3@canb.auug.org.au>
In-Reply-To: <20191204142404.56631d84@canb.auug.org.au>
References: <20191204142404.56631d84@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/f38ebYue0nYaUdH/QtzxL8X";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/f38ebYue0nYaUdH/QtzxL8X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Wed, 4 Dec 2019 14:24:04 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> After merging the vhost tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/net/ethernet/atheros/atlx/atl1.c:2889:21: error: initialization o=
f 'void (*)(struct net_device *, unsigned int)' from incompatible pointer t=
ype 'void (*)(struct net_device *)' [-Werror=3Dincompatible-pointer-types]
>  2889 |  .ndo_tx_timeout  =3D atlx_tx_timeout,
>       |                     ^~~~~~~~~~~~~~~
> drivers/net/ethernet/atheros/atlx/atl1.c:2889:21: note: (near initializat=
ion for 'atl1_netdev_ops.ndo_tx_timeout')
>=20
> Caused by commit
>=20
>   29fd1db09264 ("netdev: pass the stuck queue to the timeout handler")
>=20
> I applied the following patch:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 4 Dec 2019 14:13:18 +1100
> Subject: [PATCH] netdev: another fix for "netdev: pass the stuck queue to=
 the
>  timeout handler"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/net/ethernet/atheros/atlx/atlx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/atheros/atlx/atlx.c b/drivers/net/ether=
net/atheros/atlx/atlx.c
> index 505a22c703f7..0941d07d0833 100644
> --- a/drivers/net/ethernet/atheros/atlx/atlx.c
> +++ b/drivers/net/ethernet/atheros/atlx/atlx.c
> @@ -183,7 +183,7 @@ static void atlx_clear_phy_int(struct atlx_adapter *a=
dapter)
>   * atlx_tx_timeout - Respond to a Tx Hang
>   * @netdev: network interface device structure
>   */
> -static void atlx_tx_timeout(struct net_device *netdev)
> +static void atlx_tx_timeout(struct net_device *netdev, unsigned int txqu=
eue)
>  {
>  	struct atlx_adapter *adapter =3D netdev_priv(netdev);
>  	/* Do the reset outside of interrupt context */
> --=20
> 2.24.0
>=20
> Then I got another build failure:
>=20
> drivers/net/ethernet/natsemi/ns83820.c: In function 'ns83820_tx_watch':
> drivers/net/ethernet/natsemi/ns83820.c:1606:3: error: too few arguments t=
o function 'ns83820_tx_timeout'
>  1606 |   ns83820_tx_timeout(ndev);
>       |   ^~~~~~~~~~~~~~~~~~
> drivers/net/ethernet/natsemi/ns83820.c:1552:13: note: declared here
>  1552 | static void ns83820_tx_timeout(struct net_device *ndev, unsigned =
int txqueue)
>       |             ^~~~~~~~~~~~~~~~~~
>=20
> At this point, I just used the vhost tree from next-20191203 ...

I am still getting these build failures ...
--=20
Cheers,
Stephen Rothwell

--Sig_/f38ebYue0nYaUdH/QtzxL8X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3sOXwACgkQAVBC80lX
0Gwn2wgAmOuQyZTXpyU1mVtKEJjRyeKCdsxD1NJTFJEoJe3OIJ4IInF2l02h3q1s
4lwbID7+6M2SCDH6S4fBF+shsWSXr/qGymEnmP59WrsssAg4djP+U+SYJB1kdYjf
Jtpp8GsL5aZZJdV+FvauDNXtsmInMRejLMirlM/vh4T/5dGJ5fD7YPWJvfwR0Pb0
RK9FjvlxGnjBN7A74fIFCGPWiDct6IvcDfSAcbmFTj5dHSyc9qxgQiFyW+skoxtx
kDhU18LNUglEL3ogln8P8DEhKX+iNspnDFfMQBYcKgOaTCCz8ZWzlPAqXDOFEy77
b2QgPiNzQomxmrez2Lp7O8+Ukv3PjQ==
=MzD/
-----END PGP SIGNATURE-----

--Sig_/f38ebYue0nYaUdH/QtzxL8X--
