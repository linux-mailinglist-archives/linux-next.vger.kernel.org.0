Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A16F3732C2
	for <lists+linux-next@lfdr.de>; Wed,  5 May 2021 01:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbhEDXgD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 May 2021 19:36:03 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:48927 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231226AbhEDXgC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 4 May 2021 19:36:02 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FZbmM4qW8z9sSs;
        Wed,  5 May 2021 09:34:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620171300;
        bh=0out9Isf7Z9icGU+IM9sl8hM3WJa0lf6i23LuiOjslg=;
        h=Date:From:To:Cc:Subject:From;
        b=jq4yVblMaYDOESwevI/KiRgOaXDrtCdlBfCY4WdMH2k6CvwpuPWbuXZEqDvcHbncP
         MuEop5QTM3CU5raqNElJBO1RHfnajoMurKMW8RINRlSK+oLrm+xWVqYuQlqj+jlOyN
         hURiv13oZWqP8BdpUDdgC0KVoXpsTwsgZfXWTaQEmb/3ps44bCrIeiApaRJKgN3R6I
         8EzF2J/W1wL8222wSqDYLcKBj9YUZ4FkhitoGRfAMx288htOhmqWt9APWTODjdA6iK
         Mey8/xRy5Kewb5j9obj0TmDmkkNmtTXL0x/t7KOaKMQHfXKmf2l5+55/7brCQ7s+BC
         gz1+lZVKWpYug==
Date:   Wed, 5 May 2021 09:34:58 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Jude Shih <shenshih@amd.com>, Hanghong Ma <Hanghong.Ma@amd.com>,
        Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
        Daniel Wheeler <daniel.wheeler@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Dave Airlie <airlied@linux.ie>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20210505093458.23efd0ee@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sU9Rfc=Y6ieX.=tcetB9P0L";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sU9Rfc=Y6ieX.=tcetB9P0L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'a=
mdgpu_dm_initialize_drm_device':
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3728:7: error: =
implicit declaration of function 'register_outbox_irq_handlers'; did you me=
an 'register_hpd_handlers'? [-Werror=3Dimplicit-function-declaration]
 3728 |   if (register_outbox_irq_handlers(dm->adev)) {
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |       register_hpd_handlers

Caused by commit

  77a49c458931 ("drm/amd/display: Support for DMUB AUX")

I have used the amdgpu tree from next-20210504 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/sU9Rfc=Y6ieX.=tcetB9P0L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCR2iIACgkQAVBC80lX
0GxA5Af/Q9d0AAusrcQqcYWNMCZR8hsKWJmF4j1lFAjqlUd9+L/NWsDZEMS4OFxi
oBM1HqbyI/S7WmpUh+YfUvymSrPJ6XUuagfW8KZMc3dRR9GwRIrjD89SWbr2e49B
zoesFg26qvxB6EwO4P4J5xzRDzP+UMM0AZ2gw35ZBdH9pLtMc7NfLYL9v0+wlRMn
QgVyNRHhOfWTezmJfBRdxbX7PhLkPkVywChp6HvS9mR52xpJH7fefk6nPkNdT36Q
fuTbLedJIDTl25COoB7EFfiy1iky47mY0jxjnPQhmohZFtEnjB12IAvqNYztnkbf
5d3nL0W8Nflacqu5rJmr3I0uh2ROiA==
=Do7a
-----END PGP SIGNATURE-----

--Sig_/sU9Rfc=Y6ieX.=tcetB9P0L--
