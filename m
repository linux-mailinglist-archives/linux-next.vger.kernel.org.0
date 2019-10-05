Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7398FCCCC2
	for <lists+linux-next@lfdr.de>; Sat,  5 Oct 2019 22:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725801AbfJEUwl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 5 Oct 2019 16:52:41 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36739 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725789AbfJEUwl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 5 Oct 2019 16:52:41 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46lzTL6P2jz9sPZ;
        Sun,  6 Oct 2019 07:52:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570308759;
        bh=5HRmnJDOeYxUUzpnW2WWDTJdYX4mvAlcw2HRZjQEbho=;
        h=Date:From:To:Cc:Subject:From;
        b=PPcvJxfNyvH5OOya+yj3Wjn84rJVsPZGkurzzlmL5xt7BDObECYvx4fbejjOjxQZR
         AkfUgdyhP1kKGRh0lCNa2jklag4z9WPLUBgAC/ffuQli9dWMW9f70wGueBQeDTLp7g
         3Dgw6G9rUoVAwzCmURkhnmV0LdoXFWXqKOnKNGLwNkoPOUIhXceMj6vfSwRKQQUD8y
         IFj6QS1WQ3tZCj56agBnu+j2NXKJMj1Zgvdx0Y01gnaDZJ8LxeTaYe0Qb+XauJJKhG
         TUZcC40mIKhBVQxzXxmxBlKtpWXUeFDM5KnnWX0k2EDewwSpZr322oV9QtYKzEFUIj
         v927qVwdqIKfg==
Date:   Sun, 6 Oct 2019 07:52:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux-kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: no release on Monday
Message-ID: <20191006075231.3bc0cd45@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DshnIOKP9n0.t2lrfNKE=vf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DshnIOKP9n0.t2lrfNKE=vf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

There will be no linux-next release on Monday Oct 7.

--=20
Cheers,
Stephen Rothwell

--Sig_/DshnIOKP9n0.t2lrfNKE=vf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2ZAo8ACgkQAVBC80lX
0GyqEwf/TAxHP9g6//WGgiR9vDuVAeYmzJrBPjKrF9NIYiuu641jsMt6vY7IN1UP
0gG2y6RNYo/HpnpNg3/rsRbuhbh/iEh9AQRSLt6i36S2vCApeSGvHGDd5b3x7iQe
MlqRm5m4R6r+5OTyDYhjOQNUa7kPPf11+qLxgi+Wv1RaOvggl7T2tFDdj/fQIMRw
XnupiR4wnmkf8wOM8f70fP5PjqiNrtLT+XZ4LgLYsSFE+iPlntf/SAFzjwKml2wk
YvTCCueDyyI9ekcfxhmEURkCCEMoe14pUTvb6BleKirrOWaoGoJ7AXa6aaPrUBbE
9YrigDtd2K0f7udZNQaHnKwozJjDBQ==
=5kZO
-----END PGP SIGNATURE-----

--Sig_/DshnIOKP9n0.t2lrfNKE=vf--
