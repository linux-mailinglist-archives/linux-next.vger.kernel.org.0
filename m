Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 463DB17B5D9
	for <lists+linux-next@lfdr.de>; Fri,  6 Mar 2020 05:53:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgCFExv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Mar 2020 23:53:51 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41109 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726368AbgCFExv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 5 Mar 2020 23:53:51 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48YZyN5CJCz9sPg;
        Fri,  6 Mar 2020 15:53:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583470429;
        bh=yMx47DN5cVj1bo6PsxadEb0QYyIOSVKVLG24evYZuig=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=s7exIuAv8/oFib89u1Bym0H7AmD/GAP+T8G7tkvpnWqopI2aQcdq/Co0UzpAmaZ6R
         SbZpIcy3CqgDcEjTVW9R3LIxIXgx2nCUmzG+yZGgPx+arww8yUVJuFpvjIX3Z3UFL9
         PAsxFu2CkHPoLtEEoZjepoZ1QZpzwQKYMucxEfwJ+IYvFI8TFcvWjAXBRjsccvJ4bn
         yxxpROEuVlDZSSkJjogzUwRtRXGKaL1n1n/nZ5lqlS4fqmZ+KZwaveffAAvnmhNTYC
         Cs25tZj7FEbC9Lyv3J5tvtkNjwCyn2DmVvtLwjCCsd5KEsxJ7ge3ySD1OWLODBLBQr
         +44gYqxjve62g==
Date:   Fri, 6 Mar 2020 15:53:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Theodore Ts'o <tytso@mit.edu>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: linux-next: build warning after merge of the random tree
Message-ID: <20200306155348.7bdc9622@canb.auug.org.au>
In-Reply-To: <20200302144452.6a7c4907@canb.auug.org.au>
References: <20200302144452.6a7c4907@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6pDETBXvvN0ia_QueXdZ42T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6pDETBXvvN0ia_QueXdZ42T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 2 Mar 2020 14:44:52 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the random tree, today's linux-next build (x86_64
> allnoconfig) produced this warning:
>=20
> drivers/char/random.c:820:13: warning: 'crng_initialize_secondary' define=
d but not used [-Wunused-function]
>   820 | static void crng_initialize_secondary(struct crng_state *crng)
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Introduced by commit
>=20
>   5cbe0f13b51a ("random: split primary/secondary crng init paths")

I am still getting this warning.
--=20
Cheers,
Stephen Rothwell

--Sig_/6pDETBXvvN0ia_QueXdZ42T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5h11wACgkQAVBC80lX
0GxPqQf/e2WqxfcblgL1WawrIftLywpWOef6xvH4tjsQsWEwB/5PHw+wdcnetCcF
tFmUYL0Q5uVbhm9tiqjnbR6NoU2+KTq4ZnrUzQsnOztE71GWZGcWziLAaAOFBioE
jVS1Smgdc6r+GkFO6RGXPJA6laWKEXRtnSNzl4cAQTvytkW/CiSveK+tGA7AlQQq
Gm9iMrkuGB76yj6cAjuv+RpuNiRDHar+6Kh21Cpj0TtKFfeKmkm6tK6usVpgV3oE
SkZZnAbb2Nwzk1H+40FBbGpkzvq0bu+YTzcveZMM0mtCXgFwWvGhQGMabikv4fOC
0EDQzApzuCc2np6DiHtUp3ZLQMY/3g==
=EKiY
-----END PGP SIGNATURE-----

--Sig_/6pDETBXvvN0ia_QueXdZ42T--
