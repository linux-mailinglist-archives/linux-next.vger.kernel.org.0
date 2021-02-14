Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85DE131B2EF
	for <lists+linux-next@lfdr.de>; Sun, 14 Feb 2021 23:04:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbhBNWEY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 17:04:24 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:42109 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229881AbhBNWEV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 Feb 2021 17:04:21 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Df1TP72Xjz9sBJ;
        Mon, 15 Feb 2021 09:03:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613340219;
        bh=sbr/yBgbfhgTN/oEnoD2FwzCjNixJMFLOleNMlXrBQs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oiCEE6PHqxpmhj93Wk3acMgZoyffkjde8P7i0bPQx2DlozwCOxhRhvMQ80pDhf18J
         zMtSn/dYtn8xpVCNHWS/210nUSZa1EPKswuIh8oEPqzpiw4l6mUNwvNsL4uXUYdOAv
         OBrw+JAvWpWF7xnLMyZGcT4hLRq06PHOCAesFBOu+HyXTVfr4igjDtvATw+NpK1NNC
         loUbUbBPMEZUE0WefSlmHQp+wpWFTL+6vAhVNCfmTBypzEBSDUysr6uBCzqioJzkqa
         3oe209NF7FRgOaeKaKml0lZsyih2miLnJctLllNRwdKtzn5DHcAoqbGOncF9zHLplH
         bzqK+f/8fmv/w==
Date:   Mon, 15 Feb 2021 09:03:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the char-misc tree with the tty
 tree
Message-ID: <20210215090336.1b149ab3@canb.auug.org.au>
In-Reply-To: <20210129155341.1868ef9e@canb.auug.org.au>
References: <20210129155341.1868ef9e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LG_ORBR17HIlJmSW01dMyYx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LG_ORBR17HIlJmSW01dMyYx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 29 Jan 2021 15:53:41 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the char-misc tree got conflicts in:
>=20
>   drivers/tty/n_tracerouter.c
>   drivers/tty/n_tracesink.c
>=20
> between commit:
>=20
>   3b830a9c34d5 ("tty: convert tty_ldisc_ops 'read()' function to take a k=
ernel pointer")
>=20
> from the tty tree and commit:
>=20
>   8ba59e9dee31 ("misc: pti: Remove driver for deprecated platform")
>=20
> from the char-misc tree.
>=20
> I fixed it up (I just removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

With the merge window about to open, this is a reminder that this
conflict still exists.

--=20
Cheers,
Stephen Rothwell

--Sig_/LG_ORBR17HIlJmSW01dMyYx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmApnjkACgkQAVBC80lX
0GwKPAf/Vn7TFcB+Bgo+3xAleSUPBL8mJr0WRApdixN3C0CPvqF6BSQxY7WOg4rV
n+hVzE7nIe5pX+PrhleS1ciC0k/sa5Dca7LLdHxlV4rH8uW6Bskpdi//fdmXZVzB
j3gnzXMp5BIr0FX6y1z3d4zTdpSIL6qMFdxVeB/QbLo0Rk+9xSTjUn8eT2691zMR
R/0O4A7y23cWHO4+uw7be7QgPznUrQasVImdiA3Ek6URJcU/AbsUFKzmt4EpFvNc
JunPNl2mE+IkJpCTBZKDDbQ8nlEhtCXJlP54HnH7tlqDAkjfR3tZcmwsk6ld71qD
W0V7gciEyTMQhvNB32ZyH70tKquE3w==
=q2Sb
-----END PGP SIGNATURE-----

--Sig_/LG_ORBR17HIlJmSW01dMyYx--
