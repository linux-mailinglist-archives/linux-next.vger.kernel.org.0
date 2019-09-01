Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD98A4C40
	for <lists+linux-next@lfdr.de>; Sun,  1 Sep 2019 23:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728958AbfIAVS6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Sep 2019 17:18:58 -0400
Received: from ozlabs.org ([203.11.71.1]:45707 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728942AbfIAVS6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 1 Sep 2019 17:18:58 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46M5gM0DHPz9s00;
        Mon,  2 Sep 2019 07:18:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567372735;
        bh=Bse2SIC2VqIWeE1NZUt3RLLarWXhnirMrWKtkodGUdc=;
        h=Date:From:To:Cc:Subject:From;
        b=WaA+OpsNqHiW1XhxG2n/IS7hdUz7mrVkpZDDwUwUAfZSS1j7GJzrXyUwcdjK4FqWB
         5h174YPgDkqVaQX0ah2OPJwht5+R+00GlcTiDWyVLCLOZrL5x8jXeM/T2JP45O69Sg
         T6nMPksW1nbusLwXWL8/mkJkg2iJwwM9T8ieiQLJRsU3b+SYqkcQipiDfhmVdbkUJK
         I1uHbdUCgNRdHXA/usuvq0SgawZJmzZtgklQnj5kg+FETT+Gn1rdrRjKTLnPqxx8Q3
         fdBqqAO0wdX5LUdxt/gSLKt1M9xnvB0H0GQTHOWLwG8gEaEVuNGd7Xf29kBQDO4Ooi
         A8K/L7+HkJMAQ==
Date:   Mon, 2 Sep 2019 07:18:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the asm-generic
 tree
Message-ID: <20190902071848.6cc2ca04@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fnsoGgY2z+1oe7Vig_363h8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fnsoGgY2z+1oe7Vig_363h8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  adea510eaf35 ("__div64_const32(): improve the generic C version")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/fnsoGgY2z+1oe7Vig_363h8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1sNbgACgkQAVBC80lX
0GxZ2gf+JW3sUB+QI1N2K++8nPMKlpmCzzi783Aa8c41Fjq7tOK2cBCPTmF3xpra
0xkHvNjJ1yxbwP0DNT6RJn67L3ZUETGeJXw1CxZkIDbTdacPI0BtFPupgDkrfKy0
fSPTvITziRrpaFyiIb2Mw6LLfrS61HVTzXfyzJNGkVcaCFhvoTxX/ESuCkzamXIe
PLcP5DzPcL2GEB6fa9Io5ITCVyVJ2jtsLr6/oy3DExiixOr44Se7dAjd4jztOOck
kO0RS6KAAzV2oQ37wkms6v6xJSm1TFBliTXnv0/yT4Woe4ksgaC8E6heCxpVbb5g
30zY+s2bbYaP+UXqdGoADCRgF3rilQ==
=Za9J
-----END PGP SIGNATURE-----

--Sig_/fnsoGgY2z+1oe7Vig_363h8--
