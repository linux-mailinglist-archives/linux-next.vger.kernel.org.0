Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54BBA43122B
	for <lists+linux-next@lfdr.de>; Mon, 18 Oct 2021 10:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbhJRIdD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Oct 2021 04:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230476AbhJRIdC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Oct 2021 04:33:02 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 449F0C06161C;
        Mon, 18 Oct 2021 01:30:51 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HXqp126Lyz4xbL;
        Mon, 18 Oct 2021 19:30:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634545849;
        bh=iZtAp0lbsYDLBYRvrzuwaugi66sdmnplORfZT2oVzt4=;
        h=Date:From:To:Cc:Subject:From;
        b=M650VTC9w8eYY3QqPo/BlVzKv6KLWcYidhEMMPKYEAYsXm0c/mOYuyKRFRPZcRIX7
         BoeWloJe2+9/19j+PemLH/MuNvd6SNO7F3vv0/Tm+kFasbzBFQBAtDtyGnNUns8ieD
         QNiTvpaaohlnTIqFnLovtpiD8w/fTmP6BE8CXca+qmqY8nyh3wPK40jGuDHOhLbIMa
         iwMhiLuBVIudBPlAm8UH28WRG2yf/VNfW/nukSlhBt4/bjP9EM45BN/8NvkLxJRqf3
         U3h30qanwKbByPkao82byxEV6Cm0iIfPi4c+KpykCt1MznLBnQMH2+YwHwVWMbXSSy
         L1X6zWqCQpZvg==
Date:   Mon, 18 Oct 2021 19:30:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kspp-gustavo tree
Message-ID: <20211018193048.14517460@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hq9ohxodL4BQhD3=QbGbAM4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hq9ohxodL4BQhD3=QbGbAM4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kspp-gustavo tree, today's linux-next build (sparc64
defconfig) failed like this:

sparc64-linux-gcc: error: unrecognized command line option '-Wcast-function=
-type'; did you mean '-Wbad-function-cast'?

$ sparc64-linux-gcc --version
sparc64-linux-gcc (Custom f51944395b6aa154) 7.3.1 20180130

Caused by commit

  21078041965e ("Makefile: Enable -Wcast-function-type")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/hq9ohxodL4BQhD3=QbGbAM4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFtMLgACgkQAVBC80lX
0GyLwggAhoh7o1UdOymuvfoocYWl/ZpfPul7QYCW2u02qIvsfnvPbk1kMkyreha1
zDpk7MZZAUdbVrPqcrjceUWhafHLULZq8lpmEDvk2GhvkX9jsKEP+DFSdeMEcYls
F47beukJ3azcKp9sxttPP25PLbTgd6AUFXY4lhb4gzPf1J0C9k6AKFAccsn4UDOz
94eWTzFGojGW8TOAfLPbD2waceVEHsxZqWTKpEGgazTiyqob7AaoTe5N537SEaLR
bJx5nZ/bKe3KjPf+XaeUZBibL/LyDXqcH9udjyEFeYi5uAlmQ1D8dvgC5oZzJsmL
x1QSY+N188EdKQy0RCvIODkzrZ9xtw==
=G9GR
-----END PGP SIGNATURE-----

--Sig_/hq9ohxodL4BQhD3=QbGbAM4--
