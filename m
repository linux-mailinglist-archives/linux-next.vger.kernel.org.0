Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1B282D077F
	for <lists+linux-next@lfdr.de>; Sun,  6 Dec 2020 22:58:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727659AbgLFV6a (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 6 Dec 2020 16:58:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727040AbgLFV6a (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 6 Dec 2020 16:58:30 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A01F6C0613D0;
        Sun,  6 Dec 2020 13:57:49 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cq0fx0qKsz9sVs;
        Mon,  7 Dec 2020 08:57:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607291866;
        bh=8rlgPSGV9TUozVxWtpN/z++2QpWCOrPK9q8yut1bQaA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=W36Y5HHV8CANjHB+48X/XnKJAvUmhdLpQrWJuC4nR2XhlxjQJu8OgUPLSKOprisjk
         SR27Nn/4ZL3dtoNxWNg+UWSaRSZ7l4M/hyKF02WhXh+vuPuUMl2ukHnB3weqIYMKh9
         sQoQHYgf6I6cFLIgCItyf0giYA5LebTZ6FWPV+em/9OwVcxWaJ0+9SsvrFi6pYXKZz
         WwhSXqIjowE492/xb3wVrRu78qwq7mWcye1SdEtJEZXFr5D4uBoN7JZCLxfaouAUTR
         crhSJQ/DmYkMMeUusl1605t38+WPL92pbdmakYCoHqh+M9LiTk5SKuAncE334AJOH9
         KcZna9DxYyjEw==
Date:   Mon, 7 Dec 2020 08:57:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: linux-next: Fixes tag needs some work in the drm-msm tree
Message-ID: <20201207085743.67ca0ae2@canb.auug.org.au>
In-Reply-To: <5820a22b-6fce-20ee-2a48-58c2d57b4ac4@gmail.com>
References: <20201207070517.28951ed0@canb.auug.org.au>
        <5820a22b-6fce-20ee-2a48-58c2d57b4ac4@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/As1s5th/uIUtozQeVZ9=T6B";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/As1s5th/uIUtozQeVZ9=T6B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Iskren,

On Sun, 6 Dec 2020 23:05:30 +0200 Iskren Chernev <iskren.chernev@gmail.com>=
 wrote:
>
> I'm sorry, I copied and truncated the hash by hand. I should have used
>=20
>  =C2=A0=C2=A0=C2=A0 git log --pretty=3Dreference

We actually prefer

	git log -1 --format=3D'Fixes: %h (\"%s\")'

for fixes tags.

> Also scripts/checkpatch.pl didn't notice it. Should I submit v3 of the
> patch or it's too late.

I don't think it matters for now, just in the future, please.

--=20
Cheers,
Stephen Rothwell

--Sig_/As1s5th/uIUtozQeVZ9=T6B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/NU9cACgkQAVBC80lX
0GwTSwf/S1CdF/jQVWAnHHIr1hNcCBYFhIyVRD1labYi5GxG2lfpfhWeCVWyyjNT
YwW+NDyNUI3rle+UT3/pi9sm7K9MJLMM3WqaJjd8EE3aVpWnVxmIPRQi7G2Uy4ID
QlGknQWg+qln0A4kw0W7z+cgl6mrsmqVQvH4N+Nh8joQIT/F/hF5xFbevjamjBzl
4ljbY3aIT3EUAaAKEOf4giCoCar4dO14iZO0gq8pBgL1pFlIVNA52/CPY3MoFOdt
u9pAvx5CxzVWi5sdn1H1Z2F0XZERXJ7zd2wTi4D43dLB8Nk6XZ3cuzjnbPb8tyZO
Szu46zXRYWlo6mZHorgzMjC/QuznAw==
=AZXT
-----END PGP SIGNATURE-----

--Sig_/As1s5th/uIUtozQeVZ9=T6B--
