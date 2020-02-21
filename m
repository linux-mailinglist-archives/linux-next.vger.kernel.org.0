Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06077166DE0
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2020 04:39:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729546AbgBUDj5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Feb 2020 22:39:57 -0500
Received: from ozlabs.org ([203.11.71.1]:37037 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727944AbgBUDj5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Feb 2020 22:39:57 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48NxzZ3h5qz9sRl;
        Fri, 21 Feb 2020 14:39:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582256394;
        bh=vgKhJtAQu5/AyCyCN4a7gmdkvz8Ai7bAmdHGaTwWFqM=;
        h=Date:From:To:Cc:Subject:From;
        b=X9uiU7y++0TcJLCfUqhzCGh/osRxNrTS0MzajMkjUep6fhj/c/BuPrSSsQ1OvzG/C
         EEdVsQs8oDxg+pBGkmPb/Mox2e/gvd5veJuY5ytg5O5Lc8QZuBh4hdoRQuIjFzYrVt
         /QNFsb0iio2Bjf5UMewhQPZWW+gm84K0OR1aZbjlmrETqPw0kgkYEDlt5I+eiL9b5x
         EsV8ZmcqP5H++qc/jdeMgjj/zZJH0YSlffQjweEbuEHr33lYxGQvrfdvekh76hvx8h
         NAFDI2Ay239BvszbWmcIysWIOrbQXhGfwjLILz/tWkyTiI+gvMJoN7kNLroMAKxYpM
         lNEoEvxC+kCpA==
Date:   Fri, 21 Feb 2020 14:39:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Subject: linux-next: build warning in Linus' tree
Message-ID: <20200221143930.620f381e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6U3i/Oj=DwC==c+av/nyAib";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6U3i/Oj=DwC==c+av/nyAib
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

For some time I have been getting the following warning from the powerpc
allyesconfig build:

drivers/usb/host/fhci-hcd.c: In function 'fhci_urb_enqueue':
drivers/usb/host/fhci-hcd.c:398:8: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
  398 |   size =3D 2;
      |   ~~~~~^~~
drivers/usb/host/fhci-hcd.c:399:2: note: here
  399 |  case PIPE_BULK:
      |  ^~~~

Introduced by commit

  236dd4d18f29 ("USB: Driver for Freescale QUICC Engine USB Host Controller=
")

from 2009, but exposed only recently.

--=20
Cheers,
Stephen Rothwell

--Sig_/6U3i/Oj=DwC==c+av/nyAib
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5PUQkACgkQAVBC80lX
0Gxowgf9FzZUw1VbMTWlX/J4qyh0YdBz4qvX/OeSMeExqJbWKcr9LeJNteVkTj8C
fdqdWIKByke2UdnpULqOpbfTocHBc6A6HMbcnzehCyWfLcChWGPG8J1qaCKuX9GN
0tPKn73XIh3EbfPoUAEObQTC0pwshxovkNOHmnDl9INDR8wKwFp09/x7vORCPiMa
7ecLm5MwhggdvPqGw/CR+KrFUooJcjIIka1et6n2yEhAJLMDL660+oziK/VC/MUy
R/BSCMIV0cPxMMP/NeBzWQqinhW/Lxcmd2yzAiq1a99pDRAWyVH3RN+EozcaSl13
e0pPGVLts22Jo42l1w+rQ9c8kPQrZQ==
=dvQq
-----END PGP SIGNATURE-----

--Sig_/6U3i/Oj=DwC==c+av/nyAib--
