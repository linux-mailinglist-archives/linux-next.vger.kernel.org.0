Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4849ABF2
	for <lists+linux-next@lfdr.de>; Fri, 23 Aug 2019 11:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731778AbfHWJvp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Aug 2019 05:51:45 -0400
Received: from ozlabs.org ([203.11.71.1]:58791 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729716AbfHWJvp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 23 Aug 2019 05:51:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46FGrZ5WXvz9sBp;
        Fri, 23 Aug 2019 19:51:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566553903;
        bh=QLzdlGUP2qHEZlzxsdrO1oxIaTROUs3zT3IbbobvE7g=;
        h=Date:From:To:Cc:Subject:From;
        b=OIQ0AQe8iVVw+fLNrQ3/q3fEyUTbhCJOv+E7jYQc56hj8wHO9ciUq6b3puZ+SsVWg
         U3ypD9L3ICPtB+2DIDezTalchGkvMfdIwnNlj3yqOnjaNR7ZoV8e0hAKf5sQK8EMBs
         F9iaUP2FALOTinEVzVIUvpOairD4gj5T6+zMGKsZ1HEXFrSNeEjvmD8SQxT8ccAW+q
         b+ZoVCAbHWv0gwYVJmN8vYQcIgnRCFwQVHIq9CfgG9nX/hwbTQoNjaKcHY8rxekZdU
         LLMJWX6q3AECF4OYK5YD2/mQK43bTkuN0t5nrexc/7PXSbIf5GSNCju8gplHR/DU4i
         pEDwzdqnBm+2Q==
Date:   Fri, 23 Aug 2019 19:51:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ben Skeggs <bskeggs@redhat.com>
Subject: linux-next: Signed-off-by missing for commit in the drm tree
Message-ID: <20190823195140.3bc7821c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eDkqsrvY0P4s280mUgHpOaC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/eDkqsrvY0P4s280mUgHpOaC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  88b703527ba7 ("drm/nouveau/kms/gf119-: add ctm property support")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/eDkqsrvY0P4s280mUgHpOaC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1ftywACgkQAVBC80lX
0Gy+gwgAm56anyFuDl42rt7iwMXlmwMaWLDH7JyiYBHCx4Wl6oD/R98T0D1eT4dX
KgRF54RSZcmpneQDgwqGv/zSKC3xl4vF6+/gzguw5M5KQZiHriYoNp2PV9/o+kWm
5/5sz/REq3DHb4uk07BZ+iUbRFPoifRpim5d2KOmV2IwNMfiNln64weFUgNH3E3A
ODZWQ68HuOsV1JdkMUzutP+VrMKIJsHT/6Bb7Q74SlVzZ9D27QbKnkYA0bPzdNUX
EIyARO8EbMx72nCPP+Nze2UVa/LZG7DWNHWyPL0kw+w1mE3zBLmDT1g9qlgfIf2p
Csxt1kTjoHzphZkicet6jxRZzycyZw==
=EDY5
-----END PGP SIGNATURE-----

--Sig_/eDkqsrvY0P4s280mUgHpOaC--
