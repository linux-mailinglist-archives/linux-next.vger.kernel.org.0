Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C43B3F22D0
	for <lists+linux-next@lfdr.de>; Fri, 20 Aug 2021 00:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235439AbhHSWMt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Aug 2021 18:12:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbhHSWMs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Aug 2021 18:12:48 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0838EC061575;
        Thu, 19 Aug 2021 15:12:12 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GrJsN1jwmz9sWq;
        Fri, 20 Aug 2021 08:12:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629411128;
        bh=+oTpbS3uk/7dzLSp+YsF1uCdxGlNJXxEOnYCwdDzisU=;
        h=Date:From:To:Cc:Subject:From;
        b=NQNwyMoeL0cL/YIqnnB/Omz2kzZtbsW72fO/G4k6Ukbf/txZ0neQg2aU1vuYRxYz0
         MHLAbw5N6CYlLwyfX6OZnlyi86C604v4EcHpcW9xBYLpFe7ADZ6SOBzMiO/ecskF4t
         7PU6LeJLUBJKoYW6GaCSnyEE8XyxxL1OZk0WLb06NlLNcfAw/DJjuN/xxMREhGK6Kb
         /m/qXSJqC2gZVl9YABUq5CidtOrzbQTVIR5pwOil8jRop9JVXNHiH9InSIxPbo0ofo
         ey1XdzJOsq9BkLboujcACBW8to6HilhjkaMpMf3YRnBcxq7WyNG7TI7Fz+DN8R2HRd
         l2ZIjKRVDbwLw==
Date:   Fri, 20 Aug 2021 08:12:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the gfs2 tree
Message-ID: <20210820081207.710990a6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qMIUCfh/pcJ=IzbDrn3QF2J";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qMIUCfh/pcJ=IzbDrn3QF2J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  368242d2be99 ("gfs2: init system threads before freeze lock")

Fixes tag

  Fixes: 96b1454f2e ("gfs2: move freeze glock outside the make_fs_rw and _ro

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").
  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/qMIUCfh/pcJ=IzbDrn3QF2J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEe1zcACgkQAVBC80lX
0GwySQf/bO1u77QwYwvhFlCwY99RuYNoS2ae11XTvl7hrHxojXr2vSr2YvwHPzQY
wSnpmn5xo4ZgBOrOggXrZ7BLGx6emPJLasISrTqptOY3oX6uPabYoCcJeEUW21je
oz5j0SXqv0RXPswzhZ2VAAf9yI7GB78LH8cSrXjjQUQXkG3Mp9zkpz8+C380aMmg
0780CKOnUKadMtWcYtiyzaQDOJWjQBM7q4w6KBLvFpVms6oQI5XTjy3434ZZRIB2
GH/mvOzd4m7spRsN6uuzQdIYCmFrwRPutwyugKGWfFWol7dIj20A7v2XUGBOVITi
lBUr2gn0dTBUerYo68fLN0maA2zOcw==
=kZ+k
-----END PGP SIGNATURE-----

--Sig_/qMIUCfh/pcJ=IzbDrn3QF2J--
