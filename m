Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E407223912
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 12:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgGQKOV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jul 2020 06:14:21 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44239 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726453AbgGQKOU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 17 Jul 2020 06:14:20 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B7Rmk3nn2z9sTF;
        Fri, 17 Jul 2020 20:14:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594980856;
        bh=+d12izQZNqq1Xen1VXv7hmaax4kvKI0i024n4oevtQ8=;
        h=Date:From:To:Cc:Subject:From;
        b=N3588t0kZ9Ge8ncwNEyaCJ4CqER5MRKDaKQ2tkqto+O1HnoUY1d8EAQUBcMsabIg3
         ZhgNVzwhemgj8b1/Ljh7YDXYJx0nDepIB3qckFHDqeYpYkdWXGbDTS4EJ1Gn/XSrNm
         0RpGm4/vnFSAIrV9Xskra1+xwHcN6dyWjkFbcehvfRcQbf8EKA5MFG4mw601OQoBIt
         46qEa5LJS7VYz9XIOIaGEifh5mjl+UCYlEWX62errAigq3SSNCJcluJmoyLwhdnjjP
         669yPSd4/i0XnW6wmzpFbgaQqDxdxoebtDAe/8dc6k50BnLI8XKvtb+yJLZpbwtjBU
         /OKV2bLk4yTZg==
Date:   Fri, 17 Jul 2020 20:14:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Waiman Long <longman@redhat.com>
Subject: linux-next: manual merge of the akpm-current tree with the crypto
 tree
Message-ID: <20200717201411.3f1b8417@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7TAqOv9qwHHsaFQA3S7ryIm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7TAqOv9qwHHsaFQA3S7ryIm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  drivers/crypto/mediatek/mtk-aes.c

between commit:

  f441ba2ad341 ("crypto: mediatek - use AES library for GCM key derivation")

from the crypto tree and commit:

  161f6a5cc3ea ("mm, treewide: rename kzfree() to kfree_sensitive()")

from the akpm-current tree.

I fixed it up (the former removed the code updated by the latter) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/7TAqOv9qwHHsaFQA3S7ryIm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8RefQACgkQAVBC80lX
0Gz4dAgAhyyhqqep3XLl7QP4fbYlew4AKH2GdGKlIuLuxEeXeAquZX9aUIz0xock
2O8tqv037OoDAS6wJi+Jy0sHkzccUOUFkLIXawKbNN+2CFznDex1er1jmQE9Tj11
9XmqboZETfXKVJM+3vpbF5b1QvbX+CihRLXBrBNDZY4kEqc4/kxIe8BNJHhMD0E9
65rkEV8Xres0xKOIT3ORlH38nq0YLRcogEoBvpFZaMj0IP6r2+9rBSAFdhlZalrS
1Zjxy24Od0sm4gZl+7/NAP7Lj9ZI5Vccmb5Ptd183/MBlPPSS/vNpzKfkjzKSUn6
XEa+B7wADR6+yz29yvnniEHluGE79A==
=B6DM
-----END PGP SIGNATURE-----

--Sig_/7TAqOv9qwHHsaFQA3S7ryIm--
