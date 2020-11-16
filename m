Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6F342B3D2F
	for <lists+linux-next@lfdr.de>; Mon, 16 Nov 2020 07:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgKPGfH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Nov 2020 01:35:07 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:51319 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725819AbgKPGfH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Nov 2020 01:35:07 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CZK7W61dfz9sRR;
        Mon, 16 Nov 2020 17:35:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605508504;
        bh=mZ9pJim/9qu1xbydQ4AUEek3SWS3nI5D3sgElsQp58s=;
        h=Date:From:To:Cc:Subject:From;
        b=ACjBcKcC+Cs7zikojbKMCC4HihNOQZTkv07ZczRzX319+Ime1zuBSifAwBIZw/CaX
         o08P3Y6KxwRtC8/cjzXQibR/1/MJbWufCsy+MCcmkWIfx3vBv7rS65Q5i1hk2+w/YM
         Xyc7ElfEqH00jJK1xUiuM1h12OqyWLIA9/KAt/e8FOFhv2CIGNAor5KiN6lC7sV9jv
         +S6ucYbX71ZPRHkXv/KE3U+qhWhqgMXHXGZtXR51HpPD4Q0kk4glu6QKUKaIHm1jSH
         nWalLOVDMjK90YP9uqK5PrnodFrvHFI9lqhOGmZrfhuQ2G/dewE47v96Y2NoN/Hom4
         7NeVVzmR6h3jg==
Date:   Mon, 16 Nov 2020 17:35:02 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the ftrace tree
Message-ID: <20201116173502.392a769c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xfgPDyV0Q0GD1T0Xhf1bfnv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xfgPDyV0Q0GD1T0Xhf1bfnv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ftrace tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/trace/ftrace-uses.rst:123: WARNING: Unexpected indentation.

Introduced by commit

  a25d036d939a ("ftrace: Reverse what the RECURSION flag means in the ftrac=
e_ops")

--=20
Cheers,
Stephen Rothwell

--Sig_/xfgPDyV0Q0GD1T0Xhf1bfnv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+yHZYACgkQAVBC80lX
0GzThAf/X6nN97l+a/Hp3NsTfd9uVribBXbpQ3br1VReGNM7IgQCWM4duFbvuXIz
ct/Uo2kqIfVyQeFMmp7+SEUJ5nWlNQU1dbL2oWoucwDYfUWN7F3OQxKXi+MxleW+
zZ3n6KWZNph/mHTUCQtrjpUI09JiPJsdD5S1SlBaDF7GqyI/px2DiqFsy6vX+VcX
Jn3SCCPJZDcZJBb7a2e7E4NBGVb9d+uqppjypYT/rEHVJkBIHWVTIx6+c3+IcaGz
DJPcLJWPvQ6PzA/cr7rPrtagONfXB/u/Ett6jlySnLjGvhRai26z1Lvj/jzJmAG0
NQ60IGY3uKwD8bBSm+6zCXV1Y8OskA==
=WKXn
-----END PGP SIGNATURE-----

--Sig_/xfgPDyV0Q0GD1T0Xhf1bfnv--
