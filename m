Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77AF12D1CC4
	for <lists+linux-next@lfdr.de>; Mon,  7 Dec 2020 23:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgLGWGo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Dec 2020 17:06:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgLGWGo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Dec 2020 17:06:44 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 341B2C061793;
        Mon,  7 Dec 2020 14:06:04 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cqcnx2rKCz9sWH;
        Tue,  8 Dec 2020 09:05:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607378760;
        bh=IVLX9M5g6UoyVANWjArDzYu9DDy4TQyvy+EgaTeXfrs=;
        h=Date:From:To:Cc:Subject:From;
        b=M0mhKkinqAYIX96gpRLmAm0wSrCOBFks61Y4QLkb6t/YxxcCqWQL3zD4MQPdydUVf
         /XcZ4hkn3QmZPlqLUpiCW8zY0bgKAfJ/jPVyc7OQsegQy9qtEqjSdWhEIiqNcgC7f5
         X+UAPFoaIr9FcDL1wfQhxzhyNEM0FOSeAmQldUoyDyRMsonVZBd3roTl/qKZYFKpmK
         5VX5FJ2YOzeHhdF4nT0m/Tbd43h/tKnCr2iJ61dXjqcd8L0ywnY1RUKiSdcnI+Wa21
         Qvp3oVanD1NEfnYWaNlIFqea9gIVgkyHKLWVUhP1RDLWN9eavwK00gLMUqvKCGFRTv
         oQXKzEFoucpQg==
Date:   Tue, 8 Dec 2020 09:05:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the clk tree
Message-ID: <20201208090555.7159b138@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zWU9a7pyYTRXefi=QifDV3x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zWU9a7pyYTRXefi=QifDV3x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  c3f207f6d23d ("clk: renesas: r8a779a0: Make rcar_r8a779a0_cpg_clk_registe=
r() static")

Fixes tag

  Fixes: c07439dea94050b6 ("clk: renesas: cpg-mssr: Add support for R-Car V=
3U")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 17bcc8035d2d ("clk: renesas: cpg-mssr: Add support for R-Car V3U")

--=20
Cheers,
Stephen Rothwell

--Sig_/zWU9a7pyYTRXefi=QifDV3x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Op0MACgkQAVBC80lX
0GzfVwgAnUjPPRzCgYDD3Lh7xC3irzYEY1wO7trqKZD6lbLnZCQZPn2hm/xOp0Yc
6ciZzg6vHeT7HQ+0N66W9mvEcIvZ7unmNixJjNM35RUoElKOhJyvxBYJX5SUXvyo
8n/QsqQrJlWGTcS45TSExWcWs5BgeOtGUGUCWxoyopDdVvMsRbbsNbem1PuYYBVp
JDV02QK82S43XAJMF39jph3QlzRCd0sUyvBQ6ATAtBACHQE4fykoLvQsBrbJ65SL
HKhPTTqMuwfc3DjS+TSHZwxYyoCXydeceB7KUmGdCNsdN1qZesQy53zMXTsTF8/D
fDTks0qosc15cw/HK1iP2fG67m2dMw==
=iDFJ
-----END PGP SIGNATURE-----

--Sig_/zWU9a7pyYTRXefi=QifDV3x--
