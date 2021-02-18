Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5057831E498
	for <lists+linux-next@lfdr.de>; Thu, 18 Feb 2021 04:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbhBRDtB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Feb 2021 22:49:01 -0500
Received: from ozlabs.org ([203.11.71.1]:57847 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229806AbhBRDs7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Feb 2021 22:48:59 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dh0zg6Ydjz9sRN;
        Thu, 18 Feb 2021 14:48:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613620096;
        bh=KZLShXknssbpHlq1mybpWLCAMvICgyJu4jRRWIiyKgo=;
        h=Date:From:To:Cc:Subject:From;
        b=ZDfpj8ZG3oKts+IdL6Y38RQlPa+KYEqyuxHEygWL28oa/bdKVGjh4RCcXNyMZH12Z
         juifl/axtQYyFiASJSzdL4pDxmuwuENMLkCha9xzMX+3GcdmEy9/2Rm1hxjqwF2Uhb
         oI3FGH/+A87axb5TdsDnKem75/QK84+bl4jswsaoyXBMLOODdmtt+vTHiSzweIvju5
         hRW9SQJLxZavF6204jferllrGD5X+ebB1/iZ/JSqO7CKItaaB/hMouXniDQWdrj/bn
         6/X1mSHSWAFbTXbvUblTtk7VBOOSX/w3iyEBUqlUrrRFS+i+5cKrlqhTfvD5avNp9h
         sJFc+NdTlTNow==
Date:   Thu, 18 Feb 2021 14:48:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Hari Bathini <hbathini@linux.ibm.com>,
        Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: linux-next: manual merge of the devicetree tree with the powerpc
 tree
Message-ID: <20210218144815.5673ae6f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GQSo81TZbEJK8U/wnAHYYnY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GQSo81TZbEJK8U/wnAHYYnY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  arch/powerpc/kexec/elf_64.c

between commit:

  2377c92e37fe ("powerpc/kexec_file: fix FDT size estimation for kdump kern=
el")

from the powerpc tree and commit:

  130b2d59cec0 ("powerpc: Use common of_kexec_alloc_and_setup_fdt()")

from the devicetree tree.

I can't easily see how to resolve these, so for now I have just used
the latter' changes to this file.

I fixed it up and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/GQSo81TZbEJK8U/wnAHYYnY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAt438ACgkQAVBC80lX
0Gw7PQf/a1d0NWQIgPhB7xouP3AzhGRerfWA6mMtdHA5mq8rTcHBuoBtwuXyLevF
KyiQvwpAXo5ETgcdKyJ2q+kzkNsDzo5fzJkKD1tzCX6x12rZcdd0GUWiIBXmMVwb
Gzst/oZMrxHsPqTlN8ubrGHqSzRGkMBBXamy4HuXdAAAq+E/C369jxbH/Kb/+sBs
jApDC8xPpOSc4xNqwPvtrObiuVvpJPovAHJkbb5eVpTHz6W5DhSBIFhM28mtZXwA
MRt2YnLiQqIDVFk2s/NG83Ig3YccPMb406Xt8TSwF2R/JDLOEEuPGfb5pYATU8zP
o7Ze4sqM31shYat0Cc3JYjgnUTwS7A==
=MsIt
-----END PGP SIGNATURE-----

--Sig_/GQSo81TZbEJK8U/wnAHYYnY--
