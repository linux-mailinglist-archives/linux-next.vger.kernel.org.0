Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F11363330B5
	for <lists+linux-next@lfdr.de>; Tue,  9 Mar 2021 22:16:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbhCIVPt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Mar 2021 16:15:49 -0500
Received: from ozlabs.org ([203.11.71.1]:56361 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231858AbhCIVPZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Mar 2021 16:15:25 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dw7K15Cbzz9sWL;
        Wed, 10 Mar 2021 08:15:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615324517;
        bh=3ASNWcj0kvXWiLQPxSP630XB55uHhUxdFm+XjzkpJ8E=;
        h=Date:From:To:Cc:Subject:From;
        b=YWRGdQsE3uzHQqAC+cj1Y6KeY2mUSPe2joSpdRtujh1z2blwRBuhNrShVJMYJDuKz
         0yRc1DtYpUq4pnpSje6QuaMdIr+Hp9TRzP+j8o75eb52tar48Z4C5qflemOQxglf6S
         oUP9eIG65PzlupigDx20n0JGVaYcv4mPF2S8OkAyBugp8mE8cgn+XuGNK+y3Jf/PKJ
         qNSL3HwiyLfecxaQf2O8WFnDdzfBS++UeyWAixxaM7XAqw2UEalEqfkr0ffrzE+9rf
         RfAJ0iuUh2Vm5g1CEpE0wLcgaxPLahdtXO8BOdmVoY6t+AifI0RxPNINMN8mU+C/r3
         6Ey+EGAFzrSIA==
Date:   Wed, 10 Mar 2021 08:15:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the mmc tree
Message-ID: <20210310081516.27b949e0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5tytxPckDXktYMg=Ht5x/.I";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5tytxPckDXktYMg=Ht5x/.I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  a7856f326331 ("mmc: dw_mmc: simplify optional reset handling")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/5tytxPckDXktYMg=Ht5x/.I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBH5WQACgkQAVBC80lX
0GzorQf/TELKZ/GWifjcqvJtxGRcj0GmZOYO0NYoWWKishDMvLv3C6YLjzBSCfVu
gDKLXRDdgNwMtC/HHYKmTjAA+FaL4YrrI7iO7yVBPFbtk7Gs3IalYWpmQEzgyLpF
2dSaPhH4T8tqA27R2qKkxjZHLL0vSLD6MN5VCgHHrSTkypJhG2TXwqLk/ffbfAnN
kJjPEJJkIDaAMfCCar8CEAyC9V0V+pjb+cGbE0hBCcJx0G6q7rVaiuGypoI0QJlH
C5zPLzR/90naz85kA4fUwV63o9avYVaDfB04EtW3FWV7Uyty5KoH+uDi7IZ118dU
6PIeMpZpZU3c59x57Vf5sY8ZM6Up8Q==
=deHi
-----END PGP SIGNATURE-----

--Sig_/5tytxPckDXktYMg=Ht5x/.I--
