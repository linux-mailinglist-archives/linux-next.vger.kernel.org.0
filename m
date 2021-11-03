Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F825443C45
	for <lists+linux-next@lfdr.de>; Wed,  3 Nov 2021 05:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbhKCEug (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Nov 2021 00:50:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbhKCEug (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Nov 2021 00:50:36 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74912C061714;
        Tue,  2 Nov 2021 21:48:00 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HkZ5T2qwSz4xbd;
        Wed,  3 Nov 2021 15:47:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635914879;
        bh=Jf45jJFRdfm6+hTrxPFhIdwpnYWcu9CQiCJo3RQg3z4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=h2N9RPBI3dorwE35vb4xKhSnynXj+4E82w3tXtIbzTq6ZM4LxYyVWNAddDHbIQ8x+
         2eud2tG7euIZ+Ca7eKmYT7l2DhnOFN0ulhWkQZf+aKK3E27wgZiqL9baqajmxhEuCE
         1dYcV1E7G0i8ema2lxpKclu8Z3EMj3S4DUhipO6zEBsc8225UDzZwLJF5s7eS+1Jt8
         k4xHIDaMoO3nY0dK3jV+1TRX/CmdZQd89x+P8R02YujFpvjc/nLLM/kVGJcpTWhtSE
         muYMMykg06w/wYdeVGV8mQbtP8xHpSZGvpQLNX6UKYTrPnLEnrsMhG3kr2Mx8Q3bsm
         oNzYp/V+boyww==
Date:   Wed, 3 Nov 2021 15:47:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Anton Altaparmakov <anton@tuxera.com>,
        Joel Stanley <joel@jms.id.au>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of almost all the trees
Message-ID: <20211103154753.115d243f@canb.auug.org.au>
In-Reply-To: <20211028212651.57beb05b@canb.auug.org.au>
References: <20211028212651.57beb05b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BdOtPGiLPIi/6U49KhsvE.a";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BdOtPGiLPIi/6U49KhsvE.a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 28 Oct 2021 21:26:51 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> Today's linux-next build (powerpc allyesconfig) failed like this:
>=20
> fs/ntfs/aops.c: In function 'ntfs_write_mst_block':
> fs/ntfs/aops.c:1311:1: error: the frame size of 2304 bytes is larger than=
 2048 bytes [-Werror=3Dframe-larger-than=3D]
>  1311 | }
>       | ^
> cc1: all warnings being treated as errors
>=20
> I have no idea what has caused this.
>=20
> I have disabled ntfs for now.

So from today, I have used this instead (i.e. disable CONFIG_NTFS_RW):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 3 Nov 2021 15:17:17 +1100
Subject: [PATCH] Mark NTFS_RW as BROKEN

it currently breaks the ppc allyesonfig build

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/ntfs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ntfs/Kconfig b/fs/ntfs/Kconfig
index 1667a7e590d8..68cfef0280f2 100644
--- a/fs/ntfs/Kconfig
+++ b/fs/ntfs/Kconfig
@@ -52,6 +52,7 @@ config NTFS_DEBUG
 config NTFS_RW
 	bool "NTFS write support"
 	depends on NTFS_FS
+	depends on BROKEN
 	help
 	  This enables the partial, but safe, write support in the NTFS driver.
=20
--=20
2.33.0

--=20
Cheers,
Stephen Rothwell

--Sig_/BdOtPGiLPIi/6U49KhsvE.a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGCFHkACgkQAVBC80lX
0Gzavgf9EhXbQ0wVedCGP0ZSomtNsAMSInV7q2EQ+gP4wDKvcx4bYOWItOfdNduy
RnF6LOpcFyHvt/5LGJT493RsffcMKeOlb7JaE9POZR+3yjmrqXzL/FSLzzaH6ri3
UfLk5tfOvxJP74lNZALGTPkjV8Xr/GMDTQA0t0bsSDXVYfzpQIoc+PGy8RZTQgL9
QdQNckWJzuFAqbZgwcs6iionE6eikIpLb23VQeE6nuTcnjpuXEP8Zt5Qb/nqYb3w
98qARYR3CZk2LfEHKMjZHmLkBwyQ5Kc+Iaj2RYTgds7ZGHoile0mxOIsCfPoHwUF
UB9DoOPsXhI/Wt8BJHYf50MllgOQCg==
=rbgt
-----END PGP SIGNATURE-----

--Sig_/BdOtPGiLPIi/6U49KhsvE.a--
