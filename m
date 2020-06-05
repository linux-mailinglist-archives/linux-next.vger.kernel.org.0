Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 413B11EF0F8
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 07:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725986AbgFEFxT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Jun 2020 01:53:19 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51433 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725962AbgFEFxT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 5 Jun 2020 01:53:19 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49dWz05YGpz9sT6;
        Fri,  5 Jun 2020 15:53:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591336397;
        bh=4TG+N4zprLWBKvNGKrTJdG+wqMbsR+YGTDbwmNAbiy4=;
        h=Date:From:To:Cc:Subject:From;
        b=cv6w9OUBVhThrDVVE0cgWPbwFI2Aj8g3SAVPETB03hzeDIspwfxdegfBvM/SkpbP5
         FCk5nWbLjzOz/Qq3t3p8oByB1SjsMHhywAVhNpMy/xxJOnoTlwfwnLDtjFDvMl0Q7F
         im3fc+CY3v/OInMbIFI6lm8qnXxrxCADAjpG75dgeerhX7vx336HxpQP98FqKMsBMy
         B8WUPhqk7LM0N3aFbgxybeyAWmfBi//kUGhO2l0qGybnuS2wXqacv7WrMP5UGDVXdi
         00aIj0iaVuV2vWZIBh2cdsv5IHWYWmTy+TggVQsTyz8KUe2WIuzq4k/A7tnjKcCdVZ
         XwrdfUfRpiTCQ==
Date:   Fri, 5 Jun 2020 15:53:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Rich Felker <dalias@libc.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: linux-next: manual merge of the akpm tree with the sh tree
Message-ID: <20200605155315.6fe115f7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WVdYYZ.5Dcmay7pCddPRNt7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WVdYYZ.5Dcmay7pCddPRNt7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got conflicts in:

  arch/sh/kernel/traps_64.c
  arch/sh/kernel/signal_64.c
  arch/sh/kernel/ptrace_64.c
  arch/sh/kernel/process_64.c

between commit:

  37744feebc08 ("sh: remove sh5 support")

from the sh tree and patch:

  "mm: don't include asm/pgtable.h if linux/mm.h is already included"

from the akpm tree.

I fixed it up (the former deleted the file, so I did that) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/WVdYYZ.5Dcmay7pCddPRNt7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Z3cwACgkQAVBC80lX
0GzvJAf7B+iYERyvbuUwOL3Eg3Y0krFdcvUQLyogiUX+4kcGJC0s22Ey6JANbJKa
niXv+zuSeHnUCWPAru5cOkKfD5ypJOn07w5stprz+IjUwSDAiTNDjuzJNTbm3knU
7urVDTQkZnDOFpscHqNAQNdEchrWHaZgtcnT8FQdWojkc1Uuc+XDGFD0M/Fb+len
lRC6E/KUJdN3P5/PzAGFMpRlvsZXm2IPoJoMWeCpmisSmj0v7qgwbzfKDP5PdgMS
Lsnk8tyXB290veQd2eVWc5aKKUuxOXrqfnTPlWmynDSs/JeOkWwPi61x27OJYqbp
xV6ay/GL7wBMTvFNnX36GMiVDmcCog==
=mhPE
-----END PGP SIGNATURE-----

--Sig_/WVdYYZ.5Dcmay7pCddPRNt7--
