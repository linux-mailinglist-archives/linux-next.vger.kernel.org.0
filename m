Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3564C131B3B
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 23:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgAFWU0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jan 2020 17:20:26 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33381 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726695AbgAFWU0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Jan 2020 17:20:26 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47s91g6hSnz9sPK;
        Tue,  7 Jan 2020 09:20:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578349224;
        bh=D4L4d0o2nGXQmsn4N43cbibnhfi2fb4y3rP05X2ZFm4=;
        h=Date:From:To:Cc:Subject:From;
        b=BcJXEtH4ciYUdQ9TcUeoVBbDzM4KyfLWuZ0bGVqnzvPhzDMfxQInzypRvZheC/L7x
         oPcXIRBYCJ+pJOybA7CpIoHS8h1U+8AdFIjMYXfn+oqWYv3kVuXSrt/HWAhr+jJPX2
         z+OmYtexUNAodjXUetlZkzsZGmwSxRoKfUy1ujHZ8GlM+e5AA276KcLrFbOdLl42sg
         SXzgXUl+64+1Gs5xBkr94KqWW1q2oAT/2i9V0Fro0An3yyv9sVfRfHMrG7B5PLnQUf
         VRvvoVjT+VTo0Rh3rqMi97NLJLigOUkhSMwaINTN5KqRZN9PI6Jjfij6ysrMTAheaV
         2nD5do5NR/cfg==
Date:   Tue, 7 Jan 2020 09:20:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andre Przywara <andre.przywara@arm.com>
Subject: linux-next: build failure after merge of the sunxi tree
Message-ID: <20200107092017.1f219a19@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_j1Wl=vgzOhip/lEsdpXq7K";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_j1Wl=vgzOhip/lEsdpXq7K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sunxi tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/boot/dts/sun8i-r40.dtsi:656.21-669.5: ERROR (phandle_references): =
/soc/spi@1c05000: Reference to non-existent node or label "dma"
arch/arm/boot/dts/sun8i-r40.dtsi:656.21-669.5: ERROR (phandle_references): =
/soc/spi@1c05000: Reference to non-existent node or label "dma"
arch/arm/boot/dts/sun8i-r40.dtsi:671.21-684.5: ERROR (phandle_references): =
/soc/spi@1c06000: Reference to non-existent node or label "dma"
arch/arm/boot/dts/sun8i-r40.dtsi:671.21-684.5: ERROR (phandle_references): =
/soc/spi@1c06000: Reference to non-existent node or label "dma"
arch/arm/boot/dts/sun8i-r40.dtsi:686.21-699.5: ERROR (phandle_references): =
/soc/spi@1c07000: Reference to non-existent node or label "dma"
arch/arm/boot/dts/sun8i-r40.dtsi:686.21-699.5: ERROR (phandle_references): =
/soc/spi@1c07000: Reference to non-existent node or label "dma"
arch/arm/boot/dts/sun8i-r40.dtsi:701.21-714.5: ERROR (phandle_references): =
/soc/spi@1c0f000: Reference to non-existent node or label "dma"
arch/arm/boot/dts/sun8i-r40.dtsi:701.21-714.5: ERROR (phandle_references): =
/soc/spi@1c0f000: Reference to non-existent node or label "dma"
ERROR: Input tree has errors, aborting (use -f to force output)
make[2]: *** [scripts/Makefile.lib:292: arch/arm/boot/dts/sun8i-v40-bananap=
i-m2-berry.dtb] Error 2
arch/arm/boot/dts/sun8i-r40.dtsi:656.21-669.5: ERROR (phandle_references): =
/soc/spi@1c05000: Reference to non-existent node or label "dma"
arch/arm/boot/dts/sun8i-r40.dtsi:656.21-669.5: ERROR (phandle_references): =
/soc/spi@1c05000: Reference to non-existent node or label "dma"
arch/arm/boot/dts/sun8i-r40.dtsi:671.21-684.5: ERROR (phandle_references): =
/soc/spi@1c06000: Reference to non-existent node or label "dma"
arch/arm/boot/dts/sun8i-r40.dtsi:671.21-684.5: ERROR (phandle_references): =
/soc/spi@1c06000: Reference to non-existent node or label "dma"
arch/arm/boot/dts/sun8i-r40.dtsi:686.21-699.5: ERROR (phandle_references): =
/soc/spi@1c07000: Reference to non-existent node or label "dma"
arch/arm/boot/dts/sun8i-r40.dtsi:686.21-699.5: ERROR (phandle_references): =
/soc/spi@1c07000: Reference to non-existent node or label "dma"
arch/arm/boot/dts/sun8i-r40.dtsi:701.21-714.5: ERROR (phandle_references): =
/soc/spi@1c0f000: Reference to non-existent node or label "dma"
arch/arm/boot/dts/sun8i-r40.dtsi:701.21-714.5: ERROR (phandle_references): =
/soc/spi@1c0f000: Reference to non-existent node or label "dma"
ERROR: Input tree has errors, aborting (use -f to force output)
make[2]: *** [scripts/Makefile.lib:292: arch/arm/boot/dts/sun8i-r40-bananap=
i-m2-ultra.dtb] Error 2
arch/arm/boot/dts/sun8i-r40.dtsi:656.21-669.5: ERROR (phandle_references): =
/soc/spi@1c05000: Reference to non-existent node or label "dma"
arch/arm/boot/dts/sun8i-r40.dtsi:656.21-669.5: ERROR (phandle_references): =
/soc/spi@1c05000: Reference to non-existent node or label "dma"
arch/arm/boot/dts/sun8i-r40.dtsi:671.21-684.5: ERROR (phandle_references): =
/soc/spi@1c06000: Reference to non-existent node or label "dma"
arch/arm/boot/dts/sun8i-r40.dtsi:671.21-684.5: ERROR (phandle_references): =
/soc/spi@1c06000: Reference to non-existent node or label "dma"
arch/arm/boot/dts/sun8i-r40.dtsi:686.21-699.5: ERROR (phandle_references): =
/soc/spi@1c07000: Reference to non-existent node or label "dma"
arch/arm/boot/dts/sun8i-r40.dtsi:686.21-699.5: ERROR (phandle_references): =
/soc/spi@1c07000: Reference to non-existent node or label "dma"
arch/arm/boot/dts/sun8i-r40.dtsi:701.21-714.5: ERROR (phandle_references): =
/soc/spi@1c0f000: Reference to non-existent node or label "dma"
arch/arm/boot/dts/sun8i-r40.dtsi:701.21-714.5: ERROR (phandle_references): =
/soc/spi@1c0f000: Reference to non-existent node or label "dma"
ERROR: Input tree has errors, aborting (use -f to force output)
make[2]: *** [scripts/Makefile.lib:292: arch/arm/boot/dts/sun8i-t3-cqa3t-bv=
3.dtb] Error 2

I am not sure which commits caused this.  I have used the sunxi tree
from next-20200106 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/_j1Wl=vgzOhip/lEsdpXq7K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4TsqEACgkQAVBC80lX
0Gy9Qwf/cClLDg1KvU91VRswOst+kXxmgf0ef66eYzrt85Gyrsio9BnQzOopKKGG
Couog5WucGyww0DFi1SugQXD7PYD1wClUogwCPeQ3Ge/u2tX0glBYGX6cZoTAeW8
mtJBl6EJwA79XmvMqteDX/ZWrFr1aA560YZ41O42l92CrN4QFcgg5vJeV2XNkwOC
ibZzlfPHGhUSu+lyi4rHVdAeCllINor0qnaJO59j20ZRyZyzuEI/ifZ3Q7JP4HoC
LNfNdHZcmrU3tvazfTqi+eHeCBVyMX56CPLpO3VC6XjRwoh9I2HVYqvw0MQldeco
s6XB2Ef6Ww/J4wcx7MHPfuOZLB4q7Q==
=3prn
-----END PGP SIGNATURE-----

--Sig_/_j1Wl=vgzOhip/lEsdpXq7K--
