Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5E7C412BA8
	for <lists+linux-next@lfdr.de>; Tue, 21 Sep 2021 04:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348582AbhIUCXr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Sep 2021 22:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236639AbhIUBvM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Sep 2021 21:51:12 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93902C0AEFA7;
        Mon, 20 Sep 2021 15:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632176822;
        bh=08SwW1s0+RgGmt4e1Sh31ihX8hRkJEoDQMEGUQ7h/ZU=;
        h=Date:From:To:Cc:Subject:From;
        b=GZKCD0WeYAgnj30mMgYr6LuM+2BbdvnSyvVzpoE+Q9ncsUuDcu3ubB75ZStSAgyS/
         eD2lm/80feIc9pWr+TngupDfGWl3ZhxRMwGJFUftXLftotPUWV6HBVq5L0bxHWPBWC
         t42EQu4QAyxATMba/PleVk9ajsUAH8CmVD15ADElUyORdU3kQJJd73FH1nST0+WUK0
         KsVDSHJnI3UEr9W3gaV+GXjB+9DBxQysKBG+yaI+6Z1J+Cw6L9m8DqVGSBXnlwMShG
         7mW6a6tcgju4WiSRqT1U61E3MYi7G1wHm+M+tCwt79ZrQF5M0HvfLt1SgZy+eLGVEj
         KIEcH239imEMg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HCzgp3Kjvz9sW5;
        Tue, 21 Sep 2021 08:27:01 +1000 (AEST)
Date:   Tue, 21 Sep 2021 08:27:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the rockchip tree
Message-ID: <20210921082701.462128c6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aoiC4s564oFof_hqi4aW3UU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/aoiC4s564oFof_hqi4aW3UU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  bb232c4c2a4b ("clk: rockchip: use module_platform_driver_probe")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/aoiC4s564oFof_hqi4aW3UU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFJCrUACgkQAVBC80lX
0GwcDgf8CG89LJ27yL3+O8gLOMZ3qGuTO/pD+exOSnbwQJpG9AcZQGvaCGdN72ii
hRcQoX7c/hVsVmNMgPAGqjaXrjngIQ85Y7x/IgOpmOZ4tS1jtCt8XWcxc0fx+eQx
hqVaSsSf1pDY6Lu8HsbIQZP5Gk2DwBtnzM5aVAYec8I0TSDFy62AJ9CYO+JJBgxC
S5ooAIB4Wp5VTF4uIJfH8bLF3G4zeIWyqDghpvgcjAb07oGM1QrPtpr1VYxZx6XX
YqYbi3WSt5e4/gjj1YfFzzcgQ6fZ+evCxVr96k6wngYSEWA5DMwZSAnLsCNHGfMO
+YtYwDovYKu0968vrFzYrlHJ/U2k5g==
=wRaH
-----END PGP SIGNATURE-----

--Sig_/aoiC4s564oFof_hqi4aW3UU--
