Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1B25331D2C
	for <lists+linux-next@lfdr.de>; Tue,  9 Mar 2021 03:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbhCICzk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Mar 2021 21:55:40 -0500
Received: from ozlabs.org ([203.11.71.1]:34723 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229379AbhCICzL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 8 Mar 2021 21:55:11 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dvfvb3g4Fz9sVv;
        Tue,  9 Mar 2021 13:55:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615258507;
        bh=I2atnsURNCx0AQ0lKEMYIfhWnoXp+Om5a1Eh2ifNoa0=;
        h=Date:From:To:Cc:Subject:From;
        b=jMwv/L5LzH1VIG//vQlBl6pyeNz4lHOb6VmPlUgDBEmwW7rxTVT8uLaWhTyGQPxGP
         SVw6NRDDur9jZTsr2nELWYS/TDeygk0KHAP9UwVFHmtEtyu1rdlpRIjE7ddFv6lU/y
         rw9UHgunPAjfWFEqmJSdE/E6aZ7+us4g+CeXk6V9a/OF2O7vHsE0O1P/zY2R1UoSH2
         dmEdDSs9UL1PfwpjY/qBv24A9/cO9G69OlJPQKrI0aT1G0gAhYq5+iG5tM5b8NXU+M
         HKPFIxE6yZ0NUHjZ6cIxZiJwLsr20F6CrU+y9a6RDuM4Fm4jc6sOW0uGT1EBUHo9ji
         S+DSQItcReGSw==
Date:   Tue, 9 Mar 2021 13:55:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Wayne Lin <Wayne.Lin@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210309135506.3db99688@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ymHNEbazt37WVESKSZznpIj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ymHNEbazt37WVESKSZznpIj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:380: warning: Function pa=
rameter or member 'crc_rd_wrk' not described in 'amdgpu_display_manager'

Introduced by commit

  9a65df193108 ("drm/amd/display: Use PSP TA to read out crc")

--=20
Cheers,
Stephen Rothwell

--Sig_/ymHNEbazt37WVESKSZznpIj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBG44oACgkQAVBC80lX
0Gyl7ggApNRopCChPuxc6NEAwUvAr25UwRsXljp8GXmbcvuLX+5YHQzjGm184zlh
NQpPNnoKdjXfhvC4WKAoooynIkzpXWGkh2EdQ5QbcoWkTEi0kSZnpXMmlkL+KJ04
TApaENdj8bxnyWJqoYPaITD0jKwZWj4LMIO8CU+GJRitpbrI3gOE92TjgEtG+Qxf
QJ5g2ZDpjHz7ZvSHStiYzflHoKHDWK82z5eJkpa35gPOL74e/wXP4u5LH7T19WLH
gbbYhTzbLwIFeO0eFy8110x3WJu8IEGv22F20PGktG6/I9c4b2To6S2bLyGjHwTS
jid5bmLO/3k5n8vr9PRtCKpQDtcSxg==
=PTNx
-----END PGP SIGNATURE-----

--Sig_/ymHNEbazt37WVESKSZznpIj--
