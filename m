Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 676223FFA93
	for <lists+linux-next@lfdr.de>; Fri,  3 Sep 2021 08:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345522AbhICGs0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Sep 2021 02:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344368AbhICGs0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Sep 2021 02:48:26 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E0EC061575;
        Thu,  2 Sep 2021 23:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630651644;
        bh=eYstr8j5YH15uhHTg1l/ac0oOD57AePRVQjMmPAGOVk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=frgnGWGX4/ZOD08DhvnE9hV0FOpN374hj3SgqaweNEdGQdmlRpnsK7SnWsVYChy7c
         GE/exwSdD7zOIQgvp2r/KYpAYzbKwl1/BMvBXFyDP0f6Ri+RNN6ZclfQYxybe8nNZ/
         1t0kz9XMbq3W1woNZSP8Z4PYRZJQGJg6llma2XAThNVlOs9D9EFjnI3TLNZxIUG4g6
         +hfhBvVfg9mr93Alj7Bv3KV06ohrUl3M8W7LhtyOZ/0cW8QBj1CXOwfr3KFMTjsiHN
         avr5GWxgi4vXyCfrSBMekb9zYk4bbAOSsssVjfOx0lpfHjLeBC/HF1FRrK/vkSoGee
         B3loLFxsgncMg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H17dS4ZZNz9sW4;
        Fri,  3 Sep 2021 16:47:24 +1000 (AEST)
Date:   Fri, 3 Sep 2021 16:47:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the irqchip tree
Message-ID: <20210903164723.176c889e@canb.auug.org.au>
In-Reply-To: <20210813194457.445205e6@canb.auug.org.au>
References: <20210813194457.445205e6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/82UEefXt/LiPl2hEXYpxDOw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/82UEefXt/LiPl2hEXYpxDOw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 13 Aug 2021 19:44:57 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the irqchip tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Documentation/core-api/irq/irq-domain.rst:178: WARNING: Inline emphasis s=
tart-string without end-string.
>=20
> Introduced by commit
>=20
>   991007ba6cca ("Documentation: Update irq_domain.rst with new lookup API=
s")

I am still getting this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/82UEefXt/LiPl2hEXYpxDOw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmExxPsACgkQAVBC80lX
0GzA0Af9E6KOnEpmIOwUTmBjdBGqk/00wOr1kwz6zPxuFwvIBIGWq6h89qnzlJys
fV5h7ztfzlDpCAIEtNDU+iWhvw+/ZsTTTC/NT1cdO1XPgkSUJfQLcZQs42EkcVLH
e6925iYxStllHNcCl+1gHXZoh7YY2Yz1yJGZA4WssIrEElEZzvYDTW1txZgl/Ztr
R/SLF86tsbv8LdY3ZsQDQlXyFw4sxyTd70xbYisi6b7vdiNXyS6THn7WCq3JhpYM
duf425AgDVlWsxBTvIBZ1mT+tqZpegYaSfDKhV7++9q8OZYNLXDK+DkUzLkQWZ0s
COm+9ftJIOJXPX8qoq/PVMGOP+6CRw==
=06hN
-----END PGP SIGNATURE-----

--Sig_/82UEefXt/LiPl2hEXYpxDOw--
