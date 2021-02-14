Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B193931B2F9
	for <lists+linux-next@lfdr.de>; Sun, 14 Feb 2021 23:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbhBNWMS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 17:12:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbhBNWMR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 14 Feb 2021 17:12:17 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B11C061574;
        Sun, 14 Feb 2021 14:11:37 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Df1fP271Rz9sBJ;
        Mon, 15 Feb 2021 09:11:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613340695;
        bh=2VBHLAm0gcOLzgX3KbA/12sDRFF4VuLYTHh+5XsshGI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Zytu0o2zbVFBwKdAEfr/7IDkO8FudNnJ6Y2wISo5ZMvK9G/oKxbPLtVJ9RlHvDIo9
         jE4adBlviOuRbCBhTpwUqpkG5HTq57LtpGM2ZkfExubuSL5y0dBPHtzEcmeq2Tzi95
         QBqYXYVquYiUye+EQSt+8FvByIODNafQmIw0uRUgVBAQ/eLFeM9t25Kbc8oW/VeklJ
         UwgGU40XvLNfI04nV7XoWRJzdImfmcbOrAaa5vJcDHSPiuQdSOwy7LdpIu+rAT+Pqg
         VeRirTf0R895b5yWH/8mtm5gQ96traqF4bj1h1WCxgR+7jVbUujm/gV+ij5r0fCt7Q
         H8QhWJvS/QQUQ==
Date:   Mon, 15 Feb 2021 09:11:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marc Zyngier <maz@kernel.org>, Olof Johansson <olof@lixom.net>,
        Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Paul Kocialkowski <contact@paulk.fr>,
        Samuel Holland <samuel@sholland.org>
Subject: Re: linux-next: manual merge of the irqchip tree with the sunxi
 tree
Message-ID: <20210215091124.46c005ad@canb.auug.org.au>
In-Reply-To: <20210201144259.102ae6ab@canb.auug.org.au>
References: <20210201144259.102ae6ab@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h8Cej0=nYg1drUa691HRZPR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/h8Cej0=nYg1drUa691HRZPR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 1 Feb 2021 14:42:59 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the irqchip tree got a conflict in:
>=20
>   Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-=
a20-sc-nmi.yaml
>=20
> between commit:
>=20
>   752b0aac99c7 ("dt-bindings: irq: sun7i-nmi: Add binding documentation f=
or the V3s NMI")
>=20
> from the sunxi tree and commit:
>=20
>   ad6b47cdef76 ("dt-bindings: irq: sun6i-r: Split the binding from sun7i-=
nmi")
>=20
> from the irqchip tree.
>=20
> I fixed it up (I think - see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>=20
> diff --cc Documentation/devicetree/bindings/interrupt-controller/allwinne=
r,sun7i-a20-sc-nmi.yaml
> index 4fd1e2780026,f34ecc8c7093..000000000000
> --- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,su=
n7i-a20-sc-nmi.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,su=
n7i-a20-sc-nmi.yaml
> @@@ -25,17 -25,7 +25,10 @@@ properties
>         - const: allwinner,sun6i-a31-sc-nmi
>           deprecated: true
>         - const: allwinner,sun7i-a20-sc-nmi
> -       - items:
> -           - const: allwinner,sun8i-a83t-r-intc
> -           - const: allwinner,sun6i-a31-r-intc
>  +      - items:
>  +          - const: allwinner,sun8i-v3s-nmi
>  +          - const: allwinner,sun9i-a80-nmi
>         - const: allwinner,sun9i-a80-nmi
> -       - items:
> -           - const: allwinner,sun50i-a64-r-intc
> -           - const: allwinner,sun6i-a31-r-intc
>         - items:
>             - const: allwinner,sun50i-a100-nmi
>             - const: allwinner,sun9i-a80-nmi

With the merge window about to open, this is a reminder that this
conflict still exists.  It is now between the arm-soc tree and the
irqchip tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/h8Cej0=nYg1drUa691HRZPR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmApoAwACgkQAVBC80lX
0GyvdQf/ZYGtB+JyRJNftVlhiweZaLh9ab6YXSL/BeFq5PlyahID57qAgVzfXJCy
5ekIgNiQGPL3QqfvTYVFHeoP4QU3RVJbPhchpi//gYBe4mFpEFcfQ793ezEi3ghU
+81/OuAcz6bsu0njJUVIKzhFuupnRdbIs3ypYNkyZOJaotCyQwTeNPIM6+5gQzM/
vh4FIg39h7oZxsA/zeImlDpr3lHeLx4eqY14Ei6IL4d98ZLn1yJzQN9f5/Vmq8GH
KjOG6dgngf8TN7b4RUHJ8mwIZ8kAhNZ2EtmHvKg439yKwJHV/k3YhK1XogrP5DbY
ua8WzRKOZo/gbYjJHf4KLjNFKzPnug==
=g1UE
-----END PGP SIGNATURE-----

--Sig_/h8Cej0=nYg1drUa691HRZPR--
