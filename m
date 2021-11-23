Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63AD8459BB9
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 06:26:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbhKWF3p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 00:29:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbhKWF3p (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Nov 2021 00:29:45 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E11CC061574;
        Mon, 22 Nov 2021 21:26:37 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hyt0q6xVcz4xbM;
        Tue, 23 Nov 2021 16:26:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637645196;
        bh=B+/al1MZNAcetREPvhtRx9L8OdwnbChT9PlgJkXZ3ww=;
        h=Date:From:To:Cc:Subject:From;
        b=tXcZ8YYYFbxIqVDLs0EaxwvRGKwNRyty0oTXXJTpMTkeu0K1WVKdFb8sFBE2u7dfm
         fWdBPc9aRuXYiekFOPLzlbUFwKC1Z8oO8Bru8bCPTzqALpwNpEm2RJusVo3SgmYVzc
         LOQmWCsy5Qn2VCvusacwXJzrhMQrzrKLIo0Rzt+7QEmU8sRvQEJiT4cEN7DlFE0yWx
         4P1amsKOx9yhmY+FNYwcvJSJ7Wn97NZDhgvcKudv9iYTwttuy9Pi8VaR8k7zsvKAh7
         05AN2ragpJ9xXPfE3iRCzNW6Ie3HgGsw5kkpoH9kXxu/c1zDXiJU6/ku9evXaKJq4t
         dBAOL1L+gel3w==
Date:   Tue, 23 Nov 2021 16:26:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Colin Cross <ccross@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20211123162635.29c8bccb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CVhJjl3mZbKM0LZX1um7MXa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/CVhJjl3mZbKM0LZX1um7MXa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/filesystems/proc.rst:429: WARNING: Malformed table.
No bottom table border found.

=3D=3D=3D=3D=3D=3D=3D                    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[heap]                     the heap of the program
[stack]                    the stack of the main process
[vdso]                     the "virtual dynamic shared object",
                           the kernel system call handler
Documentation/filesystems/proc.rst:434: WARNING: Block quote ends without a=
 blank line; unexpected unindent.
Documentation/filesystems/proc.rst:436: WARNING: Block quote ends without a=
 blank line; unexpected unindent.
Documentation/filesystems/proc.rst:436: WARNING: Malformed table.
No bottom table border found.

=3D=3D=3D=3D=3D=3D=3D                    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

or if empty, the mapping is anonymous.

Introduced by commit

  2df148be9486 ("mm: add a field to store names for private anonymous memor=
y")

--=20
Cheers,
Stephen Rothwell

--Sig_/CVhJjl3mZbKM0LZX1um7MXa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGce4sACgkQAVBC80lX
0GzmXggAnLi8gkU6pXRf0VY76EmDmKZnlNiFqRHBpIq2huoKjDuzBhawRbLMaC5R
SiuuVvTsXF+6roFS6XrYNQmlD5UE9WSGfvVPK25o+wKUst3SGJAdV96Gu7Yp2DoL
gW1zxn6XgGo0TErRQRQUm6CNWeMZpqoJqoSRRrImWgf7n95CPm2EB/+6Yz9AU1jJ
ns9hp28okyajg1OvnPUUMSfqEm8rUKe8Bvbq/RvlL5P7RdXLbyGvLg3dhA21MdOq
d4UdyNZsR0ROYcTgv7GZ/Y1pUbhw8knclapcoefog8NxdShhexYPBTmdiAB3gmuH
PCMgAYMyG79+g32NecNqrlkiUDfkog==
=ywg9
-----END PGP SIGNATURE-----

--Sig_/CVhJjl3mZbKM0LZX1um7MXa--
