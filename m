Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67D2F3C6675
	for <lists+linux-next@lfdr.de>; Tue, 13 Jul 2021 00:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbhGLWmw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Jul 2021 18:42:52 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33455 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229931AbhGLWmv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Jul 2021 18:42:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GNzH519N2z9sRN;
        Tue, 13 Jul 2021 08:40:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626129601;
        bh=pUinegmw/I69ijKK5Z5PXZv317Tsr9Eyo6sOYjk6PqI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kdCTvOww8I1iYzb+0SUqW42mHPTENYBRSyQ9OUN9kgWFAuAG2yIzUV+df3fIiB7tu
         Az3Wwv/XPFiCxjGSox76oMuPp3ujbP9PGPDWipb4XGvs4PY0kaM1Iigt1FdHnVR4Eg
         MDShzrQlZJykCpm/FUaktNouikvY4Zmm3dcuWapNaJ5LqaHUemMe58xbCJfJWkGLZ0
         nUKzD8fENJjXinBIEGoIryHwd5/lJDCzeTNvebh5OPqhQOrOD4kcH+YrNJW2XoO0y5
         iJNY/TVecRvgDH2A1uojB0r1V/ouSXu1BCIg+wY7S9xy46qAse6WNlUQCL+fg8eYIb
         eLr6kBtOeke+A==
Date:   Tue, 13 Jul 2021 08:39:58 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc:     linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: linux-next: removed trees
Message-ID: <20210713083958.413e85b7@canb.auug.org.au>
In-Reply-To: <20210705215743.40b26667@kant>
References: <20210514123221.7c21393f@canb.auug.org.au>
        <20210705215743.40b26667@kant>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T7D/pkuNwrusp=tD+pC6OAn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/T7D/pkuNwrusp=tD+pC6OAn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Mon, 5 Jul 2021 21:57:43 +0200 Stefan Richter <stefanr@s5r6.in-berlin.de=
> wrote:
>


> Would you be OK with adding linux1394.git (for-next branch) back to
> linux-next?  There are two patches queued and I am finally aiming to get
> them merged. :-)
>=20
> Christophe JAILLET (1):
>       firewire: nosy: switch from 'pci_' to 'dma_' API
>=20
> YueHaibing (1):
>       firewire: net: remove set but not used variable 'guid'
>

Readded from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/T7D/pkuNwrusp=tD+pC6OAn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDsxL4ACgkQAVBC80lX
0Gz3Rwf/Y3fCj4Rj1PZGIKXhn2fjUP2q7kuSBDeh+s5MtRbSJcqJgicBI8+LX/rv
nARA0xFLtjkm0DP/zPUpP2uVzgIJd5ZRaGdyiiLvl4KCHZ/IkEC9YDq2N5cuWJgm
MrRywd4Y+/3Xdq+RcoC69vKsL9Kx3CiOty7W2PhkJ2jJTo43K8ndNSQf7rN/1aTJ
/LDgqXfJ0/jX6LzhUY8eXAblgnlyGa8CsgD/llG3AXYG+YC4JressQ1dRzV+IQhf
ICTKO2Dfaw5fb3SfJatN2X8xK4E14wwwBF4iWYaicY8FOiIhp7sQ5jR/raNk5nYN
GPlQuhtZyGJ12oG5waBGonYhqvb61g==
=BNg4
-----END PGP SIGNATURE-----

--Sig_/T7D/pkuNwrusp=tD+pC6OAn--
