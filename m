Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1242DA0B0
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 20:39:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502572AbgLNTiT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 14:38:19 -0500
Received: from ozlabs.org ([203.11.71.1]:58401 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502451AbgLNTiS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Dec 2020 14:38:18 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cvs9X46sRz9sSC;
        Tue, 15 Dec 2020 06:37:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607974656;
        bh=uFHOh+nJefjibjHGbSPmxJhfUGwzMbG+13XLIzwefro=;
        h=Date:From:To:Cc:Subject:From;
        b=Kcp+zBCVu2E48FGCrijVyRzLz7+0g1zFC6FGmedLL/YbmYtiBSsHWAdWyCsQMz6jY
         0BORx15lQJXqktaC/+2mripkfM+bI4eDc8+RhfUB0gTuwY8GqCyd0tk6mBoipDm2cX
         IDY0wMtviySxr3ntrLhwK131D4Q3jSva72jOqTHac+AdkEt5AukLoiulUgNLh8LNEc
         18vzHzgSeNCk7w/LGTnaCX94xRdD1Oz5PsHaT/2Go6BR1G1CZgkOxOT1f8Oi01PsdN
         vIc5c+as1K8Tv+qglFbccnrpwslIOlbSxfs9DKNJdKCc2kUBpRjcWHdtDg8d0cDRHY
         xykLa0UJxm2sg==
Date:   Tue, 15 Dec 2020 06:37:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the pidfd tree
Message-ID: <20201215063735.43966f5d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w.18qqCS/efjODCk8Wi4DX8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/w.18qqCS/efjODCk8Wi4DX8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  716e343f014e ("selftests/timens: added selftest for /proc/stat btime")
  3ae700ecfae9 ("fs/proc: apply the time namespace offset to /proc/stat bti=
me")
  31909e3330c8 ("timens: additional helper functions for boottime offset ha=
ndling")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/w.18qqCS/efjODCk8Wi4DX8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Xvv8ACgkQAVBC80lX
0Gy9xQf+KIwo3uddVQn8K84U/Ts0kzVGZYy/nuVRfwizWFWQ3Vq3G3uyEvgJ00uS
eWNwU534llyBIo+xvrmIHjOswo3XLSqAPT80ZhK57Vu6QsGxtvMSBcdqm2vC/c3n
DwTKJGEDJUqWzH8HUM/ZRQyMJL5H1XxvobMXNSaqT/larD1oqAxV++GP6B9WOkKg
VUIwFm6HYRH37zd9mk7aB6kpKzVXgU5Jun8DGV694TZs8i0yqMveZkZ5dk2QjpJj
7D6PeN4QK1lIAxnDcszj7vci1AOIMpsZWjU61AfEwxQbNtRAl9jhOw9/CVgLzOUV
27joU71n3PTLRbX3NkdXlLcRLIc1tg==
=z6Fq
-----END PGP SIGNATURE-----

--Sig_/w.18qqCS/efjODCk8Wi4DX8--
