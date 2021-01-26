Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3917D3046F0
	for <lists+linux-next@lfdr.de>; Tue, 26 Jan 2021 19:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390411AbhAZRSh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 12:18:37 -0500
Received: from mx2.suse.de ([195.135.220.15]:57550 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389259AbhAZJTl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Jan 2021 04:19:41 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 1A990AF85;
        Tue, 26 Jan 2021 09:17:16 +0000 (UTC)
Message-ID: <3f563185539b346477ca19b350d0ac8c96632398.camel@suse.de>
Subject: Re: linux-next: Signed-off-by missing for commit in the raspberrypi
 tree
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Tue, 26 Jan 2021 10:17:14 +0100
In-Reply-To: <20210126191117.47fffe80@canb.auug.org.au>
References: <20210126191117.47fffe80@canb.auug.org.au>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-XT0h9IerV7y34lokR1n/"
User-Agent: Evolution 3.38.3 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--=-XT0h9IerV7y34lokR1n/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-01-26 at 19:11 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Commits
>=20
> =C2=A0=C2=A07a5936445053 ("ARM: dts: bcm2711: Add the BSC interrupt contr=
oller")
> =C2=A0=C2=A069894e0baa0c ("ARM: bcm: Select BRCMSTB_L2_IRQ for bcm2835")
>=20
> are missing a Signed-off-by from their committer.
>=20

Sorry for that, I fixed the branch right away but forgot to push it.

Regards,
Nicolas


--=-XT0h9IerV7y34lokR1n/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAmAP3hoACgkQlfZmHno8
x/7RMgf/VIKtjrAqjvBP4Ymnv8dC/4VMnq2Y2C2Ki7LRJIH/+5c2G9L45uk7dC4e
RhQv4An+byKbow90CYp+SmWoTpnWX8EXjF6/eCD5r5+WnltmkaTgIYcwkcvEkbWk
KMxwRzR+fQu87oRfMP/likuPVk1o6WPEyuP9UGrVmRdEKebmo5of1vNJ0WI0iZBV
wZIQysAq0Qi2Rb6GT1ryYgxk0zAUvvthY5BMs8MhVLC1vqaa6bBbEGAkXe+RM8Md
WZNV/zOFAVpXRg1LDRnm4VSsokIwilOp7tPt6i4YM5IY/g6ZhoppRxh8tc74JTBu
09XfJfW8aTWweNWv3Zl+hWnR9XOa9A==
=Ip+l
-----END PGP SIGNATURE-----

--=-XT0h9IerV7y34lokR1n/--

