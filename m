Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD1E3D2FF6
	for <lists+linux-next@lfdr.de>; Fri, 23 Jul 2021 00:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232224AbhGVWLX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Jul 2021 18:11:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231596AbhGVWLW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Jul 2021 18:11:22 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1383C061575;
        Thu, 22 Jul 2021 15:51:56 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GW7491nFGz9s5R;
        Fri, 23 Jul 2021 08:51:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626994313;
        bh=e5mOfGJop9Nh4Yt9MWZu7g9tfrwRGHr/RvNnpAJ9NYU=;
        h=Date:From:To:Cc:Subject:From;
        b=SAfmxPMfbynHCMVVJDU7JKcrKa6zvBo3Z5grk2Kxm80Qiqjx66d9QWlXuRJMrOUsC
         q46BAcBsqVQbYFWOaTlVpQQE7jNCV1xvGxxfeW9pLYY6TNcEN8zcHm55X4uarhmpF2
         JAHs0g0Chdr26GHYVi7Z5Sb6QfJmwvlcuW77uoTl3iBBCPT8BdADp62k7z/3xUxgFx
         ZpKY3ueqNLIrwKhHcIoLnX9RxFVSp50goqzQJBEZOj0S5mLdPafw+OoBSWeD/MuEQu
         v0TIk3ZGZoT6HzY8rgTJJKWjjPvmsQG294v7Sb5fkWjPp5xtVifbA7nVZ+SC+KND9v
         7UT1+rZYMdkGw==
Date:   Fri, 23 Jul 2021 08:51:45 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Yizhuo <yzhai003@ucr.edu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the v4l-dvb-next tree
Message-ID: <20210723085145.1ce7ee5c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=4_f282AMVVaq9PGxlSBD1y";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=4_f282AMVVaq9PGxlSBD1y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  c275e5d349b0 ("media: atomisp: fix the uninitialized use and rename "retv=
alue"")

Fixes tag

  Fixes: ad85094 (media / atomisp: fix the uninitialized use of model ID)

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").
  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

maybe you meant

Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")

--=20
Cheers,
Stephen Rothwell

--Sig_/=4_f282AMVVaq9PGxlSBD1y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD59oEACgkQAVBC80lX
0Gwcawf9GoaZT/t+SwnwsdyJBnFupk3+YKTMQJQ3Du5m/VP7IGlSLYvp1esMVs4S
hDqkbkMg8fVwUGweN3vjABi7X505BnNipedRecjDQXAu/4Ej8EOIM0tl6tIXvnl2
+mwXl600kPxepPkkkt36/9sGRTdPJvuHtW1Oo+AtcEtyzvM/JjmCNTF9ZJYgaoEB
torbKzVvuw37aLMgOCNwuE+NNR+g8/eMsF2BUskCUETILPhjYbaB2NhauTGs1vmJ
ddxcx00l5e3U7O0eHP60Bn03ZKtlw9ZonjAt1z/OzrcFzy4VDnnMLDu7TQ/cxnVd
GFatpCQSGWoVryya/AFHGEwW5MH5tw==
=o6iU
-----END PGP SIGNATURE-----

--Sig_/=4_f282AMVVaq9PGxlSBD1y--
