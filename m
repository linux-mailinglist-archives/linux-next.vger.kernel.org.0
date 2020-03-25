Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46E74191F18
	for <lists+linux-next@lfdr.de>; Wed, 25 Mar 2020 03:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727348AbgCYCdA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Mar 2020 22:33:00 -0400
Received: from ozlabs.org ([203.11.71.1]:56503 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727305AbgCYCdA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Mar 2020 22:33:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48nBx36WTPz9sRY;
        Wed, 25 Mar 2020 13:32:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585103577;
        bh=x6e3RNDMdZMU5+krqi2U/HIx3JNvnOWo1D/VYW8jf4Y=;
        h=Date:From:To:Cc:Subject:From;
        b=Fry/d1eUyZI4SF6LJbPtYEZnM6pfhc1UjpV3+04jZAvyDwVUMt1R37ln2DAYV1CrH
         rR+GVnPJjvHEf66cOs1/ntVaStfyb9a3YaY11QE0jHJxOXDBlRNXk34WOb+Q8TdMD6
         jimMMayQn+FALwbAH9uVmJWHordPulaAenPEpb7/ZdL6dFAFFa2wX5puKQ3IY3AV2l
         555Vi88VeeeUos8GpXpQQE4GP9MJHOJEQFYa5qJIKsDl7FuJvxh+vl4HcZqr0ca72K
         htYOKLEUAETPX87JtKl1P/LNMhG0PhjI4197aEUdGHx10bVy7nRqQIMZNSiDdNb+hD
         J2SxiuJxODKqQ==
Date:   Wed, 25 Mar 2020 13:32:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Willy Wolff <willy.mh.wolff.ml@gmail.com>,
        Thara Gopinath <thara.gopinath@linaro.org>
Subject: linux-next: manual merge of the tip tree with the thermal tree
Message-ID: <20200325133240.50370c2f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EKy9RTzTWh=MHRhsOjjX/lZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EKy9RTzTWh=MHRhsOjjX/lZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/thermal/cpufreq_cooling.c

between commit:

  ff44f672d741 ("thermal/drivers/cpufreq_cooling: Fix return of cpufreq_set=
_cur_state")

from the thermal tree and commit:

  f12e4f66ab6a ("thermal/cpu-cooling: Update thermal pressure in case of a =
maximum frequency capping")

from the tip tree.

I fixed it up (the latter seems to include the former, so I just used
the latter) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/EKy9RTzTWh=MHRhsOjjX/lZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl56wsgACgkQAVBC80lX
0GxC2gf/b50X+3RlWUAq4IOpBu7mZuzgA8tUvHZz0yLjRXcmOzlwU9U8MhrVPO6t
j69NOHVqerF/CRix5QVphgCOYKaCmg3UfjFkqNuq/tX8nTOj1IF/oJjEfhhWyEty
wAueuUIBBcATWt+LuJA2rCGGRHJMbJRptagn+jMQWTcTGe2TTuYQYKnhvMulfi9z
YK9ENXBxZ8FxSKqAH2ckJ7urD/9jiRL4dB043XeSPfOcCQq1tfir7PC7iAPmHQum
SfdIqQ20qG/HyBPxJ4Rw7D+pNJSZOz8piLge/8EqVw4Yz8FYgQNlarK36972suQ6
rLc+MAxRZDPRW7DpIR7zpSEYYzhmpg==
=Khic
-----END PGP SIGNATURE-----

--Sig_/EKy9RTzTWh=MHRhsOjjX/lZ--
