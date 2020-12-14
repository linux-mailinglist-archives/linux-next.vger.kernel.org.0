Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 743682DA0F7
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 21:01:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502793AbgLNT7P (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 14:59:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729523AbgLNT7P (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 14:59:15 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC3B1C061793;
        Mon, 14 Dec 2020 11:58:34 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cvsdh2JfVz9sTL;
        Tue, 15 Dec 2020 06:58:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607975913;
        bh=FTqblBkuSCH27sSZnYqubX2wg0+2cXaZFq7YcUu1hYs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=d+qlF/vlG1DFZ49YRJNCInXzsEdj5t4JDn5FFc8xeuXaYizVoHi4Q6pP0au4G4I0w
         fcJzfb76paNwcZZa1UaubhY5Y4hsXgzqNuBSo5ySgLViWrvQRhHYY+HmrRH0JfzH3o
         zCDeRjvHgCeOUA/uuaCjfW7CH0LhG408eX3x98VRV7ic4LaOX/BkAR5Q0aa183fzDT
         pBnMww7znHUeZQeXgGRtsO9v/ArY6CKzKa1U4HPM23y5FIlxBnMS/+VcTNz9jMW9ya
         yPQMOT9zgsoryuZsJcJPVi0ttcLtDSPMr4ydT2xnI8DeUwNgptdjcicU6xfPFvHJjU
         wPJs4Va8Dvp/g==
Date:   Tue, 15 Dec 2020 06:58:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Dave Jiang <dave.jiang@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the dmaengine tree with the
 dmaengine-fixes tree
Message-ID: <20201215065831.552ffeb4@canb.auug.org.au>
In-Reply-To: <20201119142915.22217138@canb.auug.org.au>
References: <20201119142915.22217138@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TvW3t_btpO/OEKavscyyiRY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TvW3t_btpO/OEKavscyyiRY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 19 Nov 2020 14:29:15 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the dmaengine tree got a conflict in:
>=20
>   drivers/dma/idxd/submit.c
>=20
> between commit:
>=20
>   8326be9f1c0b ("dmaengine: idxd: fix mapping of portal size")
>=20
> from the dmaengine-fixes tree and commit:
>=20
>   8e50d392652f ("dmaengine: idxd: Add shared workqueue support")
>=20
> from the dmaengine tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/dma/idxd/submit.c
> index 417048e3c42a,efca5d8468a6..000000000000
> --- a/drivers/dma/idxd/submit.c
> +++ b/drivers/dma/idxd/submit.c
> @@@ -74,14 -86,27 +86,27 @@@ int idxd_submit_desc(struct idxd_wq *wq
>   	if (idxd->state !=3D IDXD_DEV_ENABLED)
>   		return -EIO;
>  =20
> - 	portal =3D wq->dportal;
>  -	portal =3D wq->portal + idxd_get_wq_portal_offset(IDXD_PORTAL_LIMITED);
> ++	portal =3D wq->portal;
> +=20
>   	/*
> - 	 * The wmb() flushes writes to coherent DMA data before possibly
> - 	 * triggering a DMA read. The wmb() is necessary even on UP because
> - 	 * the recipient is a device.
> + 	 * The wmb() flushes writes to coherent DMA data before
> + 	 * possibly triggering a DMA read. The wmb() is necessary
> + 	 * even on UP because the recipient is a device.
>   	 */
>   	wmb();
> - 	iosubmit_cmds512(portal, desc->hw, 1);
> + 	if (wq_dedicated(wq)) {
> + 		iosubmit_cmds512(portal, desc->hw, 1);
> + 	} else {
> + 		/*
> + 		 * It's not likely that we would receive queue full rejection
> + 		 * since the descriptor allocation gates at wq size. If we
> + 		 * receive a -EAGAIN, that means something went wrong such as the
> + 		 * device is not accepting descriptor at all.
> + 		 */
> + 		rc =3D enqcmds(portal, desc->hw);
> + 		if (rc < 0)
> + 			return rc;
> + 	}
>  =20
>   	/*
>   	 * Pending the descriptor to the lockless list for the irq_entry

Just a reminder that this conflict still exists.  Commit 8326be9f1c0b
is now in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/TvW3t_btpO/OEKavscyyiRY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Xw+cACgkQAVBC80lX
0Gwqzgf/YGZ0IqvEIiJ5P20tbQeaplSD6lItZ2O5tWqYfwdwIR3D37uomMpTUWlY
wswB18dK5LsaAGAvKRuT6T+Buigve1XktTaE2EMPPbvqHd8r6N8x5IhHwqmA3m/N
jI4zs0XDNThQr4bH+0RzxkxD5haG7FI9nLrdVcaMr/g9uY9jhAa6vWB+qeZfH7Cd
C9kSRE9FQ18jv66XthJUwoFkccj/z6mnE4AZqqHjsPeitm7PdyHBxUMSzSTRLS85
Wn2/p9UTe751Rq18nAnZwOYHCdmKsJ66SHaH8CtH+gvM3n7zuKLl9Yj7laAwxYip
Q6ZugNy7PQ4BavhEDmzvm1HsNiGMPw==
=CsGv
-----END PGP SIGNATURE-----

--Sig_/TvW3t_btpO/OEKavscyyiRY--
