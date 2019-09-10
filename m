Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1452AECAB
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2019 16:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732434AbfIJOLf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Sep 2019 10:11:35 -0400
Received: from ozlabs.org ([203.11.71.1]:49783 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727415AbfIJOLe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Sep 2019 10:11:34 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46SRln03S8z9sP6;
        Wed, 11 Sep 2019 00:11:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1568124692;
        bh=iosbdi1w/L3Iq2gU94f99/9L4OC1yILT3GuWLS3hHLc=;
        h=Date:From:To:Cc:Subject:From;
        b=XWcrTEPjg9H8c594qHVIqto2W6XNWLVwnB34fZJFtiu0mfZW+GZ2cZ2qlV8z31wfX
         KbL0hgQ4WyYOrOPmIDQtBMfTAssUYarRC29yOCFrdVV9GspVfxkkSjj3GAS7T6HZbf
         v32+5p0q1pdK0jI8lcRMOeFry2UW09iC31AWMucp7RraexXAhdfm8GtVCRLPTUZTDV
         aAnCOQneAOAPPoJkW4r9SRmIEbPU4fOPOj0YL1t3tcKSHLacbHtCDjyo2+tTmrO1Z3
         xvOSQR2IEusbVKFlOQ3k53Eorl6+R0lokrC/kSmg5pFEXuu3c9SKHsSBD4TwDa6zsA
         zIdgqxuysk90A==
Date:   Wed, 11 Sep 2019 00:11:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Drake <drake@endlessm.com>
Subject: linux-next: Fixes tag needs some work in the mmc-fixes tree
Message-ID: <20190911001103.534819b9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eWMHCg0w2h9wZ_R0.u1v9Ig";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/eWMHCg0w2h9wZ_R0.u1v9Ig
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  9fab7e575727 ("Revert "mmc: sdhci: Remove unneeded quirk2 flag of O2 SD h=
ost controller"")

Fixes tag

  Fixes: 414126f9e5ab ("mmc: sdhci: Remove unneeded quirk2 flag of O2 SD ho=
st

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/eWMHCg0w2h9wZ_R0.u1v9Ig
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl13rvcACgkQAVBC80lX
0GzVzwf+PSdmDwPtggR95WPxc2UOPE6Zy88EGhAxBA04+sMQ44JLHkwjbZrZg0WG
60aCn6cezzHCvY9IDWULbrxpDetU7GgU32nCN27HvL0cg0EyS0NzcPNHtP2cODiF
m2qg4aXtEeLJMhH/2xAqiRMVxR8tarDXbaBxQ2AjHPWTpi/lOI32TMH4/MEIEQ54
CRoROvh9Xz2q2tT3xOEf3V3Pmfnt8oOij8hNx5XD3yWd7POHJyov2ta19/yQEQM5
1+G1qaau+jUoLCBomXs56U93ZXo8ll/353aciYpSPCuY5vZUjpLRUyMomusqO7SN
Ex99x149rdNpBwZXBTxq9SvrD2Hk9w==
=yElV
-----END PGP SIGNATURE-----

--Sig_/eWMHCg0w2h9wZ_R0.u1v9Ig--
