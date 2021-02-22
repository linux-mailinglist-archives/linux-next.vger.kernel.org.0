Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFB1D32226D
	for <lists+linux-next@lfdr.de>; Mon, 22 Feb 2021 23:56:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbhBVW4k (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Feb 2021 17:56:40 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:35525 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229902AbhBVW4i (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 22 Feb 2021 17:56:38 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DkyG428Jcz9sVR;
        Tue, 23 Feb 2021 09:55:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614034556;
        bh=YGbyfBCqyDeORyWh7vBb5P38QO8qcnOEq6JEeUbAiaQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hTjNGtkc3yJYiKi9r3t8t7duyARK5ZRJiSsUdcPVo7qXkP4ukjdLkpuFJuZpn9HgJ
         seGuP3CziYDhi73M1FaKgtEc+OW6C63sWLtvzK9FrrqmgMQeojzFle6tk4jj/98RYc
         drO2szYvvky5afBN36VuqW1pqB/OYZLPCRr4oHRucdfhNPcdV8iuYs5IfDRku3syGZ
         wZ5O2ZjNfbmYjM5x2/HBOtzo1GkC+j3HWQX1x8HtwTnTBv+fZbaq3mLJbdv1IRaiQY
         eigjIasv/NX4AfrWPiklvtc3qpM2tJKdrdSrw7srjtKBx0dlXA//Kgc+DZO0rSIy2T
         kc5+oucuooBiA==
Date:   Tue, 23 Feb 2021 09:55:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Rob Herring <robherring2@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: linux-next: manual merge of the devicetree tree with the kbuild
 tree
Message-ID: <20210223095555.70ee4c0c@canb.auug.org.au>
In-Reply-To: <20210215093202.36611afd@canb.auug.org.au>
References: <20210205144540.1438cc3c@canb.auug.org.au>
        <20210215093202.36611afd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hPzXB8sr3EZQc_SVxxI3ZU9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hPzXB8sr3EZQc_SVxxI3ZU9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 15 Feb 2021 09:32:02 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Fri, 5 Feb 2021 14:45:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >=20
> > Today's linux-next merge of the devicetree tree got a conflict in:
> >=20
> >   scripts/Makefile.lib
> >=20
> > between commit:
> >=20
> >   d73a6a04c76a ("kbuild: use always-y instead of extra-y")
> >=20
> > from the kbuild tree and commit:
> >=20
> >   ce88c9c79455 ("kbuild: Add support to build overlays (%.dtbo)")
> >=20
> > from the devicetree tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >=20
> > diff --cc scripts/Makefile.lib
> > index 6f248ff91982,b00855b247e0..000000000000
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@@ -85,12 -81,14 +85,14 @@@ always-y +=3D $(userprogs-always-y) $(use
> >  =20
> >   # DTB
> >   # If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built
> >  -extra-y				+=3D $(dtb-y)
> >  -extra-$(CONFIG_OF_ALL_DTBS)	+=3D $(dtb-)
> >  +always-y			+=3D $(dtb-y)
> >  +always-$(CONFIG_OF_ALL_DTBS)	+=3D $(dtb-)
> >  =20
> >   ifneq ($(CHECK_DTBS),)
> >  -extra-y +=3D $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
> >  -extra-y +=3D $(patsubst %.dtbo,%.dt.yaml, $(dtb-y))
> >  -extra-$(CONFIG_OF_ALL_DTBS) +=3D $(patsubst %.dtb,%.dt.yaml, $(dtb-))
> >  -extra-$(CONFIG_OF_ALL_DTBS) +=3D $(patsubst %.dtbo,%.dt.yaml, $(dtb-))
> >  +always-y +=3D $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
> > ++always-y +=3D $(patsubst %.dtbo,%.dt.yaml, $(dtb-y))
> >  +always-$(CONFIG_OF_ALL_DTBS) +=3D $(patsubst %.dtb,%.dt.yaml, $(dtb-))
> > ++always-$(CONFIG_OF_ALL_DTBS) +=3D $(patsubst %.dtbo,%.dt.yaml, $(dtb-=
))
> >   endif
> >  =20
> >   # Add subdir path =20
>=20
> With the merge window about to open, this is a reminder that this
> conflict still exists.

This is now a conflict between the kbuild tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/hPzXB8sr3EZQc_SVxxI3ZU9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA0NnsACgkQAVBC80lX
0GxL9QgAiRTX5n+xJDlJAklQdheB33nFHd6bQj4wQIN5hDML/AOxxG4gs4cdwwfv
NUX6XYLL/XJbGbrzUa5vox7IofLH3znpnAHBwiRIhwTRwwhMZqgTuAZi8CLpVhA7
+PM0P9K1i1R+6/gGFJjVDRaVT2Z9uZ0ypGEPPuzDUjCF8GRPLx4FiqGAZWyi+blX
H1Wfh/SYApOd9232DEq/Frdc8uQmHPOcLB/dubF9UFam21G2etvDxVYTJ/Ph7H3/
c+1vNiQaloQPsyYq2jZg/8aYxLaclUkwmaHYkvjX8IeBZkVCjLJqoygiUzKmo5/0
lsd7ksNRjZcS0B2CVPMLcEfe3/rbgw==
=7w1X
-----END PGP SIGNATURE-----

--Sig_/hPzXB8sr3EZQc_SVxxI3ZU9--
