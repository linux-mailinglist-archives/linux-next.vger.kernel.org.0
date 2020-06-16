Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3094B1FAEEC
	for <lists+linux-next@lfdr.de>; Tue, 16 Jun 2020 13:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgFPLMX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Jun 2020 07:12:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbgFPLMW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Jun 2020 07:12:22 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974DDC08C5C2;
        Tue, 16 Jun 2020 04:12:21 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49mQWz2PnSz9sRh;
        Tue, 16 Jun 2020 21:12:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592305935;
        bh=b9eG2tUE4G7fi9ZaZp0aDNPVYyHflnyR8H4ODG/joUY=;
        h=Date:From:To:Cc:Subject:From;
        b=QeDiWTpD9zeCHbLctaXjvMASke1Z7FDEPUPaDJcdr+rah6m6iYB/A0jbWOgxkxSwJ
         WPZxc1jPLffKMr93HPGXx3xNvmgshejTZPj/iJ3RG9l6iZG3F8I54l9DZ1GFr88su0
         rjCtkP/Wjh7bfvTsLj/iKa0viWkYMP7VDjDXKkBxYxqFXrkjrwgI7qisF2/Fi4RNIA
         8ETB/T8Fn6qu+lRBd5B7d/5Y8eQ0HZMWjwacoKCjgi1V1x1131+WiLHslXN6lAri1P
         7FuRxzSBSSc1xAWhEkepXpLP6wZaYp+uiKuf06PUwC/LxlcSx7Tt6Z961ksFrFIsoC
         nJ972wLHRcZLw==
Date:   Tue, 16 Jun 2020 21:12:14 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: linux-next: Fixes tag needs some work in the pinctrl tree
Message-ID: <20200616211214.7cc1f1a6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OmNvIodYFDfK1Brr=xEpr=6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OmNvIodYFDfK1Brr=xEpr=6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  912f25eca000 ("pinctrl: qcom: ipq6018 Add missing pins in qpic pin group")

Fixes tag

  Fixes: ef1ea54 (pinctrl: qcom: Add ipq6018 pinctrl driver)

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/OmNvIodYFDfK1Brr=xEpr=6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7oqQ4ACgkQAVBC80lX
0Gx6xQf+JQd9qhBjpm5Oqz1AxRcBLRS7t7Ac9x2OMBmYQfQ61REEbh0l2gncK90i
Pqn6+yLJr7EVTWmN3DgLuVwTFEcQ6TPOwF87lC2pmjslL5n0icdeZJNk6Avgw4hb
nAThM+DGbqkdwNmhSzRuCwdF1h7BKHxKa/9O2fyv+2X3PIeszmB2D1EFF7qdCBa0
Cf67uAeLKHbWgX4PQyhYTKu1xLaaZunAicHwW/6Uu7lzbLMeG4ZA1moE4eRH/uAP
7NUFHlyzIsmrDKcub86QThoN6kpbZZCvlt3McuQR8XxLkrRVT34wdwI7TikvgaIl
rB/uSkUeK7BXMblay8ZwryuffDzIXg==
=P/05
-----END PGP SIGNATURE-----

--Sig_/OmNvIodYFDfK1Brr=xEpr=6--
