Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4D73F5599
	for <lists+linux-next@lfdr.de>; Tue, 24 Aug 2021 03:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbhHXB7q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Aug 2021 21:59:46 -0400
Received: from ozlabs.org ([203.11.71.1]:59549 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229742AbhHXB7p (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Aug 2021 21:59:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GtsjJ3s7Lz9sW8;
        Tue, 24 Aug 2021 11:59:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629770341;
        bh=NHi2IxLiZ/iGUyq/FORZhdLtj2vt6yMIofu48FWDu/o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HMXLwyfyLEc7uTr/mpMqg3lJdDC76hStM5aZaDRZ75XdC9zJljVhvOpZxV4kMWJSB
         UusspzwI2olRIx+RVmFZ5sRHj6h93Z1erxybqx6WUcrjEfOJjrkXnuMHu1a9FBrVJJ
         /Zb4moEPbuxUpfy4kEbv9AFifEp6KIUF23ww3E6dIi7Gil+Jawi1nQqQEe/HcQS40U
         ysZza1VxESNHIUoHq7DZgmlmqOh/HUt1EfirmDVd6Y9xzfJR946E0AwDeqp41HgG5k
         4Pw/cMxSpfJYbw0Q7RlpZkos2DUcXrfLaV3efqM6qUptIymLqCLw9Nz/l2nhmoYjtt
         7MyzNbe+P769Q==
Date:   Tue, 24 Aug 2021 11:58:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>
Subject: Re: linux-next: Tree for Aug 20 (Wno-alloc-size-larger-than)
Message-ID: <20210824115859.187f272f@canb.auug.org.au>
In-Reply-To: <66615de5-4acb-8d85-6d69-ddd0b9609348@infradead.org>
References: <20210820192615.23e2e617@canb.auug.org.au>
        <2706a406-9f72-7df1-03f6-f8e852897eb2@infradead.org>
        <202108202248.921E8C66@keescook>
        <8b9cb816-9d8a-2633-1afa-f5c4597a8314@infradead.org>
        <20210823203742.5169ad54@canb.auug.org.au>
        <66615de5-4acb-8d85-6d69-ddd0b9609348@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n02XM_JdzDFuM1xJm7O.qfC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/n02XM_JdzDFuM1xJm7O.qfC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Mon, 23 Aug 2021 18:24:44 -0700 Randy Dunlap <rdunlap@infradead.org> wro=
te:
>
> This is just weird. What I am seeing is that for every source file
> where gcc emits a warning: it then follows that up with this
> >> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger=
-than' =20

I see the same, as well as:

<stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]
cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'

But only on my gcc 7.3.1 builds (the rest are gcc 10).

> Smells like a gcc bug to me.

Yes

Also noted here: https://github.com/DynamoRIO/drmemory/issues/2099 (second =
comment)
--=20
Cheers,
Stephen Rothwell

--Sig_/n02XM_JdzDFuM1xJm7O.qfC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEkUmMACgkQAVBC80lX
0GzzcwgAjNtzSyfZwoEYXL3AJwWD3Gw9cjT0vTJ/n+5QoyUoY3fdseX46YkMZKOB
qgLeCrtfBm6Pg6jd04pBxV9oRnh8IGCpt2KXVwHFQxiuDBnjbvYh2H/oXEYSRFJT
+Xe2TRD+BURXn0BOvQ0O7jhThSe/f/0CoTgIfaao6NNHExiNz/hPlvJ9FExHdtgF
gUPlmCTe0tBOTAW6/qAtw6tl7dx4BDlBHGUO0uRGck63I2GQrKq0JRU2tGxxxaxN
1NqpLe4GHVVxLDMU3/4iUINDE7J61UGLAfnkAzHuHDEpAAh01953LHRc8uBqf5o1
1/zArWJ2qMBbTNX7CNMhyn/FgXpS5w==
=1wHB
-----END PGP SIGNATURE-----

--Sig_/n02XM_JdzDFuM1xJm7O.qfC--
