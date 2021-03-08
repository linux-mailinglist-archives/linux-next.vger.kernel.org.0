Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64A1533090F
	for <lists+linux-next@lfdr.de>; Mon,  8 Mar 2021 08:58:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232745AbhCHH6S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Mar 2021 02:58:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbhCHH5t (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Mar 2021 02:57:49 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B32BC06174A;
        Sun,  7 Mar 2021 23:57:47 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dv9gB5TSBz9sW1;
        Mon,  8 Mar 2021 18:57:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615190263;
        bh=j8w3I6+itaVr2X0H3+gppTWL7fiby7bIz3HAvBq6Shk=;
        h=Date:From:To:Cc:Subject:From;
        b=H1hEQXny4KcMXawH0kdDpAjBFiZAFtlGzpNnbqtJOgc0Bl36yfrM/16KJBWoC29MI
         tNRzLlGBlESllM7TSoob+840hAZ93HuUC7YDkNwj3HP+mPoBrqXZ3ewaThGK5gYGni
         4XNWSGPMxtAuPjD7ot409dC4C+EC2YjzVL1Kg8HYr90UwH4sCCychosZ5HfMybke5P
         3pUAITRfVrTXF5c8Sz6G7GBh9eCorQ/c3Mm9Utm/BaI7pmysqAUzHi6DGjXDXPejal
         Xt9yPiib0vHPwk0SzmG7No9SDJUUhXaF2k1B22Il3SuihB/fv4XImIjug+2z/phOVn
         oNKMsvNXGX1wQ==
Date:   Mon, 8 Mar 2021 18:57:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: error fetching the arm-soc-fixes tree
Message-ID: <20210308185741.56900784@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r6ZEGB=EHiqQa23pa6G4aHf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/r6ZEGB=EHiqQa23pa6G4aHf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Fetching the arm-soc-fixes tree
(git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git#arm/fixes)
produces this error:

fatal: couldn't find remote ref refs/heads/arm/fixes

--=20
Cheers,
Stephen Rothwell

--Sig_/r6ZEGB=EHiqQa23pa6G4aHf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBF2PUACgkQAVBC80lX
0Gx9RAgAksI8KHNpl4JElB0OrifE2tUVrwTe52gVVLuxQLBxryOZPjsK2bwaB+tA
yk/tb45eBms6MDWOA8ty+POzvtAOsouaAPguXOGLBWBebjDOYF2x9i6fXgPJs7c0
pqwLZB18aYEAB2LdCCKOjn7HhjzjHsYJiBRjNDWWUJAPc9CXwk8L0LbEIBetPje5
tCXzeo50SMUgKJlxwGtjFEv6K1syBhmxIRTY63eT6RtLWSs3osX1/RlNyI0raQkO
Yfhf/j6Tjr7CDBGO9YOBxyPi/cxpPKB/Ekw4FpBTaUjj1ETHAVdv/U47ER3in5+/
UbOjtKoEW8aRdQx3hur7Vhhlbq0ung==
=+VHx
-----END PGP SIGNATURE-----

--Sig_/r6ZEGB=EHiqQa23pa6G4aHf--
