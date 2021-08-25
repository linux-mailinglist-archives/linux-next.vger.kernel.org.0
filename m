Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC893F6DA3
	for <lists+linux-next@lfdr.de>; Wed, 25 Aug 2021 05:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235305AbhHYDVk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Aug 2021 23:21:40 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54315 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230021AbhHYDVj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Aug 2021 23:21:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GvWTK09s2z9sWl;
        Wed, 25 Aug 2021 13:20:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629861653;
        bh=2FREYEHgyQT3GTSLSp1XZWeUNJi4mIma3AKSxHwedsk=;
        h=Date:From:To:Cc:Subject:From;
        b=YClNZXdVIDNAoUYMaQnzftMtVbQeyf2kvdGEJ1pw8rznrWAMuC8tyKMzjxiznb7Mr
         I+EaQiicKc9yYYEs82rMZUaqdeB8s2hnwBH6JUAVjjMKEehkT+Nbe9GkMXtwdn1LjV
         Ji+97dgHfJ/ScdJ3x0zPtn7P1oEcKVt1v8aISVVc5YwguCzvCxOBoZcd66syKAV6IG
         7Jen8vuzjdI4p+aqJBltUSK0hGosvFs6eJJuyvuoj+bMK9Cgwf7XIPHl2/aT2EcFGr
         zLESDvek97cPQT8FbBF0LnLHAe6pTZAUb1Kl5AKPyZI2ckghZSehjeMk2cGHzzabaO
         rHPNRnlnB5+Mw==
Date:   Wed, 25 Aug 2021 13:20:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mmc tree
Message-ID: <20210825132052.24ea065e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yGW5NHkdK1gfd37Ef0lNKfU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yGW5NHkdK1gfd37Ef0lNKfU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mmc tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/mmc/core/pwrseq_sd8787.c: In function 'mmc_pwrseq_sd8787_probe':
drivers/mmc/core/pwrseq_sd8787.c:77:34: warning: cast from pointer to integ=
er of different size [-Wpointer-to-int-cast]
   77 |  pwrseq->reset_pwrdwn_delay_ms =3D (u32)match->data;
      |                                  ^

Introduced by commit

  b2832b96fcf5 ("mmc: pwrseq: sd8787: add support for wilc1000")

--=20
Cheers,
Stephen Rothwell

--Sig_/yGW5NHkdK1gfd37Ef0lNKfU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEltxQACgkQAVBC80lX
0Gy+Jwf/bcIv34XMPJGhgSILis9AHgAye+rECO2chHQN98gUU+LuAGY9zDcyvvmF
HbicdMuBxzRzUHF0yd9uidNW2xBwrQx+VHAQ0iehejOOR6raXfQcprR+ereO98md
DTFIljWIMHRIbGJyINv81jiwHwtH5wX6iUQ0K41UwJmKMtbSsJFeAo2nLw57Qknr
VJLrrwhBcYkuj1IqWufvELHKgM4HjUbNY2MbOCiHoDSsIXRrFxR7/ooSq0NrD425
JRfEyKjQjidqRQ/YuwJe9VqFBbMF9K7YFDyEDMgbC+NXAiK1n+zNGgAJna9ipDg+
SEzP+Zoo1KErCT7wnBuCRYCliyyojA==
=a5eV
-----END PGP SIGNATURE-----

--Sig_/yGW5NHkdK1gfd37Ef0lNKfU--
