Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 524631BCF48
	for <lists+linux-next@lfdr.de>; Wed, 29 Apr 2020 00:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgD1V7p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 17:59:45 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34871 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726256AbgD1V7o (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Apr 2020 17:59:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49BbCd4CbLz9sRY;
        Wed, 29 Apr 2020 07:59:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588111182;
        bh=QU/8zKJPQmddMFvI8HlBQNeIiGhgy2L8S+BFjVaC7wM=;
        h=Date:From:To:Cc:Subject:From;
        b=ku57Ir88dZ6+CqWHcoP0pVtVQy4B6r8bJIkxOVsTf87dQYcjrVt9qTplrGlFX1Dur
         nH/ZZcaB7R5d405zAQsJD+6vlcwM2HLIKa72W+nFPgN29xoJaGUwKc8/gp0in/JvUo
         SdeJWz7ww5PD8+UgxmTaSpxQBEujSTvfSfXi/rLWA6/NGIPFrMWQrtAvtsZuj+Hz1Y
         J8bwHDgjsIatY7/qNT4XXuv4r3hb+c7CwJBhhGa/oZBHuyBPs79E6HrnRhWYeXw1KY
         sslI9qtAPydiTDeTROW5HiW1Tk44p2gnhABD3To5Q2iRl2J2gwOF55tSi+ziGHfda9
         PVC0j3c6IMIXw==
Date:   Wed, 29 Apr 2020 07:59:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: linux-next: Fixes tag needs some work in the sound-asoc-fixes tree
Message-ID: <20200429075930.53910a3e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w1W15NPJCdvpLwjk=OxMPQO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/w1W15NPJCdvpLwjk=OxMPQO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  be8499c48f11 ("ASoC: tlv320adcx140: Fix mic gain registers")

Fixes tag

  Fixes: 37bde5acf040 ("ASoC: tlv320adcx140: Add the tlv320adcx140 codec dr=
iver family")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 689c7655b50c ("ASoC: tlv320adcx140: Add the tlv320adcx140 codec driv=
er family")

--=20
Cheers,
Stephen Rothwell

--Sig_/w1W15NPJCdvpLwjk=OxMPQO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6op0IACgkQAVBC80lX
0GzSAQf+On6V4LnL8ulIccC73gO2Br4MLbFSQAdBqv5KcdJCh55gc8ARQM8ispcw
nUtaFCF0byHx2LVPQfe7ASITBaSnJPyiqxV4LQyQfuqeaZoJ00RKlzknA6iryHYm
0YwNBYWFQpxSuQOSOsBUkCmfq18GJl3aIvs7+SFVAOImzn4/4PCs/APyagMCeSfJ
ghlTcjMiARvNtuPzXBKInsf2K3c/CFcxsZDIplKCEJA7gsC1nuWUYW8+oKfisGye
GQBwyrL4I5Hzo+C53vgHDTEJNFojn10B403XLvVV9GflyHq+1/I0m2AOz64ceHUr
zr4DfYv+guxZ+nEh9eEg5wXTvZYGAA==
=bktv
-----END PGP SIGNATURE-----

--Sig_/w1W15NPJCdvpLwjk=OxMPQO--
