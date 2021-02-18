Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1FD31E538
	for <lists+linux-next@lfdr.de>; Thu, 18 Feb 2021 05:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhBREtw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Feb 2021 23:49:52 -0500
Received: from ozlabs.org ([203.11.71.1]:37617 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229864AbhBREtv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Feb 2021 23:49:51 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dh2Kk58Ssz9sSC;
        Thu, 18 Feb 2021 15:48:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613623747;
        bh=U3pXJmB/9mHsJ9I2grqn2rpy0G5O3rUt2PR33nNR7ts=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WOdFP5BWDC4PVDQX3aHnTLcUXgg7NgiMvsXIe092iiFP+sItHIJyZ7jqKY/ROhkDV
         3x7pEEsI9ubfWAtVPJm20Qwx7uxfd4wIsAdLSP2ogvpclA4+H7ek+a3KGoML2Lb32s
         +CvhmGrJH9t3lGXlY8X06vwaOjIMp3+Ln2OTuk4rP2Te/7AOjbzkEGBG4RKGI9EhIb
         uz9BnfqBvNx8SKspw9HQGGzbh8jaOUVr4GCCgwH72EQ8zy9Wc1IEhFWXjhIDR+PRRX
         mlqTZd45h0sOiLALxj/RN9znQ3Sdpc+vIHHhL7jSkmdwXgVWx/ASvUxLZ/j0g4NIoh
         +B9/sYTlgXRkQ==
Date:   Thu, 18 Feb 2021 15:48:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Marc Zyngier <maz@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Paul Kocialkowski <contact@paulk.fr>,
        Samuel Holland <samuel@sholland.org>
Subject: Re: linux-next: manual merge of the irqchip tree with the sunxi
 tree
Message-ID: <20210218154857.75bad5df@canb.auug.org.au>
In-Reply-To: <20210215091124.46c005ad@canb.auug.org.au>
References: <20210201144259.102ae6ab@canb.auug.org.au>
        <20210215091124.46c005ad@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/81Mwa=wdGo=IUKVht5j+jdK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/81Mwa=wdGo=IUKVht5j+jdK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 15 Feb 2021 09:11:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 1 Feb 2021 14:42:59 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > Today's linux-next merge of the irqchip tree got a conflict in:
> >=20
> >   Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7=
i-a20-sc-nmi.yaml
> >=20
> > between commit:
> >=20
> >   752b0aac99c7 ("dt-bindings: irq: sun7i-nmi: Add binding documentation=
 for the V3s NMI")
> >=20
> > from the sunxi tree and commit:
> >=20
> >   ad6b47cdef76 ("dt-bindings: irq: sun6i-r: Split the binding from sun7=
i-nmi")
> >=20
> > from the irqchip tree.
> >=20
> > I fixed it up (I think - see below) and can carry the fix as
> > necessary. This is now fixed as far as linux-next is concerned, but any
> > non trivial conflicts should be mentioned to your upstream maintainer
> > when your tree is submitted for merging.  You may also want to consider
> > cooperating with the maintainer of the conflicting tree to minimise any
> > particularly complex conflicts.
> >=20
> > diff --cc Documentation/devicetree/bindings/interrupt-controller/allwin=
ner,sun7i-a20-sc-nmi.yaml
> > index 4fd1e2780026,f34ecc8c7093..000000000000
> > --- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,=
sun7i-a20-sc-nmi.yaml
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,=
sun7i-a20-sc-nmi.yaml
> > @@@ -25,17 -25,7 +25,10 @@@ properties
> >         - const: allwinner,sun6i-a31-sc-nmi
> >           deprecated: true
> >         - const: allwinner,sun7i-a20-sc-nmi
> > -       - items:
> > -           - const: allwinner,sun8i-a83t-r-intc
> > -           - const: allwinner,sun6i-a31-r-intc
> >  +      - items:
> >  +          - const: allwinner,sun8i-v3s-nmi
> >  +          - const: allwinner,sun9i-a80-nmi
> >         - const: allwinner,sun9i-a80-nmi
> > -       - items:
> > -           - const: allwinner,sun50i-a64-r-intc
> > -           - const: allwinner,sun6i-a31-r-intc
> >         - items:
> >             - const: allwinner,sun50i-a100-nmi
> >             - const: allwinner,sun9i-a80-nmi =20
>=20
> With the merge window about to open, this is a reminder that this
> conflict still exists.  It is now between the arm-soc tree and the
> irqchip tree.

This is now a conflict between the arm-soc tree and the tip tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/81Mwa=wdGo=IUKVht5j+jdK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAt8bkACgkQAVBC80lX
0GxAmgf/QddCsP/621qMYpNzwzYcGTi0/qD4s82f14UQzRZ1/0U60Pj0Bm5hr7Ci
a4mY58RUibDy/ODyBJI7HfYdiNhH6Dqz6WY2SCKZ+scVMXgKzlJS6qyRlPUFQmCB
3q64uLJhoMySuvpN34xHu43RwYGnCe3NfpouLu5acOINQAlQFKQy8OtusmEmc3zl
3l1rv/uIuJwF3Ylt6ukBlt6OThMCWsJ3+WqnN+kCes8QA4OuBbQ2ipGzGqB5qCRd
bLfYG4HmRByeO1b6SEZgjPtXsMouDUeQE+cDHSlvw04sTs5AHrRecZZ2n0n+druW
vVFxdE9kgr6Ajr5GVSTiXaOUX7sJKw==
=NeFd
-----END PGP SIGNATURE-----

--Sig_/81Mwa=wdGo=IUKVht5j+jdK--
