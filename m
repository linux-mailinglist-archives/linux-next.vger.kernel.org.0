Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90CFA183ABD
	for <lists+linux-next@lfdr.de>; Thu, 12 Mar 2020 21:40:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgCLUkB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Mar 2020 16:40:01 -0400
Received: from ozlabs.org ([203.11.71.1]:32771 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726558AbgCLUkB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Mar 2020 16:40:01 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48dggL06P9z9sQx;
        Fri, 13 Mar 2020 07:39:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584045599;
        bh=YYrgXHiQdLWPmfrBmfHD2XWZZmiW/8aOr57uHfsVFE8=;
        h=Date:From:To:Cc:Subject:From;
        b=lH9XRK0PKXEwKaxCg8F5TUSG5B3PZLAp0ADwXy8IQLjpAAJmb0nuTRDFmwt+qY2x3
         vUJ+bROWxRyLiQn5clc/i0IKKce5VxGbbraUMhdebLbMsSzMmZW4E9wkb+EmgxakIj
         0jvmwR2E29DFKuFSjjW7Q6u8+yQ0xjpWGlDSWTz2sA7zDCyBVcWd+5xumcSnxBJyyz
         6EmUdTX40AlJPS7RqcGkMVLCWtj04K+pGIjLwxMxKctXsVHaopA2jcPSJk6WetGVEQ
         PHj9NpN6NXUdw/H1M441PHznL5S9myjGyp2Mw5MsAAqbWZJpMFeabjJf0SQ2LTJ84q
         RK/uVCVGzClXw==
Date:   Fri, 13 Mar 2020 07:39:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: linux-next: Fixes tag needs some work in the sound-asoc-fixes tree
Message-ID: <20200313073945.2cc1a326@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2v/Q4Zq9Vg6KGM29U5KwYXU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2v/Q4Zq9Vg6KGM29U5KwYXU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  16dcefc23eef ("ASoC: SOF: Intel: Fix stream cleanup on hw free")

Fixes tag

  Fixes: cdae3b9a47aa ("ASoC: SOF: Intel: Add Intel specific HDA PCM operat=
ions")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: c6be710f5e2a ("ASoC: SOF: Intel: Add Intel specific HDA PCM operatio=
ns")

--=20
Cheers,
Stephen Rothwell

--Sig_/2v/Q4Zq9Vg6KGM29U5KwYXU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5qnhEACgkQAVBC80lX
0Gx7nAf/XVYQA1zEyfNYheDuMRJa8VslcXk8cHKD42TYnIMZnBPw50i/cf3ahBZt
YQqDFIKiPkzuNB465SfkuClKY4vAiOyhoF/Lj4cd4VamCdmPKgqs43CK0/53j0WD
FPKiHRD2LbxoBCcmx5lsCANBfjNDoHpxJmO0z/yx3uMILZqrac33Uw+boh7Cc8mn
5PkZqQqDYlPeNHyHFNc5DlP4wRiTppB+xqGe1FXyRLEu1i9KiquN8JYFRqq8N9aw
kBsp23eGKFhZMWZZ8Ow6o42AHqL88Wg1tUnTgZKTz40cs9pVdGBZQIn/cUtx/dw+
mLwAuyBgY7AtbB4XN+PVhnNzdWmeLg==
=sE5j
-----END PGP SIGNATURE-----

--Sig_/2v/Q4Zq9Vg6KGM29U5KwYXU--
