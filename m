Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4A9E3305CC
	for <lists+linux-next@lfdr.de>; Mon,  8 Mar 2021 03:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233644AbhCHCHm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 7 Mar 2021 21:07:42 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:52133 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233631AbhCHCH3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 7 Mar 2021 21:07:29 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dv1tz5hxcz9sWF;
        Mon,  8 Mar 2021 13:07:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615169244;
        bh=b5b1JoSKqIm9qLnH/4SwPE++OVPfdsfuKC33EJwzLS0=;
        h=Date:From:To:Cc:Subject:From;
        b=u9y/KtOQNMdMJsRjkfMK6DBMsFpSBda4NcKmUCCqhBBCZR/rTf+tCQLvuRAnqeabv
         Pa74HCNR3HTK3jp5bY8rNlZCFuSozRuDOVvrB1R3ypQK/oOD2lDXo/zKGgraOLmrwO
         TVUMqO9nX+y0irm+9l1rJY7a7iOyD7RTMplltrXpyZHUwVgXhHTu2R54eQb2RjtWYr
         teq8dYUtUTHqhANiR/bqwUQojME7yOd+GFAxkg4oWjbCYVvXlzctKp9HHQLO/lEWzk
         4v8TJYgmbQILu9wveugDLCiPN+i5FKAkYTcBgJ6xaUfY9l5Kn5QM1GgJF3B1cm7Sms
         d2iqL1NHLVNNQ==
Date:   Mon, 8 Mar 2021 13:07:22 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Felix Kuehling <Felix.Kuehling@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the amdgpu tree
Message-ID: <20210308130722.1be2fcd1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/unza3t/lyfldzIBv+maSP5F";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/unza3t/lyfldzIBv+maSP5F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  47c45c39d1a4 ("drm/amdkfd: Use a new capability bit for SRAM ECC")

Fixes tag

  Fixes: 7ec177bdcfc1 ("drm/amdkfd: fix set kfd node ras properties value")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant:

Fixes: 5436ab94cd94 ("drm/amdkfd: fix set kfd node ras properties value")

--=20
Cheers,
Stephen Rothwell

--Sig_/unza3t/lyfldzIBv+maSP5F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBFhtoACgkQAVBC80lX
0Gyf+Qf+PdEGvu206+ua4i6zQCheaCREL5mwuR1799Mm94oFhch3vK0SYOyxtCAB
XOPkwtOUYrax2gBwmBeRqDoXV6YtNaC/Rre4P47qo/0iF1lgKuwPOcdVUE/r8WAr
+fe7pcTKr2+5P2aIvITtFp1zDswprkIibgjUbEEeCmhRfE5t5TjX/kuT/9abHHlM
6uf7aSjW9zfMQZzqUIs4YISL8o5JWZFXoTNF5as+7Kv6nHgL7n8m6P1zlSXx8R69
NqLoR9ad1waTKAiok8G8d5WH/+cfJEC0fnw2CWprja2qJNSU1eBj/gj6ygdkVhx7
8BSXZIQTNVsQi/m8m6G0hu0Ep/uTHA==
=u9E2
-----END PGP SIGNATURE-----

--Sig_/unza3t/lyfldzIBv+maSP5F--
