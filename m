Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5318C37B187
	for <lists+linux-next@lfdr.de>; Wed, 12 May 2021 00:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbhEKWS6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 May 2021 18:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbhEKWS6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 May 2021 18:18:58 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F79FC061574;
        Tue, 11 May 2021 15:17:51 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ffsk52vKzz9sVt;
        Wed, 12 May 2021 08:17:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620771469;
        bh=Jqtc1vFQyuxnUe/GPLE56YVT/lmzi75J3r2+XEKI+vY=;
        h=Date:From:To:Cc:Subject:From;
        b=mEa/5o4VqZpQ/DrR8YHOwB2FtNHD3Rxp7SFm4cq1WXqokBaKgbIbGIqKWmiuQbSFA
         hbk8FUZJG3NGp16Elyiao8NDT2SjR89rJPgIvaido6BjBLMqLJD6ipVpFcQDf30/Ag
         11eStIKioVeSndQm1YJr8ujyP/7BTAvYmS03hlPleM6fQOAS/t9M4PE2vGKzn4P6Mp
         ayrDH5A76ifTb9yRx63Dpk90REiETLnYgBut5C0cqX76VOU6ES6kon4k6yJ8deMGMF
         YhYBwVgWpTOBD1MHOKmgYlzOe6FMl0FyaijDk69d9RPvZdkudTS/2eu06vXFmBhB84
         MvTmWE+vWN1TA==
Date:   Wed, 12 May 2021 08:17:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the amdgpu tree
Message-ID: <20210512081748.0f122ac4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EwfZD7h=Y_S_AvfUmDGwTeX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EwfZD7h=Y_S_AvfUmDGwTeX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  337142ee10ca ("drm/amdgpu/display: fix build when CONFIG_DRM_AMD_DC_DCN i=
s not defined")

Fixes tag

  Fixes: 77a49c458931 ("drm/amd/display: Support for DMUB AUX")

has these problem(s):

  - Target SHA1 does not exist

Maybe you ment

Fixes: 81927e2808be ("drm/amd/display: Support for DMUB AUX")

--=20
Cheers,
Stephen Rothwell

--Sig_/EwfZD7h=Y_S_AvfUmDGwTeX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCbAowACgkQAVBC80lX
0GxW2wf/TuTStdXPHufJplyLplGn3jsG6PZmuICLsf187pOYTfsRaNGs+HIY7z5F
wAozZZ/6dA34pwYkLlOLgOAasE7mVGSpYfhLbUXotkEmXIkcc9sUSfyb+PnxaALf
IPRi6E2zNLIHraDMRUjaT4nSmHk538txKMCf6gthmObOIarxzH3R0KpwhHPs1Yrw
wm1ZoN2ZPWEOVIf/ZHvZNr6Y96fhlPDFE5A3dZln7tB52OSJnQ8gTsjqexyYlZhJ
A3h+loq/4UyTtRnFdwzjy7NwhLa6YzvmQmvmRYL4q1LNpYmLe9CRQ5y4qo/CRIo6
qCjGqVv6pvIwt27JVsCwtLn6zLCAHw==
=eAeV
-----END PGP SIGNATURE-----

--Sig_/EwfZD7h=Y_S_AvfUmDGwTeX--
