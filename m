Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8054EE7A3B
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2019 21:38:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbfJ1Uir (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 16:38:47 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35423 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726623AbfJ1Uir (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Oct 2019 16:38:47 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47264h3WG5z9sPK;
        Tue, 29 Oct 2019 07:38:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572295124;
        bh=bhX/b5vcqgDcRRNVcj5hPsxjO1eq57hCDy60xvgn2pY=;
        h=Date:From:To:Cc:Subject:From;
        b=miQuRTRXWeE0G4X0kgyS1DkAchIWlFnXJlnP+50ykImflVh8hbkh6Gj+BfmGQVgPK
         S6yjJhTtnUUOa5eMATadGYBCJpCBlZHgHCbJmmE0xWGtihpFYpapVwI6MHOU3+S1gJ
         JxVo7vhdlrZyERPuB/a7M2at8plEiIVA3bfb4dd1TyHbogDjDPNDuzjiRFxgB0jeEM
         5elSqGUDocUhVsiTpXum1sfDiDMSb+FgpO4/sEdhROiEnDW512ymAXo5BIeyVmiORL
         Yyu1ccR83TqPmpGVr1ERIsN0ol1eP1OnqJtcwiwtT8tDowvvKtTsQ6lqnYm7yRt3l7
         BUkRM35ySnG6Q==
Date:   Tue, 29 Oct 2019 07:38:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the imx-mxs tree
Message-ID: <20191029073838.146df408@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GH1iIlt=N9/O2Z0GN.xGJ0Q";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GH1iIlt=N9/O2Z0GN.xGJ0Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  5a7fd0deda7a ("arm64: defconfig: Enable CONFIG_KEYBOARD_IMX_SC_KEY as mod=
ule")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/GH1iIlt=N9/O2Z0GN.xGJ0Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl23Uc4ACgkQAVBC80lX
0GzMeggAlQbrJnAvWVDWvLg1kPZxeIkEtTBw13FytIgUYb3v57+35lx4lOdK7kG+
heIBcT9n6MSrqOBGW2Z9vvE8hsFCeT05I33JUX428iY4qdKBfrZlMXdWD8AfTKKw
REQK90s0Py4ztsxsFm0A0Zt1P1iP7VE4kivv7ipeAoQU7j11VM4IqIoILpgtjdfI
dZbaRLDYwo83mKMPH/AgIACpdh10hhw13MAbynlA4952kQsa3rhPC0kFNqAeNnTy
brXi2po6ah8x8P3w8kw7asXo90hFFLs+3FVQRYyJHMfXKlXu8RdyTkXFnoqg73ul
Wn9551f3gV+O4uMbczD7541hVcFrLA==
=+Ezz
-----END PGP SIGNATURE-----

--Sig_/GH1iIlt=N9/O2Z0GN.xGJ0Q--
