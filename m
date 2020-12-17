Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 824442DDA3A
	for <lists+linux-next@lfdr.de>; Thu, 17 Dec 2020 21:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730788AbgLQUiw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Dec 2020 15:38:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726951AbgLQUiv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Dec 2020 15:38:51 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 673C6C0617A7;
        Thu, 17 Dec 2020 12:38:11 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CxkMz3d87z9sTL;
        Fri, 18 Dec 2020 07:38:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608237487;
        bh=hdTNc35SNvUUdOeEkUqDTbHHtHnsRfzPL+SEY5p0v2Y=;
        h=Date:From:To:Cc:Subject:From;
        b=BhHrWdwaBCg7OlOfovUynL1JfyyfRkhevYTaPVfg0VLOsOjj9TS7oYW6dl+kMyaGY
         FOhrjWRmnp/HFEuSKqH05zB8gU2yhoDcwHD6yWAv+QyWHYLZUPIHUZDsgBytSz5krt
         eQGwfUADYbQKYjJuuwKVRKKuwVP48isuj2vnLRw0yxh1xu89KHyw2MZlJBw+Wsv7Cg
         MZVAEPCrREIshZFNucStv7ZaikWx8SejIvSMR9cFS30pCA8hAE5oPsWWRUdFT2Zujm
         N+Kty15QfaphknmbGDsOOeyyJWJ4zQiv2bwUSxpqDV9UAVsJJ0lMc6VnP6pBjp19Wt
         GpPL46ySrbnFA==
Date:   Fri, 18 Dec 2020 07:38:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stefan Haberland <sth@linux.ibm.com>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20201218073806.06395319@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cfT3OR12L7beCEYjQNcIgfz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/cfT3OR12L7beCEYjQNcIgfz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  358e7cbf87b4 ("s390/dasd: fix hanging device offline processing")

Fixes tag

  Fixes: 47825e05d93e ("s390/dasd: fix endless loop after read unit address=
 configuration")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 41995342b40c ("s390/dasd: fix endless loop after read unit address c=
onfiguration")

--=20
Cheers,
Stephen Rothwell

--Sig_/cfT3OR12L7beCEYjQNcIgfz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/bwa4ACgkQAVBC80lX
0Gz3PQgAn8U+y2Z4tPJP6/KdWKrAEFriinB3CNZeiVHzQQL/O+IaH+ldjSy1p8qc
8417KLlvgZ4V0eXrzZlyhKuj0zVZhAyWbpNS4v+gWal6NTfti2igVUMobDCxorZd
lxb8bwbZz9lYD92FNPjUY28Kl57/8wgdrda5yn3Hu4EkqDycUnZwWUuJkiDdI6sY
LVFqARfdFfXtTc+8kY5aNV16I7TvcGKA1I3EfguWQy3pLFKAft8msCcrFQXnZ4ip
/Td0CfGP5CcZwTxqwSZoi3FtHPmoL7aHL8TiiXR+jOkh7BIh/T1KrQyw7bSOEVlk
zZF8G8jl4rn/fRKs0EgZ+UJA2YmkSQ==
=VQHY
-----END PGP SIGNATURE-----

--Sig_/cfT3OR12L7beCEYjQNcIgfz--
