Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE9C30CCC2
	for <lists+linux-next@lfdr.de>; Tue,  2 Feb 2021 21:07:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232831AbhBBUHd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Feb 2021 15:07:33 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:34049 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232371AbhBBUFl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Feb 2021 15:05:41 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DVbQ04YHdz9sWR;
        Wed,  3 Feb 2021 07:04:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612296296;
        bh=OzwFR6tuq5lQcXviHPDRxVXF5FtRufNo8GuUpvWwVgI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rVVarzKIQI/d0PKYA9oVZRNuruS44jhnPEuhoC59vlnSgrIwWUFXGiuOXKF4PJ676
         k4pzaBsDZoPX2YQXXnY1uZ/EmQBD9VKq4pQzrizBv084PBl3oQqpf+cYpbwKliQYH1
         sF4LBLrvjKgATKzkMv++VMZZLMSdU8NPtRo715D14/r0ezdxuE+LP9eAuOFIS7tRDg
         DRvMswhrFb4kX8CQgJowVZbu8bmFp6q0gZdI8ERuFqi1FEuwu3395Stro0hM4U+2Ld
         Q61EBRffAiCBGaolRLSs7MymNstEHo7qT5T392uUmHWiED1pfcOgb0UIkeaIW2tUK0
         emEGygHF/tHkQ==
Date:   Wed, 3 Feb 2021 07:04:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc
 tree
Message-ID: <20210203070455.6e9a9a52@canb.auug.org.au>
In-Reply-To: <20210203065754.6b351c79@canb.auug.org.au>
References: <20210203065754.6b351c79@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ts05nBiZxIIHsTTacUS_zkU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ts05nBiZxIIHsTTacUS_zkU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 3 Feb 2021 06:57:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> Commit
>=20
>   4e238bfd83f3 ("ARM: dts: sun7i: a20: bananapro: Fix ethernet phy-mode")
>=20
> is missing a Signed-off-by from its committer.

This is actually in the arm-soc-fixes tree, sorry.

--=20
Cheers,
Stephen Rothwell

--Sig_/Ts05nBiZxIIHsTTacUS_zkU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAZsGcACgkQAVBC80lX
0Gwf0wf/cLto+C+Z1B6HsS7bx+0PrdVH6+ugIDOKcEdkuL2M+MxLrlQs2lC7JQZO
aPG4wVatt6kf+oP5Vr361DdgHX3/jqGCD7gSIDm7OZ5eTcDZshEj8Lf/kBXGFosQ
AOWZz7EKh2NpoqZA9WukHfBIIzFJsKXKtPsvBhZu4sWuuj8s3TRyknvvO+NudaJv
+ExQ32WifoaOe8VdhP/gOjndN3i7Ewq1LS8hPOsBzbNE/+7SeqjZ1fuhM+EYwyGf
NHOOh5TWKJZkdWxrVcnx45FTB/V1xCG8N5MI2qg7CTRxlemLJbfVOvEBXXeh0zD5
JBpLUC4YeByAiuPuUf3NKACL/a40MQ==
=042E
-----END PGP SIGNATURE-----

--Sig_/Ts05nBiZxIIHsTTacUS_zkU--
