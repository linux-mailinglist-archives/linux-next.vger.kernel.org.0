Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7BBA43DB28
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 08:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbhJ1Gfp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 02:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbhJ1Gfp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 02:35:45 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE06C061570;
        Wed, 27 Oct 2021 23:33:18 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hfwjn0W6hz4xcC;
        Thu, 28 Oct 2021 17:33:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635402797;
        bh=/R7loCnMrMbPjsUshOHJxqGM+7aLjRr8ecYMPWeUsTU=;
        h=Date:From:To:Cc:Subject:From;
        b=g64YH78CMh3JlAlFRYGBkNNGd4y5pNAcgx5ZxVoMv9669gK8hhRZMeZ0HaS+keMbD
         I7eue/L5R22Q5T/JgBZ9sPSEv7GQyYu1PoIm0XF3UFC/uppsItGb6+XKMOnl0y+TEp
         lJk0yAUVtpLTv1wHn8KrXXU3a8cDmWIvac5TwoEIYYy+ArxmcOACaewgiKs7JFEzWm
         P2UOmmmmq1f8ohxWoDrCKaRICLqCjqSHuhc104TqrB1Pow2a/oCC22QjLkLkXs/6gy
         P0RtS8q+siRTjlxaIBjNuSqKwP3F/kb6j0h+VRUe+QMFsVEqNXZYTteqt7AFDRKf7F
         xKet4Q0PvuHmg==
Date:   Thu, 28 Oct 2021 17:33:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Juergen Gross <jgross@suse.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Xen Devel <xen-devel@lists.xenproject.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the xen-tip tree
Message-ID: <20211028173315.55b1a121@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r0i/0s/oy4PgZOhjNEZmIby";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/r0i/0s/oy4PgZOhjNEZmIby
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xen-tip tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

vmlinux.o: warning: objtool: pv_ops[32]: paravirt_BUG
vmlinux.o: warning: objtool: lock_is_held_type()+0x145: call to pv_ops[32](=
) leaves .noinstr.text section

Presuambly introduced by commit

  97c79d816979 ("x86/xen: switch initial pvops IRQ functions to dummy ones")

--=20
Cheers,
Stephen Rothwell

--Sig_/r0i/0s/oy4PgZOhjNEZmIby
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF6RCsACgkQAVBC80lX
0Gysogf8DPnYiV4jaScnM+66C/vwmmlpos27JM+22fOKgj/3J1syzTHopLIS2jZ8
v358bhJ1jj8EnGJI/m2ebkZwATeNbGhsTj/Grs2AWaz4XzjVNX7fX6PX6fg4p4wM
aLCRmuedIMDcNkzSNtsO9AZQsQLtpdsmxRthvfwdLkA/L6895mszPTP+hA4AZNzD
SuoLYGP622hkjcASTSGxhaohbo1hJtsfwAkQQzviQ/QhfWdVKmx7gOuLA7AG9mJU
UPVVXAFwoYX58z2q3AqoN2xsAFknKRAafS2L8zKk99JKhrK7azlwoqXZj9unkErI
rivpI4IsQO6yjZs3k9OZ0aIZSI/PkQ==
=yI5b
-----END PGP SIGNATURE-----

--Sig_/r0i/0s/oy4PgZOhjNEZmIby--
