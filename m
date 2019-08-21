Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F18BE96E67
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 02:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbfHUAdU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Aug 2019 20:33:20 -0400
Received: from ozlabs.org ([203.11.71.1]:55701 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726478AbfHUAdU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Aug 2019 20:33:20 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46CpY80p51z9s4Y;
        Wed, 21 Aug 2019 10:33:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566347597;
        bh=kegbEI/BE2OclelZCUqD67xr8wnFE5RBt08qkirW42s=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OQGohsskPC+fhAZngYm20H+xCfRT9mtliu57fw+MKqHWaN/i/dkl0D3Ir72Ocg0iA
         hgFQnFLYWzbfrFRcb6/yt4XVuy4HfYOksi0hgi7ctzEMC+qxiA5b4EYgIpima4iKtd
         /aoM5zxvZbI9cbJQ+QJ4gZcOGJBtUyMEWw1SjV2YGJj4nvyPLdmmTbDJZZgjFOXLvY
         j3yBC/AeZweamSIztkCRIVug9hTo4q5BivgV4oVus9lIEINpjgBvRXAQAPgCHyxfuM
         RdvLT6RA0TilpmZuJWBWV400Bh4t2mFsDn3rnjpJTmo1qt6mgdSuMvg663lyKIb4uj
         pqXP3LQqVNneA==
Date:   Wed, 21 Aug 2019 10:33:14 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Matthew Garrett <mjg59@google.com>
Cc:     James Morris <jmorris@namei.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Howells <dhowells@redhat.com>,
        Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the security
 tree
Message-ID: <20190821103314.426add83@canb.auug.org.au>
In-Reply-To: <CACdnJuvCQBX7JaajT5upiY-sNrUfS+pmmSqJF-g_mog96A8h1Q@mail.gmail.com>
References: <20190821083227.794a0a83@canb.auug.org.au>
        <CACdnJuvCQBX7JaajT5upiY-sNrUfS+pmmSqJF-g_mog96A8h1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pJE73_LFZ7k8Rd_vAN4gjOS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/pJE73_LFZ7k8Rd_vAN4gjOS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Matthew,

On Tue, 20 Aug 2019 15:39:33 -0700 Matthew Garrett <mjg59@google.com> wrote:
>
> On Tue, Aug 20, 2019 at 3:32 PM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> >
> > Hi all,
> >
> > Commit
> >
> >   9d1f8be5cf42 ("bpf: Restrict bpf when kernel lockdown is in confident=
iality mode")
> >
> > is missing a Signed-off-by from its author. =20
>=20
> I'm providing this under category (c) of the DCO.

That, of course, is fine (but not something that can be deduced from
the commit :-().  Its also a bit confusing since the preceeding patches
are from David and have his SOB ..

--=20
Cheers,
Stephen Rothwell

--Sig_/pJE73_LFZ7k8Rd_vAN4gjOS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1ckUoACgkQAVBC80lX
0Gy+gwgAl7j3nF49Ye909wwrZgUiXLKHf2XK0ZupQnJUsB05D8pxvWPnSi6aNdGe
hWhadmYBymVn1uZMHD0tM/05dhR5+xjz4YpOZFzS6EfywFTqL1obxbMzzBpd5kkG
Uro0fG9WqahtX0tSvo6V13PyX76zRDQ7FqaPjw2TzJ4WE+/sXMWkuQIEqf6je94f
ITYv/lZoWcUjJjMASB9XQYFsuvTO3orz4DA3n99BpPCehowpA00rEYsfl/FayJyB
ndB+dbqbUqzRyLyOclII7M8cy2uaSq2I3cIYqo3xkJuLEM+vQjwXP4sxv+ruEbuL
hDIqCgBSsn6MRLv0SCVm28gJiupiWw==
=rN02
-----END PGP SIGNATURE-----

--Sig_/pJE73_LFZ7k8Rd_vAN4gjOS--
