Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C50334BF56
	for <lists+linux-next@lfdr.de>; Sun, 28 Mar 2021 23:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbhC1Vaz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 28 Mar 2021 17:30:55 -0400
Received: from ozlabs.org ([203.11.71.1]:34199 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231609AbhC1Vav (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 28 Mar 2021 17:30:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F7plz1vKsz9sWj;
        Mon, 29 Mar 2021 08:30:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616967042;
        bh=u2+9i8EbFTjVFljB7+fmbO2oGTgl8cgjIch7yTbc7a0=;
        h=Date:From:To:Cc:Subject:From;
        b=lJv0LfkC1g0m25k4f1qFAJtkxgmSlgq6qf/5jx8HC9EjEhHnyIAT5sMDey/+prLWk
         raezviG6VAkYURjPW4ZReYYeoUptRZZHE3UAPdrFlgVj+6RBeWIMAinDcpttD75VYv
         RriPNgeom4siudLunB32yifyOS3fAWvwWnuqfO5UZY8nCEUUQIqQPETv5fSqenpjwv
         jX2M9kFmT1UnXrcrfUkj9prXxUeAoaUpZzLu4Qi7pBNIxmh98K0GSIOn0OhHUyXYRn
         JNRHQjCYKH30R+pRjfo2+Lk4vZ+8XvJ6cER8ioojx5F0xjaRITJZgdnkZ3D3S4ausA
         k7s0lNsuPrNYQ==
Date:   Mon, 29 Mar 2021 08:30:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: linux-next: Fixes tag needs some work in the tip tree
Message-ID: <20210329083037.1ca35739@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tK1EQ5vZX1DtnaqIMYUuhfj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tK1EQ5vZX1DtnaqIMYUuhfj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  2f706e0e5e26 ("x86/kprobes: Fix to identify indirect jmp and others using=
 range case")

Fixes tag

  Fixes: 6256e668b7 ("x86/kprobes: Use int3 instead of debug trap for singl=
e-step")

has these problem(s):

  - SHA1 should be at least 12 digits long

I don't think this is worth rebasing to fix, but it can be avoided in
the future by setting core.abbrev to 12 (or more) or (for git v2.11 or
later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/tK1EQ5vZX1DtnaqIMYUuhfj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBg9X0ACgkQAVBC80lX
0GwqcQf/axO2PFJ2NsNJK5wpZbfE1g3hnxGL5Y7WKNSV3XfnKiYYj/1WTUH8CQBl
Qto8kSJeN/nsMz3UYrfKReuXFAOSGLwEkaEkEQO/npF759sBYYZEcILGQHuJzwli
/sCy8cBwP47r0NUM7TK903U2qG5e6uT0GWjwFTLhb0l2mqm4YdMugo8VmmC8YaPG
m7QAeKnRZVQC0+8jyEUe2LJtAAzBeCoJyLopQvmtMrx/Uv1wioaQmqitZ65S94VF
aKoOobGwsyQHAbFC853k/Sx3Qi2eblynBBuBAzJROzJ0RFCHUuvE/Y3u+U7G5itU
pGbHfGoZiKdXgALfA3ErDeiNRjGtDg==
=Clwo
-----END PGP SIGNATURE-----

--Sig_/tK1EQ5vZX1DtnaqIMYUuhfj--
