Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10484260E69
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 11:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729225AbgIHJMi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 05:12:38 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52489 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729322AbgIHJMd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Sep 2020 05:12:33 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Blzty11gQz9sSJ;
        Tue,  8 Sep 2020 19:12:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599556348;
        bh=xkKtQPVGfzHcLN5WAlWypj63duX2vRBfC4xpES4+S9E=;
        h=Date:From:To:Cc:Subject:From;
        b=opmcjJAAROFcd3v61LSygjI+JYzHXbfeUk71FLl1rwSflXTVnZf91pTlR0RTUmlaj
         hixz9g/wWNtgxXmfkfL+QxENOtyEfwpidRck5ekNVB74vMlJKiL6zT9PrACZW+CSe9
         DxaJSiYwXLWPthLMtXCOHzbhYWSgYj0UkYWWAzYSytd/EBLoWTMiuoVpn0mJ5Dz5X4
         L2YUIpMcJK4IyxM/aD0/1P1mfwXZ0bs+Q2L2MLfMA4itHTrgCPivx6vvUHO/7CoSM5
         TZJKx6ufYB8Vzc5g1KW5QP1bRZAGxfIF3rDeWbdCqEvxzB6JUVW+denv9Ff3/2/1Ws
         EOWL4vjKiOP3Q==
Date:   Tue, 8 Sep 2020 19:12:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20200908191223.0e7a9640@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hYofkrjaPSAvqhP_kr/YbJq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hYofkrjaPSAvqhP_kr/YbJq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (powerpc
allyesconfig) failed like this:

ERROR: modpost: too long symbol ".__tracepoint_iter_pnfs_mds_fallback_pg_ge=
t_mirror_count" [fs/nfs/flexfilelayout/nfs_layout_flexfiles.ko]

Caused by commit

  d25e37d89dd2 ("tracepoint: Optimize using static_call()")

Exported symbols need to be <=3D (64 - sizeof(Elf_Addr)) long.  This is
presumably 56 on 64 bit arches and the above symbol (including the '.')
is 56 characters long.

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/hYofkrjaPSAvqhP_kr/YbJq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9XSvcACgkQAVBC80lX
0GyRVQf7B1Ax2DBQ5gKK5Kq7QsZRIFiKrcVfbog2OnYc8+MNR2tbZPP8lATP/Gxr
AIaMn5PQu+J0tANjdncm87DTgDN0af7RV0ndmj2VWIx+eBBZwrmRoWU6+jxO245L
XzOY5IwJkV5mZnMFdvsWrmh++eL1Ecg7QYMTsGplotHNPzmN8IIH6hYhl92lsxWp
5QFXwt50apJ3cgbMmZhBAIzZPuYbkXrzO40p0tSWnmgyiKe6t898vsbmslzLY4xy
0oGB9GPqUmxg9HQaYurdP6W3tSrj7uf7K5rwB+mRiNaAu4xWkSJzJ1wf36owFVO8
LBp6T7Q3geUWzoi5wlJjBFg23mmAug==
=H2FX
-----END PGP SIGNATURE-----

--Sig_/hYofkrjaPSAvqhP_kr/YbJq--
