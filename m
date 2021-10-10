Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8141E4283C4
	for <lists+linux-next@lfdr.de>; Sun, 10 Oct 2021 23:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232748AbhJJV3H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 Oct 2021 17:29:07 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:51383 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbhJJV3H (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 10 Oct 2021 17:29:07 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HSFPQ0CpGz4xb9;
        Mon, 11 Oct 2021 08:27:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633901226;
        bh=Tdpa6xnFc3ophnWEiOl1ld3ry0k/KgAZC1Myk8IqKNE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mcgfXPRRZC7Eo3EhA1j7l7YmgqLE0qefC1LBZanrPS/alYfJN861aigEFznukuT/R
         BSpO420gbDzloZGrULJ81Wqcf4m8zgWHFBfTeh7VHlEHo+Zg/AeuRFKF122XzhHILZ
         kfmSlcvhoEzxk2+kGYAzdksFUk0ZhTLqvDGmHfulpWl9OqU8tLzFcttjXL+KPuZq/T
         npDi8IuqVpLVlS+szraSwypKUFpu3exd/JjPq3Nsvbmcecx+FjyD2d9ox5isCGmyik
         RNnpb2KlGPh9+xNkSLwkFovpNk12BDMJ0ugHUjr6Dg18Em22YiqKad4XJU1/ctksUu
         mcTZHDJMk3BFw==
Date:   Mon, 11 Oct 2021 08:27:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: linux-next: build warnings in Linus' tree
Message-ID: <20211011082704.3cff4568@canb.auug.org.au>
In-Reply-To: <20211008164728.30e3d3a3@canb.auug.org.au>
References: <20211008164728.30e3d3a3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xIyb51QYuHZd2a6dL62QVXX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xIyb51QYuHZd2a6dL62QVXX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[Cc'ing Rob]

Rob: these warnings have been there for a long time ...

On Fri, 8 Oct 2021 16:47:28 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> After merging the origin tree, today's linux-next build (powerpc
> allyesconfig) produced these warnings (along with many others):
>=20
> arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /=
pci@f0000d00: missing ranges for PCI bridge (or not a bridge)
> arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /=
pci@f0000d00: missing ranges for PCI bridge (or not a bridge)
> arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /=
pci@f0000d00: missing ranges for PCI bridge (or not a bridge)
> arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /=
pci@f0000d00: missing ranges for PCI bridge (or not a bridge)
> arch/powerpc/boot/dts/mpc5200b.dtsi:182.18-186.5: Warning (spi_bus_bridge=
): /soc5200@f0000000/psc@2000: node name for SPI buses should be 'spi'
> arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /=
pci@f0000d00: missing ranges for PCI bridge (or not a bridge)
> arch/powerpc/boot/dts/mpc5200b.dtsi:182.18-186.5: Warning (spi_bus_bridge=
): /soc5200@f0000000/psc@2000: node name for SPI buses should be 'spi'
> arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /=
pci@f0000d00: missing ranges for PCI bridge (or not a bridge)
> arch/powerpc/boot/dts/mpc5200b.dtsi:182.18-186.5: Warning (spi_bus_bridge=
): /soc5200@f0000000/psc@2000: node name for SPI buses should be 'spi'
> arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /=
pci@f0000d00: missing ranges for PCI bridge (or not a bridge)
> arch/powerpc/boot/dts/mpc5200b.dtsi:182.18-186.5: Warning (spi_bus_bridge=
): /soc5200@f0000000/psc@2000: node name for SPI buses should be 'spi'
> arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /=
pci@f0000d00: missing ranges for PCI bridge (or not a bridge)
> arch/powerpc/boot/dts/mpc5200b.dtsi:182.18-186.5: Warning (spi_bus_bridge=
): /soc5200@f0000000/psc@2000: node name for SPI buses should be 'spi'
> arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /=
pci@f0000d00: missing ranges for PCI bridge (or not a bridge)
> arch/powerpc/boot/dts/mpc5200b.dtsi:182.18-186.5: Warning (spi_bus_bridge=
): /soc5200@f0000000/psc@2000: node name for SPI buses should be 'spi'
> arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /=
pci@f0000d00: missing ranges for PCI bridge (or not a bridge)
>=20
> Given that arch/powerpc/boot/dts/mpc5200b.dtsi is oncluded by several
> other dts files, fixing this one file would go quite a long way to
> silencing our allyesoncig build.  Unfotunatley, I have no idea how to
> fix this file (ad maybe some fo the interactions it has with other files).

--=20
Cheers,
Stephen Rothwell

--Sig_/xIyb51QYuHZd2a6dL62QVXX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFjWqgACgkQAVBC80lX
0GxbWQf+NO+y1FHCcKtadFk+9aCdVAiB5cYV5hPoHV65SuG78Ye4TEu8yhF3pO46
EMJ0h9CsatqseqR5dnTqS58wXWqhdGXy4IW0C8zvygeDUFLTSSEVCNp4WmrAKeya
YD0iEzIAbmNjEwoV9eLh2uJGMaKHf0DvKaBHSjavhVpZf2wAT3nsYF3B+0nT/U61
px5hq0/aAYkrl3gLySfNeAxwzZQ02evyMqPKhuuA+DF6knKX21mIRFRNCvfSnN8n
E1AY72UmJeuFXce5XEiwquZ2ULAJCVwPEFyhApX0d27zi65MbcREMlogzWkoMcZQ
Hej0NkhOhbDH8JpPGM3JVn8DIkWEyA==
=8c1M
-----END PGP SIGNATURE-----

--Sig_/xIyb51QYuHZd2a6dL62QVXX--
