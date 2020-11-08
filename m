Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 052BF2AADCA
	for <lists+linux-next@lfdr.de>; Sun,  8 Nov 2020 23:19:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbgKHWT1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 8 Nov 2020 17:19:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbgKHWT0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 8 Nov 2020 17:19:26 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4498C0613CF;
        Sun,  8 Nov 2020 14:19:25 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CTpSm2BWrz9sRK;
        Mon,  9 Nov 2020 09:19:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604873961;
        bh=NEv8n5KzQuX8kW5uISsolwqQKxhUB6+CLsJVOPYMj1M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GBtrbmhXWSI1CLhucXV00FF38IOVG828y4J8H0iAPjTjLkURgN0jBjpZ8AxqCTj+X
         u33wEzx7QJ7BjjJN3oN9yB9u+PAdfGNWuM5JshA4oi9cFv6ZYQlgn5NGuAdLRdLo3V
         9+qkEHTy2rk3/CpZIsPHYMAADitNLZo2MbrTvHjey0Aj6brkWpF4rB6z1Uyanl0tB9
         ZSY3G0RROCI0cTMnV7a8bwBF8JtgMTXAd/Vz9pR6OUFI+D0XKTbM9WkmyyG4Zcl/QQ
         PzQMm/ylRz2IJt/4t0CZv79wjhMIdD08MT9NafhERhJBJ7vQhf1rqnCaxnkrGs2MWq
         oGapHeocRmr2w==
Date:   Mon, 9 Nov 2020 09:19:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Valdis =?UTF-8?B?S2zEk3RuaWVrcw==?= <valdis.kletnieks@vt.edu>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: next-20201105 - build issue with KASAN on ARM
Message-ID: <20201109091919.6e77162a@canb.auug.org.au>
In-Reply-To: <20201107200453.GA92349@ubuntu-m3-large-x86>
References: <7021.1604774000@turing-police>
        <20201107200453.GA92349@ubuntu-m3-large-x86>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gAlRvQ1xlm=eGk0Uvm2bwwB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gAlRvQ1xlm=eGk0Uvm2bwwB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Sat, 7 Nov 2020 13:04:53 -0700 Nathan Chancellor <natechancellor@gmail.c=
om> wrote:
>
> Because it builds fine if you check out Russell's branch. This build
> error only happens because of a treewide change in -mm that was applied
> after the ARM merge:
>=20
> https://lore.kernel.org/linux-arm-kernel/20201106094434.GA3268933@ubuntu-=
m3-large-x86/
>=20
> https://lore.kernel.org/linux-arm-kernel/20201106180929.GD2959494@ubuntu-=
m3-large-x86/
>=20
> Stephen could apply that diff as a fixup for the -mm patch when he
> builds -next or I can send it as a formal patch for him to apply.

I have applied the patch by hand today, but please send a patch to
Andrew pointing out that it should go in his post -next series (or
possibly he should also move
treewide-remove-stringification-from-__alias-macro-definition.patch
into the post -next series).

--=20
Cheers,
Stephen Rothwell

--Sig_/gAlRvQ1xlm=eGk0Uvm2bwwB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+obucACgkQAVBC80lX
0GzS8Qf+IuLqwFpMPWyN9ZauYNQVMdL4beEw6UxJjG/i/nnODD/OY9MjcDjSU4n9
hzhUjLwBU/6j/iKCfVHBo8GhGGnpVKTno7u5nmAxTsJ7BnVmAfXj3zPLauXPfxDe
8JYiJxy2RaFm5Suy3VqSssUvqmFIQe1pasmbUOXrJG8cATXqicJ57mSQ3NIWimO0
5FtQbRguIPOIOMq2SzZFsXTDKKoBmhS+872yd9oFXxSyFGlBIAJha7Haa4NUBaoP
9HhdE/Fu9pWfT4r6H5NhVgpYNKhuFoG/Ms1AJproDAVL2Bry4GoOTkddDmSW0d5t
mW2mkGAE3GctIz2n13fWqpn7lXttsA==
=7CEl
-----END PGP SIGNATURE-----

--Sig_/gAlRvQ1xlm=eGk0Uvm2bwwB--
