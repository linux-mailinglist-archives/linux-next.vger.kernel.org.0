Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 178268F790
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2019 01:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730493AbfHOXZ4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Aug 2019 19:25:56 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42185 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728579AbfHOXZ4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Aug 2019 19:25:56 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 468jHj0HkNz9sDB;
        Fri, 16 Aug 2019 09:25:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565911553;
        bh=PFHOp5lVQ4g6t48neVfmLKb7P6Y4cLJoqXxp1EbfGsw=;
        h=Date:From:To:Cc:Subject:From;
        b=u7DWt6RZSOWrSt4EmVMN2aMFLJB0VUpjRYDG1CbZzypUz1xhT9ynceFxqdN1I/1cs
         aE4MUE3rd3l8Cq/yTaZuCP6UY1zNovn/nAp0UhY7Hr/byHk4/xOxrEcdVpMUA7WjM3
         MCkbK90NJL2xcLP6CNgp5h9Ki/P8Wpn93Rn84mMc2ReMRxowa8c4yPuC8TYW5pCMBL
         C4hqw81w6SsRJ/xLd1QX//fETSmKzvw93xNFo6txLGFSqwCeLeTaD3QgLMTKSPN+Kf
         HlOylMz5XHlfZnbCNeCdVYgf6lvqOG9RGcBJTdFu7fgiL59pPQuAnBs85gYdPpr2dB
         xKHK+/nPrVgpg==
Date:   Fri, 16 Aug 2019 09:25:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the arm-soc tree
Message-ID: <20190816092552.2db24732@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PS/=YMWaCZM9rHzFA5FlDSJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PS/=YMWaCZM9rHzFA5FlDSJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm-soc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/usb/gadget/udc/lpc32xx_udc.c: In function 'udc_pop_fifo':
drivers/usb/gadget/udc/lpc32xx_udc.c:1156:11: warning: cast from pointer to=
 integer of different size [-Wpointer-to-int-cast]
  switch (((u32) data) & 0x3) {
           ^
drivers/usb/gadget/udc/lpc32xx_udc.c: In function 'udc_stuff_fifo':
drivers/usb/gadget/udc/lpc32xx_udc.c:1257:11: warning: cast from pointer to=
 integer of different size [-Wpointer-to-int-cast]
  switch (((u32) data) & 0x3) {
           ^
drivers/usb/gadget/udc/lpc32xx_udc.c: In function 'udc_handle_ep0_setup':
drivers/usb/gadget/udc/lpc32xx_udc.c:2230:3: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
   switch (reqtype) {
   ^~~~~~
drivers/usb/gadget/udc/lpc32xx_udc.c:2269:2: note: here
  case USB_REQ_SET_ADDRESS:
  ^~~~

Exposed by commit

  50ad15282e7c ("usb: udc: lpc32xx: allow compile-testing")

--=20
Cheers,
Stephen Rothwell

--Sig_/PS/=YMWaCZM9rHzFA5FlDSJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1V6gAACgkQAVBC80lX
0GzbXggAgQcbe6PiiKiz41iZdVjWSP6qLiYI9RWoUAiLo3dK6LpQ7z2QZBVB8u9H
TbW90qgKFEAtrDh0dzXFEVQXFecmHaXOmNDWvQKe6ja6qf/burnKbtKgE901luO+
rrf6GMlQCzid/nOo/r6Ikp0e5s64Dvv0h2llH9THvQUbPE+9xkpqJ8WYbJL/ASE7
r8rcSzTG2ebhqdM/Ysel60/rEmu7hyjxvLvVpFZUE5Fa/+Sfgg4xh7bDDcqt2dpo
UlmqyhTzfsy+ilMvL9xX/ldjuDOISoQFwBh8X6S5b4Uix7/qPUV3KqDw23RD0QDJ
NGRc9PIPTU/LXWS6mLBsfzZ5xpBNUw==
=Axde
-----END PGP SIGNATURE-----

--Sig_/PS/=YMWaCZM9rHzFA5FlDSJ--
