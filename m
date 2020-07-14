Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7220A21E43E
	for <lists+linux-next@lfdr.de>; Tue, 14 Jul 2020 02:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbgGNAC1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jul 2020 20:02:27 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42419 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726629AbgGNAC1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Jul 2020 20:02:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B5LL869l6z9sQt;
        Tue, 14 Jul 2020 10:02:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594684945;
        bh=Xp+Eo/m3I8eKIUvfRsFIWO3rOV+11Cuyv/nck9WM+1k=;
        h=Date:From:To:Cc:Subject:From;
        b=iyGCw9x7WPqiMb/+Ny/AL533qX2ZAITiJp5jcnrBsWXJxmzi8Qe/SaUCEtgI/jf5a
         0gx11CyiNe5OoRM3PiPBZMQ7rUzC+0ndD5Pu3cCPLUwHQefkwyHFFgVorQXz+q0XB+
         POOYHPNb0b0ndM2QTQnSpJSnRLfCt2YXh0L+uN29mP9XVEOBKd74L3r244E+f/Jaom
         tT1dS5PDZTOcZAcP0idp0smLbwzU8Mj54rzWGYuaWuPNRw2rt6+ZOCqtgL9L+quGSq
         9TTWLwto5GVFadE9zXZqth8NfLDKsdB42vnJ/hE54AffrfhI57ByCk9CUbpxjd0d9Y
         YhGwyOD0fp3Cw==
Date:   Tue, 14 Jul 2020 10:02:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>
Subject: linux-next: Fixes tag needs some work in the drm-msm tree
Message-ID: <20200714100222.46632daa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CWVboPbRpdIQzY+9SpYhZlC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/CWVboPbRpdIQzY+9SpYhZlC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  736fe23d544f ("drm/msm/dpu: request for display color blocks based on hw =
catalog entry")

Fixes tag

  Fixes: e47616df008b ("drm/msm/dpu: add support for color processing

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not truncate or split Fixes tag lines.

--=20
Cheers,
Stephen Rothwell

--Sig_/CWVboPbRpdIQzY+9SpYhZlC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8M9g4ACgkQAVBC80lX
0Gx/qQf/Y0gIaG1+QSAWd63BiAFiwNhPDvltXSLUT2gjT4LdpKQjCfWFxHjAjmPI
8nZpg1hlLYvUfH0x7FYM6+oyZSsO2oyz4rS2dThr+ccYGI4fLcUuhT+CdhY9tag8
PBfMedWdA6Ue2WCXcOoEIWE2pKWk5Rxtuct+icn1F+sjpP3VifWJlnTnPmhkxcIB
wf/tUmRdJXBHh+kdRqtdvjDeQziAln19DpzmwNl+JIQPNSzTAZ84ayWLGKOSqGxk
LQq89/IFmdm2BKMEyoh3h3VGyuFXx5tWOEqzltB6j8GFBHBWeIZSsEudZILMWLrW
CJ6r9Xsc4tMbJ5u6sV4IC1tSQ5oQMg==
=iaYL
-----END PGP SIGNATURE-----

--Sig_/CWVboPbRpdIQzY+9SpYhZlC--
