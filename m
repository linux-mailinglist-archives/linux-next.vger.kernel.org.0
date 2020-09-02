Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB76725B580
	for <lists+linux-next@lfdr.de>; Wed,  2 Sep 2020 22:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgIBUzv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Sep 2020 16:55:51 -0400
Received: from ozlabs.org ([203.11.71.1]:36369 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726226AbgIBUzv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 2 Sep 2020 16:55:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BhbnJ5tWBz9sTM;
        Thu,  3 Sep 2020 06:55:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599080149;
        bh=uM0hDmC9HpZly0i9AhNTUq7WOr6lzxGCXBmsHDkemZU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZAE3xJXm/jgZtMWY3PHmgPZtg+ER2RMg9/lVIZj2dYypqIu5U2f4qIhDwYqNcGotx
         RPhhczWM1ohf8yYB2gtoY7K6mriXg/LV3bsqHLj4qnJM7RHZKghNZXeTCyRCGrB5js
         gXp0atjfQCYvSAaiaYAVmvBWgs1VKpZbWKs3mgoR6dLPqBL67mQsYfgQXwFOYGox0y
         O9yRn3xjQ5eVEQwwr4mVLZrBQdMKcxsLfM/9TKP3iky/fmmDWiadREO88QrNdfWmWD
         2Qgt/6SKUBCISo41oYnAspbq3PXxy29OObw6bh340RQ4Leqi+tuJ1MonssKDcQ1Fzg
         RW/3UbelQMlWw==
Date:   Thu, 3 Sep 2020 06:55:47 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Ogness <john.ogness@linutronix.de>
Subject: Re: linux-next: Fixes tags need some work in the printk tree
Message-ID: <20200903065547.0cc6f53b@canb.auug.org.au>
In-Reply-To: <20200902072610.GA9496@alley>
References: <20200902072254.3054db47@canb.auug.org.au>
        <20200902072610.GA9496@alley>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QwCApALY27p8oUP1Jk=3i.R";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QwCApALY27p8oUP1Jk=3i.R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Wed, 2 Sep 2020 09:26:11 +0200 Petr Mladek <pmladek@suse.com> wrote:
>=20
> The problem is that this commit is not in mainline. It is living
> only in printk/linux.git.
>=20
> Could we use the SHA1 from the maintainer tree when it would not get reba=
sed?
>=20
> Or should we rather avoid Fixes: tag referencing commits that are not
> in mainline?
>=20
> I am sorry to bother you with this silly question. I do not see any
> hint in Documentation/process/submitting-patches.rst.

Well, in theory, maintainers trees should not be rebased after they
have been published (except in exceptional circumstances), so using
SHA1s from them should be OK.  Especially if the fixing commit is in
the same maintainers tree (which it should be, right).  It does mean
that maintainers need to be a bit more careful if they do rebase their
trees to update any Fixes tags (or other commit references) that are
affected by the rebase.

--=20
Cheers,
Stephen Rothwell

--Sig_/QwCApALY27p8oUP1Jk=3i.R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9QBtMACgkQAVBC80lX
0GwFBwf/f5CxwyqW/SlsVLzSKdGPSUNE8ia4sv0Sf78TUWcYaaVjj+VX9+rfyRe3
yo+DAZfneV/X8nKqTfveF4inR9MZKiSTUzeclV1PYC513gjln1WvDI83GKSEt+Kb
IkvTy8mqX0HjNEQMEbKcZV1zQ5FL/L2q7P9hwGZ0ZF+HnDIbov7pzkd0PbHjsUcp
0xTPlKi/a5icOxiFrlAIONOemVAiCn+z7gd5txGvBOjuHr4By5jujGZdQfiKhdqm
Xlnt8n+5fslJ9kQPgy0LRO/a1lM6OB5CJlcspeYym634baey75KTxWE7vsWS2xWW
2xHgX1toFXwGdwFdQRY2H/cN4UJTFQ==
=qOZE
-----END PGP SIGNATURE-----

--Sig_/QwCApALY27p8oUP1Jk=3i.R--
