Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEFF226E857
	for <lists+linux-next@lfdr.de>; Fri, 18 Sep 2020 00:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbgIQW1K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Sep 2020 18:27:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbgIQW1K (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Sep 2020 18:27:10 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A96DDC06174A;
        Thu, 17 Sep 2020 15:27:09 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bss5j2PCTz9sSJ;
        Fri, 18 Sep 2020 08:27:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600381625;
        bh=65GgIVjHlsKL7mcg4a+XCD4S0QJQ0hobEgxDH3w58vE=;
        h=Date:From:To:Cc:Subject:From;
        b=tqtIP0EtIAK/7pxLmSQSvqpyQZPMnIztWi0f1pUQ63/sLsiT0G2+P7MMu0CUHV9qt
         qr1DiueMVKSZ4Sgudrn+9f0bKyNBosPxtoQ9l3O1Ui3RlHC+AZBjmoRGORmWZcD7gI
         9m2wvXGLhZiXfxS9J/A5v0jmnpv4jC9pGRbGj0wQV4qddWWihTgEfNaUP695DrULs7
         JiojES3GaVcjY1wAlAXbC/rcTb2EWwuJLC4QFNSotz54uB0sabapDkXBR3XEv8QOwl
         cRb38A3CGGkh/nlcXne0PxgfqeYmyilFj8ORtB7AAxRUVIbXZQLI0qHQhDyUDZQvGX
         GIZuZ3gK0BicA==
Date:   Fri, 18 Sep 2020 08:27:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mauro Rossi <issor.oruam@gmail.com>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Subject: linux-next: Fixes tags need some work in the amdgpu tree
Message-ID: <20200918082704.466c822a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9=e4Li/30Z3EhUqJDWMNFpT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9=e4Li/30Z3EhUqJDWMNFpT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  2561adedd576 ("drm/amd/display: dc/clk_mgr: make function static")

Fixes tag

  Fixes: 3ecb3b794e2 "drm/amd/display: dc/clk_mgr: add support for SI parts=
 (v2)"

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

In commit

  d5c0af573279 ("drm/amd/display: Add missing "Copy GSL groups when committ=
ing a new context"")

Fixes tag

  Fixes: b6e881c9474 ("drm/amd/display: update navi to use new surface prog=
ramming behaviour")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/9=e4Li/30Z3EhUqJDWMNFpT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9j4rgACgkQAVBC80lX
0GwNKQf/TPJM3QhpZqVVWuANzX8M8NhZDd8U/aXbm3UZtwQWoHyBNLJOSFjuPAB8
YGBrSTuJV1OoWir7c7gcx763YsCj0/wkL2hCe7Sa/A3nswgyME0iwiV+IsMRnQhU
gtSu9cnnIcH4GJ7x72ypykZxNRMgjOpvcOgR48e0DSy9/QkC93VemKyu/UQg4eAm
aScRTNqYhbS4ndLb45J869TNUrTxUowHuezaOqHwY4Qi1pmsfmWbnUjIR7SiuBiG
3+pRUQ+eGsM701onilAwcO3aMxe9pgC/BEJYvCXSUfoMXzYzJziS19k+ejlGfxxC
1rXntwUX+xlJLpDbPFeyJ+lIDpHesw==
=EIEx
-----END PGP SIGNATURE-----

--Sig_/9=e4Li/30Z3EhUqJDWMNFpT--
