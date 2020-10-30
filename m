Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6879429FCC3
	for <lists+linux-next@lfdr.de>; Fri, 30 Oct 2020 05:43:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725379AbgJ3Emk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Oct 2020 00:42:40 -0400
Received: from ozlabs.org ([203.11.71.1]:42851 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbgJ3Emk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Oct 2020 00:42:40 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CMqRc1FlGz9sRk;
        Fri, 30 Oct 2020 15:42:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604032956;
        bh=S3YMp7b5yrasOitOCPPY9e7x0id+Eiy1kDQ3HIg2K7A=;
        h=Date:From:To:Cc:Subject:From;
        b=OYl7Gsgmvyq1I6muFfAXvIzUyhaDRyZuSZIpKPqGCd4a1K9WXT5Z27X1SA3eH64/j
         FsDDXRcsK5QMubJKevbn2+yOsKIe+JqOHIdb7v6t43uFRxftekK4ntiFzv5YBD+159
         Rh+qOMBL6qXAIhConZL3j4tSWT8s67lbFVnftdInYWmiONdTbLfI0fr+Rz3JMzkxVG
         8HOZah8tz2N025wfeWV89JWa1p23x0x9H8hULFJzS8cPh7NgbwmcJd5xSoK7fl7t/b
         x5qSoZtLG7Cg/s8DBQlMcG1R5NgFh+UPWaTfcHqILy7RoyXom0k77OzYcMWJ/X6mAX
         Df2NPKvPucfww==
Date:   Fri, 30 Oct 2020 15:42:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the drm-fixes tree
Message-ID: <20201030154235.22883451@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Dt2HVgGTKOBxdPmM25D6GsT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Dt2HVgGTKOBxdPmM25D6GsT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  65d437b83b2b ("drm/amdgpu/pm: fix the fan speed in fan1_input in manual m=
ode for navi1x")

Fixes tag

  Fixes: 3033e9f1c2de ("drm/amdgpu/swsmu: handle manual fan readback on SMU=
11")

has these problem(s):

  - Target SHA1 does not exist

Mayne you meant

Fixes: f6eb433954bf ("drm/amdgpu/swsmu: handle manual fan readback on SMU11=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/Dt2HVgGTKOBxdPmM25D6GsT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+bmbsACgkQAVBC80lX
0GwnAggAkyQwyKmWvAL/cq5oL0oY4vImsKhN1zcnpJO+N/mrkt1xCN86E0zDSGRb
nBMDexFjOa8Mu490MxCXfHJzdCpbFYSf6i63Ub3YFFulI/PHa1VTn8UaZN+TQUlZ
U68m3eIX2gMNMtpo27tabRTNWaVP1pC1whYsOVwCik3sme5WKCzNNL69tnJvmTiy
6/CV2+t4i2nM3Lf3LkCQNxM3QkEgfwE+QCx1eEpE8RsWoK3SKYx/PjgFb7SUTZ+x
4/X2r0k2kQsqEovimzPvc7IZcKwU50bf2HL+CNagYSnSXORwgaVowJ2rhIS2ggwB
ZuXjaeBThL/nqjwZMhVdT+KvfG7l5A==
=salw
-----END PGP SIGNATURE-----

--Sig_/Dt2HVgGTKOBxdPmM25D6GsT--
