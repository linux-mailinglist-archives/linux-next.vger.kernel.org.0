Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2E46441339
	for <lists+linux-next@lfdr.de>; Mon,  1 Nov 2021 06:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbhKAFaK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Nov 2021 01:30:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbhKAFaJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Nov 2021 01:30:09 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0FAFC061746;
        Sun, 31 Oct 2021 22:27:36 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HjM46080mz4xbY;
        Mon,  1 Nov 2021 16:27:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635744455;
        bh=GldJYFkfYviPFNG6iVqbVjAWsnoNIHzcVlPTqM08p0U=;
        h=Date:From:To:Cc:Subject:From;
        b=LhbparoHGci3/r1gCvh9yYqZOVJgjFw3W6YWe1nS2cXLq4RuNsfvew4cfWDj3kCgU
         vRiMpsgJtFffrlzTqtU+8vcbM0HI95hCwuk9upO5dKYIkJtRpKrti934649Br459po
         LkgVcuVRQDG+kEWurYvwaF1lKybG+wAoWuNO7VMVsTQvkFWfrhme49tOVj9eIMZRj5
         PJXwM/jxOZvjwWm0EC5+BdvYLDIuU3q1I3pAGaH4gcFQcqrQlxQnesWedMRDKtc8nl
         h84oBeZ3MuRCCWNZ9SU9vezYOgaKCXInZi+QGUMuMx4gkLzwwfaz5k3nWlp1wiVBFl
         BH0BCTirwf6Lw==
Date:   Mon, 1 Nov 2021 16:27:32 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Eric W. Biederman" <ebiederm@xmission.com>,
        Greg KH <greg@kroah.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Larry Finger <Larry.Finger@lwfinger.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the userns tree with the staging tree
Message-ID: <20211101162732.12ef40dc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7jAE/qb3P08Mi42HVgpwRPY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7jAE/qb3P08Mi42HVgpwRPY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the userns tree got a conflict in:

  drivers/staging/r8188eu/core/rtw_mp.c

between commit:

  7bdedfef085b ("staging: r8188eu: Remove mp, a.k.a. manufacturing process,=
 code")

from the staging tree and commit:

  0fdc0c4279c8 ("exit/r8188eu: Replace the macro thread_exit with a simple =
return 0")

from the userns tree.

I fixed it up (the former removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/7jAE/qb3P08Mi42HVgpwRPY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF/esQACgkQAVBC80lX
0GzbHAf+N3wgY+yc0WciHpsmC7fSeLGkGsBpJ2N8odD+YH+jgYZGqWPpqLxR4SLC
f5kqBF9VU/zl103dzvKYYfk2Xt0voyZRiTsUa7TAc3IcsIP86O/dZeAQHK4F6W6p
kwuIrw8GRAJg2vSxHPMJNLqlL8KdWnNWYVnim9j0ZljBZWcPJhiVy77w6SzR9xUo
GvmzGgnyTgu0uEogEDpzdPrjYEGlvoQ80R6Gu0s4VKMn2+Fo3D1DobX1G6kAY5B3
LrdLvzlJjv3bBivGAJ+L5whE/FTZ0MBTlzZ2UjjlQd/PY1AC7KMoLIi682p7yCVz
wIZvXpub8712AGapfgwbg0pmK85g6Q==
=bpiM
-----END PGP SIGNATURE-----

--Sig_/7jAE/qb3P08Mi42HVgpwRPY--
