Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1CED74FB
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2019 13:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727372AbfJOLai (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Oct 2019 07:30:38 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34339 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725820AbfJOLai (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Oct 2019 07:30:38 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46stX93Vk9z9sPT;
        Tue, 15 Oct 2019 22:30:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571139033;
        bh=IuIRd5uwTk8wL8CRbqF/9+1jGmhoR2Oxcrb6FWN3ap0=;
        h=Date:From:To:Cc:Subject:From;
        b=ABpXRHN7JAGltb11Fu3o7Uw8fxwmlC57SEC//X5jV8Ua6LDKEdQqIRFV/hHazXkQf
         tIVMXPV69zKf+tkwgv69xHvrYsD/nAxbm4IJwpZOaByhml1I8t0n2ctmuZZpgqS0EW
         ca6bzWDqUJT9CJyI33zZwzHmBr2WxaBtY/a/+BHKaLrTeVeP29MuIZ+whScqo2wrZ/
         zwQljy0oIEpoRey5Hioj99guHDbyXl4XBSPhDNPSnrq5drhl0g0wH5tatGWQQh6QkT
         61FM1hyoZTptiQ5WnjRjm0LkB616scPDE1+xXSzA71cTIsQIkp4Ut1xkkWFldoTkYm
         ygGFqkSQu3RTg==
Date:   Tue, 15 Oct 2019 22:30:27 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: linux-next: Fixes tag needs some work in the sound-asoc tree
Message-ID: <20191015223027.7a381186@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SU4FtJWqrQ0wKCV2WGG54ng";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SU4FtJWqrQ0wKCV2WGG54ng
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  a35716a95655 ("ASoC: pcm3168a: Fix serial mode dependent format support")

Fixes tag

  Fixes: ("ASoC: pcm3168a: Use fixup instead of constraint for channels and=
 formats")

has these problem(s):

  - No SHA1 recognised

Did you mean

Fixes: cfc28ac124c4 ("ASoC: pcm3168a: Use fixup instead of constraint for c=
hannels and formats")

--=20
Cheers,
Stephen Rothwell

--Sig_/SU4FtJWqrQ0wKCV2WGG54ng
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2lrdMACgkQAVBC80lX
0GyI3wf+PDn7GaGLeUr/xGcIYID4XE3zXzEgzcwou103MuDhZ8COIL/xEimcAneD
SYBo0pnmjtdlr0K1dOVwhtOepeQx5CtZCEZMXrTd8wufCwrjdIJ1FlqAvBFOMxWl
hwYCMtNXiMHq3u10f2BEXnEoKHHF6kSbR5nSRaFGL7+JWTnD9OvhahfyVgQsbfzg
Zj5injddzTAtE/pRt5z+TfIGBmKIZC37soOTPgRQD1xiNWqN4iZSjQ+bPHtMkCXk
My3hnO6OOJS+HBcw/igPsjA1eELvCmVB8QqW6QI/XNlk6DTpJq/hgX1ZVCuezG5q
wCDlVmzR/dFeCblTyZWqrvFa/e7W/A==
=sLcM
-----END PGP SIGNATURE-----

--Sig_/SU4FtJWqrQ0wKCV2WGG54ng--
