Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2C8C1CEF33
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 10:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgELIeY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 04:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725776AbgELIeX (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 04:34:23 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A47C061A0C;
        Tue, 12 May 2020 01:34:23 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Lrgw5n0kz9sRf;
        Tue, 12 May 2020 18:34:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589272461;
        bh=O051q6DOp21xQD2sFea3GmHWzoHD/M6j7rwcAM5DlLw=;
        h=Date:From:To:Cc:Subject:From;
        b=Eg2qcb4o+Eh8zrWZtJRrOk1MAWE487Rnsc32ic5koHv49vs5QyE7GpDTJQe6yrFbX
         bWySJjRRD27sYyW+6JF6WlHM64vrYc4pUAiJ0uXrbhquu3F0B5faMX+hg+S1sYFWjv
         +EIFycbJPjSBKLmbqU2WFwyDG5xEWhNONnUADsw6Jk3I0N3L/plmsnXBx+toSG4x7+
         GhfUG9ruoavk3T2BHaTLyhowr+oJg1Uu27m51H8euDYiunxXKP3Tx24RRdtXhnk1pK
         5KcyyRZK72NaRUzcYsyEV71Z39BmpABJGQ+3JH3hLa0FRPj/R1NMFNUt6MYF/+iuyd
         K7KTAUdvEymxw==
Date:   Tue, 12 May 2020 18:34:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pavel Begunkov <asml.silence@gmail.com>,
        Jens Axboe <axboe@kernel.dk>
Subject: linux-next: manual merge of the notifications tree with Linus' tree
Message-ID: <20200512183419.5b61fde0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rnDs+im=zRFGoSEyfF05XPI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rnDs+im=zRFGoSEyfF05XPI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the notifications tree got a conflict in:

  fs/io_uring.c

between commit:

  2fb3e82284fc ("io_uring: punt splice async because of inode mutex")

from Linus' tree and commit:

  317f078cce34 ("pipe: Add general notification queue support")

from the notifications tree.

I fixed it up (the former removed the code modified by the latter) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/rnDs+im=zRFGoSEyfF05XPI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl66X4wACgkQAVBC80lX
0Gzpkwf8CDZEVQKpubOvAhmTp7J/4xpSzjcfZN8N6+CDC9QfxrrSNDhxWvFMMn7C
vAfXzkRusX2ByiAFbG0kLm953LlFJ89w1SZjiGB3YgXy4kjBQE5jbW8r668Ea770
fgklwAP5op2ndUV3m2a10G+nGAiDgvLwGcsDrU7F2JbGM0pMEtZ+NMsE+LQzIJlR
+47IXnL3C0aVuNrOn4KpiOy/KlGXArWVG5n4l+Bb728XWn8/hZT16AHg99T15stR
GYLTiwhF7lNZ6hwkDqLGlzP1LLZI+NVTPOV+RGtCpBPjJ4AvZW7JxgfEO3po6sa3
D9lEawnqIvO9ow5svs3QhYzXH/BCvw==
=1twA
-----END PGP SIGNATURE-----

--Sig_/rnDs+im=zRFGoSEyfF05XPI--
