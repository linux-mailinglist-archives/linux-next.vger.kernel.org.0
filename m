Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB12C3084BC
	for <lists+linux-next@lfdr.de>; Fri, 29 Jan 2021 05:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbhA2Eyk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Jan 2021 23:54:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbhA2Eyd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Jan 2021 23:54:33 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF86DC061573;
        Thu, 28 Jan 2021 20:53:51 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DRlNW1Q7Yz9sVt;
        Fri, 29 Jan 2021 15:53:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611896028;
        bh=DNR/XNxA1IeSo7zuQOtJWmJLYf7oGTHaRmUaZ1A3nGI=;
        h=Date:From:To:Cc:Subject:From;
        b=dXs9AICUEequCcuuh6DV0ABAXO7JTlxybk8erYU9PMul8jxDxE/zu98XFGZ/O6aap
         pncCjompUa/82ze+yaes9kWIrztqkKob6gtV6vhscvV5Sa+retyTwCXO2EogM5Lkyf
         hssG9DOJv5NBYLvVLOOqts5wjgBDln9IMefa6BhsJ2g6a6bXUyk6blwCsdCeQM7E6C
         eQfhcHaSYxIwgW2SgRBa/qEJvomn4AXmFXBAOk+/A3uDAlq30znFP68VnoHoKCMcew
         k2/GG5/e0wCulHv/KW2vRc/4r8/EocJ025PFCsBjf9glMhkozySua3ygKt3/TeX+TR
         b0UOCUrILwdzQ==
Date:   Fri, 29 Jan 2021 15:53:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the char-misc tree with the tty tree
Message-ID: <20210129155341.1868ef9e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_sd/oJxpH9yacXYhWIu=//B";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_sd/oJxpH9yacXYhWIu=//B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got conflicts in:

  drivers/tty/n_tracerouter.c
  drivers/tty/n_tracesink.c

between commit:

  3b830a9c34d5 ("tty: convert tty_ldisc_ops 'read()' function to take a ker=
nel pointer")

from the tty tree and commit:

  8ba59e9dee31 ("misc: pti: Remove driver for deprecated platform")

from the char-misc tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/_sd/oJxpH9yacXYhWIu=//B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmATlNUACgkQAVBC80lX
0Gzy4ggAm+fsP2AKTMLhd/3aY2nRP3fA/ryoMXhovMjsddU1ll9UtzASMY1jpRX9
iLSN0QIv4BhFzWr4v1GlnskcAIl2HApzFzeK5hP7fWeT/fwM9zCrxNoBf4NRGVSa
HpnRWSSsKKmglwkCu5eqUzQRxAdn+K9dN5ueCMb/cONfyrGg5+b2LGzTaC3IVG9X
0D5FtWrVMiVdwaWVg/31iv46pJaDSbAcbazVr70m4+Wx0RpTHHxujk4vVEiiBYOc
5g+qUKs22Mas7/Ez7tTKJMOeiN8lKe/mCiyeBVe7i6mtaqEuUTIx/oRUIe2m4Xie
vkfzNJh/+tWccxv/BbY0jRSqiecTgg==
=LSbI
-----END PGP SIGNATURE-----

--Sig_/_sd/oJxpH9yacXYhWIu=//B--
