Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECC5139A4D
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2020 20:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728641AbgAMTqE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jan 2020 14:46:04 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:50981 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726435AbgAMTqE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Jan 2020 14:46:04 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47xPGK6Q8Pz9sP3;
        Tue, 14 Jan 2020 06:46:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578944762;
        bh=eaiJWxl/1HlN1zBiHKSJZR1X7XaCLhb5S7/gtseuE/E=;
        h=Date:From:To:Cc:Subject:From;
        b=Ln+n8tGB/E7BKdqCLei4gJW2B86+3Jg1mEWeDcLLtNtsYE22Y7EAoXaYwMEDfBaU4
         81x/PMy/o/8+RvS6hcSjo6i4nUA11LqqSLeneteegRfSGaY84QLY7EMjHFqRGt/1zp
         cR5KlUuoNErsxuv4hWrxdkzCn8GscX7YctXtYG/pTANNUAk+qkBENS98dKKZPsqFAn
         fKVnOlHM4SIMvMzdiRulQr6vPd+cOW/uh4AkctZO0JkepqQDhbTMf5SLzyQ4JOyc3y
         YMA+I63o2Jj2pKtcjHAgz38tptDtk7PBsjFzOmzp1/5WFjLr9EtaDysDsFz54Zy4IR
         5C+y2bkGE08Uw==
Date:   Tue, 14 Jan 2020 06:45:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the kbuild tree
Message-ID: <20200114064553.44c384c7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KBWQse3f8OP=yeHB.QtU2V1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/KBWQse3f8OP=yeHB.QtU2V1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  239ccdfaa77f ("builddeb: make headers package thinner")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/KBWQse3f8OP=yeHB.QtU2V1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4cyPEACgkQAVBC80lX
0GyqOAf/ajOJh9Fsb3nvR+yKWL3IY36SglhDpjG8S2iXLBkGJnFxkjbK/Nk33KKF
ivFB+nKGnFdLiDQf/uvBt+cwk40OOii4+vK04v2ILyRPlMOj2dQn5P1MXytbWtdC
HYauaDboDrafZ7TnkNt/E7NH2+5FYdL8k5DldBlPYCqUE2xaoODeOzMo694P8RfC
VJlskzsij0xjrtj1rXE3JBPk/AWe1TglIR8EvBBPxpox46hPc1vxyx7jdYw6wz2E
4dDLXeCFDUkDJdYmxMQvn8SLj3Nnu9kUZrIt532XOg/x2oRDylLAnMv+GVpLjvZ3
Ekk6Q1sCeS3S8wiWNUHzd/fzEw9u+Q==
=7M/R
-----END PGP SIGNATURE-----

--Sig_/KBWQse3f8OP=yeHB.QtU2V1--
