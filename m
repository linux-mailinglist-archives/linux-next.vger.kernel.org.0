Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6723445E25C
	for <lists+linux-next@lfdr.de>; Thu, 25 Nov 2021 22:19:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243346AbhKYVWZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Nov 2021 16:22:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357161AbhKYVUZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Nov 2021 16:20:25 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B888C061748;
        Thu, 25 Nov 2021 13:17:10 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4J0W0c00z5z4xcK;
        Fri, 26 Nov 2021 08:17:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637875025;
        bh=93/TCBEh1nUv3zcmEX3i+bNwTuC9M5iS/EpIDsluCGo=;
        h=Date:From:To:Cc:Subject:From;
        b=coDyNvywVUkxzqcQMpgy35WqGom3b2tNMeVOmmy6+LdPr04/7Bb5HVH/GDsE65hUA
         sUhUV7/KjPj/rfaQVcp1Qzbwbpj/b9V4pFap53CmcExqFar/8JZLoTHwKA6b07CCCl
         bFlEFyAeF3T5CskuEuyDGuAwEGjs4omUNilG5EOqBrOhIJk6+CyrFSFKnQP5Fvh2av
         Zip4wSdgOWPkEJ5Fi30evV2DsBEv7tZCGeZGM4kReuTOCY29fpM8tlwVhUqGQlmD9t
         bdAKDefdp/VAWUYx3YrnNNbL6TeZLdiJ5PP1RLXtQD/7vgkFLu7+HdW2UDFdaQc4Yp
         avNG9K7/4Wx6A==
Date:   Fri, 26 Nov 2021 08:17:02 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Eric Dumazet <edumazet@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the tip tree
Message-ID: <20211126081702.25133048@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/96InG3te3F/RN+Q_WGynJu5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/96InG3te3F/RN+Q_WGynJu5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  6b2ecb61bb10 ("x86/csum: Fix compilation error for UM")

Fixes tag

  Fixes: df4554cebdaa ("x86/csum: Rewrite/optimize csum_partial()")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: d31c3c683ee6 ("x86/csum: Rewrite/optimize csum_partial()")

--=20
Cheers,
Stephen Rothwell

--Sig_/96InG3te3F/RN+Q_WGynJu5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGf/U4ACgkQAVBC80lX
0GwGZAgAnvA8FDnhOhCzrYbMKwgYYfnoy4hXt6h9Tw3oddjtm5yYRT9E38qhYwHO
2gcxHdavWFu81vEjh7efUBlLy7fTjPWeiEJO2UhM+8x9qZbt7q5NMCXiPlH8ZE5y
pRet53qPQc3fMcN9d+lwDaFKV78fw1ZuSjJGwLgvdc1tslqaDlLDyJ2stepsKc0A
75MxLKmpkas9JXohAz9A3y26YBytx8bdhyharp4rTFq+hhj4Z3rFeyZnmMaZmuRT
nkEDD2PPws4yw/NIcMjDHAw/MKXX/mKt3S395l4/wX2qPdMGAELzb0d+uNqTshLZ
XhsTeKIQlTCn463L3/dfjnOcoOSyOQ==
=D7ku
-----END PGP SIGNATURE-----

--Sig_/96InG3te3F/RN+Q_WGynJu5--
