Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E182728AD8B
	for <lists+linux-next@lfdr.de>; Mon, 12 Oct 2020 07:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgJLFSC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Oct 2020 01:18:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgJLFSC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Oct 2020 01:18:02 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F06F8C0613CE;
        Sun, 11 Oct 2020 22:18:01 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C8n4k4l2Jz9sT6;
        Mon, 12 Oct 2020 16:17:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602479879;
        bh=yP3OneOd9YRdtDtR/9NA/FMdutcdKOMzjqgz3BEBAtU=;
        h=Date:From:To:Cc:Subject:From;
        b=URlAOgUATHcSpnY7laMPanAFQODa73RMxEyk8Cc7Qt6KskgTzjX3y+sYU/r6Iw9vn
         u+L+YttEOqKxcHKyEASetQJPYjYcSE3naE90EEnhT7vX0LzMPGOh+i33AzMx/VbDSv
         S7kQocDR4yN0ftFczz1MF0nVEuNdo3kNkzWa4bo188xf5CQQGvzxafiyxx+aFsPTtb
         K4QqB01UOSqLWftX2f+92tnnXrqGJtDlLxSCvE44oPytQdFKqKvJC6Ye6AGmxJsZLA
         jVX/SBoUeZraQPoKyvo7iGcVvJywTi+/bjjKX4B4JD+e1TzeQMwADSJW863VUwarTm
         nZ/uZsIlEVOpQ==
Date:   Mon, 12 Oct 2020 16:17:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marc Zyngier <maz@kernel.org>, Lee Jones <lee.jones@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
        Michael Walle <michael@walle.cc>
Subject: linux-next: manual merge of the irqchip tree with the mfd tree
Message-ID: <20201012161757.4cdf20c2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sxoGIv=jBAH9wnwoQL_On=c";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sxoGIv=jBAH9wnwoQL_On=c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the irqchip tree got a conflict in:

  drivers/irqchip/Makefile

between commit:

  03ac990e0ac0 ("irqchip: Add sl28cpld interrupt controller support")

from the mfd tree and commit:

  ad4c938c92af ("irqchip/irq-mst: Add MStar interrupt controller support")

from the irqchip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/irqchip/Makefile
index db5e37d2db11,f1525149b7a2..000000000000
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@@ -110,4 -113,4 +112,5 @@@ obj-$(CONFIG_LOONGSON_HTPIC)		+=3D irq-lo
  obj-$(CONFIG_LOONGSON_HTVEC)		+=3D irq-loongson-htvec.o
  obj-$(CONFIG_LOONGSON_PCH_PIC)		+=3D irq-loongson-pch-pic.o
  obj-$(CONFIG_LOONGSON_PCH_MSI)		+=3D irq-loongson-pch-msi.o
 +obj-$(CONFIG_SL28CPLD_INTC)		+=3D irq-sl28cpld.o
+ obj-$(CONFIG_MST_IRQ)			+=3D irq-mst-intc.o

--Sig_/sxoGIv=jBAH9wnwoQL_On=c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+D5wUACgkQAVBC80lX
0GwVjwgAjdf3OGwZeb6UARz1pkgMULTTGnFTkTlFDhv/rDw4pwkKOqLNmDIDB8JS
P8bZQ/dW7kbqK2mqbsMIBwmnCh/HZz/sG6PpAYQw1QbyXO9jqcVmD+cfp+CLH5/R
QPhxApLDKUfHca8h1HgHJXMEVJ1vfc6SHuyKHfM2ikhZICmLkFtxNGn3EpLy8i4x
Cq0Igvjkonm+ki9judF94LVNApTDtfMF1KMKBsNWXV0KFYEbGbFyalTZRC1CjVgR
IWvwcL0AGsK+BzWz3o5bHUn6GEthdiCDYPnOTQUc+DwMu778yXEZWyBPLQ8vSpPr
Cedot7FOZGhtaTOoe5Nm1XMfXi4Ulw==
=zh6y
-----END PGP SIGNATURE-----

--Sig_/sxoGIv=jBAH9wnwoQL_On=c--
