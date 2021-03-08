Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F5B3307C2
	for <lists+linux-next@lfdr.de>; Mon,  8 Mar 2021 07:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234639AbhCHGGf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Mar 2021 01:06:35 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:34715 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234615AbhCHGG0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 8 Mar 2021 01:06:26 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dv7Bm3pmnz9sWF;
        Mon,  8 Mar 2021 17:06:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615183585;
        bh=PSoCQVSwRStwmrBqQ5apuNF4di9uKf0hD0zJzWP++tA=;
        h=Date:From:To:Cc:Subject:From;
        b=kB8iPykO4mUht+FPdUE7/7tfnSXs57rLIU6gTsm5r2Iv+EyD1KWziqPyogOoxAj05
         FjdCrH1+hsdmABqJFFFQ+bnh8eWViH2WGdrRNpSzOrxQvYQv9Da/MZSPE7wbzgXCmf
         YKdIN6PSA/VkCB7bwW8OAyXXvb0j0YuX6tcpRwCNWwIywU9afBRwQq8xCsTc/cgplq
         zUjhR7vcwGHg7QpUZXLQMqoMvDDX2PDLwNf169xzHhac8hqcdHgeSkk9K7NYIHwWVz
         cUMX2rtoz2EPzxC6ARidH15btHna1zEntuNGaPvNQ/XaEEFTPZSvKloeslPdeLiF8h
         Paopc113TGz8g==
Date:   Mon, 8 Mar 2021 17:06:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the drivers-x86 tree
Message-ID: <20210308170623.1304b12a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7h=xHRjaK=Te_.+u5Rpn9AK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7h=xHRjaK=Te_.+u5Rpn9AK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b5b5ff84fd93 ("platform/surface: aggregator: Make SSAM_DEFINE_SYNC_REQUES=
T_x define static functions")

Fixes tag

  Fixes: 510c8114fc74 ("platform/surface: Add platform profile driver")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: b78b4982d763 ("platform/surface: Add platform profile driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/7h=xHRjaK=Te_.+u5Rpn9AK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBFvt8ACgkQAVBC80lX
0Gw1Wwf/WQwC6mzi6Qol1hcMg98vgOy3BguEV1qj0sCJlLOnx6gcs24zkFFa8Ftq
LDOz6ol6FWOYWtm9dyK/OywoMBg/Cqb/fSfpgARC5/KaEsTYBzZm+TkKpy6v7KQP
m3rNKSu5xZtm9i2/BZa6Sb29SqKzMk1q3QJM5VJdlfVLopdAE6aTnyD/jPdRb1GP
FJd+enBfpWJUbmm3QPsJoEhPcYweUUcbiPznuTAutwGUbIqZxucSENIpoJL1QT1m
zT8444mNnJXNWYGxLJMAZ7B0jgBfzczp30t2EBzRS8UOVH8RVzeTZeKX7zUh0fFW
TUChGnrNEa/b42hLIskZQCTKRUQkQA==
=JTGj
-----END PGP SIGNATURE-----

--Sig_/7h=xHRjaK=Te_.+u5Rpn9AK--
