Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8325C36BC40
	for <lists+linux-next@lfdr.de>; Tue, 27 Apr 2021 01:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237729AbhDZXmr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Apr 2021 19:42:47 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44229 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237368AbhDZXmq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Apr 2021 19:42:46 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FThJ90PR9z9sW8;
        Tue, 27 Apr 2021 09:42:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619480523;
        bh=Zok7MXkWk3bshACCPzopjDVLxWZeZykxopB1VOLekZ8=;
        h=Date:From:To:Cc:Subject:From;
        b=hBhWNgs67BHjCCKzmuSrrkhSgEVHOAj4CZhP+8tILQo+ltuPJ79du1kZ6lsWVPVr0
         Z0k1rXsXTIoFhepV7wA498lPVofHasjmx7GphFhBDqPDDuXAsLnfj3kSHM83CX1W9j
         BfiMV8sBgyTY4f3DIhVxrIqKj6WyOzyRHRuNWu+VCoO7Caxfe2hMlBGhR5lgQkGMI6
         i6o5kEs8uW8iXkJkSfOKnrEMST2IdqKJkw+PrKPAdIF9Zq4HLh3hly7hdj4Q5s34q0
         KP38HtlaZSIMIHTDFC9sNcpFOsT6bWbvDjA/ZWEY+XKH8SyhbyWb3MOQzG7FilxUeb
         xfQya4m+Zcj5A==
Date:   Tue, 27 Apr 2021 09:42:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nick Kossifidis <mick@ics.forth.gr>,
        Palmer Dabbelt <palmerdabbelt@google.com>
Subject: linux-next: manual merge of the risc-v tree with Linus' tree
Message-ID: <20210427094200.567d8555@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xAV/fTavu==glZJoSlh3f1W";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xAV/fTavu==glZJoSlh3f1W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  arch/riscv/kernel/setup.c

between commit:

  ce989f1472ae ("RISC-V: Fix out-of-bounds accesses in init_resources()")

from Linus' tree and commit:

  ffe0e5261268 ("RISC-V: Improve init_resources()")

from the risc-v tree.

I fixed it up (I used the latter since it fixed the same problem as the
former but in a different way) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/xAV/fTavu==glZJoSlh3f1W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCHT8gACgkQAVBC80lX
0Gwrtgf/an5h//L9fhbR5NovCRdJTcJp/5rpn7/0YZ5mhvEsTeV4nyk+oikwYgsV
7HKGphlMRbn/Xw2GS/zDSBXAD9dZc62m80JD9tNqWSZ4i5xr5YATNOfpIMuUv1er
L+iSWowCEPEBL5VuBc+uRNUibY29UKQZv+dZtg0bEpwEE5ZnotUDpDaVy6zSmwxX
sgC5BUoz9eAzsW2Znf0FZIaY4S6wZzFKECgQHZ3Fuw779bJHi0gbdx8McwCDCrbX
avkR/SoIXqdnBiKTd1BXM8yM7o+9Mew8tHg9Y2DIISDsW4fYAL+TeXNK8YT7he45
zuHHeAWUTxnDL9hCE5A75YHpsjI2VA==
=6Mm+
-----END PGP SIGNATURE-----

--Sig_/xAV/fTavu==glZJoSlh3f1W--
