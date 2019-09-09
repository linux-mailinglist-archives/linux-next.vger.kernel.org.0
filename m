Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09B3CAD69D
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2019 12:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730207AbfIIKV5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Sep 2019 06:21:57 -0400
Received: from ozlabs.org ([203.11.71.1]:44583 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727128AbfIIKV5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Sep 2019 06:21:57 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46RkjV2x3Mz9s4Y;
        Mon,  9 Sep 2019 20:21:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1568024515;
        bh=fyZY9MX63OH0n6q0z5DZK7nEg/98r9px2uwAS1QIXsE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=D7Fs1Mvyh3q7HoysKEaj3i1Mmt+6OADTYf3vTqhmBJ6L/LC5GJy/3h/Zjq7O/KnWX
         vmD5qQYwiwJaAwaXnosX4joQeVlOM3cY/tzyINbkDlJby82pY5qCJ0w//EOSfk24j2
         QHFmDDMvrft8PtIZU4FQVkwBHmgGzrpKiyJZE5LrSU5jRq9469FJHj3AodMCi544zr
         FqESRpGNy567NB8OF29cENG8dqfn1jvor0H69YAC6ezWdPiDYNGTvd0rY+vJROQnE5
         tSUn091oUa1EQBbtbywGY20MTgT7SKwu2vc8vLLqKCaDyWPnXINKJX3W5xZD1PSawZ
         tTYhw3Cq2VHvA==
Date:   Mon, 9 Sep 2019 20:21:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alexander Kapshuk <alexander.kapshuk@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        sean@poorly.run, airlied@linux.ie
Subject: Re: Kernel panic during drm/nouveau init 5.3.0-rc7-next-20190903
Message-ID: <20190909202128.0c420ddd@canb.auug.org.au>
In-Reply-To: <20190909201159.778590a0@canb.auug.org.au>
References: <20190907090534.GB1712@pc-sasha.localdomain>
        <CAKMK7uHYdXwruQxxBM12Q5MVeH9fjFpZvxZz06BSo7YrCQbM2w@mail.gmail.com>
        <20190908141307.GA7115@pc-sasha.localdomain>
        <20190909201159.778590a0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l+GqJrN4iAZNpgJN4bQkHoX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/l+GqJrN4iAZNpgJN4bQkHoX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 9 Sep 2019 20:11:59 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> If you are bisecting linux-next, I will suggest bisecting between the
> stable branch on linux-next (which is just Linus' tree when I started
> that day) and the top of the first linux-next that fails.  (Assuming
> that the stable branch is good).

Actually (since you won't be bisecting the latest linux-next), you
probably want to use

git merge-base stable next-20190903
	(or whatever linux-next you are bisecting)

as your first good commit (assuming it id good :-)).

--=20
Cheers,
Stephen Rothwell

--Sig_/l+GqJrN4iAZNpgJN4bQkHoX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl12J6gACgkQAVBC80lX
0GzcJgf/TuR5t/iDv0PgFYFYxLltTSfnfqvQNfWn5bh6AylC/2B62cPp6jgBOg0D
gW0JT9Fp4kSAjFGR6KW0IMSXiJoLJAHO2b2atR6ET29yeAWQG/iPkZz6b9IimqIL
4g1YdcQZ3iLtVCOqkf0QD0NDLdCukIVhkTNuyjXgs+boATWRt/+ppnA0l+hQSnjK
WWI/oCviGpIwYcVfNVfRhstXWYoXmdEULvJ4AK0AsmPPlLOqnpTTl0rUnANgyC7p
cKk73j1s15YO7KQzHkXLtXWzHF2/lj7dY/0soS/D5720h4F5SYBh/PdN8sXPo7Al
NOwmDjgqOkd+N5jNrDM7mXr2N9xQ+g==
=B+WT
-----END PGP SIGNATURE-----

--Sig_/l+GqJrN4iAZNpgJN4bQkHoX--
