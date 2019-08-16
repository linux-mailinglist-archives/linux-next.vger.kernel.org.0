Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61A6090128
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2019 14:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbfHPMQM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Aug 2019 08:16:12 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42855 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727107AbfHPMQM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 16 Aug 2019 08:16:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4692NQ44ffz9sN6;
        Fri, 16 Aug 2019 22:16:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565957767;
        bh=TttD2v0BoQqfy4CqCzYZMu97ELZjra9rOCAFUhZ+JAU=;
        h=Date:From:To:Cc:Subject:From;
        b=P5V8QaJjI8A/GTz75j4ymV3As2MCUYXE8tA5us19i5lTfPT7oxOF2y62+/FMMFuh1
         Ag/PRci+eYaudRRtwlmW3UlkGWNbcxF1iNk/Rta1qAs8LrWKrGXkUqbh272M/gIuf4
         zQ3IPWilaMnjM9QudBeUBemZiCQ7IF8yue+yEhycA52nNi7FLnrtAEqHlNjofFfDh2
         rZW2lZcVOYjKRTV2hG/3jI6dfQRmB2VB6v8ynRsYTwkPsZ+iURYOa4IVX4F6IxKFR6
         6QDa1b/LR5GpkDoBZjTOClCvf9vWf+DPMRibzfeZWxVmkU6U51vRZAjJKfjtZVr1YS
         pOYUpO8SANkNg==
Date:   Fri, 16 Aug 2019 22:16:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20190816221603.7c0939f0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a/nVqqR7qWPxyI0MJtkhkEv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/a/nVqqR7qWPxyI0MJtkhkEv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) failed like this:

mm/kmemleak.c: In function 'kmemleak_disable':
mm/kmemleak.c:1884:2: error: 'kmemleak_early_log' undeclared (first use in =
this function); did you mean 'kmemleak_alloc'?
  kmemleak_early_log =3D 0;
  ^~~~~~~~~~~~~~~~~~
  kmemleak_alloc
mm/kmemleak.c:1884:2: note: each undeclared identifier is reported only onc=
e for each function it appears in

Caused by commit

  fcf3a5b62f43 ("mm: kmemleak: disable early logging in case of error")

from Linus' tree mismerging with commits

  bce40af67cba ("mm: kmemleak: disable early logging in case of error")
  c405460afc4a ("mm: kmemleak: use the memory pool for early allocations")

from the akpm-current tree.

I just removed the above line again (as was dome in the last commit
above).

--=20
Cheers,
Stephen Rothwell

--Sig_/a/nVqqR7qWPxyI0MJtkhkEv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1WnoMACgkQAVBC80lX
0GwWfwf9HN12JWVD9icMWjzfF2xzwHDhtRXCzGtbUR8Ra6no03pzeVJnpFUxuQdV
dWnZktFZyfarmUV8xlKpHS6QXuKx3pjvHeMb4Jbzk337liM7wPE5gPfpHlELC81u
7dpOid+iDACffF1eOVRIO6c6EZPb7b/UF05UdR0eejdSHQIq5FZWonb2nFhjLkuq
MmF5L5NHGr39xK9d4Ru7qJ7u3SxC9UssQeMoxarWNd459450WCoUjmKsOAUqAxLE
1bsX6KcSR61bTI2oYf4GtdmEiBw1k4iLOF4DFl/OszUtvHlRzH3ahleRBAJNP6u5
fDfTWRiwW1N4VAvUahdb5qLKQZZwZQ==
=7ZBY
-----END PGP SIGNATURE-----

--Sig_/a/nVqqR7qWPxyI0MJtkhkEv--
