Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00AD8346B54
	for <lists+linux-next@lfdr.de>; Tue, 23 Mar 2021 22:45:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233564AbhCWVoe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Mar 2021 17:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233663AbhCWVoJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Mar 2021 17:44:09 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73256C061763;
        Tue, 23 Mar 2021 14:44:09 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F4lHq0k3gz9sR4;
        Wed, 24 Mar 2021 08:44:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616535847;
        bh=G+PnxPYcUaUMJjHfgOB68SEknEIOOSpEsqZvLkgBw3w=;
        h=Date:From:To:Cc:Subject:From;
        b=j3ZdHapFW74EV+mPYGwVJg2CyEv38bM7YAOerz6L5Lc4QQwqX5leAe7r+n6gU4zyb
         ePaOs4b8ZU1hT/opi5hK882lQZeKiyr7m5/bPa1W9/k8W7CtZ9NG+Zq7PxzMLLqpq7
         cEU8QT3YzgYRJRVI+1hcHXc3DpT6Oav4UZozcEcaBnAvq1/4F+3VdYUVt/xoU0mHEy
         t/6U8NM7DC8B1pTlzLdD8WCxJE7BJYG2G0+fOxDq/K8o3QRo/jmR/rx/Htr7eRIrWi
         so/nVs0xpeWqnO1kzQgna51F9cFAhKFLPgPA5eAz6nBqR0rnsb8W7etYdXAe7E75V4
         MqcQ/WoDOelaA==
Date:   Wed, 24 Mar 2021 08:44:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Guchun Chen <guchun.chen@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tags need some work in the amdgpu tree
Message-ID: <20210324084406.367dddb9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6CaxaKG6s0ots9T4rc+z7SH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6CaxaKG6s0ots9T4rc+z7SH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  3b19dd24dc1c ("drm/amd/display: fix modprobe failure on vega series")

Fixes tag

  Fixes: d88b34caee83 ("Remove some large variables from the stack")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: a2a855772210 ("drm/amd/display/dc/calcs/dce_calcs: Remove some large=
 variables from the stack")

In commit

  7408733bd982 ("drm/amd/pm: fix MP1 state setting failure in s3 test")

Fixes tag

  Fixes: c5f427745ecd ("drm/amd/pm: fix Navi1x runtime resume failure V2")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: d7a8cb52044a ("drm/amd/pm: fix Navi1x runtime resume failure V2")

--=20
Cheers,
Stephen Rothwell

--Sig_/6CaxaKG6s0ots9T4rc+z7SH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBaYSYACgkQAVBC80lX
0Gz87Af/TB4a1fVfle5x8D4F7sP1/XXDEoPDcWVBli4oN81MkQn2pvRYHDrONGJx
IHjq4RGATY9HPdt9aoEw3HkPKn+huqnmUMaasJSzixRXMk7orI/drGE8b2BhzU/9
mLVeMxvJCcrAbjJxatRkV16L96hIV06ReKuTDallNq/OWluhB55Lu0Of0Uz/wAOd
0o5hWeXBDQgCvJXC4XIXfl3x4GS7TvM5eSk+haXR2ODChP1GDDHYt7nAsW98jKQC
Yre4EJX0Ug0iKy2Guw1bCg8ZYCjzP8kxAJP9fE7bzhpQyBbY1XXkVmAB34n2tvPd
3DRxPaQrty0/rbOsknqCyZfRSoipZA==
=yuOn
-----END PGP SIGNATURE-----

--Sig_/6CaxaKG6s0ots9T4rc+z7SH--
