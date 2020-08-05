Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB1023C2A5
	for <lists+linux-next@lfdr.de>; Wed,  5 Aug 2020 02:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgHEAlA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Aug 2020 20:41:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgHEAlA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Aug 2020 20:41:00 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1525C06174A;
        Tue,  4 Aug 2020 17:40:59 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BLt8T4b8Vz9sPC;
        Wed,  5 Aug 2020 10:40:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596588058;
        bh=o8lf6TdzrWFXOHnZQm2y7sn451B/oLl7VtF+Feotq/k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ToPQ4yP7+31m4kSvsm+FjGGDTX1xOU6VLIE0yrVgQXX17ojejsCHSutRIKh3DlSTp
         SBd3fkIPL06fHLFacJnDjyK8ePzz6uuAaGnSRF8kP9QPSYjtRGRsTDAhsAVjS7mG98
         k3uLVRXV01d06oqtxxD9MWBoVUQotkIffI4s7m2rD8ys+thpI8YGD+FGmEdrmFYe7f
         CZv3a3WmmV/cTAILPkMXV6o/XcIu1t+TYuQ7ZxeW94d/1IXu1bmSIox7s8lwiaJ+TA
         QNy25yH3Kvwqp8zmseHi4Ek9hsYejvRzlRFQSc75KokAMlDZ/B6gCbcBi8xQLmR8Ed
         6sU7h9wHtwlcg==
Date:   Wed, 5 Aug 2020 10:40:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Rich Felker <dalias@libc.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the pidfd tree with the sh tree
Message-ID: <20200805104056.2b1591a8@canb.auug.org.au>
In-Reply-To: <20200722203812.6ca23e0d@canb.auug.org.au>
References: <20200722203812.6ca23e0d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l1VvXk8FmB+J5KgBSOkdAvT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/l1VvXk8FmB+J5KgBSOkdAvT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 22 Jul 2020 20:38:12 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the pidfd tree got a conflict in:
>=20
>   arch/um/Kconfig
>=20
> between commit:
>=20
>   5c77ba8aa183 ("dma-mapping: consolidate the NO_DMA definition in kernel=
/dma/Kconfig")
>=20
> from the sh tree and commit:
>=20
>   140c8180eb7c ("arch: remove HAVE_COPY_THREAD_TLS")
>=20
> from the pidfd tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc arch/um/Kconfig
> index 32c1d1945033,ef69be17ff70..000000000000
> --- a/arch/um/Kconfig
> +++ b/arch/um/Kconfig
> @@@ -14,8 -14,6 +14,7 @@@ config UM
>   	select HAVE_FUTEX_CMPXCHG if FUTEX
>   	select HAVE_DEBUG_KMEMLEAK
>   	select HAVE_DEBUG_BUGVERBOSE
> - 	select HAVE_COPY_THREAD_TLS
>  +	select NO_DMA
>   	select GENERIC_IRQ_SHOW
>   	select GENERIC_CPU_DEVICES
>   	select GENERIC_CLOCKEVENTS

This is now a conflict between the sh tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/l1VvXk8FmB+J5KgBSOkdAvT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8qABgACgkQAVBC80lX
0Gw2mwf+JRHRrswhLl7z0Ru7fOcV9wxOoOVwg6WMrCXJuLba6v52sYpynvBt7ojW
tclBce0LQNCetY3CiKRQ8DwxmmWTUcKk5Lacm1Z+M3wqk8kkvn6n2HcmZQb550Gh
Xp0/40ZuJK3Se7ro4iwRr0uzPGPKkct8KSyTslWyG33nR1ph3I4FAJRsISjDalzN
TFhHttWtnRn/l9k5Xef2DfoUNcaRLz/TxZ1jjah85/uSXnVK8D91khvJEEjO82J0
RmTbZ0pO6V35UKPzBmNqGNFlTe0FZ/66hXYn8dCi9N1ovNk1MGbCqZDMAPjKo6GK
u81VsdNQU/0e5D0n82b8KQmSHzCPqg==
=XY6W
-----END PGP SIGNATURE-----

--Sig_/l1VvXk8FmB+J5KgBSOkdAvT--
