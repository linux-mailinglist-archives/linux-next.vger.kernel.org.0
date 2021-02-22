Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7027322118
	for <lists+linux-next@lfdr.de>; Mon, 22 Feb 2021 22:04:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbhBVVEn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Feb 2021 16:04:43 -0500
Received: from ozlabs.org ([203.11.71.1]:56189 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230060AbhBVVEm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 22 Feb 2021 16:04:42 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dkvmt15bhz9sVr;
        Tue, 23 Feb 2021 08:03:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614027839;
        bh=n1zxu7jquOaq9UYvHgAzDmbtR0Jgz0mkhcWXhH9Jxfw=;
        h=Date:From:To:Cc:Subject:From;
        b=BkkmkMKbAgfORL/dO652x5sxiox+CGhK60yB3kg0C3gK2yLlYxl0O4Fb7Q/Ss9Ijr
         qSmSrCDWafnsxI+57ih8+sNW3ObcKBNVJUWpV3gT2TBGMGkWk8u0iJgs2+YiXWIZNl
         33H70Xl/fA5oo3jPRAPJ0uOx0eqxsVQlBUWyrdxnCpnji1EKHEolUvxHRl8M7AmhmC
         4GaXX/GSsOXoSURjXaE6fG0fU/SSGhCFd6yx9zeslehQ9uJBaD3eB3rjIQzWXc7QYe
         rkf9mQ4YHjgNrGxM2b3cLZk6XqEbhYgT0pnWMX7wnmK2mngbE/m9+jWBOSMhB75H4r
         YkiStP4Qj70fA==
Date:   Tue, 23 Feb 2021 08:03:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Juergen Gross <jgross@suse.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Xen Devel <Xen-devel@lists.xensource.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the xen-tip tree
Message-ID: <20210223080357.4ebd44b0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ynOSmpJ.eiUpA_EoBpcTwl_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ynOSmpJ.eiUpA_EoBpcTwl_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  99bbb6e0b436 ("xen/events: don't unmask an event channel when an eoi is p=
ending")

Fixes tag

  Fixes: 54c9de89895e0a36047 ("xen/events: add a new late EOI evtchn framew=
ork")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/ynOSmpJ.eiUpA_EoBpcTwl_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA0HD0ACgkQAVBC80lX
0GxPIQgApHjUQziHnhZSQneSnPtW1dRgoqbYf8Sp6JZCBWqfZRhbA1jRPuUjnU7t
8WNe7I9xKcdYXLT+GW15qKQXC5m5TYS3SBz33hicCls1ZIOAi7eFfo4V4K124l8k
iGfhCG8Fjcmvh8kfOr2invSmXT5T61ascGQka8VViLnPEb8blfdMpWiC/5/1OKWe
p3Zj81TuycL/OU6Pf5zeFR/7mfrWsXXrL/lp8EkXz1zOeCT5Cy+2F9NQw1jVHfb1
48+LpqjqQCXXqYz9FXlq76euMGmUtCZb2jr0JMQEHPfDEDtQs+VN04BwX4T49xG0
On3HQDxd9RsyJcCfvXQnjqeJfaNLuA==
=XBN0
-----END PGP SIGNATURE-----

--Sig_/ynOSmpJ.eiUpA_EoBpcTwl_--
