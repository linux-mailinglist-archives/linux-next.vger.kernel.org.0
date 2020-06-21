Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C08B0202B0F
	for <lists+linux-next@lfdr.de>; Sun, 21 Jun 2020 16:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730192AbgFUOew (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Jun 2020 10:34:52 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:49985 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730154AbgFUOew (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 21 Jun 2020 10:34:52 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49qZnP5dYwz9sQt;
        Mon, 22 Jun 2020 00:34:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592750090;
        bh=D/TARDs/stjyGH0I8Noq6NhmTgRmKSi7h6hDe14Mn6A=;
        h=Date:From:To:Cc:Subject:From;
        b=ipdZLn9C5ncMcK4sKxa8j6+B44B7q7Vo5QYzmh2aWqeQf2WH2XP6hKPBmEXm+H61m
         gk0CkNw/eZTro1U4YEKOLS5vZYksNz3PSL1j8FYH4j4T/Qvd3fDDDsZboRe6qmhjwf
         g2LxB4nrZ87pEw/dw2uOBJWG2MqZpNLyOVp1uFwQrSw1n82gKeJySKrWSG2H7WE2+p
         BPKe6Oj1BmevfwAB9hdEU005fmdL2e6Ijb4UIaLLrBn88SM6vVlrwppeJTgB/JPFuf
         nlN8rVeBllpmHNlxB7CJG1/5W0enkROQzOAmg513IiqArmMN0JywJ+NtgKmOnpvTKP
         0xelbMDiNApHg==
Date:   Mon, 22 Jun 2020 00:34:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20200622003449.1f3a90a4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/82IXfTWlXkBkD0RSdhPRokn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/82IXfTWlXkBkD0RSdhPRokn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:


Caused by commit

  a1e988dda7bb ("drivers/tty/serial/sh-sci.c: suppress uninitialized var wa=
rning")

interacting with commit

  2d0e6f87039d ("compiler: Remove uninitialized_var() macro")

from the kspp tree.

I have just reverted that commit for today.

BTW, I don't see the warning that this patch is trying to fix ... (gcc 9)
--=20
Cheers,
Stephen Rothwell

--Sig_/82IXfTWlXkBkD0RSdhPRokn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7vcAkACgkQAVBC80lX
0GwzpAgAnofRnafWxV+MUwFTUEVYhdM4o4rKOKtaYPMrufmewY4qH1BEL9pYEx4q
+xLxOF3pVY0K4kWSuUoNjUsZ9Jj8eXPDGgzHVnTO2js6JChTQ5OLGw0mFlDsNILz
ho6UMdF3MwNpM0LsdUnhT6ilkn4a07ECK/UH9+pCPIWsFOkACFe27kWswphtdWpJ
1YYDmc7rcMmWDyUEa5tvVD1MejWfpB19zuLIaTjKUTGwTQiD7gquvixNT0I26pMW
jvZrRFXbvz5+QJL2ITtv6Py336tvPSJUUc07JhauhBm7Ceu5MvOu4edd3Wog5wFg
O0HIr6p6aZ0zV+6CulYKUodNUYMnsQ==
=6YT4
-----END PGP SIGNATURE-----

--Sig_/82IXfTWlXkBkD0RSdhPRokn--
