Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 948B82F9878
	for <lists+linux-next@lfdr.de>; Mon, 18 Jan 2021 05:09:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731297AbhAREI6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 17 Jan 2021 23:08:58 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:48215 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730993AbhAREIw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 17 Jan 2021 23:08:52 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DJytt01Mdz9sVr;
        Mon, 18 Jan 2021 15:08:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610942890;
        bh=9ji3rG4AewVlQsEVCx9uSjgE1CJ98CjDp+kMa3WXxrc=;
        h=Date:From:To:Cc:Subject:From;
        b=Iim22ibSSar2UWb47HnE0mQP3RFLg6/FBqtnrwl6CXrdMufmLx0+dH1RnjlTo/I0+
         9kvhDjDdC8zVVSM1XB7WLmxKTu8g5nwwptQw1oBtZaWMP+zCrOiUqso2yc+GqFh51m
         sVVKSRnnJ+o7zWrtJecZmyi+rE4QP/8jal8i/PacoTqaV35copqXHzFJwJfJpYpZ4V
         kwYzOcK08YiUm/bj5+bVxSDIJq6kF0o8zomx0ywpsOvfj2h2MDr+E+CDZPEGdaU/8I
         lGq5PEgbIt6VFRZBTvp2a/la9hPgiF9ppPkktvHIrOuHuSrr9wMWQlLWkMaAhn7O0e
         tqt4eaVtFsWUQ==
Date:   Mon, 18 Jan 2021 15:08:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Alexander Lobakin <alobakin@pm.me>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>
Subject: linux-next: manual merge of the kspp tree with the mips tree
Message-ID: <20210118150804.378ac9f3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dB7MnGXiui1776_s0n8kdSu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dB7MnGXiui1776_s0n8kdSu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp tree got a conflict in:

  include/asm-generic/vmlinux.lds.h

between commits:

  9a427556fb8e ("vmlinux.lds.hf41b233de0ae: catch compound literals into da=
ta and BSS")
  f41b233de0ae ("vmlinux.lds.h: catch UBSAN's "unnamed data" into data")

from the mips tree and commit:

  dc5723b02e52 ("kbuild: add support for Clang LTO")

from the kspp tree.

I fixed it up (9a427556fb8e and dc5723b02e52 made the same change to
DATA_MAIN, which conflicted with the change in f41b233de0ae) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging. You may
also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/dB7MnGXiui1776_s0n8kdSu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAFCaQACgkQAVBC80lX
0GxP+Qf/fOmAeOySNZbDQqmFzQ3j0wOU3uotsQPWTuyt8clh0am68S0/pG6qUtO6
IMZGYTweG+2kUrZoIJNjhVjAEBSjbwSUgzkXvMLiE/ziwuuCj0RSDiOcYW2DUoPs
o/Ex7clslt1htbXKCpSaSkYb/y4dghPqrNDP3aX3bFb+emfG6O3j9AHxtIVGqRd/
eey16CK/eyk6kUrrEKbYh4M/msHsf/HwAbkLCKbJ9/gnLzovtEqQuvMMHLFWM2RW
fzWxm9CrKoHrlftw15si9WU0myyGTfs5ROpvVA+2WjACaQGewJSF8Q2hsjrHGuQ6
V78DGtr/eDOVbl6LCmw8sdwGZVJ7YA==
=v9bB
-----END PGP SIGNATURE-----

--Sig_/dB7MnGXiui1776_s0n8kdSu--
