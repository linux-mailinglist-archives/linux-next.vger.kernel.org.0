Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6468D41BC25
	for <lists+linux-next@lfdr.de>; Wed, 29 Sep 2021 03:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243634AbhI2BVu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Sep 2021 21:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243604AbhI2BVt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Sep 2021 21:21:49 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F8DEC06161C;
        Tue, 28 Sep 2021 18:20:09 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HJz7q0nHjz4xLs;
        Wed, 29 Sep 2021 11:20:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632878407;
        bh=cr/zYhza3JWtKMorVEMTMiQoNbp3/KUGWqPCd1EQpas=;
        h=Date:From:To:Cc:Subject:From;
        b=erQkWqCEvdhtCNc7gbYPKkgeh8NViKTf/OtOCvFHyFl4g2l5PyV0rdEoDqZQBEgzf
         dhK6gGaYR2U+6phDF2HDNtKnmYSwfvRMCGfDZjs+ZXykVsuUf+iruhjiXqIOKGuOg7
         RQzItyHO7JilBTKYaZfcf6vdIazg7FCG82dZ55MC2hcZ4AQ4Q3RuDZavCpJ5jyu8Fh
         eE8oqJIvhlI778mdcurJcxZ+eLmRL3knGODM1pizTJiz/tE/f0OkJGqzBydrgP4wrL
         dYx7iQHP+sSXTA0kXUcm91N9pYVHEWqHD/QzY57sJw9nKnRi55ls+/8nwVeFhrhyZ6
         anqrBE6dBsBXA==
Date:   Wed, 29 Sep 2021 11:20:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Michael Strauss <michael.strauss@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20210929112006.15d70615@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.=EN96QOzRa5L_FD2KjMJh2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.=EN96QOzRa5L_FD2KjMJh2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c: In function 'process_de=
ferred_updates':
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:1808:21: error: 'struct =
dc' has no member named 'dcn_ip'
 1808 |   for (i =3D 0; i < dc->dcn_ip->max_num_dpp; i++)
      |                     ^~

Caused by commit

  bfd34644dedb ("drm/amd/display: Defer LUT memory powerdown until LUT bypa=
ss latches")

CONFIG_DRM_AMD_DC_DCN is not set for this build.

I have used the amdgpu tree from next-20210928 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/.=EN96QOzRa5L_FD2KjMJh2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFTv0YACgkQAVBC80lX
0GzfNwf/c04rfj5VYoyPCrtiouT/vpLEXWlz9MRgCXwRZACwdX10spB+edHCqOBN
BVW9l0mlw7l1ISJt9pRe2dgOEeSGvnceSbRDcProyw/KRnM/2ywRSZRWRu7GvV29
0zybUwFNUCdz0UrmCupnGUQSXuT1uc5AmtGceyUfWFtskPmfkn26CJmdS87EGvfb
JJ9SBVLLXRJ8HpWrZIuXuJXp9z6zy0ngjx7ElaMSQgIrBnJRMB/9Pf68jwJlgQjk
/Dgd+yjYHiS3ftmBS9zhP7Cgn/NB1nNPmj/QYpmkEjf1ol8cWQ+sMC0vS/G4fFG2
qKtwN3nXsIq1ANY6XUtYOvKwEhOSEQ==
=exYU
-----END PGP SIGNATURE-----

--Sig_/.=EN96QOzRa5L_FD2KjMJh2--
