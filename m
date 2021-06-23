Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F27043B112F
	for <lists+linux-next@lfdr.de>; Wed, 23 Jun 2021 03:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhFWBEY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Jun 2021 21:04:24 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50867 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229751AbhFWBEY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Jun 2021 21:04:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G8lNG2DLCz9sWQ;
        Wed, 23 Jun 2021 11:02:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624410126;
        bh=xrGd58hDoKV2wGMEzh1eY2NT4DixE0KaMw4Gwgdd4WA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bCVCHKzq4OgWgUE5CWN0NyMKVc9WvLHULBnNPLc4jBjWGgO4Y+jXXDdEXYG1DyqiB
         OgWsBSCxMvdbSjyCkGD3/hMDqcScmpKCHH5qoJK8hwOrvhYuTJMALkGmKc9vfzW/Ns
         5KFFADPtzS6hUAO2MAI4W9qgQjCYMzg+PeVKBUd3KBtAPr9+CqT4oPrCgBiR24z8ah
         qnEKzohUY6FRKDv2VFftR1qzwt0l2QTKsaVzcY0gtACRFgeuc3K+ploCwMKUoOEV+x
         KSV4V7i4ilDAHTCFEQcv9rx0F0JxXtGnDQD747lVq0bMWdGEFO6VPDbxHjMWaXDSJV
         VdRKKzcUFksxg==
Date:   Wed, 23 Jun 2021 11:02:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-msm tree
Message-ID: <20210623110205.05f98019@canb.auug.org.au>
In-Reply-To: <20210618125019.4a339135@canb.auug.org.au>
References: <20210618124203.14b57bef@canb.auug.org.au>
        <20210618125019.4a339135@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C.B1ADPViDZUpY=D8KvjwoR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/C.B1ADPViDZUpY=D8KvjwoR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 18 Jun 2021 12:50:19 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> [Adding maintainers]
>=20
> On Fri, 18 Jun 2021 12:42:03 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the etnaviv tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >=20
> > ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/msm/msm.ko] undefine=
d!
> > ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/msm/msm.ko] undefin=
ed!
> >=20
> > I don't know which commit in the drm-msm tree caused the failure, but
> > it is probably in the range 558d4272b60f..7e0230fd096c.
> >=20
> > I have used the drm-msm tree from next-20210617 for today. =20

I am still seeing this (as of yesterday).

--=20
Cheers,
Stephen Rothwell

--Sig_/C.B1ADPViDZUpY=D8KvjwoR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDSiA0ACgkQAVBC80lX
0GxG6gf6A5NeMuSjYVLn2SI3R+Mk383wodUKqQuMzpxK0mY5OFNu3JiPAE+xG4cN
HH3oCP/d4ZlkQVQgdw8Zn5Wrny48bmSV/6q0rKRqcqGW+9FT1sQHAdQ3+OmclMF2
24htKqmbBaqOMJSdZ0WZ3oIE8mhy+R2pb2WZgP1OCnP1EuzqJnPHMNq6plHXWyGz
VZRnLA7G7L0nhF6OhktJJfZLK19pSHiH482y88rcZ4WEB6SDnz4W4wjMx0rkUM9g
QfwkVVmQaE9zrkZSulY+nQhDpTovyODnvVpB5JJyNG6ceMrMBk2K/VNBphHVz/cr
hNQSc75NgxKLJ7AwgAUyEx3aqDU2Fw==
=Q68V
-----END PGP SIGNATURE-----

--Sig_/C.B1ADPViDZUpY=D8KvjwoR--
