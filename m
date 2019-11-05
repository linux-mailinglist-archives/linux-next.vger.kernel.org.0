Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B77BCEFC36
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 12:18:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730809AbfKELSi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 06:18:38 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:52599 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730763AbfKELSi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 5 Nov 2019 06:18:38 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 476nGf2mq8z9sNT;
        Tue,  5 Nov 2019 22:18:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572952715;
        bh=wlyVMHv+nfsspNnGPZQJO0GkNQj83K92ZcLTdou7qgg=;
        h=Date:From:To:Cc:Subject:From;
        b=M0oMaQdTXgJKIeSGpvAxx7cfZJmUPAqVmwbZ4i+hZnuPLjxQ2xgT46jUHOGt3McHJ
         gYC2wYeRwgJdol6PR7OEIUdzJeS3YYVdyI56AD/PesqX+sR9SoLcbG8fcodvF+SaXp
         7rSmoZI35lNWzp3usrfDodLlpfSKmw/MgNse9vPcNSOkpGFx3d/61OivhN3TGCngTx
         Hd3dEPcRejK2oyysCzupeRyt3HZAam2tA2UZ3V0pVSUhTRlSe3kFrju0X7LWL3YUy+
         ubi3YlBDDgN+R/IxrfuHoF9+/qTt7FJtfRKwMefB/aGMDjC5hwo1BqZ3A94RrXf8sq
         2OENc4eGE2Vkw==
Date:   Tue, 5 Nov 2019 22:18:30 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jan Beulich <jbeulich@suse.com>,
        Fabien Parent <fparent@baylibre.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: linux-next: Fixes tags need some work in the tip tree
Message-ID: <20191105221830.69ec8bcc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uLXmy0Ix51/Pb0+ksntgiRo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uLXmy0Ix51/Pb0+ksntgiRo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  fe6f85ca121e ("x86/apic/32: Avoid bogus LDR warnings")

Fixes tag

  Fixes: bae3a8d3308 ("x86/apic: Do not initialize LDR and DFR for bigsmp")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

In commit

  41d49e7939de ("clocksource/drivers/mediatek: Fix error handling")

Fixes tag

  Fixes: a0858f937960 ("mediatek: Convert the driver to timer-of")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/uLXmy0Ix51/Pb0+ksntgiRo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3BWoYACgkQAVBC80lX
0GzBfAgAk6DodycR3m5kO95k6g929xVfVCPhl3+5daDbBcWeJsiWYxxE9dRoHjgT
sks9wZF7s2XWcgM84SsM+6njnEc1PkTwJCjtl6GZdRFbIyWCMbOj2E1iTmC/up7W
lrYfjwVrHPGN2sgxgLLa14b3qTw6MBiIGnAFLz1unSzHitr2zXkEUm9xga5/qvOZ
oCmQ3zap1HPY3pC7KOJtiblUJytHfgNlX211PEfg/xJSNO/X2ZjTjefvQjaYu42j
l0bR7PaYsG+LI5xcmTFoo4bQKMqWLMy96aq/54DYhxYsECPMBKi93N+b2U/HHK2Z
TWjFzth0Fa5m3WRjeJBclf0g9t70lw==
=JDLR
-----END PGP SIGNATURE-----

--Sig_/uLXmy0Ix51/Pb0+ksntgiRo--
