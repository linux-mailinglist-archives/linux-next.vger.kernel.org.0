Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A19D7343962
	for <lists+linux-next@lfdr.de>; Mon, 22 Mar 2021 07:24:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbhCVGX5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Mar 2021 02:23:57 -0400
Received: from ozlabs.org ([203.11.71.1]:43915 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229771AbhCVGXe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 22 Mar 2021 02:23:34 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F3kvs1s45z9sSC;
        Mon, 22 Mar 2021 17:23:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616394206;
        bh=G/Hei2rK04hoRQOJRCj2hfl/JRiY9ViA/jYugRzehak=;
        h=Date:From:To:Cc:Subject:From;
        b=qbPcmhZ2JcGnLwLhXKKhtixupE/TZyRBZ0p5F6aWdOTjavpLnoEdoWnPWflsR1HjV
         ePF2Mo/p6Ae/EvUZOufFYa+Lu7G7ZiNBej9L9JqL/Go533Ll2kwx/1+Kw1nwKsqbW1
         UWx/0y8FExpMyE/3zWVlDG0th1qseSYcB7o9hiQ9IePvAI/bK1ODVwLeMIq9Bs/VY1
         a60DhI6DRSNx4qnzJRHlgBPtl71E/WdI/0hf8iO4yKXzmY7qwtJgXifqndKqLW5yrH
         h1kpa0K0EmctBX8DOJoCPmcjdwFtRRWjXuefIWVQPgqfZgTDyCZ3NnfeNty3XoAyK0
         lGYlvMccBsDNA==
Date:   Mon, 22 Mar 2021 17:23:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>
Cc:     Namjae Jeon <namjae.jeon@samsung.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the cifsd tree
Message-ID: <20210322172320.5c83f16a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+Htx8DM.WB1ZakJr4jyhqvp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+Htx8DM.WB1ZakJr4jyhqvp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cifsd tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/filesystems/cifs/cifsd.rst:13: WARNING: Inline substitution_r=
eference start-string without end-string.
Documentation/filesystems/cifs/cifsd.rst:14: WARNING: Block quote ends with=
out a blank line; unexpected unindent.
Documentation/filesystems/cifs/cifsd.rst:14: WARNING: Inline substitution_r=
eference start-string without end-string.
Documentation/filesystems/cifs/cifsd.rst:18: WARNING: Block quote ends with=
out a blank line; unexpected unindent.
Documentation/filesystems/cifs/cifsd.rst:23: WARNING: Inline substitution_r=
eference start-string without end-string.
Documentation/filesystems/cifs/cifsd.rst:23: WARNING: Inline substitution_r=
eference start-string without end-string.
Documentation/filesystems/cifs/cifsd.rst:24: WARNING: Inline substitution_r=
eference start-string without end-string.
Documentation/filesystems/cifs/cifsd.rst:25: WARNING: Definition list ends =
without a blank line; unexpected unindent.
Documentation/filesystems/cifs/cifsd.rst:28: WARNING: Unexpected indentatio=
n.
Documentation/filesystems/cifs/cifsd.rst:31: WARNING: Block quote ends with=
out a blank line; unexpected unindent.
Documentation/filesystems/cifs/cifsd.rst:38: WARNING: Unexpected indentatio=
n.
Documentation/filesystems/cifs/cifsd.rst:32: WARNING: Inline substitution_r=
eference start-string without end-string.
Documentation/filesystems/cifs/cifsd.rst:32: WARNING: Inline substitution_r=
eference start-string without end-string.
Documentation/filesystems/cifs/cifsd.rst:39: WARNING: Block quote ends with=
out a blank line; unexpected unindent.
Documentation/filesystems/cifs/cifsd.rst:14: WARNING: Undefined substitutio=
n referenced: "--- ksmbd/3 - Client 3 |-------".
Documentation/filesystems/cifs/cifsd.rst:0: WARNING: Undefined substitution=
 referenced: "____________________________________________________".
Documentation/filesystems/cifs/cifsd.rst:25: WARNING: Undefined substitutio=
n referenced: "--- ksmbd/0(forker kthread) ---------------|".
Documentation/filesystems/cifs/cifsd.rst:32: WARNING: Undefined substitutio=
n referenced: "______________________________________________".

Introduced by commit

  30f44e929aa6 ("cifsd: update cifsd.rst document")

--=20
Cheers,
Stephen Rothwell

--Sig_/+Htx8DM.WB1ZakJr4jyhqvp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBYN9gACgkQAVBC80lX
0GyZBQf+MYu3paF65QUfk8HZxIn/eMffMIkLpdzbfw6le0iHwWC9Wn/XUIchex0A
6U7xZZ8bJLpHVtZIjTeGmMmXTOk08Y+R/DY0YGcvYEdS0lN7Na2ZjEDBWS9PuK7L
t9huN/FaMI+TsbgL4uCdYHXql+89P6aH+2eXaMTNWY2qOmJAwrGGzyGkNVwvc8ju
00z94cqv8KiSqatSF2wAe0MsEIfCbMMlRa0hJGTy+S631DPabSddnogCLRCb8Ybf
jsK2u/85bEaGYrxL+ZOaClBkIXx/2egT0/tYUcoYIWx8X9xkNkt1cw+yM/8Eg+ix
dxnWku/QQs5tGdCANr3ZgnVMetxdqg==
=rVkJ
-----END PGP SIGNATURE-----

--Sig_/+Htx8DM.WB1ZakJr4jyhqvp--
