Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1210141ABA
	for <lists+linux-next@lfdr.de>; Sun, 19 Jan 2020 02:03:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgASBDZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 18 Jan 2020 20:03:25 -0500
Received: from ozlabs.org ([203.11.71.1]:37959 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727012AbgASBDZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 18 Jan 2020 20:03:25 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 480c4B31Rjz9sP3;
        Sun, 19 Jan 2020 12:03:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579395802;
        bh=/2SmNmlfOgWM5RrYHVJdCGkll3jc1LtqGFzGrdHQK/A=;
        h=Date:From:To:Cc:Subject:From;
        b=RoCYrpkOF9rxjvJ95Z9jAv52IKvnFYZAsTcFKu3XLH4hMK2NfuDgChtPqT/ikFXnA
         DYdLzEW5K6cwpuKnjoYRounn8fzAPJRwFtQSabPHCbkR2gACsk5fL+OShycBRxEyqG
         DY9F4Zi5C/8kt0CDEP65262suwmQc2DOZUXs3GksrT3XwV6pEDfBef1NRudiV76kjt
         Ogpd/QxC43iSg0GLIBlobth274AYQCsjgSJJ5rYY95VFl38wQ2FTpg/Rt9INoz2Z6K
         SutxZ7xVA9tPjaut0VbSQs0zEY5Xw7HvypJpoNLQupa890bopLOp9eYkgmLGUgWmjo
         VEkL+0ueGmrig==
Date:   Sun, 19 Jan 2020 12:03:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Russell King <linux@armlinux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Sverdlin <alexander.sverdlin@nokia.com>
Subject: linux-next: Fixes tag needs some work in the arm-current tree
Message-ID: <20200119120321.43e69cdf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1BgSCQMfrFItgzw4O2ssgEQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1BgSCQMfrFItgzw4O2ssgEQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  76540facd203 ("ARM: 8950/1: ftrace/recordmcount: filter relocation types")

Fixes tag

  Fixes: ed60453fa8 ("ARM: 6511/1: ftrace: add ARM support for C version of=
 recordmcount")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/1BgSCQMfrFItgzw4O2ssgEQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4jqtkACgkQAVBC80lX
0Gx+Vgf9GNIr6GdzkdCDWFtFKM6wc7WTPqvg70/HQWZ5WY1/l97yQJjOzTSswxZc
fv8a9sqFiwVXUY+602KGRJfA4n65LY3AAMHYdfIDZxniTqXECyz9rDqbu3f3nqiV
aINKd0jhKShhogwRCWtCyE7FAtBp5wIar2NHr5+uQFHNjRsCpTFE2kxOnDJrU+gx
sBZYWvRUqvR7Q2MHT+l9q4S5suEDPnEAmbV7DZ3lNcAjw3/pqadCMISh3SSLChkI
rol9C22OriErJaK944JrtWc5EefFZSLc70guoF1PKn9KWxWo+MVnwe2LCTw8GO8D
dywyK5hAK+DiC+aIPpXIoMltwmhTJA==
=gK0n
-----END PGP SIGNATURE-----

--Sig_/1BgSCQMfrFItgzw4O2ssgEQ--
