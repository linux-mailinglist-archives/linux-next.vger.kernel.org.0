Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5C0A2D4E0E
	for <lists+linux-next@lfdr.de>; Wed,  9 Dec 2020 23:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388611AbgLIWhX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 17:37:23 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:46993 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388697AbgLIWZY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Dec 2020 17:25:24 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Crs6X0GD4z9sW9;
        Thu, 10 Dec 2020 09:24:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607552676;
        bh=eD9NmmPLfPrzRjcCyxUuWyfspWk7eDWvfnBR1mLbYaE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AObb2KGsGKpSOxhuBKtuCXVomssgi2HG5rVoZS5kbFB2hXb3Yv5qxCbsDhgUXpWH0
         qw3oHSg6iol+gmzTEx9chG4FyjWuvxJcnWR5v7soZigTBDfEmTqR7XqV7Jlpor13kl
         Z3/3j0wSW0As2GBoNAL/zk1gLn3P0JHQarLObXp1uVb5WPUArfqXRBwJXHHq804n9Z
         N6yxLYIVhoik9P08W0KgJNZ6Knu5u4kcu2DYcKmnlM0fDaxkKwvUYnDmTPINqwr7Rl
         7SR8vgH8mJjswANQkRWGx6PruA4Ml+ek7UYFBU87Ol3mO/IG2dxerziJbSUZ31ziW3
         MaB7N969VCuvA==
Date:   Thu, 10 Dec 2020 09:24:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Luben Tuikov <luben.tuikov@amd.com>
Cc:     dri-devel@lists.freedesktop.org,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/sched: Add missing structure comment
Message-ID: <20201210092435.253b12aa@canb.auug.org.au>
In-Reply-To: <20201209215807.75983-1-luben.tuikov@amd.com>
References: <20201209210211.306f3c61@canb.auug.org.au>
        <20201209215807.75983-1-luben.tuikov@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iZBsxxsKc+8aoxExqRynEoN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/iZBsxxsKc+8aoxExqRynEoN
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Luben,

On Wed,  9 Dec 2020 16:58:07 -0500 Luben Tuikov <luben.tuikov@amd.com> wrot=
e:
>
> Add a missing structure comment for the recently
> added @list member.
>=20
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
>=20
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>

The commit message tags should all be together at the end of the commit
message (probably with your SoB last).  Also:

Fixes:  8935ff00e3b1 ("drm/scheduler: "node" --> "list"")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>

Thanks
--=20
Cheers,
Stephen Rothwell

--Sig_/iZBsxxsKc+8aoxExqRynEoN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/RTqMACgkQAVBC80lX
0GzvvAf9GDpGt0VwRySC78qWiw0UCoft1kDhmL80tGvkQMWChGLzHDLPwEzlkTk6
6HoF2UUmHSezITb+TQyStq/ckofIWorPHVw4ANagCy7OJ+CY2jVXtvZgjsQ55iRj
WtrtznFi9NKLVB7wvsgEd7gLZlTpfvSAT0Fq+BtAV44Fyq32IninTiT9devkru3m
Ubw1XV7sHWN/sKy03+yrbS3mBBLjFTxkkBTJ7IIvoTAEWmc6YBBYOl+e9uJ2eZW5
2XMJPCtK8fGJWLiKpSLKJv9yZWJQSylmnlLS17/RRTw9L3TVOi5Z39xJBfIv1PSL
BY6grzGQPvw+HBJshU3vFARfRLp3dw==
=X8oC
-----END PGP SIGNATURE-----

--Sig_/iZBsxxsKc+8aoxExqRynEoN--
