Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B78713548A9
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 00:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242819AbhDEWhc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Apr 2021 18:37:32 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45281 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233018AbhDEWhb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Apr 2021 18:37:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FDlsH2Vw5z9sV5;
        Tue,  6 Apr 2021 08:37:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617662243;
        bh=KmYqLvIVloHRtDcUxm3zTHqSNmjOOTi85OC+1VxA51Y=;
        h=Date:From:To:Cc:Subject:From;
        b=ozRi5pH5Lvo53wIsNaMB/3aNV/2YSPLrkSMNfjsUyjG64rcYx9WWefhPAXoSRWH3U
         71eotvDNaD9ykdnzmmTESVlGu6pLE72PKMaYTGdM+28eQMMCuUkQU8SdZcXr4F3Bgu
         oh349s8mxndoIMjLcEZGf7Ad2IId45Jyv0uJxZUlYRLaT/MrEHhfzLoJMmKYLPYhQn
         G53lEuWqo1DUaYpT2ayFbXlu/T9iM8DiXRKWGFUPnOk7YYgu5zGMHD8ihcEKApKmMk
         E7oxUqi80iWw/uzvUEShnRtd6xAiJl8EORIKcEpOcXBSrxj7WQIAhenad4KtNoHAJD
         4Rz6RL5w5q1gg==
Date:   Tue, 6 Apr 2021 08:37:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the thermal tree
Message-ID: <20210406083722.74cbadcd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/StOpH8LohzsGZYQReRC+u9J";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/StOpH8LohzsGZYQReRC+u9J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  523d7429aa26 ("dt-bindings: thermal: tsens: Document ipq8064 bindings")
  96303bc4a751 ("thermal/drivers/tsens: Add support for ipq8064-tsens")
  b60f78d26926 ("thermal/drivers/tsens: Drop unused define for msm8960")
  09343bf70f9a ("thermal/drivers/tsens: Replace custom 8960 apis with gener=
ic apis")
  b7037a445f88 ("thermal/drivers/tsens: Fix bug in sensor enable for msm896=
0")
  fab775f3ad71 ("thermal/drivers/tsens: Use init_common for msm8960")
  4d1d1e492db9 ("thermal/drivers/tsens: Convert msm8960 to reg_field")
  3e7bf6fc5fe9 ("thermal/drivers/tsens: Don't hardcode sensor slope")
  8a50bc57ffdb ("thermal/drivers/tsens: Add VER_0 tsens version")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/StOpH8LohzsGZYQReRC+u9J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBrkSIACgkQAVBC80lX
0GzJ/wf9HkKH0q8E+WBABBacxu9CNc//qcd8EphZEw/RadpQjBXfEBywx2OIriwq
zOUjg+iPtRz+A4q+7PPFfaU1mQEpXhecRZMVgHyyO60np4y1rGmltIpm8Ie3Rx/q
QVUF3CM+FLCVu7RR/Ruc3Z7JCR7f6FlRbe/AXDWqf7rwb+zV/9vi5gNE25asnJn+
3uWW5wY0QWPj8tNNzQ2ztzlqR/+SVNxhQVaaDDjZjay8fRQknfHLkR8d3m9G2HEj
L5D0otA19g4sFrcZGKAhv5qUfokafwi9t2jxUHvbom2Vva4+vGgLKfRrNVNwAKYL
C23cK2YM53pFM//FS6dCKCmJzokCOA==
=qn1W
-----END PGP SIGNATURE-----

--Sig_/StOpH8LohzsGZYQReRC+u9J--
