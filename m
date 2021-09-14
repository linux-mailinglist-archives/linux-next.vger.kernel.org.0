Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A87FD40BA12
	for <lists+linux-next@lfdr.de>; Tue, 14 Sep 2021 23:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234798AbhINVT3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Sep 2021 17:19:29 -0400
Received: from ozlabs.org ([203.11.71.1]:60879 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234814AbhINVTD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Sep 2021 17:19:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1631654264;
        bh=jpePyfrAiPQP+DJsSP7VrmKk3+QH+uStzETrz20Cs8A=;
        h=Date:From:To:Cc:Subject:From;
        b=AeZFJAXauEr4wGk1J+iSZXB1uhkoLPpa/K1MDU/GqP02LInU1finbF62c+WqN+c1z
         wAASoMGScJ7pUZEIfLfJg3b4C6jq7QoqqrXjKL074hjo0BscmaNvlXAfbUnrEPxYbZ
         WpONbWeZ/ITx0MoFjxTlWrMOB+yrmbCS7xpYV9194a+4umLAVtO5OwwE/8RR6GfS5L
         L8ySKn2GWAxj2rgS46wJY1Ru0xEj1f3IdBW1XzDb6rWXANO54kAMxZgPlzoFk8VD8x
         rroHLPKlEYmwrkqWTarW9Ud9smuM4OPtDf4R5yk/X8JEvYZcdHFU9oAaZu52RMg5bp
         2E2q6KSA0tHIg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H8GQb6c7dz9sRN;
        Wed, 15 Sep 2021 07:17:43 +1000 (AEST)
Date:   Wed, 15 Sep 2021 07:17:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the amdgpu tree
Message-ID: <20210915071740.119db858@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wkY4f=_TYOIUoYL.GWDFqLw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wkY4f=_TYOIUoYL.GWDFqLw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8e4826da95bc ("drm/amd/display: Fix white screen page fault for gpuvm")

Fixes tag

  Fixes: 64b1d0e8d50 ("drm/amd/display: Add DCN3.1 HWSEQ")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/wkY4f=_TYOIUoYL.GWDFqLw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFBEXQACgkQAVBC80lX
0Gxy/gf/SzPqOhIxiBVsQa4L2Lg8R9r+lZ4Cel8UI4Dgs1x9GHonKsE7Xu5LRugM
wBtDTUVY68erqKTj6jD67lys50yyI0Ai68YQ58GJN15mUI7rY970v2AK+FlI2YAk
MEfomfjwkcQDZlQ5/hmLDR1jH4V9EtNiKt1VRRfcodKdj4c2PhmTFbhtgBrR9XSo
KBRfqEdum3yaeljpDUFU9/gYr6FB1XX6IEyZ1IddzttDCyT3KkKB9hPcf5YmaC4F
u7NUSfyB0pq/OHkvSPm5TRQNMNHcfh3gl4mzIG/oMngeBkINTuOUOZ7z/fsExDL+
0FK1wbScIanVCkRcquph2ByNN8GLTQ==
=joE7
-----END PGP SIGNATURE-----

--Sig_/wkY4f=_TYOIUoYL.GWDFqLw--
