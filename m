Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64E1A2F42EF
	for <lists+linux-next@lfdr.de>; Wed, 13 Jan 2021 05:15:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbhAMEPJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Jan 2021 23:15:09 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:55643 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726220AbhAMEPI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Jan 2021 23:15:08 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DFvGV4tJNz9sVR;
        Wed, 13 Jan 2021 15:14:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610511266;
        bh=+ZbEZLIkSczrRychOk9i8iuvCgJR2W+mqBsX4xrWMs8=;
        h=Date:From:To:Cc:Subject:From;
        b=eUBjRJgqRc89rPHG8WZuf5JV2mtHR/3SoX6Bjvx9lawTkFFDkQHUl0w+GUQ+/sGpE
         YbWJU81coVll11d5+alQNDdPgguX4cUtNHl0t2bBE0/2it16QKb86vPrDczBwjGr7g
         8ELDVWc9TrtNZvv+I/qWf8Orvn4pDv+3xz7BqEiF5QGODRTkr1m6F9xYEo3b0dAfdl
         fS2NqJRhoXBHRe735t/DVd09kssdbP8sK+dPOPfZB5U2wRaNwlO/9tCT/O9Ifrundp
         wzcts45gCBFpJXtAfWedfbmFlqFxIml4qOP6CZ0oW/F8LRWn0vrWcyBA35eCIl12J1
         dHLsJL0tD6RTw==
Date:   Wed, 13 Jan 2021 15:14:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the jc_docs tree
Message-ID: <20210113151425.524d34e5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4.9qb/8o7XZrzRhEFAB/LfO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4.9qb/8o7XZrzRhEFAB/LfO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the jc_docs tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/translations/zh_CN/mips/index.rst:5: WARNING: undefined label=
: index (if the link has no caption the label must precede a section header)

Introduced by commit

  b8e724fd7117 ("doc/zh_CN: add mips index.rst translation")

--=20
Cheers,
Stephen Rothwell

--Sig_/4.9qb/8o7XZrzRhEFAB/LfO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/+c6IACgkQAVBC80lX
0GyTiQf+NyMTvdQR19J4rqb7ziRb1D0qgZPcrCxzN9KNqsTLAfMyb5MwRD4xqAEQ
k6RzNsiEA8OFMSJY0sH2I+s8f1yLk8bOe2yKXXhE9nBjN25FgPM0EhN6IQ9y00tE
OpXBjlwn6kNwmZeDX1DyAwH5Aue3WWBpWgtnmIpEM4JqTpa2ak/wgZPjXtPRpPwn
NG6XzKdkXR3Vz1ZsUgMKJo5/uMZxG5OAmA3l+BdJV4qETPVEg048UvtSTOvRRAbO
sad8QeCFucRYV0NK7GQJ0DZ75qoqg1Dfo7T2fokHpAtinKuhdgmTUWXiyzoxI/OX
tZHNVDKau5gVVBZgdJYBWtX656ed6g==
=7EHx
-----END PGP SIGNATURE-----

--Sig_/4.9qb/8o7XZrzRhEFAB/LfO--
