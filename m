Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC54E31B309
	for <lists+linux-next@lfdr.de>; Sun, 14 Feb 2021 23:33:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbhBNWcq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 17:32:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbhBNWcq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 14 Feb 2021 17:32:46 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E368C061574;
        Sun, 14 Feb 2021 14:32:05 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Df26C2Wqjz9rx8;
        Mon, 15 Feb 2021 09:32:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613341923;
        bh=EZJjS3Rdzb3J6Gii2gqmr3BEC88ZK2mpSjbYiSFtcmU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hcisl3n9eBfpAMQElMiMDmOBofU2iKBJUr/Cnsy4WbbD5nKLJA07J0yszoMH3g9yT
         zKMDolJ3tLsSoBEzFkAcqmtPWQRRh4FxVesOxxDhx9rt89ORsz6i448gr7yM3zAYxL
         quvVF8YFocCjG7kmR0ooklxLtj7a5Gx+6KLGbLMLqN+wSeO2kFWQB2MH/X+RWuCMsf
         28XWeGnNtZBWv2bfmeWxrkGFORDHEN5Qp1Vsna8m1WTzHnS1ddGoRLGwH/KNSOqPw6
         k4EDH4EzPdiXvUo+CKF3SV00ooC4EIQc4XPqFkkAj3+N5YZcvCnu6PXYCAzS/x08J8
         +qvHw8pS43DLg==
Date:   Mon, 15 Feb 2021 09:32:02 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: linux-next: manual merge of the devicetree tree with the kbuild
 tree
Message-ID: <20210215093202.36611afd@canb.auug.org.au>
In-Reply-To: <20210205144540.1438cc3c@canb.auug.org.au>
References: <20210205144540.1438cc3c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+FhRm9KLzqSbGbpch4vcisr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+FhRm9KLzqSbGbpch4vcisr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 5 Feb 2021 14:45:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the devicetree tree got a conflict in:
>=20
>   scripts/Makefile.lib
>=20
> between commit:
>=20
>   d73a6a04c76a ("kbuild: use always-y instead of extra-y")
>=20
> from the kbuild tree and commit:
>=20
>   ce88c9c79455 ("kbuild: Add support to build overlays (%.dtbo)")
>=20
> from the devicetree tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc scripts/Makefile.lib
> index 6f248ff91982,b00855b247e0..000000000000
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@@ -85,12 -81,14 +85,14 @@@ always-y +=3D $(userprogs-always-y) $(use
>  =20
>   # DTB
>   # If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built
>  -extra-y				+=3D $(dtb-y)
>  -extra-$(CONFIG_OF_ALL_DTBS)	+=3D $(dtb-)
>  +always-y			+=3D $(dtb-y)
>  +always-$(CONFIG_OF_ALL_DTBS)	+=3D $(dtb-)
>  =20
>   ifneq ($(CHECK_DTBS),)
>  -extra-y +=3D $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
>  -extra-y +=3D $(patsubst %.dtbo,%.dt.yaml, $(dtb-y))
>  -extra-$(CONFIG_OF_ALL_DTBS) +=3D $(patsubst %.dtb,%.dt.yaml, $(dtb-))
>  -extra-$(CONFIG_OF_ALL_DTBS) +=3D $(patsubst %.dtbo,%.dt.yaml, $(dtb-))
>  +always-y +=3D $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
> ++always-y +=3D $(patsubst %.dtbo,%.dt.yaml, $(dtb-y))
>  +always-$(CONFIG_OF_ALL_DTBS) +=3D $(patsubst %.dtb,%.dt.yaml, $(dtb-))
> ++always-$(CONFIG_OF_ALL_DTBS) +=3D $(patsubst %.dtbo,%.dt.yaml, $(dtb-))
>   endif
>  =20
>   # Add subdir path

With the merge window about to open, this is a reminder that this
conflict still exists.


--=20
Cheers,
Stephen Rothwell

--Sig_/+FhRm9KLzqSbGbpch4vcisr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAppOIACgkQAVBC80lX
0Gz4gAf/ZCXGdW/QXP3Q3ZGRRQ9+4512u8mTGkkLfhY8QvJPwplR6bUOcl+CJmDP
jwYRM64bCiokxTubimeI2GcnE3jeHjVkxZEkZQmFRPcoa4AUkCcD2hp1f6tw2Bxm
wytHIUd5Ev4qFA3IQSRkI251NmQwAKV0bSDSfOGm/O4Z7zIV+0altOett6VdeI6e
LE5rYRzRQOCBoMoReaWWyFzkR74OMCLsXjvj30Ztw5emIrUZ/5yaE92RMfxkunm2
GTYBDrsOJCzeO06re7OgaFomi0qRIu34M9dNF6wPsQb4QTRnBHksQxV/og4ev+DX
GBys99RDHLxNSpIGOJ4VRgAqaJe2aQ==
=tYhV
-----END PGP SIGNATURE-----

--Sig_/+FhRm9KLzqSbGbpch4vcisr--
