Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D96892F20EE
	for <lists+linux-next@lfdr.de>; Mon, 11 Jan 2021 21:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389468AbhAKUgx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Jan 2021 15:36:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387533AbhAKUgw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Jan 2021 15:36:52 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC53DC061786;
        Mon, 11 Jan 2021 12:36:11 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DF5873f1kz9sWj;
        Tue, 12 Jan 2021 07:36:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610397368;
        bh=4Q1kk5HQ7U1BUkdCOrDIfFA0rH7QvMmpBaG/lkXMtT4=;
        h=Date:From:To:Cc:Subject:From;
        b=UQSYEz60ht3TGbeaMTvMmfcJmsedLRNkOWqqgYGfYL92UwnC8FGDqibU5lU7FXtwP
         KpJcACCXWGvzFvUPeldled4ilKEJVGfO94qzMudtqYRqtdb3ATP0IW7KmSBR3IZncG
         OPMeBqHrVwIaMTivxuVfwILyLSl5aBYN2RNfCkzEmX9Na018Uft5MBcRuF848NUGQv
         nNiTTNkHE4F3eqfKRI+z7WQRjGAelJvkoTOa4q+S2c1JC53FXVl4AnGOVzLDUdTgpE
         ANC1YjXjOPAIGW/GDhy3Qob/OZKusoGzs7eZGGX3d9BqSuyx+7UWihMwLXL2j4MdxA
         JTTnXqYK532lA==
Date:   Tue, 12 Jan 2021 07:36:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>
Cc:     Pratyush Yadav <p.yadav@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the spi tree
Message-ID: <20210112073606.7cb02e42@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/szoq4GP6pSIYGkavuG.r.QO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/szoq4GP6pSIYGkavuG.r.QO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  2ef0170e9039 ("spi: cadence-quadspi: Fix build warning on 32-bit platform=
s")

Fixes tag

  Fixes: f453f293979f ("spi: cadence-quadspi: Wait at least 500 ms for dire=
ct reads")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

Did yu mean

Fixes: f453f293979f ("spi: cadence-quadspi: Add DTR support")

or

Fixes: 0920a32cf6f2 ("spi: cadence-quadspi: Wait at least 500 ms for direct=
 reads")

--=20
Cheers,
Stephen Rothwell

--Sig_/szoq4GP6pSIYGkavuG.r.QO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/8trYACgkQAVBC80lX
0GxRaggAojHiY62pgiaQmpSuR9rFYF8rwBgay/0mD+KCemxhzGkLoUJrcPDvOUot
VIy3OjnNvZHY5FGr6bEK3sdRAx6KYQ/gvL/EiBGwj43q1PeNF9bpKUlGAUFlfWLJ
pZSrVXYcU463GjRe7fKnEWcELfcIYFqyXWGKXDvm2tAgPn0FVdO7Uf2ASJLmbQGR
E0araqrmoBYGHVG8A2/Nyc579nDpa4YaI9wtt2I817kI1DXZ9NC3p1yibVNLIFQd
ZjsHeicuihy7OTR6Y7ekZ0d9pr3wG+CJC/Tbp/OMj44RwJFs5+jzn+GepsHsPdOm
3KxcTvbIDGCuimSAmfuTlq2AMA+hvA==
=WLat
-----END PGP SIGNATURE-----

--Sig_/szoq4GP6pSIYGkavuG.r.QO--
