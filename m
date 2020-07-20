Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D022225667
	for <lists+linux-next@lfdr.de>; Mon, 20 Jul 2020 06:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbgGTED4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jul 2020 00:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725263AbgGTED4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Jul 2020 00:03:56 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B379C0619D2;
        Sun, 19 Jul 2020 21:03:56 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B97Pw6sbYz9sRW;
        Mon, 20 Jul 2020 14:03:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595217833;
        bh=OcY+Ne7vqBdLxjtQfG1gVX1Q4F+5772mkCwouUBaQZ0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CTBxu60hNGJAbPCCy/hV+e51xBKhf698iS1sOhbF9n9//gKUw9Kmw/UCS7vWsD7Y4
         3ix8hChWp7WlhNgaewECkLABV7YSI7+aY0LxY34wj/dBfO1bIGSMbTspUlqE60ZwJt
         r7EfhWA76xnOMX19tHemU7eag8Are/HlPLpbxjMdR8FtZy9oTg/FX5nN12gtffY7c+
         PAY7ncIqqn0RJ6Us8cYAIhOeBq50KQvmbJ9w43/y5qw/8+QsYK5aZNO+bCYug27tx3
         CtUGjh/H9YQg1WY4xNUzw5Fj/qTDVDQdaayfIBqLG5QYzvfpi/vMnjKNJj8Mtmj6XN
         szOdiJoXQzzow==
Date:   Mon, 20 Jul 2020 14:03:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Uros Bizjak <ubizjak@gmail.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Chang S. Bae" <chang.seok.bae@intel.com>,
        Sasha Levin <sashal@kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the crypto tree
Message-ID: <20200720140346.109a3006@canb.auug.org.au>
In-Reply-To: <CAFULd4b9O+KJKwjQTB1PTuxMEDSDMov0rQaE85+9pfRrd02dKw@mail.gmail.com>
References: <20200717144656.4bdbf81f@canb.auug.org.au>
        <CAFULd4Ye2d-8BY7aY+_2tYwcXsfSCe3O6aJ4LF0KhvWTjVt0rA@mail.gmail.com>
        <20200717064401.GB2504@gondor.apana.org.au>
        <CAFULd4b9O+KJKwjQTB1PTuxMEDSDMov0rQaE85+9pfRrd02dKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qJXKyrG4d4dA/22o/ihB5O8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qJXKyrG4d4dA/22o/ihB5O8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Uros,

On Fri, 17 Jul 2020 09:31:18 +0200 Uros Bizjak <ubizjak@gmail.com> wrote:
>
> Please find attached the incremental patch that puts back integer
> parts of inst.h. This resolves the conflict with the tip tree.

The tip tree change needs the XMM parts kept as well, sorry.

So I ended up just removing the actual now unused crypto instruction
macros.

--=20
Cheers,
Stephen Rothwell

--Sig_/qJXKyrG4d4dA/22o/ihB5O8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8VF6IACgkQAVBC80lX
0Gz6GQf+OKDf0YYb4uBRmcWB0VQx2DEFV1NAm1t1xR5m8NNS+PMR3EBdAWPueiTe
enkl3448LXZiuKvqycKJz7AHqMu/fNPKQJrLnCS1d7NLj6UcTrNEaXrFHUym4D7/
M1PEFlnRsDWkhmBM2/f93KJ8R2q543YQjT6HRswTn1vm3wTXPUuqxX2d0P9kClNg
Vt4nYDrs0jXnQ/F9FcIeCz/hXV+cCrlLk5K8bwwnITO2bXBu91DED/TuEQfFel2B
D8zrMaT0uf4KbaaQxVpkIdtN0IyvbGcbfdM+THHt/k/zK49LfilUBbEPYQLrc9n6
lK8pEYAYZzuTyDNVjjXpeS83dzwWNw==
=CZ+b
-----END PGP SIGNATURE-----

--Sig_/qJXKyrG4d4dA/22o/ihB5O8--
