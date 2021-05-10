Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E3973799E8
	for <lists+linux-next@lfdr.de>; Tue, 11 May 2021 00:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhEJWUG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 May 2021 18:20:06 -0400
Received: from gimli.rothwell.id.au ([103.230.158.156]:45023 "EHLO
        gimli.rothwell.id.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbhEJWUF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 May 2021 18:20:05 -0400
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.rothwell.id.au (Postfix) with ESMTPSA id 4FfFnk3P78zyNq;
        Tue, 11 May 2021 08:18:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rothwell.id.au;
        s=201702; t=1620685132;
        bh=D/o/Nfv0lbsA+YP48brlk3SWef7/X50hljW4mM7sZ64=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=K7VyFUYNv4osf1eo8rpK8BpLzjgzhJDErRHnwQm9uRe43E0uVzw8w6I90Wj2wwGdJ
         Xue7IXbop099ttkozRC2HkVUmDkILCtQjl8xATsuxFCgzfPQ7AuQc9nX6Rjmv5c6/t
         emO0smYk0VZmimgXk9AFV/aSYgw1gOlBoxoN3WEoV+EcxtPNC83mQ55x+AK01EiOPW
         UWwEE9WMPcEvp0nk0b2d0aGwaB1XrKlxkH8oxpkSkvob0qMWtGX1EelbVgtYO/nFM2
         wFFQvy8EvW8L0zF12Tpx7J3/9mTcSdn0XTUriznhEYrZOuRJ6zB+Qn3Ztcm1Y1iDOe
         GWj0Lo3kCvDMg==
Date:   Tue, 11 May 2021 08:18:49 +1000
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
Message-ID: <20210511081849.59d41322@elm.ozlabs.ibm.com>
In-Reply-To: <CADnq5_OqX6EBWyt5TR1N2Fcwdq-0hWBzcRFnBSej=vCoPmZCrg@mail.gmail.com>
References: <20210505093458.23efd0ee@canb.auug.org.au>
        <20210510084628.0d4bbd6c@canb.auug.org.au>
        <CADnq5_OqX6EBWyt5TR1N2Fcwdq-0hWBzcRFnBSej=vCoPmZCrg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0hG2Mpk0Lj=GfgmXuv.3nGC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0hG2Mpk0Lj=GfgmXuv.3nGC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Mon, 10 May 2021 10:24:58 -0400 Alex Deucher <alexdeucher@gmail.com> wro=
te:
>
> Fixed in this patch set:
> https://patchwork.freedesktop.org/series/89890/

Sure, but that is not in the amdgpu tree that linux-next includes
(https://gitlab.freedesktop.org/agd5f/linux#drm-next).  Did you forget
to push it out, or is it still being reviewed/tested?

--=20
Cheers,
Stephen Rothwell

--Sig_/0hG2Mpk0Lj=GfgmXuv.3nGC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCZsUkACgkQAVBC80lX
0GzP6Qf/dTP0nWZES/UThN3I/CeQyk8Fpw+Lff5tlaeLLCCMtb/5/3m+QxMxuBv6
tEf+UEOH0DGXTcAAjmRS2XsOFsq5miP2KRCd3ezWizD7EePQrOE55QA4I+v04tUG
tkU3Tvwh2xE17zXlIYk35YNwQi/fofeQ4q/FKHKzSHctR7TcD0ncinIUse6CVysl
2WEHK5x0Xe65r5o1WvXoVWJ6grCnaofC2jHSsMqb0U2mtJnbT5yy6qYTot/VSU7v
eEkEy7VrYDc8fHGDVVZ9LwFU19MEwQYTZLskEmdaXV49YtStSlzNebuFIOzBmcAP
jJC4wreacWrap3ABOHkcrQo7VcVaEg==
=fjUa
-----END PGP SIGNATURE-----

--Sig_/0hG2Mpk0Lj=GfgmXuv.3nGC--
