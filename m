Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4439C321318
	for <lists+linux-next@lfdr.de>; Mon, 22 Feb 2021 10:29:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbhBVJ2c (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Feb 2021 04:28:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbhBVJ23 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Feb 2021 04:28:29 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82811C06178A;
        Mon, 22 Feb 2021 01:27:48 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DkcKY2Gfgz9sRf;
        Mon, 22 Feb 2021 20:27:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613986065;
        bh=+1E1Q2T0Ud2vgUYPaj/UQ+Agr1ONiKE57xZk0zhNF6U=;
        h=Date:From:To:Cc:Subject:From;
        b=UV0XkxD898HmPaAM5AEUg22Ni3qlmYbfF5ToqFYYWSlGn/79DptTnEX7llsv67zbf
         W05k2udlMrHWopwc65ZoAJMZobdT947DGgdT+VpPqNr8slHixOanZan81IUTVe0q3Y
         8vn/q9FLsVPgfqdcJwLu6Q3vVDK7bMeuuvnW2f3J8DMVRnv8i49Vj9pWvQTg3bTzoc
         nuebg1RWF3JhbqWTwlKo7OW2Qo20p9bLgGVg9Fqq9YqS3NQNjMHKxZs3kmLXjFXSqm
         T/TUjv8oepRGKhYPArD52zvzZkUSwYNSg7Rcz11S+02HZ73B2D79G5kCxjm9ZjBezV
         WmXQfmXBNLO/A==
Date:   Mon, 22 Feb 2021 20:27:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ley Foon Tan <lftan@altera.com>
Cc:     Andreas Oetken <andreas.oetken@siemens.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the nios2 tree
Message-ID: <20210222202744.29be8d08@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/44mClM0qDSs4WecIej/I/Xu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/44mClM0qDSs4WecIej/I/Xu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  9abcfcb20320 ("nios2: fixed broken sys_clone syscall")

Fixes tag

  Fixes: 04bd52fb ("nios2: enable HAVE_COPY_THREAD_TLS, switch to kernel_cl=
one_args")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/44mClM0qDSs4WecIej/I/Xu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAzeRAACgkQAVBC80lX
0GyZ0gf+PCkmlYvmZKiVNIz2//wqZOB4cWhzUg2+yofu3988lbgVMKACmhJavhaD
x2HTrJL1lqdjZIK6DWp1cJi075vQ8cooOyTVtHVxMDZu+exzWCNS6bdXjf46unUh
wY/zzvt+rfdiTmh6Kop+A9uuzVy/N+3JBYKUejwekVztP3SnYWTYVqNm6RfLHd1q
SvLVAwuJ/t2rfvtRy/Q3u+GdTo8j1YgHL9W207lcFfeGXUwt6UdBs3GPnuWJC0l8
BKAEtokbVrXWjy8SalqQi/+3kMbXZfU/td/e1qKH3I7MsM1gUoxpankuAZBXsM1h
Jc7loBn3p+TDVP4pW4WNJo1IAtxLxQ==
=qjsB
-----END PGP SIGNATURE-----

--Sig_/44mClM0qDSs4WecIej/I/Xu--
