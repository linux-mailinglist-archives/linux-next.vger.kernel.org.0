Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 412F52B7575
	for <lists+linux-next@lfdr.de>; Wed, 18 Nov 2020 05:45:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725834AbgKREpD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Nov 2020 23:45:03 -0500
Received: from ozlabs.org ([203.11.71.1]:53715 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725613AbgKREpD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Nov 2020 23:45:03 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CbVbd2PCRz9sRR;
        Wed, 18 Nov 2020 15:45:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605674701;
        bh=H7etqU6NI6S7Kc4dB561s5b0sofDQi83jcis2CYAWv0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MbGoOKPzuF9Se7+q6Zz1iFO4sGr728ihuIU0E5bpKk4oZ7aC/0kiEfFO2MF28ILBh
         WXUMVl8MifiI+WoFd6WDvvlJPCD5BEiXjne9loE905/olvnCv4JoG7vPfFg4GF7z6l
         w2RCIQgq+fhosJ53J38wDNJ7uUUW0hJ713Z37eLkavH6+N6jC4rz3s4sTwprnV5vIo
         a2/V6Qx3Y9zsGQalbcuTLcvHiUSwYv4HGTWEAf9TFZec2BOTe/921UCFP+dV+BwiAx
         AtS0V8VfxBp/A+sHp0N57eEBHAcPh1MhLjfEf4xqDdDANe6TY8pOcHrsyBhvO17nV5
         +u0A09rw2Y1Tg==
Date:   Wed, 18 Nov 2020 15:45:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mhi tree
Message-ID: <20201118154500.127aaba6@canb.auug.org.au>
In-Reply-To: <20201118153912.1decf6cf@canb.auug.org.au>
References: <20201117151225.6a50abf8@canb.auug.org.au>
        <20201117042359.GB7787@work>
        <20201118153912.1decf6cf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7H23TKS=aCPed.3RYmxcD2d";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7H23TKS=aCPed.3RYmxcD2d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 18 Nov 2020 15:39:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Why isn't that "fix patch" in the mhi tree (with necessary Acked-bys)?

Ignore that, I missed its appearance :-)

--=20
Cheers,
Stephen Rothwell

--Sig_/7H23TKS=aCPed.3RYmxcD2d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+0pswACgkQAVBC80lX
0GztRwgAocJeUQnIRhnaBZnbD0cbaG9haZcpmF9NmNIY1bQHnkb4VYraDOi9OwlM
JQdDvp6EvKacY7qV1VJmXUER3lnARLaV+vh7+5L0fTxfZQDWy/klOy8RaJZKrscU
Y+kX+r/Zd/XKLquwfRQcAQgVE7Rjpe+RVV6JzSLFTGLs039iEKQ5q0SXnEm+jcKi
jyCesxa7zWHp4ShVEeb0QKVVOaVhldiVSZEIOMOyCyCJf8q4UVkwoSXqy54uvk8w
kp4ClCLixMOTS4A5SgJYBnwfy8Ck7BWHwRENY7lLosg5S0O8QQ2yYr1slsZwKrng
zrLT6zz81tyKyzdzAFlKO0Azp1smzQ==
=2p6I
-----END PGP SIGNATURE-----

--Sig_/7H23TKS=aCPed.3RYmxcD2d--
