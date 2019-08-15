Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38F548F67B
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2019 23:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730517AbfHOVel (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Aug 2019 17:34:41 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53679 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730367AbfHOVel (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Aug 2019 17:34:41 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 468fqL0LPTz9s3Z;
        Fri, 16 Aug 2019 07:34:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565904879;
        bh=0Mqy+lQwy2HXkaxa9xR8et7m/UPnYK4/lhOEuabYuzE=;
        h=Date:From:To:Cc:Subject:From;
        b=mHSbGFlEP16sPIlNXVRDHy8q4DOOmBAFloIaJ2JjsFOqonDoFVZ6UxeoVsI7K+rPv
         yhgjmQlK6E/Lb/VMT0K1x4iA+C4x8xWux0KLsqIq1dn4DJkY6yj9GW91VrVFqzRAiR
         26YERvt2qQbxZ7s5Vj55fTk6Tt+tqw0NsiNGQ0Re7788tnyFAGKhLS7iPK1iIuk6Mk
         Lt/fOfm+4XJWOY0IoXXx+Y2r3LFWFeB+v788miUv/XKlfso1+uE7nAduYhhnV6NRXU
         yNH85K5E48xzSAtJLpukZYL4L1InCRGub0L4Q3FjVXSrozjJvtJRrlP/R/j8V28Z2j
         gUIM4bbinczyw==
Date:   Fri, 16 Aug 2019 07:34:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: linux-next: Fixes tag needs some work in the sound-asoc tree
Message-ID: <20190816073430.1e22cc27@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y/ZpR9SY8+PkOn+1AgASdNg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/y/ZpR9SY8+PkOn+1AgASdNg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  9b4275c415ac ("ASoC: cs4349: Use PM ops 'cs4349_runtime_pm'")

Fixes tag

  Fixes: e40da86 ("ASoC: cs4349: Add support for Cirrus Logic CS4349")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/y/ZpR9SY8+PkOn+1AgASdNg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1Vz+YACgkQAVBC80lX
0GzJtgf/ag3xOt766JE2unSieAcKi+JsgycMK43W1ES2KI/tZK3tHRfThhb86Iv6
COfVi+FabbKxBBYG5BtEwvoYr9F4Pt4P55x16BstOGdrsf3h/YsCsFMVni0QEqBi
mrIwS2Vv5roSWpA6mrKxdN2y31lWiRoxrTDOis+9bCkQRcIu7OtInvxuaY+8c6A8
MXJ7aYwZUvIDbOBnoJlSbF/CyeDeiGp+ZuoLPcXbkkV+2IVpeEtxn8Skxq8lr6gI
kk+UjXt3iiE7R65vFqyQ2b7/0VHcng7IngiSqaray3BtSkPkWC8Xle8m4J0/6Vdm
MNH+iRFHwCedsHOh8kUGvW1YBT7NwQ==
=uxel
-----END PGP SIGNATURE-----

--Sig_/y/ZpR9SY8+PkOn+1AgASdNg--
