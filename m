Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFAF819E17B
	for <lists+linux-next@lfdr.de>; Sat,  4 Apr 2020 01:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727958AbgDCXb7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Apr 2020 19:31:59 -0400
Received: from mx2.suse.de ([195.135.220.15]:37844 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726899AbgDCXb7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 3 Apr 2020 19:31:59 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 75F5BADD7;
        Fri,  3 Apr 2020 23:31:55 +0000 (UTC)
Message-ID: <cc05ef520927c64614acc54bf27e3df080f1fbbe.camel@suse.de>
Subject: Re: linux-next: build warnings in Linus' tree
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Rob Herring <robherring2@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Russell King <linux@armlinux.org.uk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Sat, 04 Apr 2020 01:31:53 +0200
In-Reply-To: <CAL_JsqKd=3zw4uAbDthp-c=_+4XFup0XEdw8nHOmJDzxS2-qSA@mail.gmail.com>
References: <20200404091916.6f00a24d@canb.auug.org.au>
         <CAL_JsqKd=3zw4uAbDthp-c=_+4XFup0XEdw8nHOmJDzxS2-qSA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-7fYq0YQm3itsgYWiCcdC"
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--=-7fYq0YQm3itsgYWiCcdC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob, Stephen,

On Fri, 2020-04-03 at 17:16 -0600, Rob Herring wrote:
> +Nicolas
>=20
> On Fri, Apr 3, 2020 at 4:19 PM Stephen Rothwell <sfr@canb.auug.org.au> wr=
ote:
> > Hi all,
> >=20
> > Today's linux-next build of Linus' tree (arm multi_v7_defconfig) produc=
ed
> > these warnings:
> >=20
> > arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
:
> > /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-
cells=20
> > (2) differs from /soc (1)
> > arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
:
> > /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-
cells=20
> > (2) differs from /soc (1)
> > arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
:
> > /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-
cells=20
> > (2) differs from /soc (1)
> > arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
:
> > /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-
cells=20
> > (2) differs from /soc (1)
> > arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
:
> > /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-
cells=20
> > (2) differs from /soc (1)
> > arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
:
> > /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-
cells=20
> > (2) differs from /soc (1)
> > arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
:
> > /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-
cells=20
> > (2) differs from /soc (1)
> > arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
:
> > /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-
cells=20
> > (2) differs from /soc (1)
> > arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
:
> > /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-
cells=20
> > (2) differs from /soc (1)
> > arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
:
> > /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-
cells=20
> > (2) differs from /soc (1)
> > arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
:
> > /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-
cells=20
> > (2) differs from /soc (1)
> > arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
:
> > /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-
cells=20
> > (2) differs from /soc (1)
> > arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
:
> > /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-
cells=20
> > (2) differs from /soc (1)
> > arch/arm/boot/dts/bcm2835-rpi.dtsi:18.4-15: Warning (dma_ranges_format)=
:
> > /soc/firmware:dma-ranges: empty "dma-ranges" property but its #address-
cells=20
> > (2) differs from /soc (1)
> >=20
> > I have no idea what caused this :-(
>=20
> A dtc update combined with changes that landed in the above file after
> I tested and fixed the new warnings.

Sorry for the warnings. A fix is already making its way into the soc fixes
tree.

Here's the commit for reference: https://lkml.org/lkml/2020/3/26/445

Regards,
Nicolas


--=-7fYq0YQm3itsgYWiCcdC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl6Hx2kACgkQlfZmHno8
x/6Jcwf+PvNs2r1TAijp16u3nVqgjgUkTsSV5gvsx+A3Z0rEvNVzBmyMx/xqiNHN
pfzxLKe6Mypb/lGcJwmoFWkrJCPprifueKh7/WEXYAVyOS2MjV1OO7ehAazIfEyr
4uvhFeHJyswHcTZlT3gkuMkhMpdifCXN46uXx2p8uAOmvVGhTnRIdEkloz+QPoUJ
DPKsTHI3UWUSe64iHStxBBpZOfOl/qu+CuwyJYmtFdiMXAdETRFNizxdR5ieytRm
njmxf77Bsy0CDVXNtZL1xnY3l2GItUCiPgLfWfTSayVsoMjxicOLMw2a6PlBjZHR
Q/DsxgIISBV7Oo3bmseDqWexnh83VA==
=u1wn
-----END PGP SIGNATURE-----

--=-7fYq0YQm3itsgYWiCcdC--

