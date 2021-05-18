Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82C7A38828A
	for <lists+linux-next@lfdr.de>; Wed, 19 May 2021 00:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352674AbhERWDL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 May 2021 18:03:11 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50473 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236677AbhERWDK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 May 2021 18:03:10 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fl92J2jc1z9sVt;
        Wed, 19 May 2021 08:01:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1621375306;
        bh=RQcwO8g5y1ZE6aq2IQqQ4Da3ygNU7eRGJfT6SO4RWmo=;
        h=Date:From:To:Cc:Subject:From;
        b=gmyj6cwqhWFM5MKv0NpxYiFc+7D0hURehc/ys8Lh7zgB/ZhF8A2t5jCLAHSFVeShj
         kQ6Cxe8bdTCUjHtFe8HFPUxW9/0GYcvLM77BAx9EwTC+MMwhhy1e1HUoiTRJVg7L8O
         jxhI6mBHDBZgcyF0wwNfFjZG1aww+jxzU1cYx3zyojkAYK4CCiY9fgElBuHmr4p+9X
         UQOywXYWZsno0r9o/5E4bAkPduCqVe/iNUzj4YyVVTyHZorPqIFNNkN/vIDUqU/kIV
         uDmdL7k2Lq6dYA7Y5bW7Iptcbhn3OgixW1MEKUVl0v2wZOXVkPzYm/yyFWyZRRanrj
         cq5gc4/Z2pe5g==
Date:   Wed, 19 May 2021 08:01:43 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20210519080143.583d415d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qiq99tQ0A0FtoONTWxlGF/8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qiq99tQ0A0FtoONTWxlGF/8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  1437568b56f8 ("pata_octeon_cf: avoid WARN_ON() in ata_host_activate()")

Fixes tag

  Fixes: 3c929c6f5aa7 ("MIPS/OCTEON/ata: Convert pata_octeon_cf.c to use de=
vice tree.")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

Maybe you meant

Fixes: 43f01da0f279 ("MIPS/OCTEON/ata: Convert pata_octeon_cf.c to use devi=
ce tree.")

or

Fixes: 3c929c6f5aa7 ("libata: New driver for OCTEON SOC Compact Flash inter=
face (v7).")

--=20
Cheers,
Stephen Rothwell

--Sig_/qiq99tQ0A0FtoONTWxlGF/8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCkOUcACgkQAVBC80lX
0GyfAgf/YNnnL1/D37Tv9Ixg+VnILbfqRQW8jdyZaQVeyTLH+zC89z0+/t1c/MTx
0C1hdUBlBZZ5KnwDRa7TUbdSwOUzfBl+2cPCOeg7neeZrvpx8my4ejAQAT4LCGJr
BqIgvNrYY1ibvsOs7ZnIn2VGWsW9yQUz0f/AntyVEnqXE87AUg9uj09XIXazsUS9
HwFoRcxW19SsgOhP3hu6vQ0cWHj0RUwHR+0zfERVDZ3KrT/4a2iPP8uiceGYtTTT
iaSeZHAeg8vGRkbd94NZ/nWMYwW45HinlPgexfy81e8LC2315RLl1RVQRrQBk8at
53kSAZ69k01vZIk4fpgDQeBSNCZGHA==
=n1qo
-----END PGP SIGNATURE-----

--Sig_/qiq99tQ0A0FtoONTWxlGF/8--
