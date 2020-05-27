Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D26B1E50E0
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 00:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgE0WFg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 May 2020 18:05:36 -0400
Received: from ozlabs.org ([203.11.71.1]:37467 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725385AbgE0WFg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 May 2020 18:05:36 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49XPz22JMmz9sRK;
        Thu, 28 May 2020 08:05:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590617134;
        bh=uYG7+cfkkwolCgny1+9NJ7oeNNpp6APuRn0IP0IwlBo=;
        h=Date:From:To:Cc:Subject:From;
        b=K5syjY4rkKjJumeJk/aguu7lBGUMooPc7C4tDocUXOhuRVcZpaj5PbToSGM4GPGeF
         i7YM1uaRb28j3HbeIz2gKo6MVcMbUJ40pRh1e12Do3nUry7L8LPdfHqE7HulL0RfxT
         SyIuY+HjhQDgZf1Nr5W/DXCFEXGGoUobGIQLzJDcIASZzOo/10ChHdZ2H3e2Jr3uVU
         nB9tPU/jP1Q3mqTN2DIh8Ag5SYgW32rQ8xyU6vbBNMvVJBEXQle6sDsqyF23l+1i9Q
         D1DCaz8T4CEQxL9zNxVGfuaHi/ChhFNyoOj96I4pUzXqoKrcf6Nhl8B6blOzirOa6f
         m3bvN0z+QfSdQ==
Date:   Thu, 28 May 2020 08:05:33 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the coresight tree
Message-ID: <20200528080533.5ac7b842@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LNivBGByuM+qcomZGjmW2AZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LNivBGByuM+qcomZGjmW2AZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  32de512f3f4c ("dt-bindings: arm: coresight: Add optional property to repl=
icators")
  73fe4652e020 ("coresight: replicator: Reset replicator if context is lost=
")
  fa7c3883f1f2 ("dt-bindings: arm: coresight: Add support to skip trace uni=
t power up")
  dec0cca9cd91 ("coresight: etm4x: Add support to skip trace unit power up")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/LNivBGByuM+qcomZGjmW2AZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7O5C0ACgkQAVBC80lX
0Gyv/QgAi0a61uxPssQZ6PSUShqyeMcEW1BKimUEl22xdPnd24YgwBy9kPkzi6Jw
n3lfc6FHNNm2j/bgiKmj5E40sHYH3jvCm7RFLEeKydtx++9444vFXgllBBmKNEfc
nME+uIOqQTooopjueqS0N7yFUC1a6Wm14Vd/GYGphc9nNSZXC7LkSfatnUOxcBgK
OMEOBoI4nxiNaUSEcsKI01FZ+dHKzVhQ65AhYJCRpkGrRFBxVNOCM8QNtck4TMLP
yjDJCXi64WpRKntrGtPJhEAndgaeiC8xzrD3wqxgNzqw1oMa+0E2sLriEs2MYZ0h
npCciH7rMq8xmW9rCVin6J1kBPsbfg==
=YTen
-----END PGP SIGNATURE-----

--Sig_/LNivBGByuM+qcomZGjmW2AZ--
