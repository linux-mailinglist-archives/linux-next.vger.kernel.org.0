Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1CBC33EAB0
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 08:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbhCQHmx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 03:42:53 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36489 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229508AbhCQHmm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Mar 2021 03:42:42 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F0hvg315yz9sRR;
        Wed, 17 Mar 2021 18:42:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615966960;
        bh=9B1kDwqk2Aq7cnBTJ/I8PjOF7FYoKDp9U+aU5IvgsTM=;
        h=Date:From:To:Cc:Subject:From;
        b=EMKtdlMbtZUkDYlV1t/0TUE9oY8RFcuASR3/Aa00ANZliq9pCmc3dX4nMH7gMBnNi
         rMl+VTM98i1nOVxhGJj0JRhuVc++a7ZsLfqLNSPuz+hJbpzPs6G425ozbiJi46bwqf
         z3MkbenalvyMxMq68A6aU5EYkZ/4W49wni8lV5DoQyOb+ChTJveuuTxSBnDxOJM0zu
         LrvG0anUyW63M/cYgNiSzZnvr3y0LRj8okjues/DyGlyS6HMmyBAvEOD5gJb2etGd7
         KXOoCMoI37Gc3mfm5aVyhoGGwvgNWPEFG02r4Kf7dmgLXEYAu9WbTNV9Q4eVsNAlEo
         B70OTcpGHzYuw==
Date:   Wed, 17 Mar 2021 18:42:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20210317184237.7b0de3db@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VFXPai4zRYQv_2HI6H6V7tJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VFXPai4zRYQv_2HI6H6V7tJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

include/drm/gpu_scheduler.h:304: warning: Function parameter or member '_sc=
ore' not described in 'drm_gpu_scheduler'

Introduced by commit

  f2f12eb9c32b ("drm/scheduler: provide scheduler score externally")

--=20
Cheers,
Stephen Rothwell

--Sig_/VFXPai4zRYQv_2HI6H6V7tJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBRsu0ACgkQAVBC80lX
0GyNPQf9E2nEPp3fGgyYTtoL5IqYrtgq466WBskGcOMNzFfPGq8m72yrRKMYMP69
Jx/Aclzhij8qYHVTtGukAACD/HRapGOFcMuy0Bjkha9305D+oeNFv6R6uOHEoxYT
HnuN4QvMhYJC6IWi1XW51dX+R3qyF6pjPcqsx9Y0kPdsExOSHeVIJEPaUa0XVn4P
ZmNyc19/BigZhlAVIKYV6uLetMeaKGA/pv3zVXnnUAwqgDrvbFiaGYgbGt5qItDf
r9aj5LzMImCaRqJUjblsFHbbrx5QytAwUd80I5vO/xMRi2TNYKGotpxB2w5qarUs
8nj89Bg8e3BFCejd41GDRR5fBWbdNQ==
=1WmV
-----END PGP SIGNATURE-----

--Sig_/VFXPai4zRYQv_2HI6H6V7tJ--
