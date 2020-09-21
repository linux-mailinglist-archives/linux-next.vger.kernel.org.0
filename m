Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2C5271981
	for <lists+linux-next@lfdr.de>; Mon, 21 Sep 2020 05:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726228AbgIUDDp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Sep 2020 23:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgIUDDo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 20 Sep 2020 23:03:44 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B336C061755;
        Sun, 20 Sep 2020 20:03:44 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bvq5V1J6Kz9sSW;
        Mon, 21 Sep 2020 13:03:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600657422;
        bh=zHRydJ//9CKbgLmjHViNTtc3PsH2IpWFPJatWMiEFAU=;
        h=Date:From:To:Cc:Subject:From;
        b=PwDRI29bNEEgM7yJ/oqBKcXD+zYm1RKdoi4c/DSUsLmvrN469JpF3xk0L7naW/9Ij
         qGI29tyMGbqiidIs2cNyvP2UoENKWItphHHQnCHdK8i420fJgFlpv0kbouOIIDy9Ph
         Kj/SjnUU4XmlTsmkXXkqa3hyu53Zq1j+i9EGcytlWNfcXxMLICWhbZgSsItjKDv0Rq
         v/FlRq7msRPqgnog/6KYzeNb/wQlFU9X9HL2ra/Phoq27tStLTdNvNiIHkO93vde7i
         4gWEo8EDyc/UzgjuxWpH/r16OjiAcQuRxYkZn/2dBsi+V3syA7aPjuvwSk19jIqhht
         QOQHiZBuunLrA==
Date:   Mon, 21 Sep 2020 13:03:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the drm-msm tree with Linus' tree
Message-ID: <20200921130341.79c0665f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tMGAOwqeS6XRyDd1m0+wMfT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tMGAOwqeS6XRyDd1m0+wMfT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-msm tree got a conflict in:

  drivers/gpu/drm/msm/adreno/adreno_gpu.c

between commit:

  df561f6688fe ("treewide: Use fallthrough pseudo-keyword")

from Linus' tree and commit:

  2fb7487aaf71 ("drm/msm: Get rid of the REG_ADRENO offsets")

from the drm-msm tree.

I fixed it up (I just used the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/tMGAOwqeS6XRyDd1m0+wMfT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9oGA0ACgkQAVBC80lX
0GxsUQf/U0o7jSHqBlSJFhJQrU+SPlnZPBdRr3PVfFqUjixP6q2pgzvgROXXeWCA
Im4vjM2WrEQyejIOlo2ek7PqkYuyWjQcMg/ZTBos4dgfjHdKH4JudR75Pn88N1Mv
gXUZ73mNOLlIZZY1VDAOWZQnwh/feIKRSpo7em2SqgoF7cLSJo3Lq4BeJyi4sA2N
oeUvkDVps7m77VY2SASTibMcRgROjwVulOo4ECq93ytx3ykoGu2GshAjOopfn8jO
JcgkXMbC5oQzP/x0xkrOmiJKTtnxgGi4U72LqRbO4oW7Jo4UZF9YQf1+BYRYjZ91
gzIT5VuJANAw87umxSq5HXAk0IaZeg==
=Fo8Q
-----END PGP SIGNATURE-----

--Sig_/tMGAOwqeS6XRyDd1m0+wMfT--
