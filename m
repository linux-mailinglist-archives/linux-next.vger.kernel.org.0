Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00FD4326FD8
	for <lists+linux-next@lfdr.de>; Sun, 28 Feb 2021 01:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhB1A5H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 27 Feb 2021 19:57:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbhB1A5H (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 27 Feb 2021 19:57:07 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31511C06174A;
        Sat, 27 Feb 2021 16:56:26 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dp4hj1kTmz9sCD;
        Sun, 28 Feb 2021 11:56:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614473782;
        bh=daldXCOG6n+ja1M6CZ7O/xC0XSRKtxIXPGPZruF4h6M=;
        h=Date:From:To:Cc:Subject:From;
        b=kzg8aLM3ROnLSOQSkPKpOcmf4nZDPNpPpKlC53ipUJxcYO65CiQ128funCCiESiAv
         pDcgl1+JKAfVKR2J2if7zYVNsvgvYYXtrUVkNo8xfzNni5kahJ0ppXiuH1FmDqtZ+9
         bA3yOfexNRUd5zgmbMEjbiuqC4bLkThrTLtv/S0jtLUhlwnjELFXoFIDDV8/UrjZQS
         grcRf9rrDsFV5P8OozPXzxMn/37udtAByEE8Bj+B3JXIz/1pvsoYaN9wkjIIwNH/zm
         +DdZO1yP9o3gQHFGh74cl+zWK+WEMdDA/vaSVlMxpy5Kmn3vM/R0zZ8mmuT0PlYATw
         s9zC6aqj9kXOA==
Date:   Sun, 28 Feb 2021 11:56:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Pablo Neira Ayuso <pablo@netfilter.org>,
        NetFilter <netfilter-devel@vger.kernel.org>
Cc:     Vasily Averin <vvs@virtuozzo.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the netfilter tree
Message-ID: <20210228115620.0d137d4a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q_Zai7JISNQygs6xc+JOI7a";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Q_Zai7JISNQygs6xc+JOI7a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8e24edddad15 ("netfilter: x_tables: gpf inside xt_find_revision()")

Fixes tag

  Fixes: 656caff20e1 ("netfilter 04/09: x_tables: fix match/target revision=
 lookup")

has these problem(s):

  - SHA1 should be at least 12 digits long

I don't think it is worth rebasing to fix this, but it can be fixed for
future commits by setting core.abbrev to 12 (or more) or (for git v2.11
or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/Q_Zai7JISNQygs6xc+JOI7a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA66jQACgkQAVBC80lX
0Gx2UAf+LRxwNwFXk/idziZMEFejswlcDmyiCYNvY5+AY36aCk+KdFBAe5SaECcM
2wv3yefGsd12UAO4QVd5CNsdAs299CZrmzgxEYrmIsBG6BE0AxdsLVmaIUwwixli
x09mQz2jvJKTsmTw6IOn/v0evgnTCJu8LuR0Zh55GD5aqjFauSjoXob1xDT21P26
VNFSML9zgbms0f3gLcqvGRE4GM29sasEWSDiaGNmY01w0FZqB2matxhSKSrsXoTx
mgO164MEdA+i0gwsMdFSGtrWkdr5q3oTi6w7NXslFwGF8SlrfVFsZoMrJBjx2CKv
1npHxabadacahoCeG1DHO/WL+W6veg==
=/YrI
-----END PGP SIGNATURE-----

--Sig_/Q_Zai7JISNQygs6xc+JOI7a--
