Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C37618586D
	for <lists+linux-next@lfdr.de>; Sun, 15 Mar 2020 03:07:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbgCOCHj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 14 Mar 2020 22:07:39 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51809 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727566AbgCOCHj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 14 Mar 2020 22:07:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48ffVF0jzxz9sPF;
        Sat, 14 Mar 2020 21:50:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584183030;
        bh=FH952WJu0tC2cJHlEJcqvTFIqkewn2RqDAMQP+CMBsI=;
        h=Date:From:To:Cc:Subject:From;
        b=qrvZ3ct8fNKwsBUCRvjX3oC2+FibfJ3kFNEopUy8ytNjpdiuBCSGnZ81UqkNA43LA
         ZeLf1KzL+g/496ePvfcSwZt50InEByrSkxJE9EGU7eFyOLQixjrGEu73KIYZiABHIE
         ddPWctCuOTGGwHstbjQrSuXMpNU/i0rwYXMnWZRnP5gqijzPI1JT2E4+xZ6lcffrGZ
         H6VYLQ1jkIJrYndSkuqeiVWiN2vnagWxQS3NvO4A6jvo0vJNvH0cOEdRTLnM0+O0dC
         PvjLc3v31D3wUYeL/X0ec32EUtACRLDb8F6kePkFYByTNrCIjuFcbIQOky4VF00AGD
         gKY6KLN1UCL4g==
Date:   Sat, 14 Mar 2020 21:50:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: linux-next: Fixes tag needs some work in the sound-asoc tree
Message-ID: <20200314215023.36d41bb9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JidOrxxZIwyci3zaP.++HE7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/JidOrxxZIwyci3zaP.++HE7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

n commit

  5c82813ce43e ("ASoC: Intel: boards: drop reverse deps for SND_HDA_CODEC_H=
DMI")

Fixes tag

  Fixes: aa2b4a5 ('ASoC: Intel: boards: fix incorrect HDMI Kconfig dependen=
cy')

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/JidOrxxZIwyci3zaP.++HE7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5stu8ACgkQAVBC80lX
0Gw3mgf8CMSfxE1yDJu/d/r8M8C2FnqFqDSRBniWr4Vz+wgPpheArQ/qEF2c3EH3
+QR9AIJmuPFRi4fFF/dGiAGVEPjytY2IyMWVJnvUwcyopMJBURX3RF6gupstaibX
k14+ek1ofJVmD3lnTL/KZK8XWdBtUAwT8MsYqQ0e4Qp99cC5BSkHaaS2oBfa4XEW
yZpU98Xh0C4i1GTu3Vlo/AKA7uhFF7rTtcGQawE0cl8BVa8p6vH8RYTqfLBAPyEw
w3UrEIpOGKdS9oBif6cZ0NwbSsN7KeLPcB/UrAGGi6wDDWVEjx2JTIA8YEE2ai/X
f3R1Z4f5WWLuGJqhhSmnAgP2SB9TmQ==
=CU9u
-----END PGP SIGNATURE-----

--Sig_/JidOrxxZIwyci3zaP.++HE7--
