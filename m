Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F8A632DF74
	for <lists+linux-next@lfdr.de>; Fri,  5 Mar 2021 03:13:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbhCECM7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Mar 2021 21:12:59 -0500
Received: from ozlabs.org ([203.11.71.1]:39569 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229436AbhCECM7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 4 Mar 2021 21:12:59 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DsB8l36Lhz9sW1;
        Fri,  5 Mar 2021 13:12:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614910375;
        bh=Yp2wuxb9A97R0PvQOH40IWPNrbi1M4QcmdB3YTXxmKg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=idENEfOuCKbUM1hr9aZJA+jNOUqSDwSHJw7pRSRKn8ZCnx/8jdG8m2gBxcfj5nZVn
         78V8CSxO20B73Bef5apPCW6XZAbjdrhJEJZMmwi/SqY1ZYnHwqIZ9OizrWk2cbwsrW
         ujmdTbkTJY5EQBwBcBGLk18bBzQsX1AN86dvNDMaienm3YJ9R86CFMYPFDF7UzBo7t
         CImj8tE9asxikSMOK1oeZabYcv1wzNBUH3Sh8NAtldIDSNir8Iiu/YtAElvueMG/p9
         dz4P1xDjKayvKkXo13tmONeLF3zXFcXXgGLL8Lgvd+KjRnU/eDQ5RMJ4k6EqZZaxTe
         Ibw/tPAXoDHwA==
Date:   Fri, 5 Mar 2021 13:12:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "jay.xu@rock-chips.com" <jay.xu@rock-chips.com>
Cc:     "Linus Walleij" <linus.walleij@linaro.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
Message-ID: <20210305131252.649074fb@canb.auug.org.au>
In-Reply-To: <202103050846457413391@rock-chips.com>
References: <20210304121206.3a7ed310@canb.auug.org.au>
        <CACRpkdai3LnvJgaKKtP+Y+zgxyQ2Rir1k-CbX-6cbJPnYuvOaw@mail.gmail.com>
        <202103050813501649431@rock-chips.com>
        <CACRpkdadRm8xXENJNM+yrJp3w-gyB=hejcYMF6qpQErwbYL69A@mail.gmail.com>
        <202103050846457413391@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_zIZkXn7ftl=BXp_rbPHhhO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_zIZkXn7ftl=BXp_rbPHhhO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, 5 Mar 2021 08:46:46 +0800 "jay.xu@rock-chips.com" <jay.xu@rock-chip=
s.com> wrote:
>
> Thanks=EF=BC=8Cand I think i have miss to upstream the changes,
> I have resend them in a new thread.
>=20
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -155,9 +155,7 @@ config ARCH_REALTEK
>  config ARCH_ROCKCHIP
>         bool "Rockchip Platforms"
>         select ARCH_HAS_RESET_CONTROLLER
> -       select GPIOLIB
>         select PINCTRL
> -       select PINCTRL_ROCKCHIP
>         select PM
>         select ROCKCHIP_TIMER
>         help
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index b197d23324fb..970c18191f6f 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -179,10 +179,14 @@ config PINCTRL_OXNAS
> =20
>  config PINCTRL_ROCKCHIP
>         tristate "Rockchip gpio and pinctrl driver"
> +       select GPIOLIB
>         select PINMUX
>         select GENERIC_PINCONF
>         select GENERIC_IRQ_CHIP
>         select MFD_SYSCON
> +       default ARCH_ROCKCHIP
> +       help
> +         This support pinctrl and gpio driver for Rockchip SoCs.
> =20
>  config PINCTRL_RZA1
>         bool "Renesas RZ/A1 gpio and pinctrl driver"
>=20
>=20
> =20
> From: Linus Walleij
> Date: 2021-03-05 08:43
> To: jay.xu@rock-chips.com
> CC: Stephen Rothwell; Linux Kernel Mailing List; Linux Next Mailing List
> Subject: Re: Re: linux-next: build failure after merge of the pinctrl tree
> On Fri, Mar 5, 2021 at 1:13 AM jay.xu@rock-chips.com
> <jay.xu@rock-chips.com> wrote:
> =20
> > Could you show me the issue log ? =20
> =20
> It's attached to Stephen's original mail in this thread.

Sorry I lost the error message, but it was a reference to a symbol that
has no EXPORT_SYMBOL.  So building the driver as a module should show
the error.

--=20
Cheers,
Stephen Rothwell

--Sig_/_zIZkXn7ftl=BXp_rbPHhhO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBBk6QACgkQAVBC80lX
0GwBFgf/cFZ+ojaRP8oPlkAwC7uFIY7EpWSQiPYWYnWupU8gnRplaSEmrwltR/y6
m3IoJosySEGqH68Ry86qN6M4tWLsKk2Vl+dP3mZFmoQuiVcW5U6ffshh8bnoRDFL
mIcEDCsRRtGvE3Rd1e1HILu48LO+tFzEgxyJlTE0C6DcKT4ZGut/e77wyY4OFw5t
0yCX0YKl9uVXi+Mmz90vly4ubgw4PcNWVytO2U7kWHxoNr39iD5gjFDBJCnHgpWG
+yNmFhYexKLra2wdwwXR7h05nKf/DXR8Osz/oboPg3664ZqEh9zq2Ipl/XBJQb6I
hEFCZsIrwgmCwP6CLvJJQZgIPgX3SA==
=XHee
-----END PGP SIGNATURE-----

--Sig_/_zIZkXn7ftl=BXp_rbPHhhO--
