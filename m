Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5CB31F5F54
	for <lists+linux-next@lfdr.de>; Thu, 11 Jun 2020 02:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbgFKAxE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Jun 2020 20:53:04 -0400
Received: from ozlabs.org ([203.11.71.1]:41143 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726894AbgFKAxE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Jun 2020 20:53:04 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49j51h1KG3z9sRK;
        Thu, 11 Jun 2020 10:52:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591836782;
        bh=5kZq6mHKS7q2Ry+3IYHMd4r4qTNJFTFM7mky4n/cBY0=;
        h=Date:From:To:Cc:Subject:From;
        b=C/qX8qKLKi1Pwfp89JGLlF74A/FGpWfoklP54UsAyYFdMR2yH8PydR+Uhzj6EhCJT
         /wdZyQjyiiUd3CHDo009GPl+Jf7uZr3go4bAiPDkdYkO4c11vmqViO1BsdEReXCsV/
         8Q/f5aknHgs8r1BeRgDfRqSVa2Au5ruy5lIKvJY/wIUwdKfTnls+j3XGJB16xtBdnj
         UHBv5GYXOJzdIFwGj2UeQwfnuiNVMh1YQWWAtvyeft5dLu/Rq3vi7v7kw7gG2U//5B
         VeP/h1RxX30W52nKaS5wlyawC8635smaoGnsHgR30gsjcxfIrWynGO+VaWtJZGo1iV
         YSkU77+hxLmJg==
Date:   Thu, 11 Jun 2020 10:52:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20200611105254.1b14f070@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H5JkHsyQvcThSvj3eHfxx=V";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/H5JkHsyQvcThSvj3eHfxx=V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got conflicts in:

  include/linux/compiler.h

between commits:

  dee081bf8f82 ("READ_ONCE: Drop pointer qualifiers when reading from scala=
r types")
  9e343b467c70 ("READ_ONCE: Enforce atomicity for {READ,WRITE}_ONCE() memor=
y accesses")
  a5460b5e5fb8 ("READ_ONCE: Simplify implementations of {READ,WRITE}_ONCE()=
")

from Linus' tree and commits:

  2ab3a0a02905 ("READ_ONCE: Enforce atomicity for {READ,WRITE}_ONCE() memor=
y accesses")
  7b364f0949ae ("READ_ONCE: Drop pointer qualifiers when reading from scala=
r types")
  bbfa112b46bd ("READ_ONCE: Simplify implementations of {READ,WRITE}_ONCE()=
")
(and maybe others)

from the tip tree.

I fixed it up (I think - please check the final result when I release it)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/H5JkHsyQvcThSvj3eHfxx=V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7hgGYACgkQAVBC80lX
0GyA2Qf9F2/Rn8jbNE12T9bjsQu/o/MSyyJN31irZJ7a+IokZorI8L2UB5ApZu0l
diX6GUTfHkCgMmKukjTtbsrN+NSRB9YJRSB3Tdx8iAt/aXn8vSbPBy5XSJeTlZZt
XLe0bUhRPu1EMZFryW9hfLNieM3OCPoC1O44iCpuOoVmwDg6v488E6OAs86ZARKp
5MRQT7qxuGXnhAE9dBJvyvZ5qKmAJC0UwN2XJ3hvk/V3bikUxvU1rSppRtHRu46K
m7z7wUwndAF2FPfTXJ0P/wJv23EU/Vl5E/+6XSksaWS/vp0if7nbHgTum6W/lB+d
av1Bg4MjzwhPjtSJKKzeVci9bRx+kA==
=eV/3
-----END PGP SIGNATURE-----

--Sig_/H5JkHsyQvcThSvj3eHfxx=V--
