Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FBC11CEC2D
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 06:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725536AbgELEty (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 00:49:54 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40779 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbgELEty (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 00:49:54 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Llhv1FMcz9sSw;
        Tue, 12 May 2020 14:49:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589258991;
        bh=Ws73gRqk8k3hUblHMVJ0pejNCzPVOUjEReDogTs5DwA=;
        h=Date:From:To:Cc:Subject:From;
        b=Lwx37RbRBm0UaZHlnfUgu1u9KLEm+2LsDsxGnUq5HlkkJkVwB2rSEW0hsxHxuFflq
         AYBuoA+KacCmR1Jo4WJ0a8AHHF1Fbap3O50nmfRn093A8RxZdaeW7VaOv/DAUblqbi
         jJ3ypKFYAHzSPE7e2DwTk30zE+2O55nrXM0/N02B/VU9wYirnpXp/+YPf2PrY1JcgP
         K2UlGEwC5uASbtbeay2LeFhOQxRmQZ30X79hr0WJBZjebhq6H5KCR/m2+4rQCLNre7
         Jr1ksLmNxrXgj1O/RqIGM+iXbbTELiS+y03ZVwktERUmBxwJg1/h4Mpoma3azOXhSP
         E2zChFLX4zbNw==
Date:   Tue, 12 May 2020 14:49:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Eric Biggers <ebiggers@google.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: linux-next: manual merge of the sound-asoc tree with the crypto
 tree
Message-ID: <20200512144949.4f933eca@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wm7wZpNQ4L0+owAPFPq0zDT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wm7wZpNQ4L0+owAPFPq0zDT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sound-asoc tree got a conflict in:

  sound/soc/codecs/cros_ec_codec.c

between commit:

  85fc78b80f15 ("ASoC: cros_ec_codec: use crypto_shash_tfm_digest()")

from the crypto tree and commit:

  a1304cba816e ("ASoC: cros_ec_codec: allocate shash_desc dynamically")

from the sound-asoc tree.

I fixed it up (I just used the former) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/wm7wZpNQ4L0+owAPFPq0zDT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl66Ku0ACgkQAVBC80lX
0Gxzqwf/dQ+FY+fXxCus0ESPCvc01iLjsa6Xcf3mapY2UtVwbCh9B02c/vH38356
sxAKGOguUQunXWRULUeEZ9UhEEopY7Y36Kqp4IvdVW5Mt8xE2Nbhb1a24i8VYMWF
nuYGIxMhI5FmNd8qkw0kj97TjV0K1gV3/TQqtdYgzbH56hCQI6+2CUh3mtaLf9Ad
y4b69Qb6JzRbL4k/unmsFSvNIDyqXn5+jbbvp/fIo7CyJX/ZmWt5cx2mNhN71dYv
tbt3t6gffPYQHowPtOF+L7eKLUNwvB0JBtGY47AbXWgKpXoREfO9IZQUPr5oimYE
4GE5DlIA7CCzwtlZ4bZC0ix9Msdd2A==
=Pdn2
-----END PGP SIGNATURE-----

--Sig_/wm7wZpNQ4L0+owAPFPq0zDT--
