Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4099C22E6E2
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 09:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgG0Hqg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 03:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbgG0Hqg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2020 03:46:36 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8836C0619D2;
        Mon, 27 Jul 2020 00:46:35 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFX1j6rDvz9sRW;
        Mon, 27 Jul 2020 17:46:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595835994;
        bh=OyFK23EEAzKzQf8PiO3NBnsNkfMdybSgGGu1JgJ4NWE=;
        h=Date:From:To:Cc:Subject:From;
        b=RAuGFAnf6krRksT41li3gRxXRTiuPu0MdwaHQ7RpvldBJXfXDt89hmaZ/bVSWCyli
         XJCF2NuA9kJ4SRLId6K9O7fojQlpe9Cu1Vktey2U0ooEGxK/dxSIq50eFJyLO+eEY9
         uRCw1Fh3zSdO1KadJtCWUiZEJZwfVx3xcG0jPqARX8F5WvatFip5dKO6BrImUO7z0M
         7OP8UsB+tbOb0/C8dDeynxU3ElKtgA2CEamAUYAmOE2vFuNRJ9OG4pTmZUh1dgTcAv
         g2Tbe8Nu9rKjX/UDz5XqZZ8f9ltuvoD9Oxaf9aDL3L4XsMqOamPsZl9rGx86ysONuv
         E1+Mo7lrXtq3w==
Date:   Mon, 27 Jul 2020 17:46:33 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Oded Gabbay <oded.gabbay@gmail.com>,
        Ofir Bitton <obitton@habana.ai>
Subject: linux-next: manual merge of the char-misc tree with Linus' tree
Message-ID: <20200727174633.40fd8f15@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wdV_+DImcfZsl3kIUSXr888";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wdV_+DImcfZsl3kIUSXr888
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/misc/habanalabs/common/command_submission.c

between commit:

  cea7a0449ea3 ("habanalabs: prevent possible out-of-bounds array access")

from Linus' tree and commit:

  3abc99bb7dcb ("habanalabs: configure maximum queues per asic")

from the char-misc tree.

I fixed it up (I used parts of each that no longer conflict) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/wdV_+DImcfZsl3kIUSXr888
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8ehlkACgkQAVBC80lX
0GwHhggAoLfNPpYh1aF/JvXmGyiZAh4m8WZPbfS2e/1vK3rs4hJgphpBo8ZdnH9I
nZtAVTfORhcGQTfXPPGI8eVGFIi7+0U5D5Bum+u1v4iwCJIteFaY1bp/+KkIuFq/
t0WR55wrIY2w1P+kBgh1ggo0kgC2QDFzOCBCAuKwKuJXvBGGWx2iHTGeMZ70Njau
VHuoHw71s/JjNnW8iATxUaY6BGS+UgZQMj8RgBGPxVoshwcZHXmZTVxXARauEszS
QA4kowzlH/O8RkkVQqIgimtOcjGTQC/WMr1iVPw95arEE5ZMJsFg7UcTCYod0P3m
U/6JoPDSf0D8hUmVrTZfoPuW93xpeQ==
=m/Q7
-----END PGP SIGNATURE-----

--Sig_/wdV_+DImcfZsl3kIUSXr888--
