Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 657101EF0F4
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 07:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbgFEFrl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Jun 2020 01:47:41 -0400
Received: from ozlabs.org ([203.11.71.1]:35435 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725280AbgFEFrl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 5 Jun 2020 01:47:41 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49dWrV3BS0z9sT6;
        Fri,  5 Jun 2020 15:47:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591336059;
        bh=63TakGsED8KCMIrHEmGyRqvmoV7pgkNeDrTMs1+Yp50=;
        h=Date:From:To:Cc:Subject:From;
        b=STJ1AfWaLm98y8QnkdSXEwhLltIR6GKA6fvGpxP6uISFnY+Hk5izAwbCa7qmMhj8t
         /BPHvnRMr5rJL4oRmeLI/yPwtvbnOK2kaBfGeEAis0SvNDMXUh7bm+vzP6f/q0c+OF
         CAjMGG4lhZXwR1Z/UqnhroUvL6UzuIJXWQplgMyzzlhGtziO3RIJhRwDDAMDvmTfYD
         /xRY6fKAKeWfDDJtnqcVaz2VlbuwGvZ/GpYliLK+WfCkZFzr79u6j6UXRRyuS6kYir
         uZBGlqrk+N8ow1QBrSZ0xR33OVVi9NU8Z9B5lB/BmQzL+A/AvhoGdmHot1udCTVwUX
         JEmlxeEcVfarQ==
Date:   Fri, 5 Jun 2020 15:47:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Rich Felker <dalias@libc.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: linux-next: manual merge of the akpm tree with the sh tree
Message-ID: <20200605154737.05ec657b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H.eaN00h2yNtG4RiEdQ_Dif";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/H.eaN00h2yNtG4RiEdQ_Dif
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/sh/mm/tlbex_64.c
  arch/sh/mm/cache-sh5.c

between commit:

  37744feebc08 ("sh: remove sh5 support")

from the sh tree and commit:

  "sh: add support for folded p4d page tables"

from the akpm tree.

I fixed it up (the former deleted the files, so I did that) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/H.eaN00h2yNtG4RiEdQ_Dif
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Z3HkACgkQAVBC80lX
0GyFiAf/dhPPPPpo1RDD1fQF5XafUTIdSw2mfp5EEGeysFrPExl08dzP6x0y/nSn
FtcaPigGH/qwjr39VXZOG0FeKDLGIevH5amZ/BdRUYXxRyje1PmPrDTi1QZaqY/W
JiRr608jtrV5cfRvJ0YiFxlrPawHekioVI7hffujqC9A5jUAoAPO49Fh/KjcQBUu
RIQ5GCKsTzr7oM5dNkc4dcyR2Uo33adKkeo1RrHAWnrnOEboXxwnOj1FpY0E2nVM
GjlLkfl1JTQX+8okTOuXf4rg6BHqp3IfGVJ5PORCL/91WHmw462l5pqwKmMZkj+g
Hqackhi8Tki61RSD9AT5vykkEKhPbA==
=tmJx
-----END PGP SIGNATURE-----

--Sig_/H.eaN00h2yNtG4RiEdQ_Dif--
