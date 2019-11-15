Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF7DFE88A
	for <lists+linux-next@lfdr.de>; Sat, 16 Nov 2019 00:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbfKOXT6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Nov 2019 18:19:58 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:37169 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727081AbfKOXT6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 Nov 2019 18:19:58 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47FDpM1JKHz9sPF;
        Sat, 16 Nov 2019 10:19:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573859995;
        bh=eEEBKvYw/GN+oSZLuWFBn1TbetuCzMJ7i8usH3ZtHPY=;
        h=Date:From:To:Cc:Subject:From;
        b=F8UDLZIFCYbh5AA+i7bDyhxOngCurXnANFqY4FiGwy8KBvLmkGSD0oydtu88CQLNL
         l9qHIa44TCjzgAon2wekdIKXk0K9mCqT4I0Scs2AYNTeG3cC9+FY91xl6vaHwT1dhL
         OGRamTv3j8qEWqy7ruI0SYhSEI5IMyis1VgxiHO3j/EFAgN4qBOFzAuVbgws1nMTYP
         odZFpvp5VsIyKLRCfuDcogk3dQd+Jy0z9ju1e9cTyJF0tG0+q/X6YhdMLTZUKdASVP
         WWC1TPg98Cz/9hNl/x2lT6RbGD+Ta6I+bH34DIrW42IakKwvjir9vOCEPIEkdP9rKP
         IGEdjB1dUKn8A==
Date:   Sat, 16 Nov 2019 10:19:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pascal van Leeuwen <pascalvanl@gmail.com>
Subject: linux-next: Fixes tag needs some work in the crypto tree
Message-ID: <20191116101954.33672f2d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/D4Ba3eFEy0KYUIKk9yi1Tlj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/D4Ba3eFEy0KYUIKk9yi1Tlj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8c2c43a5be3d ("crypto: inside-secure - Fixed authenc w/ (3)DES fails on M=
acchiatobin")

Fixes tag

  Fixes: 13a1bb93f7b1c9 ("crypto: inside-secure - Fixed warnings on

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/D4Ba3eFEy0KYUIKk9yi1Tlj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3PMpoACgkQAVBC80lX
0Gx4dgf/fS9McyXiEhl2nlgnlt5QncfqCh40a08ze960Gftg46P5AWJVspS821iM
/Jz/JitSmZeOCy+HtvbgKsgc67y9iyqECBLwzcw28qfWY6tNOAucDSw6Drc1n67/
/pfjg7iZjyqwRArX3GUjTlWplvW6F/nF876NO4p9ZFchjSKzTaN9t7A4h64DbAuU
OuZYVLfXCGIM+oSGtBZpQQyNHfu+BTfv7hRa/BiQ7Wu+okZFTKzE8z1szOBRW7DJ
DExRz8ZxPfAy4uTeDtDiEYl4ec5j2yvVzcUtyJcwdH3ASe48yjfhUl+K233uaNZh
vY3bzGVS0BXYG9scNptIx08jZQhOrg==
=x3ec
-----END PGP SIGNATURE-----

--Sig_/D4Ba3eFEy0KYUIKk9yi1Tlj--
