Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF0F317E19F
	for <lists+linux-next@lfdr.de>; Mon,  9 Mar 2020 14:46:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgCINqe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Mar 2020 09:46:34 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58011 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726604AbgCINqe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Mar 2020 09:46:34 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48bfdg08qZz9sPg;
        Tue, 10 Mar 2020 00:46:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583761591;
        bh=rimuX9bz6pCrVPaXzWio/u4bP/hMKmAmLkOVHJ1WVcY=;
        h=Date:From:To:Cc:Subject:From;
        b=rEX/2qtnvtXRmQ6W2PnEVHRBaMXQM37CpCeINjmM6oxY70pM1RmHqm/ZBENwijDAd
         ELd4QIvJHuic2dQILAhKrsO46VHhB8xUJr1rqD1pX3Rwtaw983GUxLFaMey8H24Fwa
         ONwz7PgM1jcSHXqdYlaRL9rIEY3HSmu+TyTU4je41sFHaQySCLfof80p0WGQkw6yFs
         eTLx9N7pdg4/bOfdM6rx13q9Z1psL9Rgh26jXO3Rfqe3DAHFKLrXMXYPfvT/ZOOw+N
         RYkgZO0O5ctVcHnMeEwQj9L4c8ln5UyaMNdaGEU0HB2Ma0dNiqhyxy1GM/89Dyeo0R
         iRmUT1x8EITsw==
Date:   Tue, 10 Mar 2020 00:46:29 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the tpmdd tree
Message-ID: <20200310004629.5a752080@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YfJjuVGym98ukps0cP2f5Ys";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YfJjuVGym98ukps0cP2f5Ys
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  4eecda6b7df2 ("tpm: tpm_tis_spi_cr50: use new structure for SPI transfer =
delays")
  0fbd8fe52759 ("tpm_tis_spi: use new 'delay' structure for SPI transfer de=
lays")

are missing a Signed-off-by from their committer.

Not really, but "Signed-off-by" is misspelled.  Please fix up what ever
script produces this (or your finger memory :-)).

--=20
Cheers,
Stephen Rothwell

--Sig_/YfJjuVGym98ukps0cP2f5Ys
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5mSLUACgkQAVBC80lX
0Gw16gf+LRsH/H+I/LMr0+EhkdvrwGK/+JqYkzf1ZJCdCQPdFj9bP+tfU/vR3ljh
sB42sEjQmsywLwJV5nJ1jiDq+JxV2ppZKI/jQDkNEYOkemXpNNO38VaHoxe1CAxY
lzB56pezgbcYuYnIc8I6hEDamNiOdluI8MP9WhalRDy5Hq8LQ1+y06rrOkKb3Dld
5caJEMPzJupo/RnuDVkQdCD2WAfR1HjLPfvcDfjk+NFbJIKHbdvzCATLVmH6jApM
U++nwADkuQtxnMwDXlYdiannyADpR71x0TL9vMZXe4iE1iZzdK4XsvrUq7u4LWjW
i77F3pXeoqvuwwz0Wuu84Zh40kX1Uw==
=t7pC
-----END PGP SIGNATURE-----

--Sig_/YfJjuVGym98ukps0cP2f5Ys--
