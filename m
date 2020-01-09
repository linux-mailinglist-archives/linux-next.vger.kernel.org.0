Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B789D13550A
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2020 10:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729051AbgAIJAh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Jan 2020 04:00:37 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:43313 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728919AbgAIJAh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 9 Jan 2020 04:00:37 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47tg7Q2Z50z9sQp;
        Thu,  9 Jan 2020 20:00:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578560434;
        bh=dzx7HLZJUiOr/H9eH8PAr+Mta7u59cFYzgiQYZF92zs=;
        h=Date:From:To:Cc:Subject:From;
        b=t3pwlIAFWYlxBamGmd8/Yubl7TCXYwLU1r3nzoGopOvwKt87XYgGD4UE/ArOKcsuq
         wBWD2EH/qa9lWC4/3zKdNGdhXcdD4qM9gJeilhXYHixJxjZH1C+xXesC8IXdVqjKl8
         4M60Yf1w0vr1sprkgNr7Q2WQ9D5GC2wI2QFnTRni/JDvVcCuzdjcRzoORIgUV10go2
         9ia+h9VXZjVrx3/5o6UFXDxS4JbWLZFVkr3HuW0x61zfNlVq1ixdERd0er5oabk/fE
         LcjSzJ7Em2Sg9adi5SJso71wNvb/GjUmoZVQLGhp25kaL9B8RiNVNla3coqQwgxA4b
         5SNCyc0hj3pnA==
Date:   Thu, 9 Jan 2020 20:00:32 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gary R Hook <gary.hook@amd.com>
Subject: linux-next: Signed-off-by missing for commit in the crypto tree
Message-ID: <20200109200032.61ef862c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WWl7=5LoKJ2.IFv/3gnRzUR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WWl7=5LoKJ2.IFv/3gnRzUR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  e91e785e1821 ("crypto: ccp - Update MAINTAINERS for CCP driver")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/WWl7=5LoKJ2.IFv/3gnRzUR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4W67AACgkQAVBC80lX
0GzhSQgAosDm0u9w+pQhS17m4BGbjRdY32/bTATa5rZZ7xO3EWjH0jHVM1LvBMs+
idxhtHHsimIp5r7eWofBGNkB/u0qw4aYcRxz1ZHGCy+4+1V8upH7hEnDk/InCZow
8lpiMHcecP5kg94hV5vgVa+Je4pX0DO/MDeFl/qDvNDvOCgg/twqODZPPhHQt9qU
zn0h0PxaPQyAy9txsqIO/3EioQigR8geelT7nPtWeeSbVKPXNnyhzmbq7Hsu+d+M
tBKBMVyYOfoTG0TCSpOF5vZafBqtNgtTzqTbpTzFLRA2gXGM+pWk3sXlMI+nsKiI
1qEYO/5UYawenFDD5kgNjnQ+c0qlqw==
=E+wR
-----END PGP SIGNATURE-----

--Sig_/WWl7=5LoKJ2.IFv/3gnRzUR--
