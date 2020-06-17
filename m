Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B439C1FD9F0
	for <lists+linux-next@lfdr.de>; Thu, 18 Jun 2020 01:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgFQXwi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Jun 2020 19:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbgFQXwi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Jun 2020 19:52:38 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B135C06174E;
        Wed, 17 Jun 2020 16:52:38 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49nMLr2XVhz9sRk;
        Thu, 18 Jun 2020 09:52:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592437956;
        bh=pUtJEfP9Kni1G2xXnNuxm6zr8fgGmvTP891aB2Cz9Yo=;
        h=Date:From:To:Cc:Subject:From;
        b=DH/7QUTWhf8VwNIWeGcZQdEGHlx61+kH9MCWzE4rkMJHlRhCyae0M8/f/YE7gLygs
         tckjn2k54CI5/q8eYs6Ers8zQmymttqRx7YGLcc9Yg0HHf9NIcCknn3TtXlndmVvV0
         +0PgE4kf7ZxhFADZ6I9MXcuej8rBpeHS+MtRswcvn5iZgcE1M4sCNskaYX8kooKOs8
         fjXFJ4X2saghtYznXPG6aHr9/dIQsdraSPdT9OFSNVZkgqmd7q650Ot5sRt2PPbM0o
         Idbo4bFKiU6WeM/qimPJa6L1WG1FsQlq63HUxvs7TLfNmYZ4tPAcojQU8IMrgPk2n2
         jWgP4UKsSwlFg==
Date:   Thu, 18 Jun 2020 09:52:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the tpmdd tree
Message-ID: <20200618095235.4040a1bf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HjKE_XcXZlnYbUf/VAnCbFs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HjKE_XcXZlnYbUf/VAnCbFs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  8270cafb505e ("tpm/st33zp24: fix spelling mistake "drescription" -> "desc=
ription"")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/HjKE_XcXZlnYbUf/VAnCbFs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7qrMMACgkQAVBC80lX
0GwvJQf/bKUBtZyEsAhUOvMYMDW3lGsznNk/NY92Zxiq7G5zjvqKvxw2T8KnySxH
p11bX1rgh6DRNM/a+S3s6Zl9lbSC+kuREKmB729plufzZEdN8OtP2ksqdITLRGH3
H4cG4dVp/T72Xf1hBpXoo+uECqnQQhTfpEllVl/cjPY6EOSGID8Z3CignM2n+f9r
dKtfaKekc4jYm3nr/IjARqIjJMBqwrbUcAX0hg1dHj7bwW1huohmpdjLeFPFV3a3
LemPuT9IENAsIXduJcqYx/u+yZAFYIjXqhD/gdO6gJ/H1//GoGNKjAm7DmtN2L87
TOKlM4GUK9joDzi0f5XmuxeAu3SmwQ==
=paSh
-----END PGP SIGNATURE-----

--Sig_/HjKE_XcXZlnYbUf/VAnCbFs--
