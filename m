Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4673E3279
	for <lists+linux-next@lfdr.de>; Sat,  7 Aug 2021 03:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhHGBDN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Aug 2021 21:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhHGBDM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Aug 2021 21:03:12 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33EBC0613CF;
        Fri,  6 Aug 2021 18:02:55 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GhPGN1gKhz9sCD;
        Sat,  7 Aug 2021 11:02:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628298172;
        bh=32xOiu5FOTXbpADsYguSP7iK8YL5NBGhYQdglWE59bQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SwwRleemeugGwupF+K5c9CcbqxtwuUXEjUJsiQuA5UsPDLsHvhfbsiUATxUvk+OBf
         FvqrSJGBnUHDm/Ps2/6S5bF+aBEjjkM/GJvZX7La+O4OWYEKi/ey1u7ZsciOLxEaXg
         yV8KGjrO9n1pqWGwrt6Xg9g1Mb/mO7WYm8IScDNtACXsX5IQcyA5VJx9FiBhN3sntg
         LvJuxFa/gmUvW80L1dfoDw6KVna6Uj/x21YuK1iB5ER+B4TC8Dc6oe0YXFJO2r2vCP
         EJBK+gIvhoGPWlG5ryI0tOoTsgf6G/oKcWoXx9KHOU3Ns2FKHNCRRHgjkZ6TwN3S0Y
         /M4vfltFaQQfg==
Date:   Sat, 7 Aug 2021 11:02:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Aug 6
Message-ID: <20210807110250.365b18a8@canb.auug.org.au>
In-Reply-To: <20210806165351.10621-1-broonie@kernel.org>
References: <20210806165351.10621-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NVbySHXs7K+OJvq79hK4sZm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NVbySHXs7K+OJvq79hK4sZm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Fri,  6 Aug 2021 17:53:51 +0100 Mark Brown <broonie@kernel.org> wrote:
>
> Stephen should be back on Monday and normal service resumed.

Yep, hopefully :-)

I just want to thank you publicly for taking linux-next on again.  It
is very much appreciated.

--=20
Cheers,
Stephen Rothwell

--Sig_/NVbySHXs7K+OJvq79hK4sZm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEN27oACgkQAVBC80lX
0GwYFggAnetwvKcN/68aqZ0k7nzDfD7vlmT0bll+1KjGU263cQpqy47mCt4Yj84Y
yiQ8vDhCf1Jlj99LmVWyt4LOkyYBIPsokUEvXRGhRswLCtuA4MTHGXLs4012kNuS
WO23E2bv6AIgFIw+zgLmUP+rJyI2nJAee9m8ucWcXMMct6HJW7wHb4HKUtn/EsSK
j8AqgTyf/S3EAHord0gvPbf+SVhp6boYVK8F7qRcFoxJ9uKoDzYSEi4hUK+MyUd3
sgPIXGaWo3YMrrBLJP/7lueosRhZuNr5vDW8urXfqmXPhz4qYyRftosQkxRplja0
8B+rJFpJtUzfGPAtYTqDaW+ZOQ5bQw==
=Pjow
-----END PGP SIGNATURE-----

--Sig_/NVbySHXs7K+OJvq79hK4sZm--
