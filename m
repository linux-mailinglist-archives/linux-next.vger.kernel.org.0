Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5F1B28352A
	for <lists+linux-next@lfdr.de>; Mon,  5 Oct 2020 13:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbgJELuN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Oct 2020 07:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbgJELuM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Oct 2020 07:50:12 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C5CC0613CE;
        Mon,  5 Oct 2020 04:50:12 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C4f6Q6DNzz9sTR;
        Mon,  5 Oct 2020 22:50:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601898607;
        bh=Vtk2gHjFMqGZrcdPRvFpNYaBIQVKO8j/8HtNePDvMH8=;
        h=Date:From:To:Cc:Subject:From;
        b=buqXebmj8y90Gj1kpt6bCOcMByq6jKPYDKXkdpEPeQlug3Rh8RjIXG0zoowSi0b30
         rKb3LYtj8wG++P9E4pgSRvL8FWxafx4IdHM4mEQAuN5HdwyvGWO9TflKFddCx0qQvj
         4K2/ltR65la8UJRR781aCmIpzGFoEKJUUM5Ex1iR3Q3g7PCHpO4XO2Ur9+WJvwFFfF
         1/G+ZfybLioLiugvu8T3XpRo3WgKTtmvI+y7LjbWCFqgsoXiSyTQTIUmxF5EcGAQkv
         CEj9h4kNM9kX0k2WYCrXUE9inVjfnEzeyHF5oVEoCUgWCseurSgu/q5tQeYd9PvNug
         3Cy+f4Gxv89mA==
Date:   Mon, 5 Oct 2020 22:50:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Ikjoon Jang <ikjn@chromium.org>
Subject: linux-next: Fixes tag needs some work in the battery tree
Message-ID: <20201005225004.0d3b59a1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oNbfhNGLK1e9q6kry924NWu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oNbfhNGLK1e9q6kry924NWu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f9d293364b45 ("power: supply: sbs-battery: keep error code when get_prope=
rty() fails")

Fixes tag

  Fixes: c4f382930145 (power: supply: sbs-battery: don't assume i2c errors =
as battery disconnect)

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 395a7251dc2b ("power: supply: sbs-battery: don't assume i2c errors a=
s battery disconnect")

--=20
Cheers,
Stephen Rothwell

--Sig_/oNbfhNGLK1e9q6kry924NWu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl97CGwACgkQAVBC80lX
0GyUowf+IgrqGbxVs4BKWuBzOPnjW1cQ3fwH7C2XgKzC+cmGRbrKhW7iPv+5G3j+
+4WoDsBkt9s+DpEpyY+XGnB6ay1hDZ4bFr+JEEZvgK29T5epvFilH+Y6MlZIdUbi
OlVgH9ivmUqJOanQyabQckKG5ase11mmm41umRyqpJWKZZODWSYpexp7vK+bVsK8
/whRBZjz/g9+NVarZ+41cxNy0tKt7FWTVCVuigMMM1nPtHZds8VsGj19qgimr+Ko
NtJk/3Qtt+EVrILleUrdw3FvUo4h+LVkr0vrd0SY0n7gSG9lnxj4clL0iX2rdFoN
v8c9Qfbg9BiEMyD6OnaHJ/uKtXaj9g==
=OKeb
-----END PGP SIGNATURE-----

--Sig_/oNbfhNGLK1e9q6kry924NWu--
