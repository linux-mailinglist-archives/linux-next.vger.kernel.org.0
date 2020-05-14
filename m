Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED6931D25E2
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 06:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725794AbgENEbL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 00:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgENEbL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 May 2020 00:31:11 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB6FAC061A0C;
        Wed, 13 May 2020 21:31:10 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49MzBL6yVMz9sRK;
        Thu, 14 May 2020 14:31:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589430667;
        bh=udlQud55+EREZRifKVqsf2KSUhnehd+L7nElntYn2Cg=;
        h=Date:From:To:Cc:Subject:From;
        b=FK3LNXuM5dbe9U0YFUHs4fFIWsPVIVhm4dHZJdJCDi3Kii6/9HN6MZTKaGk+HAinU
         PTUFBLA/i/MJNa+a3zG8ai6FWUNNomzXn70NCWV7W7jh6Sw4HOEBJyNHqxlRSG9Mir
         OimLXsIha71VlVxYK8+Ro50o5/mAb6r97E32meQ5w9nPukpV1HMwUrQeDXNBpnYJg5
         rRWHvAbhYon8CdTrT90JOJDkROYLHfCmUnSx+n471JgZUZvLIZNn6ZWURfFsoH7gZA
         0IdrZBJTOxDyzIQrTiPQSpTsLEBMe5oMLLy6wYQbOZY8HWw+F0tUL2tkbLBKQaDjBc
         9wZjIkqLXHUCg==
Date:   Thu, 14 May 2020 14:30:55 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: linux-next: build failure after merge of the keys tree
Message-ID: <20200514143055.1f71ba68@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/skWfLstk8P+vqG8NQ9SdDj2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/skWfLstk8P+vqG8NQ9SdDj2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the keys tree, today's linux-next build (x86_64
allmodconfig) failed like this:

WARNING: unmet direct dependencies detected for CRYPTO_LIB_CHACHA20POLY1305
  Depends on [m]: CRYPTO [=3Dy] && (CRYPTO_ARCH_HAVE_LIB_CHACHA [=3Dm] || !=
CRYPTO_ARCH_HAVE_LIB_CHACHA [=3Dm]) && (CRYPTO_ARCH_HAVE_LIB_POLY1305 [=3Dm=
] || !CRYPTO_ARCH_HAVE_LIB_POLY1305 [=3Dm])
  Selected by [y]:
  - BIG_KEYS [=3Dy] && KEYS [=3Dy] && TMPFS [=3Dy]
  Selected by [m]:
  - WIREGUARD [=3Dm] && NETDEVICES [=3Dy] && NET_CORE [=3Dy] && NET [=3Dy] =
&& INET [=3Dy] && (IPV6 [=3Dy] || !IPV6 [=3Dy])

WARNING: unmet direct dependencies detected for CRYPTO_LIB_CHACHA20POLY1305
  Depends on [m]: CRYPTO [=3Dy] && (CRYPTO_ARCH_HAVE_LIB_CHACHA [=3Dm] || !=
CRYPTO_ARCH_HAVE_LIB_CHACHA [=3Dm]) && (CRYPTO_ARCH_HAVE_LIB_POLY1305 [=3Dm=
] || !CRYPTO_ARCH_HAVE_LIB_POLY1305 [=3Dm])
  Selected by [y]:
  - BIG_KEYS [=3Dy] && KEYS [=3Dy] && TMPFS [=3Dy]
  Selected by [m]:
  - WIREGUARD [=3Dm] && NETDEVICES [=3Dy] && NET_CORE [=3Dy] && NET [=3Dy] =
&& INET [=3Dy] && (IPV6 [=3Dy] || !IPV6 [=3Dy])

WARNING: unmet direct dependencies detected for CRYPTO_LIB_CHACHA20POLY1305
  Depends on [m]: CRYPTO [=3Dy] && (CRYPTO_ARCH_HAVE_LIB_CHACHA [=3Dm] || !=
CRYPTO_ARCH_HAVE_LIB_CHACHA [=3Dm]) && (CRYPTO_ARCH_HAVE_LIB_POLY1305 [=3Dm=
] || !CRYPTO_ARCH_HAVE_LIB_POLY1305 [=3Dm])
  Selected by [y]:
  - BIG_KEYS [=3Dy] && KEYS [=3Dy] && TMPFS [=3Dy]
  Selected by [m]:
  - WIREGUARD [=3Dm] && NETDEVICES [=3Dy] && NET_CORE [=3Dy] && NET [=3Dy] =
&& INET [=3Dy] && (IPV6 [=3Dy] || !IPV6 [=3Dy])
x86_64-linux-gnu-ld: lib/crypto/chacha20poly1305.o: in function `xchacha_in=
it':
chacha20poly1305.c:(.text+0x12d): undefined reference to `chacha_init_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x13d): undefined reference =
to `hchacha_block_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x14b): undefined reference =
to `chacha_init_arch'
x86_64-linux-gnu-ld: lib/crypto/chacha20poly1305.o: in function `__chacha20=
poly1305_encrypt':
chacha20poly1305.c:(.text+0x2ab): undefined reference to `chacha_crypt_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x2bd): undefined reference =
to `poly1305_init_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x2d6): undefined reference =
to `poly1305_update_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x317): undefined reference =
to `chacha_crypt_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x32d): undefined reference =
to `poly1305_update_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x379): undefined reference =
to `poly1305_update_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x385): undefined reference =
to `poly1305_final_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x413): undefined reference =
to `poly1305_update_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x434): undefined reference =
to `poly1305_update_arch'
x86_64-linux-gnu-ld: lib/crypto/chacha20poly1305.o: in function `chacha20po=
ly1305_encrypt':
(.text+0x59d): undefined reference to `chacha_init_arch'
x86_64-linux-gnu-ld: lib/crypto/chacha20poly1305.o: in function `__chacha20=
poly1305_decrypt':
chacha20poly1305.c:(.text+0x847): undefined reference to `chacha_crypt_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x859): undefined reference =
to `poly1305_init_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x86d): undefined reference =
to `poly1305_update_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x8a7): undefined reference =
to `poly1305_update_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x8f1): undefined reference =
to `poly1305_update_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x8fc): undefined reference =
to `poly1305_final_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x94f): undefined reference =
to `chacha_crypt_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x9d9): undefined reference =
to `poly1305_update_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x9f9): undefined reference =
to `poly1305_update_arch'
x86_64-linux-gnu-ld: lib/crypto/chacha20poly1305.o: in function `chacha20po=
ly1305_decrypt':
(.text+0xb78): undefined reference to `chacha_init_arch'
x86_64-linux-gnu-ld: lib/crypto/chacha20poly1305.o: in function `chacha20po=
ly1305_crypt_sg_inplace':
chacha20poly1305.c:(.text+0xf16): undefined reference to `chacha_init_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0xf3b): undefined reference =
to `chacha_crypt_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0xf50): undefined reference =
to `poly1305_init_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1094): undefined reference=
 to `chacha_crypt_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1155): undefined reference=
 to `poly1305_update_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x117b): undefined reference=
 to `poly1305_update_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x11da): undefined reference=
 to `poly1305_update_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1223): undefined reference=
 to `poly1305_final_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1321): undefined reference=
 to `chacha_crypt_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1401): undefined reference=
 to `poly1305_final_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x14a3): undefined reference=
 to `poly1305_update_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x14d6): undefined reference=
 to `poly1305_update_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1507): undefined reference=
 to `poly1305_update_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1573): undefined reference=
 to `poly1305_update_arch'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x15aa): undefined reference=
 to `poly1305_final_arch'

Caused by commit

  f22998a0de8a ("security/keys: rewrite big_key crypto to use library inter=
face")

I have used the keys tree from next-20200512 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/skWfLstk8P+vqG8NQ9SdDj2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl68yX8ACgkQAVBC80lX
0GwxWAf+NXtBflePGhMJNG8iznYUzDET+ugAPDjD919GRHjcvB2SifNwsWT++ojf
N9bEg/fQrOOJ13282YrB/S+HtmkVPtOt3vmRL0zx8DxyAgswpJ6FOV6yIRQLyMKy
XnoXJEmZjcEnu/J9Z30BJef2HR3QnwK3ncVjX3skdFdgXKDlOncHLIhHGJeQ3FY0
s4zILSc06sivW+N42vGjIxA4GzlCRh2ngr1jP3alMxSAmd6m1YmvsEZrywSR8h6+
MXCNwCCZsS3YxopexXM58eRIF2WmX9lEu55bPtokG1m063Q5ElxhatRscW9J2ghH
dG5A5HOKj/aQTlMFMVlUe4ZkKYVM/w==
=GKIp
-----END PGP SIGNATURE-----

--Sig_/skWfLstk8P+vqG8NQ9SdDj2--
