Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD4F2D58A0
	for <lists+linux-next@lfdr.de>; Thu, 10 Dec 2020 11:53:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389149AbgLJKw7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Dec 2020 05:52:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729145AbgLJKwz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Dec 2020 05:52:55 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1961C0613CF;
        Thu, 10 Dec 2020 02:52:14 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cs9j75ghQz9sW8;
        Thu, 10 Dec 2020 21:52:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607597532;
        bh=XdGEj/wxLnr2TGCvder97q9uSNEzmoV3o/hlovFQcHY=;
        h=Date:From:To:Cc:Subject:From;
        b=gC6sbIAmDKY1+Z11U8nXGQT6giUjAqT0CUUQVtDBAcYK46fJ5d9pWDka8hrEkJ8yg
         IM0dtLy6t1N0dA3tui8p3HWANxHEchyPdBQ9cuidHQaRCa+pLCGYtNniTS6h/WGABY
         uPjyppZ1zRNMaXjPOoQuM4+0/ijJveBG30Ibw40PuOyPblzlTvmUU146pf9m6zuoSy
         IXR+urpImmvyNA6Uuew0vprsFv+tHdcgc98ICQFLzS+zOdrgHXR7DE2s4rAj6iXk8/
         BNNBWsFt9ul6s13sTyPtJOKjej1wrT7gfnAs2N1K0HQNrDUBqcy4wkBipECp/FNqlC
         uREbFkwWpfJdw==
Date:   Thu, 10 Dec 2020 21:52:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Giovanni Gherdovich <ggherdovich@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <20201210215210.2c432324@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sLpuWhXyc0OKH+68FxDIzzd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sLpuWhXyc0OKH+68FxDIzzd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  46609527577d ("x86, sched: Use midpoint of max_boost and max_P for freque=
ncy invariance on AMD EPYC")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/sLpuWhXyc0OKH+68FxDIzzd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/R/doACgkQAVBC80lX
0GwKXAf/cWDi4Yf8M9/jRCjomM5kEIp++SPuA3Z0hjBQoaZKf4EZZuoTcl4bRZ7s
h7lsOPjYOLRYOaPfo5hwgMc+lMfksybrVaLNcCIOBe1T/WAFppMyokvwys/7uEmj
qlqUkOI2heEZ4UagdTxDB1WLvoBv2K6eNGLZ3rznLfOxvyHz5T69nEEh15Y/5mlt
vS9uGLwVEDKbShpZ5Pux5mO7PQK1dLq/JAP2WXOMND8H/BaveUZC5UHN/QvJ7Bnf
mU72Kny1BvbVmtXoXDydU9PH4DIq1n5SS+tpt0CQP4LLhXFIwXpXYt8k7Lrvv6iQ
xymkrWTvZwkCCmEMje39Ci0u2gwkUg==
=XUTh
-----END PGP SIGNATURE-----

--Sig_/sLpuWhXyc0OKH+68FxDIzzd--
