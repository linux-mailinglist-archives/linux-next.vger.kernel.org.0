Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D43683F7DEE
	for <lists+linux-next@lfdr.de>; Wed, 25 Aug 2021 23:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233455AbhHYVpG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Aug 2021 17:45:06 -0400
Received: from ozlabs.org ([203.11.71.1]:38445 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232768AbhHYVpG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 25 Aug 2021 17:45:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GvzyV09sWz9sSs;
        Thu, 26 Aug 2021 07:44:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629927858;
        bh=ST1wR9VGpOHgUTXovKGHbI3WZhJIoWBpGkeOWfnhdiY=;
        h=Date:From:To:Cc:Subject:From;
        b=onWPSfPqpCf71gLij0v7e28rYymy37oaNz9OEbBIqq6c+0ONqtBHiZG/VQUJOwK/z
         yCxihcGcT5loA4as/zS3YH3oNqCiCQo7IXNmIY89uGMYUtFVRfb5uVmB5z01OuHMEX
         gtQ4jivzcfy74vhP/6S55hteyAIRnCw/03+7ict2mDtrq7Pet6/pz2wD8kYDOnueza
         pM+AE1BriFDrcV9vstAUtc55D6+0C0tEkFtPjFi2KNI53fWgsahRCtzLPcb0SrZlWQ
         eb11cnSU/oMSm0hItI6VwallbRkJ/WMoFiAmfg3WQgSxCuwbIf4Pk0GLyRlAW0pkQ8
         t4/lNAxoUCRfQ==
Date:   Thu, 26 Aug 2021 07:44:16 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the i2c tree
Message-ID: <20210826074416.5ee62678@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DZ/QnAGJQTqogMKx9hN_Yc7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DZ/QnAGJQTqogMKx9hN_Yc7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  661e8a88e831 ("i2c: xlp9xx: fix main IRQ check")

Fixes tag

  Fixes: 2bbd681ba2b ("i2c: xlp9xx: Driver for Netlogic XLP9XX/5XX I2C cont=
roller")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/DZ/QnAGJQTqogMKx9hN_Yc7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEmubAACgkQAVBC80lX
0Gz3aggAoHgssOtX+b3JM7L1S6P3+t6Ala+fgg7C0JHx7QFk0OMK/tcp/0eX2FB8
9r9+P/n+2DKlos8P9dKEfeYKsDzQtonW9M3ki/+RiUCwlrr0PpQRjoTLhhfJTVl/
c4R2YNfbUR75tRG1nsgllYFWDcgF8MLFAev2TVGPy4oVIsFD9DkG7k3ZUC4RLDA7
PNqnWqg/F2r1i1y73LC14MWyUNge/voYielHYz2NUeIclYY+UqCPB1V3sQUqp3iw
gFc9kjtrv++R7Bb2oDdcKo+HVApc3xTiO213T5TfPjNF3sbPFQve+D48Oc7fXDHq
Kn/2NS2ZVsEd7/a/Iza6jRVpfmC1hw==
=je/7
-----END PGP SIGNATURE-----

--Sig_/DZ/QnAGJQTqogMKx9hN_Yc7--
