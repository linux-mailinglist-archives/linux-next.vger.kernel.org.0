Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6140F34BFD0
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 01:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbhC1Xhb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 28 Mar 2021 19:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbhC1Xh3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 28 Mar 2021 19:37:29 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8A68C061756;
        Sun, 28 Mar 2021 16:37:27 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F7sZD2H9cz9sVw;
        Mon, 29 Mar 2021 10:37:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616974644;
        bh=pRcT3T/Dq4XUCyxKA7iX4NWvg6vOfMUbBUaHxasfjUQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CWbZbhLCjLEo+g+2qDYqAiGvOTVAmg2kG6MTA3LXzzBvKjqTLfABCkf9LkxL52RNm
         Xs3mXp+y5UH6WLUavOcNSD39V8w/LBRUeoap8uDXlitIFwl0Tt4Nz2gVyiM4qa1rRR
         wF0W5HhIP66tVD5Qn1rq38Qu61jlRXakmLDlGfg6jxvSO82ewmgPewt/5shAg5Pd1Z
         y17PokxQNMAQinV9hpxsvV1sYvcZOie41B47OfYwIp07390f3I2ig15ni8Sux+tdlA
         9RRfUEWW65XHVZfjQgNj5pBrlOL93fVosSgLAcQPO1LUL6+923/qgieAl9skhPuXne
         7nViMgcYTSkGA==
Date:   Mon, 29 Mar 2021 10:37:22 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Kbuild fix for today's linux-next
Message-ID: <20210329103722.2be2d81f@canb.auug.org.au>
In-Reply-To: <CAK7LNAQUeQ1jrrWKszxU98NRM1QNDdTL+aT3znYut-ZKnEsUBw@mail.gmail.com>
References: <CAK7LNAQUeQ1jrrWKszxU98NRM1QNDdTL+aT3znYut-ZKnEsUBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J=Rh_xvdXz5Lvcky+Tz9MED";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/J=Rh_xvdXz5Lvcky+Tz9MED
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Mon, 29 Mar 2021 08:19:52 +0900 Masahiro Yamada <masahiroy@kernel.org> w=
rote:
>
> I noticed Clang build breakage for kbuild/for-next.
>=20
> Please apply the following, or use the old branch
> for kbuild tree.

I had already merged the kbuild tree, so I applied your patch by hand
for today (it was wrapped).

--=20
Cheers,
Stephen Rothwell

--Sig_/J=Rh_xvdXz5Lvcky+Tz9MED
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBhEzIACgkQAVBC80lX
0GyviwgAgPUNrwYBf0AMN8rK4wzHM0Ih7Zkp1IEpQ/kqun7IhAaxbL3JE0EyMQCL
ks5xEeJN/RK/Q/X5Fet1lBOTRNP0gmy/ObMnB/rW0RF824cbPFTNrGbmfIlT5JPS
FaVUI1kJRpxUVJJiAke0kqByK/V5jKaH6htaWMS2vRjlFwIy4ismeF0SS7KD8V4O
+aVy40SSriGh4FJH/Z6JKq6pWRj3kbwvTNdWnnq89CTvBqv+qNQA7KQh6GgWHJGW
X61DQP1J/leaVuQa+wLE4VUpuaYipigWaTtBdhxeB2HPQQY4QqMjAZ2/5g288MV0
Bz+UTKCBRWx5phXMhgnA+Pkuhc/3GA==
=ExTg
-----END PGP SIGNATURE-----

--Sig_/J=Rh_xvdXz5Lvcky+Tz9MED--
