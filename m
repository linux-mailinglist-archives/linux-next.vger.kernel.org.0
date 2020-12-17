Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC7A52DCCAF
	for <lists+linux-next@lfdr.de>; Thu, 17 Dec 2020 07:47:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727147AbgLQGrD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Dec 2020 01:47:03 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:58121 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727145AbgLQGrC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Dec 2020 01:47:02 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CxMwC4jNtz9sW8;
        Thu, 17 Dec 2020 17:46:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608187580;
        bh=zzxyExe56gGMPnZtWltbM/UtqBs1rZ5hul4IrgQJAqg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eyQkDON8rZTvQ190s8jlnad8WLhMpCqqf+9qZE9UkeiuT3u6vX4wg3x51pSnoQpww
         MTiF7TSzqC8o+qkqAfknGtllPdmcnlkYvZuhJv0OwqmzEgnBsCfa1KvKqtVp3oa9az
         +k+wHDW74oNPdz2XHfGn+q6mGpLKREzeP4lCl7CgQ2b3GO/YoOv0yuRAHbqD8H9giU
         PcUSwLSEZzm7xQREmspbHiXe1S1hJB8hsu9Biq9BsAp+AFjE3cjwjxVfkCt/4ikbJF
         HkNHjiiO48KolSwMxkD4CZ8CL9hHctd4o7BYqfS1dqnhY5btOZzkUCnx97q6v9MCeI
         7X/vk0BPrJ1pA==
Date:   Thu, 17 Dec 2020 17:46:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Kristina Martsenko <kristina.martsenko@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: arm64: entry.S:774: Error: immediate out of range at operand 3
 -- `and x2,x19,
Message-ID: <20201217174618.401f2dc8@canb.auug.org.au>
In-Reply-To: <CA+G9fYtHimKZDuJGAzF86OY_F9j93oLPcohJRVLU+RLKEDCrbg@mail.gmail.com>
References: <CA+G9fYtHimKZDuJGAzF86OY_F9j93oLPcohJRVLU+RLKEDCrbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gTpo6cq9fwsY9HvS/9w7mB7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gTpo6cq9fwsY9HvS/9w7mB7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Naresh,

On Thu, 17 Dec 2020 12:13:03 +0530 Naresh Kamboju <naresh.kamboju@linaro.or=
g> wrote:
>
> arm64 build failed on Linux next 20201217 tag with gcc-8, gcc-9 and gcc-1=
0.
>=20
> make --silent --keep-going --jobs=3D8
> O=3D/home/tuxbuild/.cache/tuxmake/builds/2/tmp ARCH=3Darm64
> CROSS_COMPILE=3Daarch64-linux-gnu- 'CC=3Dsccache aarch64-linux-gnu-gcc'
> 'HOSTCC=3Dsccache gcc'
> arch/arm64/kernel/entry.S: Assembler messages:
> arch/arm64/kernel/entry.S:774: Error: immediate out of range at
> operand 3 -- `and
> x2,x19,#((1<<1)|(1<<0)|(1<<2)|(1<<3)|(1<<4)|(1<<5)|(1<<7))'
> make[3]: *** [scripts/Makefile.build:360: arch/arm64/kernel/entry.o] Erro=
r 1

This is fixed by commit

  870d16757ba8 ("arm64: make _TIF_WORK_MASK bits contiguous")

in Linus' tree which will be in linux-next tomorrow.

--=20
Cheers,
Stephen Rothwell

--Sig_/gTpo6cq9fwsY9HvS/9w7mB7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/a/rsACgkQAVBC80lX
0GwVVAf9F8gMswhzGzPSLBocjcICVFyIk0gdzipet/ZG7T/Tb509CakZw1tp5DtA
4S2f5lck3C9OvG66/qDJvFZr4ME3JAmJZexeZHIMYusPjrqhmFuXta9/ZYIhMWNs
UH+bB9XZ5DJu/IHAdX6ICrEhPuhD3Lh+NoOdNJIhzw/nLjbtnGVjZ6MnmAQBa9Gr
eEwuPjbE//mMttkQVW+FKgiTDKCMmBN1LPwxTkphdd3DJ+m8CtYDT/9hElAq2NEm
eaKpAmwAyu3/BxXJsqP87Z4vZeavWZRPQ5K4fLCxWpV9Vu+lcHKROMv19msgHje5
kMSm64npuZ8U7TaIa9C0yFyhsXuwgQ==
=ZAGG
-----END PGP SIGNATURE-----

--Sig_/gTpo6cq9fwsY9HvS/9w7mB7--
