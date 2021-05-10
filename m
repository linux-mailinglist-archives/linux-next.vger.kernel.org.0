Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99EB7379A75
	for <lists+linux-next@lfdr.de>; Tue, 11 May 2021 01:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbhEJXDS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 May 2021 19:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbhEJXDS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 May 2021 19:03:18 -0400
Received: from gimli.rothwell.id.au (gimli.rothwell.id.au [IPv6:2404:9400:2:0:216:3eff:fee1:997a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4789DC061574;
        Mon, 10 May 2021 16:02:13 -0700 (PDT)
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.rothwell.id.au (Postfix) with ESMTPSA id 4FfGld397DzyNq;
        Tue, 11 May 2021 09:02:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rothwell.id.au;
        s=201702; t=1620687727;
        bh=vvJYrLdSKdPDp5n6MdBMG8Ejl6tfMoxG/EL7Uwg+zvw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gFrB4UZNdxUdZih5ls+hfIeDN7bpdpCvvwe+hP8iizCA5Hordev1dtY6N59CUx7Um
         AxzKOp2dURoHKDFIwSRypLjex51F7G3VIDdt9W8HsHJu4DGJBVHE4SaediiBPFEQKm
         gUHkfNN9gZiLTPMHccbt6d1Izm8xDmvSSMpA/fumNbQ3h0pX3jLNak30J9Ww18dkZn
         NIN6JvdvT9k4VU4HgeJgpWc4mBffHEtIN+2HYxhTOWw6BoVdsgwzMgkib4py/SWgH3
         AfwwNjBNS7Bf+GiDRnrBWxNv2/GpfcA8qL++mDCAztNTbtmWZCr/0uc+IJraRPCKlj
         I7EbhF0cXI6jQ==
Date:   Tue, 11 May 2021 09:02:04 +1000
From:   Stephen Rothwell <sfr@rothwell.id.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jude Shih <shenshih@amd.com>,
        Hanghong Ma <Hanghong.Ma@amd.com>,
        Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
        Daniel Wheeler <daniel.wheeler@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20210511090204.6cc161e7@elm.ozlabs.ibm.com>
In-Reply-To: <CADnq5_PgHV07dXabX9kiJzqW13W2YeYJ146=BJ-uGCxTt6-_pQ@mail.gmail.com>
References: <20210505093458.23efd0ee@canb.auug.org.au>
        <20210510084628.0d4bbd6c@canb.auug.org.au>
        <CADnq5_OqX6EBWyt5TR1N2Fcwdq-0hWBzcRFnBSej=vCoPmZCrg@mail.gmail.com>
        <20210511081849.59d41322@elm.ozlabs.ibm.com>
        <CADnq5_PgHV07dXabX9kiJzqW13W2YeYJ146=BJ-uGCxTt6-_pQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tsCNGkkeO.P0bSwqgwUKwAC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tsCNGkkeO.P0bSwqgwUKwAC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Mon, 10 May 2021 18:23:35 -0400 Alex Deucher <alexdeucher@gmail.com> wro=
te:
>
> On Mon, May 10, 2021 at 6:18 PM Stephen Rothwell <sfr@rothwell.id.au> wro=
te:
> >
> > On Mon, 10 May 2021 10:24:58 -0400 Alex Deucher <alexdeucher@gmail.com>=
 wrote: =20
> > >
> > > Fixed in this patch set:
> > > https://patchwork.freedesktop.org/series/89890/ =20
> >
> > Sure, but that is not in the amdgpu tree that linux-next includes
> > (https://gitlab.freedesktop.org/agd5f/linux#drm-next).  Did you forget
> > to push it out, or is it still being reviewed/tested? =20
>=20
> Was still being reviewed.  I just pushed out the tree with it included.

Excellent, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/tsCNGkkeO.P0bSwqgwUKwAC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCZu2wACgkQAVBC80lX
0Gwmlwf/UgBs+GWe3+mlcmaQjy7XaGMLdPyo7mDylZGIc7VYzJp3W11F0tDC6ct6
WGLQ1j5GuRGmB5nHNRM21wSfP6HomYkG+2lTkRg+e7k83JfRbSFrh+FZhS65pIBt
fCotPZy2IwoBsDpducBvmmS+scCUumLp+QGx/Ipc2Q3p2hZvr2g8z+zwb28ha2+m
vxteOZR4chDbuF4KsVtn1/FRlRqY+LbdlU64QL3uAcGleYRoZQ0O74laYsG1j/U3
t/SnnwAfmOa8jCxawKikJuB3+2YndC7KGJr7gvVrGjz63fskeCvTbOqcqEnhIDiy
1wVIuPSiU7Wag4x+eK8Z6tEqkU9FEA==
=idV+
-----END PGP SIGNATURE-----

--Sig_/tsCNGkkeO.P0bSwqgwUKwAC--
