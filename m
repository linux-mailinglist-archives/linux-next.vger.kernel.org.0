Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD5B813521F
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2020 05:16:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727671AbgAIEQS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jan 2020 23:16:18 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:49265 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727417AbgAIEQS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Jan 2020 23:16:18 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47tXqN358vz9sNx;
        Thu,  9 Jan 2020 15:16:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578543376;
        bh=iaICvJ9ZzjYYZ/Zpogr/xO8dR8P1kdPICwWuKIKsVkw=;
        h=Date:From:To:Cc:Subject:From;
        b=IbXrPxQrHjjJ7zO1RAQdDQpJjtRKc4nuB/mODT3u7QcKpsOYXtco67wCjIiaXoXpY
         GIntQ963gxTb2s49/QR8GZ4sSs4/ET11E73G1vWDZtiGn83qJrR4Ggk1w8VycWCZTV
         hTN/54pK+g9AJIosxoXA7Y1JDs3I9GCbdgF27jHNhuklIiP5TMO3Ye3iUA09VG3UGl
         MEvxCQcXD0Oa6kPZd6GnnzvMeiwTMfaAVf7mXgyxiTBSZHteCGF9WCYLjvAFaovqRG
         c5MiaXhopAO18hCt0TGG5vRTlgi6brN1+2R7ac7tJ1kWNSqyk4V1M+gcTmgH/yqhFh
         xR9BUNI5oy+fA==
Date:   Thu, 9 Jan 2020 15:16:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: linux-next: build warning after merge of the gpio tree
Message-ID: <20200109151615.388726ae@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PazVQAIqXWrfb6_4GntgKtt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PazVQAIqXWrfb6_4GntgKtt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the gpio tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/gpio/gpio-grgpio.c: In function 'grgpio_remove':
drivers/gpio/gpio-grgpio.c:438:16: warning: unused variable 'flags' [-Wunus=
ed-variable]
  438 |  unsigned long flags;
      |                ^~~~~

Introduced by commit

  25d071b3f6db ("gpio: gpio-grgpio: fix possible sleep-in-atomic-context bu=
gs in grgpio_remove()")

--=20
Cheers,
Stephen Rothwell

--Sig_/PazVQAIqXWrfb6_4GntgKtt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4WqQ8ACgkQAVBC80lX
0GxwMAgAnqYP4eatOUydhL+hS4RT2E2M9I68srpRDDKui3EhmFq/ixVfZ4PiLk5N
vPGDHBUdN9ft7WQKJbC/NAsCSkWAkJYoyyC1F1jl1JI+Ps7eytDYesGgVUB/8h1C
W+OpgRfQwe8YViKO2HK6u+wCXJUIVZQIrWKRCZWLXQFPlJMFuKn4Ar1pT2bAdYm8
TRgf8BMtyhLubZmtKpYvFeqBYdpcAinX6ON+vmgHDJEA7yIG7iv7KmcG/AoKXh1R
Bp4O3PLxXnBsia9fbXmXsyvoW37L2zUqdfVjlYC+5+1OZ9g7gRbjERgVyNRX8OtY
froM7cOKK6NtmwEa41zzzCg2nMnzUA==
=KecU
-----END PGP SIGNATURE-----

--Sig_/PazVQAIqXWrfb6_4GntgKtt--
