Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86E1A239FDC
	for <lists+linux-next@lfdr.de>; Mon,  3 Aug 2020 08:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgHCGzw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Aug 2020 02:55:52 -0400
Received: from ozlabs.org ([203.11.71.1]:35593 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725867AbgHCGzv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 3 Aug 2020 02:55:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BKpYw6HYbz9sRN;
        Mon,  3 Aug 2020 16:55:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596437749;
        bh=LKuvMMPVIvA+B/kFD48oSrZiCdXwCQMwR14E2UPRJ5o=;
        h=Date:From:To:Cc:Subject:From;
        b=Y6dX8N7YA0LM9DL0xsUsZNZZCF5y0RPaSlAqOH9UmPuMo8zFtiC64K0KTD8JT0NN9
         bpng8nZ5STUygwKlhR6dFbM2q0cXP2JN7SV1H5eeq3kyGJCbI1xCt5cd5IrDsxKPq2
         iafFVfugXz9fKAJq9mFID2jm58pEY3neCSAk7C28DKgfVaP+m2h0j/VitaVRDTDem7
         gispg5Zw+IuiZusToa9GOSrMyJAX9/NInMThjcOgo22ujjCLx0KSPPFCewT4EuKLql
         z2aU2LqnYJiY1Clv1bHim9+MZhF/7JEoRSWu6ySuhz2CLULCxwCBLXs7BekNe/4eZu
         NQDwUidhnqh5Q==
Date:   Mon, 3 Aug 2020 16:55:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alastair D'Silva <alastair@d-silva.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: linux-next: manual merge of the char-misc tree with the powerpc
 tree
Message-ID: <20200803165546.6ab5ab6f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qHOjcln.v14dlTifU=wo.eC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qHOjcln.v14dlTifU=wo.eC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/misc/ocxl/config.c

between commit:

  3591538a31af ("ocxl: Address kernel doc errors & warnings")

from the powerpc tree and commit:

  28fc491e9be6 ("misc: ocxl: config: Provide correct formatting to function=
 headers")

from the char-misc tree.

I fixed it up (as it was just differences in comments, I just arbitrarily
chose the latter version) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/qHOjcln.v14dlTifU=wo.eC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8ntPIACgkQAVBC80lX
0GwH1Qf9HjXBmc/hCbg+8mUN8HeO99NLP+3Z73rBfw04BVzR8UCN4n2Sz6gty35l
nKxiWyIS8eccOL5RcIuR6XY+jT4uqdUOzllsytZpgf01VrBs9yLeWtQoRU5C3jyT
EUpLDCpu/Gs3NsRmG3bFBoqV9Xv7CpAs3NFSkKckXhh0DWp6DbIXqWOTXFyE6yd3
x1EyD3n02t9Kcq1h2lN0GchNanmaC1egu9lXK1ovPeuaGQ9+PPIpdANLBpw5HEKS
3+fXriRx5zHVZJkPL8709HL5GCMelIol4y+XZlQI/KOnrutXY4EneugpLlepWq7M
CcDGU9A9w3NwGLuPpOGK3i1jpVzgZQ==
=u9Jo
-----END PGP SIGNATURE-----

--Sig_/qHOjcln.v14dlTifU=wo.eC--
