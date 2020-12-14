Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 776582DA2EE
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 23:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbgLNWCP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 17:02:15 -0500
Received: from ozlabs.org ([203.11.71.1]:56513 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730517AbgLNWCN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Dec 2020 17:02:13 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvwMb0WKqz9sSn;
        Tue, 15 Dec 2020 09:01:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607983291;
        bh=qmia65so9Mk+dno5qTwFh5y8LiTEShWkZNN7F5/2YjA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aZM5YD05i0GtVLEutBW4m3RLAkpITnkRFoMcVT9cIBa8jko6h6VHxTp/MBA76kR/J
         Yzxq1V+L3PreKy2eYO/ETi6DBFsDjKKXi+jpRdju2Q+pwiLeWXg3G1rml5hE0J2Ggw
         4NAc98sn81VGKhACIE5/wmRxPc8GMnXniGa5CZTsZrXu6HKBTOSN4wp6784KNZjlNo
         rfD2Wi0Yvxq9gFSvxmZObyWagynStWDw6QgAST2wkL1jQEHe0fctVWtaRLrPGmxLC9
         MrCrIhYm1ZolbWemsAXPL1wmVSvYtkrqKuQZAGVNegEKR/ybVwHYg7rJi6gu2GF0qr
         ub6gaVcACxq6Q==
Date:   Tue, 15 Dec 2020 09:01:29 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.com>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Naohiro Aota <naohiro.aota@wdc.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <20201215090129.47344ce7@canb.auug.org.au>
In-Reply-To: <20201214215445.GT6430@suse.cz>
References: <20201202150149.42543862@canb.auug.org.au>
        <20201215070956.6852e939@canb.auug.org.au>
        <25c43226-f937-0866-9c0b-46867bd04cc7@kernel.dk>
        <20201214213612.GS6430@suse.cz>
        <20201215084300.3543c433@canb.auug.org.au>
        <20201214215445.GT6430@suse.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WvO_tZwrn/um/PblLvp0R5R";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WvO_tZwrn/um/PblLvp0R5R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, 14 Dec 2020 22:54:46 +0100 David Sterba <dsterba@suse.cz> wrote:
>
> On Tue, Dec 15, 2020 at 08:43:00AM +1100, Stephen Rothwell wrote:
> >=20
> > On Mon, 14 Dec 2020 22:36:12 +0100 David Sterba <dsterba@suse.cz> wrote=
: =20
> > >
> > > On Mon, Dec 14, 2020 at 01:12:46PM -0700, Jens Axboe wrote: =20
> > > > On 12/14/20 1:09 PM, Stephen Rothwell wrote:   =20
> > > > > Just a reminder that I am still applying the above merge fix.   =
=20
> > > >=20
> > > > I sent in my core changes, but they haven't been pulled yet. So I g=
uess
> > > > we're dealing with a timing situation... David, did you send in the=
 btrfs
> > > > pull yet?   =20
> > >=20
> > > Yes
> > > https://lore.kernel.org/lkml/cover.1607955523.git.dsterba@suse.com/ =
=20
> >=20
> > I would expect you *both* to at least mention this conflict to Linus ..=
. =20
>=20
> 2nd paragraph in the mail
>=20
> "There are no merge conflicts against current master branch, in past
>  weeks some conflicts emerged in linux-next but IIRC were trivial."

No worries then, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/WvO_tZwrn/um/PblLvp0R5R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/X4LkACgkQAVBC80lX
0GwHgwf/bM/idF7PHRTNWHnfugW6Ypx9+x9Wh+g63FI25BMLcfWBx0UzWj51NgWm
6N+yHKrwTUwkp+sG65Oqz96vNHO8B1hD3VVypMoSbtHRIHWUcuyXGmg5KWTRYIuK
vdZuo/UFbD186MRI4iX5CatnH3MlFfsgnWB8MWblUrNtg3KfZ4YKmKG0L2F498hR
bl663TfjNsekMivy+bb7t4Rafy3U0oQdv/7h3UiKGv3dpm2uqwtDdFiXHwGtf1ym
VCCU+cCJhVcpe0mjyRLmcOO3rL20mFsHi4AVuHbEKUKR8z4jJji+LJfkJSC3peCT
L3GMAzFjJvXXaC+Jy2n+Y0Lg7/zYxA==
=jXiI
-----END PGP SIGNATURE-----

--Sig_/WvO_tZwrn/um/PblLvp0R5R--
