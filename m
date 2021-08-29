Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C52693FAEC9
	for <lists+linux-next@lfdr.de>; Sun, 29 Aug 2021 23:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231800AbhH2Vx0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 29 Aug 2021 17:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235976AbhH2VxX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 29 Aug 2021 17:53:23 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97B88C06175F;
        Sun, 29 Aug 2021 14:52:30 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GyRy24GPTz9sR4;
        Mon, 30 Aug 2021 07:52:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630273946;
        bh=OE19xNgfrcKXD41VWPuOu4Sv/paWzqyt11xbINsQXvY=;
        h=Date:From:To:Cc:Subject:From;
        b=ctPQ48K+BDtDckIwOJt+DvtBs92hFFbt0xdr9CDBCvD2WK0zrOEMqVcTHxWsZ+NQ2
         UaT+pIh+rgQTFknlXy1ihbPrK/7ndkfasDeyO7w5/aITDgJrmqLw4OKCMKyVJpUzr9
         ue1cAENnyBCPcLBfDFN8F6YHKflIoPY7Me7KRTAlf6uIv9XCP1DerWOxLPFGpS6zDf
         jgfXTMqbNRjPMRqc7yIYbQs7J60U6P7gNAhYMOGvZAxMLVQLBLmKOWMa5Qk4EdUyhp
         QwIsXxHlw7sv8u1B3mEZkY5IZ8B/GxNt9WFJhzSyitASovmvfn1moEyL0KWuwnjDQU
         utZ823iRPacYQ==
Date:   Mon, 30 Aug 2021 07:52:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the block tree
Message-ID: <20210830075224.0f234b14@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xm.n=Q3bhIRZtFu_Wmz063c";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xm.n=Q3bhIRZtFu_Wmz063c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  2f7eff262585 ("io_uring: allow updating linked timeouts")
  132bf9af1d0f ("io_uring: keep ltimeouts in a list")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/xm.n=Q3bhIRZtFu_Wmz063c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEsAZgACgkQAVBC80lX
0GyIAAf/RwUVUhEMsPgcdBKmF/t4xSVTrT+I6EYHJAjgSRmG6J7neoXfNrEkgN0U
BLL3cNLOxtipbr2LTKcQvHa7X+Qe6BqGz+yT/ajU3f8OlfujUpXy1RkJH7gon5X7
L5Hfdqwh+HXii7Jraroz5s4Eo4sXxOXJKGK6w691DBO8y6YD6+UObcua4E/p3I9J
PsNUq75nSsmebQGdRFvrPYq8NgDORTInklojqfp4CbihpxXwznfFUi/q/GEPuTtb
XQDrRVWLzDTXeeEZMVoqB4me9bpgtmYHBk3ea3/caQ5SldpBwm86HM5Hru/40VOf
RXxGQ6M2Q5pJapf0v3kGh/pNaIr9XQ==
=OKSy
-----END PGP SIGNATURE-----

--Sig_/xm.n=Q3bhIRZtFu_Wmz063c--
