Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CED4B43BC0C
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 23:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235840AbhJZVKA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 17:10:00 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:57803 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235813AbhJZVJ7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 17:09:59 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hf4CP5Dmdz4xbG;
        Wed, 27 Oct 2021 08:07:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635282449;
        bh=UthEJtyhT5RIAUn1+FAgs29p5I0d7JLIMmPFt7GHEA4=;
        h=Date:From:To:Cc:Subject:From;
        b=dWFQFKpjlL7mr2jVcybLOYF8h9FkUOoVejg0TRGbRcf8B6SnVFLHLPcR1nHRPkAix
         wS3z3ELfHJ1W5HQr1hOTIrqLorY0DnZVIrHcqt0q/9GHboBqt0nImzbiT4x057bZzn
         SYLHkvkdqP5Cd2aK8d7cp08f8qXUQ4eP5GrFXjeYDa8EvLqBv34jzGaWe6dz6z2tAu
         Q2ocWVjoCHfmuXGolgHq1dPikdP0//E1xUCRMlRPy29P45YLIA74GycbJQ+vo4K/0i
         FAdbJqKBYFT2t0zw+drtRJpFs+Ar8YR67vwCRRb5kyseA9w2FQRiOTdHpS2bxzXTFP
         zeDv6I6J5oWqA==
Date:   Wed, 27 Oct 2021 08:07:27 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Richard Weinberger <richard@nod.at>
Cc:     Petr Cvachoucek <cvachoucek@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the ubifs tree
Message-ID: <20211027080727.7e9df9be@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Kje0IdHUX=py9_NN6ZthpZf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Kje0IdHUX=py9_NN6ZthpZf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  e7259f574fca ("ubifs: Error path in ubifs_remount_rw() seems to wrongly f=
ree write buffers")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/Kje0IdHUX=py9_NN6ZthpZf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF4bg8ACgkQAVBC80lX
0Gy4JggAjubIQQkRjchjiE/CTR8JPthOWcfp8TlzkE7TSCgc9axdBOYCPOyL1UBB
kwLXVRn1w5aMfI6wJIPUhEMXS3hsQ8qQGbFvMgu9n3ZCk+d7Kfvbr8T2wAsgWiaf
bDkGakD/mxkiuYpBSz6u3SH66W0jvke4gHFarkNu2zM7ns4Ab3QITFRGZ2FklHe5
BhyzflGLmcGCcY/+fTVoZt+F4F6c/M3m3hk0VqOm0B/qbZuIZCWe+dllxavagCjW
JLLazJ/n6NLRp96vbDP7S77TWOd8vTtFESxbDDc50vp968xjAG41mvwqgtw5wIs7
3I9g36PtLGIFQM/UPiLO32F9hA31+w==
=/k9B
-----END PGP SIGNATURE-----

--Sig_/Kje0IdHUX=py9_NN6ZthpZf--
