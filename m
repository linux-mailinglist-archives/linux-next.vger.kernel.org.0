Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38C0F2B88E7
	for <lists+linux-next@lfdr.de>; Thu, 19 Nov 2020 01:09:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbgKSAJH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Nov 2020 19:09:07 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:46955 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbgKSAJH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Nov 2020 19:09:07 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cc0Qm2bYMz9sRK;
        Thu, 19 Nov 2020 11:09:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605744545;
        bh=bp94GxKdK5VTCdrPqWQaf/fBgda1pNJWd6iqpH99cMw=;
        h=Date:From:To:Cc:Subject:From;
        b=A6Ym+WrFtYORm+FUtM7MlUDg8EQB6WAjAO/6JXvk/Q/htMeBcEeWy/JdU/5PaMGrd
         k4wCUVvODu25iBKE823VE2B8uriV6qznlZr/FTpK5ARwkuXWSbClPUQYr+3Dpk0b2Y
         FSr5A49n3xWcd5ZKbqF4W3PVht/piVqOH7U6b5Qm479B8aY3feCXYD1+p7jy1zIwUW
         /VrNY+8QKsHZ3yOWPMfmwSMf96EvhOn+L2K7w81RNM+FjxUcWitcgPS/Eu4Lvy3zF1
         NwYaAQn0FP3H0TE5NLkS37Gbg4VQVmBCii/+pQBFlfV18gLJQq9i5nZb767cDH2LWp
         Ho8pM9Mvi7S6w==
Date:   Thu, 19 Nov 2020 11:09:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the pm tree
Message-ID: <20201119110901.1ad61658@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fex.dSe2n.=w+h.teEM+HJJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fex.dSe2n.=w+h.teEM+HJJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

WARNING: modpost: missing MODULE_LICENSE() in kernel/resource_kunit.o

Introduced by commit

  5df38ca6afec ("resource: Add test cases for new resource API")

--=20
Cheers,
Stephen Rothwell

--Sig_/fex.dSe2n.=w+h.teEM+HJJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+1t50ACgkQAVBC80lX
0Gx5Twf9FYwl74AT5eLvCi4lqJf6qfPTQ7cJeZrDo2U0xg5vGQIToOX7zVWslcgS
u5UiFMpljBOPSTpZzjA5vcqxIfkdRcKClH2KWtuIcnMSlG9QZKMeNR2/EVhOiQZ2
gXIRFB96WTcwlb2s17Z/mA5IWFYUuPvd11anZv/MkxewYjHLbAna3zOiBhiltJ3o
M68pNksNDJNruvBV2GTkn6UUQCTsHeuUhRRrCSstI+QY0Z3RqqUjjRqxoZepYGrG
A3UFUHFkfKKOtzIpUaeX956FnGytYgW+GYje/Wna+cpNT6A3HlrZ/mG6jGRzHLiP
7Pl2XKY9/yWDFOGOAVurewsiUkNE8A==
=ukjd
-----END PGP SIGNATURE-----

--Sig_/fex.dSe2n.=w+h.teEM+HJJ--
