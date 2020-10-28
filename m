Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD4829D36C
	for <lists+linux-next@lfdr.de>; Wed, 28 Oct 2020 22:43:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbgJ1Vnw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Oct 2020 17:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbgJ1Vnv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Oct 2020 17:43:51 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49688C0613CF;
        Wed, 28 Oct 2020 14:43:51 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CM1Ng6dFNz9sSn;
        Thu, 29 Oct 2020 08:07:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603919236;
        bh=W2n5VWwBllSsH7rdOKp+MwgYDXy0yFzINN07H5vOOXc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gUSY4fEamKL/MhS6u92pulR8ZY/JEEugzlCP1p0u/Uyb1a2Ov0Ga8wE8LnkkD7Suo
         dR60NscI7MQ6HThH2NpEkHwfkuXxb4fict/NYpGchLtUkUKuXCGjHrZTMs5k16ySWu
         kTjvFhiEtr7krpYZ1eDmQ2j35LqBgDBM8DeeoF3JwKv8XTIopKwT7EzdqfIJeRAwgl
         s49g3kbY5BxPC48VD9ftn/nI0HRadhE3yPfHDh3JnX05qlOPl0nfD0mXi8jGEfOGiA
         V8QYvxB5fyGSJpwGhGjVJSevOZ3OrlMKQPNTjSS+rCNfY26LKTnUPCayaR+/nF1cBZ
         yzNNrHJYxeHuA==
Date:   Thu, 29 Oct 2020 08:07:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Micah Morton <mortonm@chromium.org>
Cc:     Thomas Cedeno <thomascedeno@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning in Linus' tree
Message-ID: <20201029080713.64c5f78c@canb.auug.org.au>
In-Reply-To: <CAJ-EccOQCADagAb8YqRHL6aUVCrMuGOO=tA-TBorjO_AiXT7Gw@mail.gmail.com>
References: <20201028142809.09f7f4b4@canb.auug.org.au>
        <CAJ-EccOQCADagAb8YqRHL6aUVCrMuGOO=tA-TBorjO_AiXT7Gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JT9K7rs4nx=+x9oFqfn_JtY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/JT9K7rs4nx=+x9oFqfn_JtY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Micah,

On Wed, 28 Oct 2020 08:56:00 -0700 Micah Morton <mortonm@chromium.org> wrot=
e:
>
> Thanks for the heads up. I think someone sent a patch to fix this
> yesterday: https://marc.info/?l=3Dlinux-doc&m=3D160379233902729&w=3D2
>=20
> Do I need to do anything else or should that cover it?

That should be fine, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/JT9K7rs4nx=+x9oFqfn_JtY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+Z3YEACgkQAVBC80lX
0Gy9ZggAldySAgJfmE/sEXrBEoBEo6trpm1XBwz3QaNHmEp3uV5BjyBUKCxPveor
cncCNyI2vK0QB5qnLUHcga5At+YuipUEbWt5Cmis73gM1rqjddfZPLgYDcikz981
RQvz5lQWN4GWUG420Ksn7clLI7qMErS9r2zgbyxp2x+ktN9xz+eijlTCImEd2f+Q
w0n9aMojT5tbetczeV6oZNhV8cFsLsrEcQKzcBTvIbV7H1PMUYwg8L/4sAUog+ES
UmP7VoC7VQTW35vAV4riGmkYCNpzhUnmQlJKZodONR9Tk/yqoeVoJWAy3PzM/2bv
0cOUY9i2pWveQElT0NgAqrgrvz/OtA==
=EhPZ
-----END PGP SIGNATURE-----

--Sig_/JT9K7rs4nx=+x9oFqfn_JtY--
