Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7BAE2D285F
	for <lists+linux-next@lfdr.de>; Tue,  8 Dec 2020 11:03:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727945AbgLHKCd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Dec 2020 05:02:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbgLHKCc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Dec 2020 05:02:32 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EA45C061749;
        Tue,  8 Dec 2020 02:01:52 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cqwgv2hG3z9sWC;
        Tue,  8 Dec 2020 21:01:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607421710;
        bh=ezmHCZ5AbVIRurImCcFnc0ZqSX+s2LoQCpPVja58s10=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kNt/g7Ccy5BC+aCGLv5J1KLSRmDBy8nc4GG3ElJCWBQA/H7xuL2aD/vc9SyMHBlU0
         ezAqKed0k9pMT9yn5ul92HRDTXxC46qCrQ6Nfk9p049u/cS2tg7nxvBOpWO5oTcYMN
         yJ+e5l6EYenIOK/XMfq1ETVPp5TyULsr4iR17fMXzy82hTqPZ3gyAT0tYmxVkXPkMY
         +5OicAP09d4Rn9tnEXQT8WHwZG+Hl29x2sR0nVrsXX9KXnOlIHFQaI4YLLckqpx5Ee
         MpyeBJw5Fk1bVKLeED4dK7g0AbM9lQvBk172XHSUdCAjOWfs33WxTkrNhJqqJVcl0A
         4qh7h0B7l3CCw==
Date:   Tue, 8 Dec 2020 21:01:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Bart Van Assche <bvanassche@acm.org>,
        Can Guo <cang@codeaurora.org>, Hannes Reinecke <hare@suse.de>,
        Jens Axboe <axboe@kernel.dk>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
Message-ID: <20201208210143.4b5e943a@canb.auug.org.au>
In-Reply-To: <20201208093039.GA15180@lst.de>
References: <20201208202853.186ae136@canb.auug.org.au>
        <20201208093039.GA15180@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tC9jpfKM1FVN+tkeymM=8hS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tC9jpfKM1FVN+tkeymM=8hS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Tue, 8 Dec 2020 10:30:39 +0100 Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Dec 08, 2020 at 08:28:53PM +1100, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the scsi-mkp tree, today's linux-next build (sparc64
> > defconfig) failed like this:
> >=20
> > drivers/mtd/nand/raw/intel-nand-controller.c:17:10: fatal error: linux/=
mtd/nand_ecc.h: No such file or directory
> >    17 | #include <linux/mtd/nand_ecc.h> =20
>=20
> The error message doesn't match up with your proposed solution.

Yeah, semi automation gone wrong :-)

--=20
Cheers,
Stephen Rothwell

--Sig_/tC9jpfKM1FVN+tkeymM=8hS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/PTwcACgkQAVBC80lX
0GzcKAf+KSsJEnJgNzf35+hfECY/bidMNv11o1KRfMTpn+yWr92mP9oKrIZ3D0h6
N5T9a2G2/UFurGvUM2ikOLUlWYNxL+qSOuOaW1v84EvvqTceZ3m7g+FNsbXywZXU
SMEldCAzI08YfO6LdxNpk6NHiSbZA7vtb8UCkpidNjKYxCUSC/OBlRAURsuBbk7r
0TFsiF7XIqk8JfTXXFKGNazX6iTPltoLMqAoBYWdeEX5VtMpIBe7q3k40Mjy+Ujh
to2U6jWQbP6jAcAVA2sOe9LBobLj2/CkVpNTGZCrlxY2qocyfN169Ze92kMrVfE4
0KSdHGlAcJ4wslusLdo6/DNViGxLxA==
=3lHH
-----END PGP SIGNATURE-----

--Sig_/tC9jpfKM1FVN+tkeymM=8hS--
