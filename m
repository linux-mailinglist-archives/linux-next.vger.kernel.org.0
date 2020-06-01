Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADF281E9F6F
	for <lists+linux-next@lfdr.de>; Mon,  1 Jun 2020 09:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbgFAHo4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Jun 2020 03:44:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbgFAHo4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Jun 2020 03:44:56 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA6B0C061A0E;
        Mon,  1 Jun 2020 00:44:55 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49b6dc0W4Kz9sRN;
        Mon,  1 Jun 2020 17:44:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590997493;
        bh=z6WLdrux9PFMmWECwD1K/hoO9y3u+bAxkYzGOqRvbPM=;
        h=Date:From:To:Cc:Subject:From;
        b=twTD2F4Gc/G3CE/bMhXs79L/CKjAVi0l2dvV9FI34AHqGdm1+9vO4l+uNOyE2lj73
         noRpbzy39YiRErI8tTQTrTLh7fS4tA0mXKujirE2l/1VYINIAnwTjrSkhDrdWg2OPV
         blxCSI9DDs+lT1UuWsFGsHmt3UfAzbcjdtVyHOiNXhxHA8vnyr3yKTzr8wE+1sR8Ew
         RQuVTWnaJG3NW2rwjeWrjSFTYpWQJnk8jvMIV9EK3Ts8Mt8tc997lkzcqBTNuVXkhb
         w2vd5uDv43ZJDo/cAD6SB8ml86TllMLRijw7OdDw2ab/xPQSv1Hnkwcjw/GEF8EukC
         DQp6r9y2A9sFg==
Date:   Mon, 1 Jun 2020 17:44:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jon Mason <jdmason@kudzu.us>,
        NTB Mailing List <linux-ntb@googlegroups.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sanjay R Mehta <sanju.mehta@amd.com>,
        Arindam Nath <arindam.nath@amd.com>,
        Logan Gunthorpe <logang@deltatee.com>
Subject: linux-next: Fixes tag needs some work in the ntb tree
Message-ID: <20200601174450.7a0d79a3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EeKjYcGmKX4jJPzaAOqAoiG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EeKjYcGmKX4jJPzaAOqAoiG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  eb3eabb28cf2 ("ntb_tool: pass correct struct device to dma_alloc_coherent=
")

Fixes tag

  Fixes: 5648e56 ("NTB: ntb_perf: Add full multi-port NTB API support")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

In commit

  55480afb82bd ("ntb_perf: pass correct struct device to dma_alloc_coherent=
")

Fixes tag

  Fixes: 5648e56 ("NTB: ntb_perf: Add full multi-port NTB API support")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/EeKjYcGmKX4jJPzaAOqAoiG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7UsfIACgkQAVBC80lX
0GwnUAgAld9zNIu4OOr4xLt8SJSe3C8ofwKBmAZesfM8K1oLwVyng98JFfPKLbfu
fjpwyOrUAODbPL30urB8GTq92N2S8/mbC3LAYCg70raHKM6Vts055hh9Mj2s69EB
+fRJ8Kr9ttfDEw52xGy9CZTw1akgg+8+a7Xe4p8Xhvm5vwppMV9BlTKNFC+PLipD
PPNSBUf1upfdOpt2SKmcsjAGJ1LFmnFXXRVeDcVUanzOTR5i14SmzYkZxJKaRO5C
i1fpSQlQx8N2KGGem7wxcaBDvX3Ra54+QHLS1POoCyhzlsKklE2ZhwqYwKhscxgv
Y6ehfvtLoytjtf+HIztYmxTPppLlZQ==
=CPSM
-----END PGP SIGNATURE-----

--Sig_/EeKjYcGmKX4jJPzaAOqAoiG--
