Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9104FDE1F5
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2019 04:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbfJUCNy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Oct 2019 22:13:54 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46591 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726715AbfJUCNy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 20 Oct 2019 22:13:54 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46xKv175XPz9sPT;
        Mon, 21 Oct 2019 13:13:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571624031;
        bh=l8xP7nDZr/LzCxDqjWtfJYR4RQtG89y63SZ6U6dpWhE=;
        h=Date:From:To:Cc:Subject:From;
        b=RVrGpAFX2vmyf4w1iFvI3EA7PixevWFbWjHsQSNcf3vOBxp7yT8KL2dhQScWEvgRL
         nt2Dflv1hQYfXJi0Bcbw8ggS81OenzzUN3HMgCWPgxDvDKP3mzv4xsXQwDNslFcrJj
         MpkxPbvGkZDIqDEQGPd3QFuT9eYtgYdSBmbNWtY5iQ+dc7ALVU0Px2lCWtBV2NH71r
         WcsBWbqgsCvkR1+5rVD7t8GSbf8Y9xziKZqrRMrpwu7DyXTEuNIUJyrXqcVB+1K0Ks
         a6WtUYZG2HFPx36MdmIFdPqeU3GJBQ5w6dll8c6e4SsEhcoB+02SeZhKsJ7K/koK7a
         IZg6hznYMzq9A==
Date:   Mon, 21 Oct 2019 13:13:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20191021131342.404551d7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wjH3mOkPz+qHjPPaiG8Ewr7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wjH3mOkPz+qHjPPaiG8Ewr7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (native perf)
failed like this:

make: execvp: ./check-headers.sh: Permission denied

Caused by commit

  05f2f277053d ("Merge branch 'x86/core'")

which somehow removed execute permissions from tools/perf/check-headers.sh

I added a commit to reenable execute permissions.

--=20
Cheers,
Stephen Rothwell

--Sig_/wjH3mOkPz+qHjPPaiG8Ewr7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2tFFYACgkQAVBC80lX
0GzsNwf/aG/PjxbFTpN+2Lp5aBBZjDB/oQgB1k9riSpp3rejiFCsEtBjt06A9RI3
oS+NhOEgdUJonOnznrtYTSUnCZ/s3gpx/ZFAJHGARNtfPyBzc6JFxzAxZdup3Gmf
9WJmvrn1k5OpleZXe87Lxa0QTo7FEzdLBqd9p6ZZNhQ6+BSjpZ4Dx9Hi+aTPlPYq
GwRK+KhoW+pSsSjsSLe4vk0jbIZnFjEC+8uIm6ZDE3HLon6C3/XbUnzaAhLmcmhs
riOXCuE+Pfqo7uc3TKfUL8D8Ybm6vZJk6XGmk2xgm5y6Ov9nW0o0SmHwvdD8sZRN
kl/0AW+4rKphjVhZgWz5fR3Fit1dWg==
=JZqo
-----END PGP SIGNATURE-----

--Sig_/wjH3mOkPz+qHjPPaiG8Ewr7--
