Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A46A243C836
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 13:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239966AbhJ0LDr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 07:03:47 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:52503 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231473AbhJ0LDr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Oct 2021 07:03:47 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HfQjW62Vjz4xbG;
        Wed, 27 Oct 2021 22:01:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635332480;
        bh=8V10gVOSySKY+RIZmut2n23AklVBFvSx199a3IrUKvc=;
        h=Date:From:To:Cc:Subject:From;
        b=C5LYcB2bd2NfpfNDdY8RJeAhK9y1G/2o9j1dNUWsmQdtXfUDxI68DOe7a1A2mqp8B
         HHPRRTd+WW8CNdp0LIOkwPVAibT9kTz8ouIxEHbAyeCmxQc5SJnE82SIRjBV5Bp+v1
         pWp0zypQgg8Dn0EyLjEXda29nYkYNfS7cuRj92+5tDUFdt+tpmGgI3SiNabcAutWvX
         QgT5v8w1s0lgsrl3n4jTMu4y5RV+Z5nYHCltuFmsqL65+oD+6lkF8lWueDEby6AiiQ
         mIpftZN5f+bONos2rV2hL/onU+pAoS0h5imIvQUyM2wL02hs+Wq9nRQ2+rPYnN2YyT
         yPlGg5eCNNrqw==
Date:   Wed, 27 Oct 2021 22:01:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the pinctrl tree
Message-ID: <20211027220118.71a229ab@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4gzLc37za48_ugFjdJ4i_Ck";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4gzLc37za48_ugFjdJ4i_Ck
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pinctrl tree, today's linux-next build (htmldocs)
produced this warning:

include/linux/gpio/driver.h:284: warning: Function parameter or member 'par=
ent_handler_data_array' not described in 'gpio_irq_chip'

Introduced by commit

  cfe6807d82e9 ("gpio: Allow per-parent interrupt data")

But may actually be a problem with the tool :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/4gzLc37za48_ugFjdJ4i_Ck
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF5MX8ACgkQAVBC80lX
0Gyi2AgAno68K6wEyWQN8nmvn8enihDwrTmHxS89/n2/4GG/McV7W7FNyc5yaiId
zfDoJQGpMavpTgooN/JZw1H7blZrpDWuv5UAtBQ8z7rrDN8O5QY4R6kbulnc38Nd
RgULm8sULgznHYDFo575b/XlvHXnakeQ7Fw50tF6/Sy6MV3rIWdy9TbEpGpRkwWH
Dk7MoMEod62Cu820BbLiT2bKpTt2uiaELANmjudTwkVULSX+rmBBgWlKOChdjmvn
2/rg6UZ9dXuZxW75sBhaH5vCE9HVt/+MtZ29JDfm5tcLsnxmvBzg5TkrFpvu06EI
9l6hiYpAPqXLdrVdaDu9/unRN56jZQ==
=O5jp
-----END PGP SIGNATURE-----

--Sig_/4gzLc37za48_ugFjdJ4i_Ck--
