Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 215C2397C00
	for <lists+linux-next@lfdr.de>; Wed,  2 Jun 2021 00:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234834AbhFAWCD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Jun 2021 18:02:03 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35933 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234740AbhFAWCD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Jun 2021 18:02:03 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FvmL401bKz9sWc;
        Wed,  2 Jun 2021 08:00:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622584815;
        bh=VNJUL7vtURQbJVy1w9t/7hyhua736mwNIIFv/kKyKiU=;
        h=Date:From:To:Cc:Subject:From;
        b=AcJ8rCyCDDuISz6JsgloQtKiOonDqbXKccrZZTwXqkT9IZ5at1Y9ccepYAI6gwP/W
         YdMlutLKG5TrHKp+3ZELXbz5YQNkRyKn0JzXZOzP4l8HA3oOnMv2XdgoYSI+VQ1CHK
         Vs640+uImoX2FfwgSdYVyHE+/v3I9gkeU6TfCOprqAxzgR/76FLpbiyYQKaLtEhz56
         I0r6NiESvC2mP8LJWDCX7uHR7tckrv8qR6bzdOTq19Tz1912791NpR+rQ0YESPiNo5
         hAn7uaHCSWy2BUqWKVK7vSzUfyBOgRpAmSzqSa7MpycJfhRxJ0C9VCULnQXB6DpMS0
         /JWoJbTLh1rbA==
Date:   Wed, 2 Jun 2021 08:00:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the sound-asoc-fixes tree
Message-ID: <20210602080011.6c211704@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qiJlL5srbB0/IGVG9BqGO+e";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qiJlL5srbB0/IGVG9BqGO+e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b640e8a4bd24 ("ASoC: SOF: reset enabled_cores state at suspend")

Fixes tag

  Fixes: 42077f08b3 ("ASoC: SOF: update dsp core power status in common API=
s")

has these problem(s):

  - SHA1 should be at least 12 digits long

Probably not worth rebasing for, but can be avoided in the future by
setting core.abbrev to 12 (or more) or (for git v2.11 or later) just
making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/qiJlL5srbB0/IGVG9BqGO+e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC2resACgkQAVBC80lX
0GzTPgf+IBmgbBJGxc3wIhS0nnYZ3tYLcVDFmWPfz1W1POmvVWOvwGqYgP7qAbrc
UnRVRgY4jkosKjXED4BarDZikPGTcUsoh1JlKKsi+FonV2Q+854/Qyp3XR7Oq2Y9
YPZABSy/uMVIn6MdleQbagcJQkKM1eVXKgx1jacjC9Ds7SowwOyWrSfclPaJpNIJ
3O9BNlATuxvsYEx2jJUTYTgs9U5DZNV2tz+FXO/WOw3r/46vD9eKq8oWEQmBIHJC
VmdfeKcOb+PZR1Ba1SgW+kfMmj2pCI4WECdhFnmeFnlYQP1NUlpru+17aIkz2eQv
hgNZaNHVslUFgOMzvycckWxru6zB2Q==
=gloo
-----END PGP SIGNATURE-----

--Sig_/qiJlL5srbB0/IGVG9BqGO+e--
