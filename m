Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0372C7F17
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 08:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727331AbgK3HtT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 02:49:19 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:39967 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727326AbgK3HtT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Nov 2020 02:49:19 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cky5w1qRGz9sTv;
        Mon, 30 Nov 2020 18:48:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606722517;
        bh=+Jt2KVYAfNJFjtEWvuejPncpO/lG5iglAE4GRC7JIUk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Idwo9h5btQXUC1+yGg+mh8WQ0Fy8lt9Z18blqQBGTps5ihj5MCoMpuXDBwRJHsYgR
         ED0883eCciXsUBlmrCTJmC+MHTuU55i/biPYGDpKw97hf25PY+shuY/KvKOIkwGJiR
         6GZga1NRFR7bq2ghuONY6Jrhp403q7Sn4a6kvXsLo33dE6ULTvKwTi4jx2X3fWl2Sj
         FQxmzgCkoBOlw8bm1narEKuYbHC8ZOEY8dpbkiHgCwQGZesvRaSDgzPmUmVgxuQPU6
         UII9Zdoq8o8xWPtkPPvaPc7SgqfEzi0kDJlm41eK5rMwyjlne5W5y1cneMhyC34Y+J
         cp6AvqWJWLK7A==
Date:   Mon, 30 Nov 2020 18:48:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Peter Collingbourne <pcc@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: Re: linux-next: manual merge of the akpm tree with the arm64 tree
Message-ID: <20201130184835.18b5f4de@canb.auug.org.au>
In-Reply-To: <20201130182840.02a96a67@canb.auug.org.au>
References: <20201130182840.02a96a67@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+qcc3kBYJTSeupgUXQ.OQFz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+qcc3kBYJTSeupgUXQ.OQFz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 30 Nov 2020 18:28:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the akpm tree got a conflict in:
>=20
>   arch/arm64/kernel/mte.c
>=20
> between commit:
>=20
>   e710c29e0177 ("arm64: mte: make the per-task SCTLR_EL1 field usable els=
ewhere")
>=20
> from the arm64 tree and commit:
>=20
>   44a7127eb3a4 ("arm64: mte: add in-kernel MTE helpers")
>=20
> from the akpm tree.
>=20
> I fixed it up (the former just removed some of the context for what the
> latter added) and can carry the fix as necessary. This is now fixed as
> far as linux-next is concerned, but any non trivial conflicts should be
> mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.

A couple of the following patches in the akpm tree also conflicted with
the arm64 tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/+qcc3kBYJTSeupgUXQ.OQFz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Eo9MACgkQAVBC80lX
0GwJBAf/d3W226dGpYVcwvf9H7gd3yWNX6zVDLnJ3DsgNA74aWA6pMJlrM8XZZPN
JgiwqrbNlfWhe1S1ZSJ2q54o6TsiC5KqlRuKpyd3gr7Jw88fC6iJJ3+Sa+8LG7HD
zFCoNpnHeCWxdyl4o8GdmvDF8ZbsJY3Z3JSyFKunoITfxphEYFaQwrGMTiLX337n
8dcZpOxamQ4CQsJLLAg3C9cjQb29ORbq43IA64ShdeXt4JrtwWIi+Qgmk7Dfy6fB
7RHcDk/8IRQKLu86xgpa/SUVrEDXy181xXNisyhcqKOfRRXJyn3d00HvYdpq8RYd
xb4To1YWhvNQU7+4sPfEFjHdRRUqvA==
=/omq
-----END PGP SIGNATURE-----

--Sig_/+qcc3kBYJTSeupgUXQ.OQFz--
