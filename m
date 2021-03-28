Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D7034BF96
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 00:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhC1WaN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 28 Mar 2021 18:30:13 -0400
Received: from ozlabs.org ([203.11.71.1]:53253 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229656AbhC1W3o (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 28 Mar 2021 18:29:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F7r456X41z9sW1;
        Mon, 29 Mar 2021 09:29:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616970582;
        bh=/Yk/uP3DYf8BIbNht5Dxzz7iypK1cDTflMQYlH5EqdI=;
        h=Date:From:To:Cc:Subject:From;
        b=TR8/v4bVZ2ICKnSPstoX/gVQOrusbI413SiExBEsNm6h8yblDVVAxX3oZTSToeqF4
         3ASwSHGLKOS+GnWIYBlp7VvJnoh+yEtLEYpifr+/kaXSmcYDtM1ZN3fa/mPcrbk2X3
         2Hva4eNDE5L9li0bGl9JBabz//NS8FlOy6WZvYR+N+Bxpl2trA1rgmQaZEUCV8HpL2
         Ng0R4INDjv6oCK2oVrr4P0bHISHxDYmpHdJbqFarBuVRLyoQMnm1uGtvOZMNHpI6+K
         OlHUAdSe5hZr1F1zOByt/tnKhEN31QLf8XqOG+jKwq07kyN4zHvZJ1nQhyzfFQtQlt
         WlEErzTBqY5Kg==
Date:   Mon, 29 Mar 2021 09:29:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rich Wiley <rwiley@nvidia.com>,
        Vladimir Murzin <vladimir.murzin@arm.com>
Subject: linux-next: manual merge of the arm64 tree with Linus' tree
Message-ID: <20210329092940.6363f0bb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z_H77_2QRaEQDJCFqAixY7d";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Z_H77_2QRaEQDJCFqAixY7d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/include/asm/cpucaps.h

between commit:

  20109a859a9b ("arm64: kernel: disable CNP on Carmel")

from Linus' tree and commit:

  18107f8a2df6 ("arm64: Support execute-only permissions with Enhanced PAN")

from the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/include/asm/cpucaps.h
index c40f2490cd7b,9e3ec4dd56d8..000000000000
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@@ -66,8 -66,8 +66,9 @@@
  #define ARM64_WORKAROUND_1508412		58
  #define ARM64_HAS_LDAPR				59
  #define ARM64_KVM_PROTECTED_MODE		60
 -#define ARM64_HAS_EPAN				61
 +#define ARM64_WORKAROUND_NVIDIA_CARMEL_CNP	61
++#define ARM64_HAS_EPAN				62
 =20
--#define ARM64_NCAPS				62
++#define ARM64_NCAPS				63
 =20
  #endif /* __ASM_CPUCAPS_H */

--Sig_/Z_H77_2QRaEQDJCFqAixY7d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBhA1QACgkQAVBC80lX
0Gy2YggAh8C5PgKUKq1ULP2wMr9BSF3AA5tRSEq4oPvFXOVECZrea7mzePpZMLFN
LAppINAydSh5+jt2y5k4EGafk0JYJgp+JiW3imRvsdcUL7RXUmHKHUrNZjXOzjAk
T0qHphRgCKtkLGzkOhSoBtIBJqpTvypn9nfI9hjOwT8E6QFRlAsuIp0sXDR7jABL
I2kUnLfYOHGP7kEglbF7c3PA0b93s4hs82NX5ji5kFh+dxDvwHknwbzdJvkd/44I
wQeMeENyAiDMyETX8WxAFcvVZ/b3tCNa/vkWwzmk1Yqz7cEoC6+SRT9KKIK5w2qk
P/URdClZ61W0q73fb0Iee4s+zQq6Gw==
=or59
-----END PGP SIGNATURE-----

--Sig_/Z_H77_2QRaEQDJCFqAixY7d--
