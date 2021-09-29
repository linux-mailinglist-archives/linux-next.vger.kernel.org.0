Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 777DD41BE88
	for <lists+linux-next@lfdr.de>; Wed, 29 Sep 2021 07:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244098AbhI2FCg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Sep 2021 01:02:36 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:60455 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242323AbhI2FCg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Sep 2021 01:02:36 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HK42Y2v0Fz4xbL;
        Wed, 29 Sep 2021 15:00:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632891654;
        bh=ZoguTJOiokVLXr2BzauUrli1aK3kR+bDWHUeHBBcKzY=;
        h=Date:From:To:Cc:Subject:From;
        b=C2QVvHJT1meZ6pMWDdyy8zvaKIa21/KJgdPFeUpVbbMz/5tD1WdWulXzZKTv6IlN4
         dtfLt8thFkOiChKcV8o1i39u707lxcTqsUJBpI2CIOaW3myV5iDJkHPfVRpQ3C4cYS
         Rojh2egjeQh4EsKiWsXi0JOuDyd+jgJ0U+feSJ288timGKadvoCaIw/G+s8z8ArKhk
         e3EQL/i1FMF95h5bRv8NTwh5CsrN1McVJOW2PsJkXa4wKx80E4mLCgk+v8ecTahvJP
         o8GKEVeYoRmffrjXSzbNl+LSdq0FgrQ2Ks9pdZfqxoeTUQVn/RkxAOHlg34IfhGD0A
         yOIETQ8i5mdcA==
Date:   Wed, 29 Sep 2021 15:00:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20210929150052.41ca3989@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mi0L/u00_BhVi.wohliiTkm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mi0L/u00_BhVi.wohliiTkm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

vmlinux.o: warning: objtool: .altinstructions+0x171b4: don't know how to ha=
ndle non-section reloc symbol do_swap

I don't know where this came from, and it started before today was
hidden by other warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/mi0L/u00_BhVi.wohliiTkm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFT8wQACgkQAVBC80lX
0GxBXAf/TmC2prhMUk9eA2SqAIr+xjxn74uYdeWUiGsBm/2ZdLT33OpzrvBQSYIH
1/Qs7iPI1zPIuejGKfWNkibkDUlAWjSzFYkvfUF0LcRFHEqI+0Ar3ksig9JYLRNo
Bilkic4et6+vacTKWG01O4e9U4UXtS/qWQN+nYXV66VX5vXZQPnAkcmrQC18zT8K
ZHNEfTJtSA5RkmxAPqQgozKVN+ozLSR23Mwp9CTcziLnVzyb9H0L0xmpZro1sPP+
UoxeDFAc+1UD/h8qtJiO/lJnQX78QbC48Mi0FfrNxMAVkm0WjPyA5AdFZMHiC/Lk
U/4j72r8o4l9BjwHVf4IKx4kYNgqlQ==
=Q39L
-----END PGP SIGNATURE-----

--Sig_/mi0L/u00_BhVi.wohliiTkm--
