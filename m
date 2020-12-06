Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBBA02D0783
	for <lists+linux-next@lfdr.de>; Sun,  6 Dec 2020 23:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbgLFWA7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 6 Dec 2020 17:00:59 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:39121 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727040AbgLFWA6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 6 Dec 2020 17:00:58 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cq0jr3BHBz9sVs;
        Mon,  7 Dec 2020 09:00:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607292016;
        bh=tUWZm6WvfLuGY1J2XRvWYCaZnntTE9jBBg7MeaS+ExQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=D6+7I2Nhpo42hTSC7kUf4DcRvGf456S/0hsBG0IPBAH2iZ0jpcquTfcx0L/vR2CxO
         hwfShgS59CnuwTbOQHX8d7thO0/+97ZmWMT3mBaEuclImZs0T0XidKrUVpo3+aHLsl
         r26ca1R9iM+2MtZrll6msNYfP+qPDiT7xw6A4In0pB83hnnbN94EcDh0MagUjxI1cK
         OQxTUn2doJwfNiRnWqeelPDrxZKJuLZ69KUYrJ0dIck9+FhYw9DYrfK19/rt/V0SN5
         6nEnweT68JkfJLfuFR4FCFxJNJvduwk58peFfhvHcZQGHOuaeLovhYVUjqCNRy4W5K
         QclXB1DzPWDMA==
Date:   Mon, 7 Dec 2020 09:00:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: linux-next: Fixes tag needs some work in the drm-msm tree
Message-ID: <20201207090015.14c0684f@canb.auug.org.au>
In-Reply-To: <20201207085743.67ca0ae2@canb.auug.org.au>
References: <20201207070517.28951ed0@canb.auug.org.au>
        <5820a22b-6fce-20ee-2a48-58c2d57b4ac4@gmail.com>
        <20201207085743.67ca0ae2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NQUrUZ_7k8HWfmd_NLU201i";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NQUrUZ_7k8HWfmd_NLU201i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 7 Dec 2020 08:57:43 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> We actually prefer
>=20
> 	git log -1 --format=3D'Fixes: %h (\"%s\")'

	git log -1 --format=3D'Fixes: %h ("%s")'

sorry :-)

--=20
Cheers,
Stephen Rothwell

--Sig_/NQUrUZ_7k8HWfmd_NLU201i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/NVG8ACgkQAVBC80lX
0Gyi5wf/VG7hVBhOS4R+QkZu5abWue/aZOgpy2aifP47KioHKz+94O4FOw5rv9Hh
F+9Mm9i1MgDI2seIQy2vZtU2CaJsKyGkOWgyVpDxGpmaGHpXVAcqjiMLDQ2tEdDK
tEmRUhJ1NEK+kDUNnV+9eieFXGLq7/pPG0GyoSIR7f/5lXhIIrSB5wVwqEssLylP
hRO/9Yee+Wj+B6gP2mC0ojbxp4Pw53VUqBnE/dtYkOeQCZ/xH0XTzcKwVnuV37w+
/9O08tZVKGpF/F9IT+qpOKQcPYdYt5CANYqnA7Qod78HKk9MRHgXyUx1LQXwBA5m
n+1v/iTTFb+cywgN7erIC9TB9w/qMg==
=/c/3
-----END PGP SIGNATURE-----

--Sig_/NQUrUZ_7k8HWfmd_NLU201i--
