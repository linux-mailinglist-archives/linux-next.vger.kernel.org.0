Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 492653CCBA7
	for <lists+linux-next@lfdr.de>; Mon, 19 Jul 2021 02:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232895AbhGSAEu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 18 Jul 2021 20:04:50 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42429 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232582AbhGSAEu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 18 Jul 2021 20:04:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GShpj23f8z9sRR;
        Mon, 19 Jul 2021 10:01:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626652910;
        bh=HbnltufWdsE6x9uaLHplATZJVPjQgnFuqc9vaPf/0AA=;
        h=Date:From:To:Cc:Subject:From;
        b=AJZbEBJXEEj4VzH9tf/C6BhACj4tFp4uuKild9D12kcP1YCkmY/dJ/dwPMbeH0av5
         mvWQJr3DTQzcXFCpeK2dvhkj7iOVmXrTNZptNHCtFGqk4NnJm7yu0NyZW6Wkw24oXl
         JwiuHCGW09Xpz0SmNx1F4Xrl/BbnVdID4p+5KUBqwqkdKLe3qVeSHKdpQU2T51QXOj
         zSL5mAK8bcxhDrZo5QtODtF3hwXVPNtwhnWTz5cnX+v2qiUYaiO9IZaf+IbVzQ1WIl
         pqQE7kzzpZhUIhiCBAhTqVHWBRhuzla+iONw5vQNITZHIMz/gNd1djvOMphv9HHBn9
         scnxQ0BYg5Lew==
Date:   Mon, 19 Jul 2021 10:01:47 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Nicolas Ferre <nicolas.ferre@atmel.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Cc:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the at91 tree
Message-ID: <20210719100147.76fa9ec3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3gm9Icd+50YZtTNv4ZJJY+C";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3gm9Icd+50YZtTNv4ZJJY+C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the at91 tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/mach-at91/pm_suspend.S: Assembler messages:
arch/arm/mach-at91/pm_suspend.S:1052: Error: undefined symbol AT91_PMC_MCR_=
V2_CSS used as an immediate value
arch/arm/mach-at91/pm_suspend.S:1052: Error: undefined symbol AT91_PMC_MCR_=
V2_DIV used as an immediate value
arch/arm/mach-at91/pm_suspend.S:1052: Error: undefined symbol AT91_PMC_MCR_=
V2_CSS_MAINCK used as an immediate value
arch/arm/mach-at91/pm_suspend.S:1052: Error: undefined symbol AT91_PMC_MCR_=
V2_DIV1 used as an immediate value
arch/arm/mach-at91/pm_suspend.S:1052: Error: undefined symbol AT91_PMC_MCR_=
V2_CSS used as an immediate value
arch/arm/mach-at91/pm_suspend.S:1052: Error: undefined symbol AT91_PMC_MCR_=
V2_DIV used as an immediate value
arch/arm/mach-at91/pm_suspend.S:1052: Error: undefined symbol AT91_PMC_MCR_=
V2_ID_MSK used as an immediate value
arch/arm/mach-at91/pm_suspend.S:1052: Error: undefined symbol AT91_PMC_MCR_=
V2_CMD used as an immediate value

Caused by commit

  6cb0e54412a3 ("ARM: at91: pm: add support for MCK1..4 save/restore for ul=
p modes")

I have used the at91 tree from next-20210716 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/3gm9Icd+50YZtTNv4ZJJY+C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD0wOwACgkQAVBC80lX
0Gyuagf9HVqHfZW13jr2I8pcm9s+y8uguuAxsV7ErKlniOe87tH3dXyDMZBU43iP
3GoVMuOsb9X61KXbg1p8zgw6f2txCsuTPZ1GpV06Ca8+cIqj2Em0wqCXuQto85lX
hbyPrARV9Vpab5OANMjFCmNx0eu+5mFBUa23uk7m4qtPfvAHSiEEruTEI+sql8v4
SmfRebncXraEX1RZmk3ZsH4NStatwyXyXJl/ny7Q/k5NArvyFMtgg1m6GrP+jwS4
QxYMUjh+Ay7ApCviC66K9sikj5YVp8AO+Kb1DuGFmpwQbpxggU7XvCM7jNiOSFVw
DxQpHrO0fO1vPVk5JEt3cqrhG5Ca/Q==
=3vPx
-----END PGP SIGNATURE-----

--Sig_/3gm9Icd+50YZtTNv4ZJJY+C--
