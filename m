Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD43323274B
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 00:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgG2WEc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 18:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgG2WEc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2020 18:04:32 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E09C061794;
        Wed, 29 Jul 2020 15:04:32 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BH6yk2K5sz9sRN;
        Thu, 30 Jul 2020 08:04:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596060271;
        bh=a9/y3qHCvTROjK+WszIiAXnDNEgXnYwdO8FFBJ4Wmto=;
        h=Date:From:To:Cc:Subject:From;
        b=ipSAsw855VQBt0ypEC1uJ1XPNeH8YeRd4d7ToWgYZLWbl/F0dCloBuRav8j1KqlSa
         vUKeUc9Ir4Ma9ueSCLQijvwoEPvvvDQGsfh4ZQgF0CODt7sWEGLXTiMysDl1z4wX2o
         1xIx+wVNyW2+qGiM3eIZ6ohFGV0UX6Tz7MQVD85pbm32onwGU9XUn1HKgC+S+aeN7d
         sRkKcp5xlHfN/fBg5dZWEnRhWgJdMsn9qtSGy+ocpRYJDsq/P66kdbRGcvgZJMLBLA
         33N3INCRiVqqL7KXCVrJHwfVP/CtNuBlyRuS2wJSDFuxQsi8OJAmLOhDhTpDT9h5vD
         s3/4NRMxIJUuA==
Date:   Thu, 30 Jul 2020 08:04:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: linux-next: Fixes tag needs some work in the sound-asoc tree
Message-ID: <20200730080429.727011fc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xIWGtMSGffzMo25q=4zBRBv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xIWGtMSGffzMo25q=4zBRBv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  e5448d7ec656 ("ASoC: tlv320adcx140: Fix various style errors and warnings=
")

Fixes tag

  Fixes: 689c7655b50 ("ASoC: tlv320adcx140: Add the tlv320adcx140 codec dri=
ver family")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

Just a hint for the future.

--=20
Cheers,
Stephen Rothwell

--Sig_/xIWGtMSGffzMo25q=4zBRBv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8h8m0ACgkQAVBC80lX
0Gx8jwf/YvRUJLvvb6vNlfufiXqfhASOyVlwf2TvX4v9yK8X0YhHeLVNYcqPzZOb
qslzbkqeLZuUhv8glwWr/Hjv3JK/ScnQVkhF7wuL20g19WTP/5B9U1QzbDie13Sc
qNjXieCC2k7mzopFI2D6zKCIt9JeCNjGCIDx1UvVTZ3AF9Sl7t5laPIxyNRPW4Bh
jkmJDp0pQ1p1lTS044R/64rqveQEkUYJJgZNTqq6tMkhGEYoPIs/S46fevkL6uPw
dqc1fOYHYZtsMZAFlkTlMkqbKMhi2BguXmbyQeViddZPMcs1za+h9ijHPHBBF6/y
I3Sz4DNuCW3uZBSrWmNIbky1XKwvCw==
=lHdZ
-----END PGP SIGNATURE-----

--Sig_/xIWGtMSGffzMo25q=4zBRBv--
