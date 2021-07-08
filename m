Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 397F03BF3E6
	for <lists+linux-next@lfdr.de>; Thu,  8 Jul 2021 04:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbhGHCVj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Jul 2021 22:21:39 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41623 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230160AbhGHCVj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Jul 2021 22:21:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GL0N05RpTz9sWl;
        Thu,  8 Jul 2021 12:18:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1625710736;
        bh=dGsVRSn27YFSkOofaMR31nZQGDHDgtQeHE6bnmvWkaE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=RL1Xa8KB52elSP6gQ73crwJGl6rIIxCDoWujSlmfZAUR5/DDss3aArwk6jRo2rvd5
         KrWabGA32zu5MJZGKgE9jDUMrMfES6g42snvVqorAaXPo4l8ue5Z71SHn6n0xWdpbQ
         CE8UYSB1cVE/dtrGcoerNw1E+Egnlk9UuE4mcVXlUA4rBB4QyEbeAv1yoq9IAu9JD2
         NBowx8hypjNpXH1jreejFQVVcfcJKsK9rSeQca2oY0PS5gN4ERS9SEdbFW+0o/ZA0q
         bPzFWp8KHmQ0IVEymRPJUQpoQvhZxxQHamb82lrkCGfB5gSkiuVulK5wZMWHkoCqP6
         jfn2XliBEJpaQ==
Date:   Thu, 8 Jul 2021 12:18:55 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the irqchip tree
Message-ID: <20210708121855.69b5a5f8@canb.auug.org.au>
In-Reply-To: <20210615210143.2e00d851@canb.auug.org.au>
References: <20210615210143.2e00d851@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//s5UlzaF5+5cr3lV1ju95zu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//s5UlzaF5+5cr3lV1ju95zu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 15 Jun 2021 21:01:43 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the irqchip tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> kernel/irq/irqdesc.c:692: warning: Excess function parameter 'lookup' des=
cription in 'handle_domain_irq'
>=20
> Introduced by commit
>=20
>   e1c054918c6c ("genirq: Move non-irqdomain handle_domain_irq() handling =
into ARM's handle_IRQ()")

I am still getting this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_//s5UlzaF5+5cr3lV1ju95zu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDmYI8ACgkQAVBC80lX
0Gw/SQf7B0f/UfT/zvDZRvtx2gcSuOd8QnLGqC5m8DRXCtbkm2nzjmsiX63TQoK8
oSywcEOGhNBCAH1yJ8qm//9dfztnSF6Miyw9Yz3H5jOjJrzpJyjm3CmBlSgSv/fH
1WcB6Ugp60dYcQCRdwEerizIIc4xBuB0IMdLpkyPqUjkLvUZ40VxTUiTKPsA3f/P
+B6kYEtYB8losIWopzm2XfmZsAUc1Ox99aiaZoL/Zjj5HhCUJhCFqgAw4CfZfelE
7dvq05h8Hk/l2u0DtFbJcpzaaZXnXv2WNRh1QmUszjWYj17xDyqBnihqB/17JLfd
0PiotiaI0hSrV/Y+nXSH509OllADfg==
=uKMN
-----END PGP SIGNATURE-----

--Sig_//s5UlzaF5+5cr3lV1ju95zu--
