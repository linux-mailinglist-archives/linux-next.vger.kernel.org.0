Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38038DDC5F
	for <lists+linux-next@lfdr.de>; Sun, 20 Oct 2019 06:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbfJTENX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Oct 2019 00:13:23 -0400
Received: from ozlabs.org ([203.11.71.1]:56253 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725747AbfJTENX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 20 Oct 2019 00:13:23 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46wmbN0XFjz9sP3;
        Sun, 20 Oct 2019 15:13:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571544800;
        bh=iKlz7h6oUmqEU/r1/7WTdmpFp583ROg4rmyqRgewVfk=;
        h=Date:From:To:Cc:Subject:From;
        b=EAxiI/isn3QYu/bm4GIvBeUrdKH2AGELj+8Wux/9/IYhFfzJnkyYV9hhGdoTSAs82
         XQHcfLGi7+84wPFjgt1OS4ogw4U/m+QH3a5yZit1ygWLMQJ/nvi9kLwOfjVlErPZKn
         RK6A2SNHn4WfUbt3Kv8bZ9dWl4XikNaYlS4SSE2lLtbXtOOyJ08UnaJ4+Q0l1XSajh
         cyODpLuC2aXjGYVA08cuxXzZFTS006GzNnaNCv6pChkKUeJJ/hNmHV3GWbO/42D83y
         0v8L2VRykhblmTd9++IFhpMcohtKklKOCjPK8qwtKt46qul2wy3CdAjIkQLM6JiW1C
         A2A2w6wvHUWew==
Date:   Sun, 20 Oct 2019 15:13:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jason Wessel <jason.wessel@windriver.com>,
        Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: cleanup the kgdb trees
Message-ID: <20191020151318.7ee6cf9e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EhN2uo=xd9n+EtCh.7NrcGv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EhN2uo=xd9n+EtCh.7NrcGv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The kgdb tree
(git://git.kernel.org/pub/scm/linux/kernel/git/jwessel/kgdb.git#kgdb-next)
has not been updated in more than a year, so I have rmeoved it from
linux-next.  It contained:

3bd67b37e350 kdb: print real address of pointers instead of hashed addresses
a0ca72c2d1ac kdb: use correct pointer when 'btc' calls 'btt'

Please let me know if/when you want it reinstated.

I have also renamed the kgdb-dt tree to kgdb.

--=20
Cheers,
Stephen Rothwell

--Sig_/EhN2uo=xd9n+EtCh.7NrcGv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2r3t4ACgkQAVBC80lX
0GxWnQf+PF1otOdWYEIuaroxdSnvBgZoNvlCypgymMYbuOY8MoHjzXvqpJsp1AZz
IiG0RNwjTmT79ZDxZrHb3aSPwAZ9Gfelo+VuK4RvUVQP1/LrP53WlkZs3qUeg8pE
MdoDw8w9+vPRab4PlxXK04jHgNjnJAskcpRxkSMYKApPYMiIGheUNPh/mLYtPBxr
1GembAPSzs76R/rS3wdVrJBX8BntWMxu/sqEuh1peLBTh1GjuzAULKwFGl3OYtKA
S28rmhpcrAgzEEVzDpngcuWDFBNVK796JvglGcRtDkIE+GHXZa0yeIdSSQNLQInx
7wCFtKgyeC4PsCMqjfZjBW4tvc3Z1A==
=ekNR
-----END PGP SIGNATURE-----

--Sig_/EhN2uo=xd9n+EtCh.7NrcGv--
