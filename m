Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D93F1A29B2
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2019 00:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728017AbfH2WYC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 18:24:02 -0400
Received: from ozlabs.org ([203.11.71.1]:58455 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727826AbfH2WYB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Aug 2019 18:24:01 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46KHFq2pkFz9sDB;
        Fri, 30 Aug 2019 08:23:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567117439;
        bh=MmtUcWBvvjpAy9cWLXb7FNWAhGcqNpptwC8LinDLwQE=;
        h=Date:From:To:Cc:Subject:From;
        b=DMzidZKFzroJvnK5mz4MMkSfNVWVlnM6MZRLhxOFTMfKojONLnX8a1oqyNpDY0ecV
         Z3kdLcnrI/rHys7E+OZPE9fUJ6DOJehbXekcvy/JWlqJuqGPv0z8rvsdHlK2PcAlbA
         kOVQvoSIz0JDnGN4t1fRzfRjAvQvyBMqs4p4g2/LiPyBIRLBHxg+9hlVGwFYrR1rHW
         48MZhQ/9vaTuEVH7IUpcOLSy6lK24OpeXppNJDJcSrK80vYIkQraGPL8brp1nnaZJX
         45j9LEaX1aqrYIHHiajL68lUd4tERjAj3wh93+TSo9aF+XkgUzgM0yUX1wDdVO+eYS
         6tvhYOrYrjDPA==
Date:   Fri, 30 Aug 2019 08:23:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning from Linus' tree
Message-ID: <20190830082357.4650d243@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NWXnxGRyGHjcMwv+FuAoQqj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NWXnxGRyGHjcMwv+FuAoQqj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

=46rom Linus tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

arch/x86/boot/edd.c: In function 'query_edd':
arch/x86/boot/edd.c:148:11: warning: taking address of packed member of 'st=
ruct boot_params' may result in an unaligned pointer value [-Waddress-of-pa=
cked-member]
  148 |  mbrptr =3D boot_params.edd_mbr_sig_buffer;
      |           ^~~~~~~~~~~

I assume this is a result of upgrading my x86_64 cross compiler to v9.2.1
(from v8.3.0).

--=20
Cheers,
Stephen Rothwell

--Sig_/NWXnxGRyGHjcMwv+FuAoQqj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1oUH0ACgkQAVBC80lX
0Gx+aQf/e8Bhn/pDsW0N4pecxKBKn8OATEhIUh8vYd8cjWPpAIjbaGxNmjhNDW7v
z3ajczn2PqCbUBD9IpB31xuKHWvk/v7EUtq7NTCNE1L/l3L5ryt4jV04tCo9vcbB
ichBC5XwMvvlIyE52Iqv6i/YSCXOcmaXYkxI+Jw9ZgP9IRjndWLcL6GorNOCWrCr
88DbJrXWjJgOt2Wvr1sLrDJcvgFZkLO1JQj6qRBiZvtbjm7NyRgfvBLO8APuc6GD
oxhIFJ9Gct0RPkNSKsIcljBGtJCHBKBJi5RFJxJ/j+f/vyAk5HkhJGXTi91TEQO7
iD+r4X5leUPJEA1ng3xxdpxSnN+Niw==
=+v5z
-----END PGP SIGNATURE-----

--Sig_/NWXnxGRyGHjcMwv+FuAoQqj--
