Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49CB43FF733
	for <lists+linux-next@lfdr.de>; Fri,  3 Sep 2021 00:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239498AbhIBWfY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Sep 2021 18:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231642AbhIBWfX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Sep 2021 18:35:23 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95CDDC061575;
        Thu,  2 Sep 2021 15:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630622061;
        bh=lyoyX/bePetRBs1ZCaiOZcy2RzFgFtECR1L+iEUK07U=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UPLR5ZRE8ONuZYOTr9ludUR5WSZ/xHBtkkX5JGu2gZCMlrJWjUHfmVM7eoYcxDTws
         Xg/+DKJ4A+liFCue2616MhxFiKFrpMWXf65jGoNZ7OWyBWZeT5ycDSkwJbS6ZUrnC6
         y3ju+sIZ7R1NZ5ja5SWC+vcbqzKi1l5SuJfnL5JK5pf1bkjwy4B6q8PFp6aHtiBqya
         XHUcVyqPgjybsPlQij/zRvzEcvC2p8LkyuXaWyGFybW2pr8lutiE8dcWk4inKe2+X6
         VjIZbw8NzC8XQpj/ExjxPcKRMP17mYqdClS2LrxJXPnVBeYoMNmUKasHc49BUzzoyf
         40EfqtewLZeFQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H0whY1L3Bz9s5R;
        Fri,  3 Sep 2021 08:34:21 +1000 (AEST)
Date:   Fri, 3 Sep 2021 08:34:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the devicetree tree
Message-ID: <20210903083419.6981f63b@canb.auug.org.au>
In-Reply-To: <CAL_JsqKooHHmePPxRXGfB3DNfceO1=cdwAP=Esp-HUWtcaWefg@mail.gmail.com>
References: <20210824131850.62b29724@canb.auug.org.au>
        <CAL_JsqKooHHmePPxRXGfB3DNfceO1=cdwAP=Esp-HUWtcaWefg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aNVzspWrJxSH5/MJUIiK/wi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/aNVzspWrJxSH5/MJUIiK/wi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Tue, 24 Aug 2021 07:35:37 -0500 Rob Herring <robherring2@gmail.com> wrot=
e:
>
> On Mon, Aug 23, 2021 at 10:18 PM Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
> >
> > Hi all,
> >
> > After merging the devicetree tree, today's linux-next build (arm
> > multi_v7_defconfig) produced this warning:
> >
> > arch/arm/boot/dts/bcm2711-rpi-4-b.dts:220.10-231.4: Warning (pci_device=
_reg): /scb/pcie@7d500000/pci@1,0: PCI unit address format error, expected =
"0,0"
> > arch/arm/boot/dts/bcm2711-rpi-4-b.dts:220.10-231.4: Warning (pci_device=
_reg): /scb/pcie@7d500000/pci@1,0: PCI unit address format error, expected =
"0,0"
> >
> > Presumably exposed by commit
> >
> >   1ee7943c3343 ("kbuild: Enable dtc 'pci_device_reg' warning by default=
") =20
>=20
> Yep, that's expected. There's a couple on arm64 builds too.

These warnings are now in Linus' tree :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/aNVzspWrJxSH5/MJUIiK/wi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmExUWsACgkQAVBC80lX
0Gyiwgf+Nydu9lpvDh7RX4CpfH6zYQAZXO3Di8p5Gb5p5P0Dduzb/O4SkNaRn3VG
CV2P5s6W2N4OHtWytmPxw4DNtiu4TQN8GvKikmq2ZXlICoKoiTO0+cbUyEDeBR7U
/WpPD0hIRRPS23fkmRcuKfIHlha2i0UR0MevSvAsakv17f/fYy8ATwCoxilI25Yx
7hoiC99Ca6M+fTmIzlsc+aDnzqEBsHXOWG5oWKUiRXI97MY1q8fluqIlkvz4Fvsz
UrBLDD4OXlfXbQ6O8WYPWVvnsPI0OSsOi7dGn0rw+6YOvOZ/XMDEsDBYAw7V8ueE
Hj0AB0gF/pQHsqcgRdc3+ZVxWTPyHg==
=WNyO
-----END PGP SIGNATURE-----

--Sig_/aNVzspWrJxSH5/MJUIiK/wi--
