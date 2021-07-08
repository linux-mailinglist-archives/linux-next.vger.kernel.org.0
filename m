Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2D1F3BFAAB
	for <lists+linux-next@lfdr.de>; Thu,  8 Jul 2021 14:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbhGHMx2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Jul 2021 08:53:28 -0400
Received: from ozlabs.org ([203.11.71.1]:45253 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229659AbhGHMx2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Jul 2021 08:53:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GLGNw3ZFhz9sRf;
        Thu,  8 Jul 2021 22:50:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1625748640;
        bh=wVB2xHLvC0Sx3VH5QFGi2wnyMzDyK5n8NbulD0HO+xE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HiUwPAwrV3CmFIR2gKZS+e4HlxgB/ZMQq1+Hx1biC4UR25wzm7TGFmFU4MbYU1WzK
         hbSK1p25kXaMUBNqGSzKa3BFMlZEaVdhG1pHaGALBOvFgDz2Tnumo0Cpk4de1L5dRN
         vl/W+sCNdwIAPC7CZFp/NOQpVd7z7LEFJdwhXwEC8zb1UfUQMa4/vxMrQ+0nFaZVU/
         Rrab2XB6OLKmCNYjJPTcCK+hvxVp6Orn7/v4qQxZ1ozKcM8/Iiyuy6j3FdvP5KCmZ0
         XmutqeS2qGj0Eb9QENJOgbyJNRWq+89gybjoTLd2dEWvMvxvWrjOieiCR+8VqoVUyq
         o4WHlkXcMjQBA==
Date:   Thu, 8 Jul 2021 22:50:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the irqchip tree
Message-ID: <20210708225037.4980f159@canb.auug.org.au>
In-Reply-To: <87im1l2plp.wl-maz@kernel.org>
References: <20210615210143.2e00d851@canb.auug.org.au>
        <20210708121855.69b5a5f8@canb.auug.org.au>
        <87im1l2plp.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3CKfFPpSRjUNDaEW3Xgx/9K";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3CKfFPpSRjUNDaEW3Xgx/9K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Marc,

On Thu, 08 Jul 2021 09:10:10 +0100 Marc Zyngier <maz@kernel.org> wrote:
>
> Hmmm... I've had a fix for this sitting in irqchip-fixes for some
> time. But I now realise that this branch is not included in -next
> while tip tracks it.
>=20
> Any chance you could add [1] to -next in the future?
>=20
> Thanks,
>=20
> 	M.
>=20
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git i=
rq/irqchip-fixes

So I assume this a branch of bug fixes for the current release, right?
In which case I will add it tomorrow.

--=20
Cheers,
Stephen Rothwell

--Sig_/3CKfFPpSRjUNDaEW3Xgx/9K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDm9J0ACgkQAVBC80lX
0GzRrAf/S2tAE6SxTNv9ux7Kx5Qx09zIrz0h9U7IKLjnflgJdWSfcErWd0wkePhl
qSJOhiXVmiDSS9sC+wb2EBW9GpA0awlMoTzjFmSfcNhIH7W4sTA0gtFiWVcfjB/j
3GOzQQLRTfg5M1gqCZ4441UWNC7mlJPmuEZYuoODHcVx1MY+0mNpS62w0ADsbAm3
ixxPjaiKHy/IaSTk0dsLDqiHlo2CFE3taTM5NLEAEF1EQSdxdjuEZVT6kYZ0B0SI
EhsqFTTQ5AkXsl0+wEauIvX7CJV5qDTGnS9j4OTt8VxHaD3vUwLL5pusHVYC1QOL
aFI2sDnagPRzyvXm6TeTV7pC6dwUyA==
=rNLV
-----END PGP SIGNATURE-----

--Sig_/3CKfFPpSRjUNDaEW3Xgx/9K--
