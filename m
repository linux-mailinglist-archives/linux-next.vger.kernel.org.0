Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E34F19CD54
	for <lists+linux-next@lfdr.de>; Fri,  3 Apr 2020 01:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388715AbgDBXIT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Apr 2020 19:08:19 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42807 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732600AbgDBXIT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Apr 2020 19:08:19 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48tdyk4kLXz9sPF;
        Fri,  3 Apr 2020 10:08:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585868897;
        bh=xjh9AgkxUA5QJJTBCFGf5e9Ac6fS8f/uGzdRf6ffL4U=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=uW+kxEWSqf9a3f7i5pWR0QAMRc6Z4beWF7OFweWnfXUocMFNiK3XhaAi45g/Gjhev
         fLfOkIHZ8ta9q4HT0KZvph1Cvgj1+51q/SwhlzC/YVlJ48sOKwk1lzsD6YNcKGgr+u
         DGlEnE9+VYuqS3xCGd3rQO5L6Zyw+ahIMFgOsmRU/1SrK+W6FpKXX61WvSsMXvtKGc
         2KTzHzVPVi3Ra5H2dxoVQl/e5Gt4S/S6Z1qAVMawfK4BDG/GMPyJHZxawyktbSi8ZN
         EMmaBmreJ0ghjGyksFWIi/vLxVG9qbYCNWGTsIomaC01VoVJ/2aA45r3/RiLEvejp0
         69Bz5AkOmcAzw==
Date:   Fri, 3 Apr 2020 10:08:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Tony Lindgren <tony@atomide.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: linux-next: manual merge of the drm tree with the omap tree
Message-ID: <20200403100810.09e27872@canb.auug.org.au>
In-Reply-To: <20200318135034.242d9edf@canb.auug.org.au>
References: <20200318135034.242d9edf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9XvUIyYhQ_VUv6ebWs45tsP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9XvUIyYhQ_VUv6ebWs45tsP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 18 Mar 2020 13:50:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm tree got a conflict in:
>=20
>   arch/arm/configs/omap2plus_defconfig
>=20
> between commit:
>=20
>   98c2cc359f8f ("ARM: omap2plus_defconfig: Update for moved and dropped o=
ptions")
>=20
> from the omap tree and commit:
>=20
>   e7e67d9a2f1d ("drm/omap: Switch the HDMI and VENC outputs to drm_bridge=
")
>=20
> from the drm tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc arch/arm/configs/omap2plus_defconfig
> index eedb26ff93f9,54f1a21de7e0..000000000000
> --- a/arch/arm/configs/omap2plus_defconfig
> +++ b/arch/arm/configs/omap2plus_defconfig
> @@@ -360,10 -353,10 +360,9 @@@ CONFIG_OMAP2_DSS_DSI=3D
>   CONFIG_DRM_OMAP_PANEL_DSI_CM=3Dm
>   CONFIG_DRM_TILCDC=3Dm
>   CONFIG_DRM_PANEL_SIMPLE=3Dm
> + CONFIG_DRM_DISPLAY_CONNECTOR=3Dm
> + CONFIG_DRM_SIMPLE_BRIDGE=3Dm
>  -CONFIG_DRM_TI_TFP410=3Dm
> + CONFIG_DRM_TI_TPD12S015=3Dm
>   CONFIG_DRM_PANEL_LG_LB035Q02=3Dm
>   CONFIG_DRM_PANEL_NEC_NL8048HL11=3Dm
>   CONFIG_DRM_PANEL_SHARP_LS037V7DW01=3Dm

This is now a conflict between the arm-soc tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/9XvUIyYhQ_VUv6ebWs45tsP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6GcFoACgkQAVBC80lX
0GyOngf/eygzgm029Brs1/8L3hVH03GHwrwtdkYN8ZyMRVN31zCLrWZCPwgG0Cb7
hzGXZbuQe0haxrgRCMUIHX6oePqmmWe51RrCsxreyHgWKcB27MiYiqf/GQYzIRss
hb9h2RkQEfE6ZMoGgZegiBIH7UmLNYa2MdWmeDL+k1qA4q3LY25Wbszsfa/GngKp
AvMY3RJAIuvLv5Ztv194zAjt/3eAMY4I+Ldp73TPAaacWkkI7ln4/4DWL9c3pcag
o+/HepxZrC3JSbdEaFj55Ey2Qy0N1VlTIEtoOpniAyCODZ1V4sQNWAjTwmu+Qhoe
iQW1YRoRdLk15BEZWzJrposx+K5TzA==
=dPjZ
-----END PGP SIGNATURE-----

--Sig_/9XvUIyYhQ_VUv6ebWs45tsP--
