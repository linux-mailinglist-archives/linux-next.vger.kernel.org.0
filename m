Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8401F1DC77B
	for <lists+linux-next@lfdr.de>; Thu, 21 May 2020 09:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbgEUHVf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 May 2020 03:21:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727003AbgEUHVf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 May 2020 03:21:35 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0348C061A0E;
        Thu, 21 May 2020 00:21:34 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49SLdm1F00z9sTK;
        Thu, 21 May 2020 17:21:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590045693;
        bh=q1vx8A9kbDCtXgqiGX1gPAlTnB8R5RmVzfh8wbU2lZA=;
        h=Date:From:To:Cc:Subject:From;
        b=JRCcNUj8EUVtqXKEQWALdDBQmELP1qMzGTU0dY4bQpg+hBbuXiah+1F/LOI60BzLw
         2bJIQ5YkxRHz5Xb6zib26TQqpUho+IKN/f/05ZucajHCosAO0U0J5b4m8ocT39M8EW
         toVO6YsgNYuDSxeCtmK4NpUnu5dYZs/buJG6ZQKMbXSB9Q+mepwPGR7+YLkJuyRMYN
         L+dK+sI2LG+GBWTzN9YEEIZnMK4Fl7DCzKqww1cZPMED8N2NUqvWcaKcfm5wUuj1/b
         rgjTRSRefL5iKQjuBbd2e1EhQNs9BdVAawcGbW5bFn2WB1oW75PPMS+jZHN/qquA12
         qudfijkJBvWWg==
Date:   Thu, 21 May 2020 17:21:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Felipe Balbi <balbi@kernel.org>, Greg KH <greg@kroah.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jason Yan <yanaijie@huawei.com>,
        kbuild test robot <lkp@intel.com>
Subject: linux-next: manual merge of the usb-gadget tree with the usb tree
Message-ID: <20200521172130.52aaa1d6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/APdJPlwHsfhfWz=HCHfmtMc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/APdJPlwHsfhfWz=HCHfmtMc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb-gadget tree got a conflict in:

  drivers/usb/cdns3/gadget.c

between commit:

  e9010320f2d9 ("usb: cdns3: gadget: make a bunch of functions static")

from the usb tree and commit:

  e2e77a94078b ("usb: cdns3: mark local functions static")

from the usb-gadget tree.

I fixed it up (the difference was the indentation of contiuation lines -
I juts used the latter) and can carry the fix as necessary. This is now
fixed as far as linux-next is concerned, but any non trivial conflicts
should be mentioned to your upstream maintainer when your tree is
submitted for merging.  You may also want to consider cooperating with
the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/APdJPlwHsfhfWz=HCHfmtMc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7GK/oACgkQAVBC80lX
0GzGOgf9Fmbg59Ul1SWI1nAfe2gnjjOPB9NuPrI4Ra82K+75hnEVyZaD8T/x/UZh
MSo/BMciiXpybshpJCX9ASP7a7FfJniAGh/9GH68gNHrxkXRVMmH3m89eVZ3Q6dW
+XNkU/PeF/XC+nndsF3rwt0vgYSN77XvGQoKxvccfip7XvOrjCAKfQ2evVBCCLqS
0Dq0toe8h9NdlaiCH8pP0eMzBsmpi5WHLV9QOnjrNh9xPMV7Pp0bYW2Jl3UzG8q1
CdQ/hq9bCVuDLkjGzDEbTtA92FPnoxw9Bc+8TaJNhcYg9M/FEKjWZbFMEkVUm72Y
2y0L0SV2Y/A/tDIYSctgnlkDY8wXEA==
=roe2
-----END PGP SIGNATURE-----

--Sig_/APdJPlwHsfhfWz=HCHfmtMc--
