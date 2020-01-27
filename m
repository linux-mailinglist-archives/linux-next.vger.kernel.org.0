Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9867214AC62
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2020 00:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbgA0XDP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jan 2020 18:03:15 -0500
Received: from ozlabs.org ([203.11.71.1]:38909 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726101AbgA0XDO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jan 2020 18:03:14 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4864zN27wRz9sNF;
        Tue, 28 Jan 2020 10:03:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580166192;
        bh=gIdeDcwDr1uc2hbXazpz85MJ4jT0xSRRnAGmsRPJkyo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FDdWquOaSIqR16NlvVfmadY6oEAsvUxcW+LwJ/CCqYu7jCcor8Txl7BwdYY/NlhR8
         tUm1LDl77ND0SS79Xt5jp9j9yERhPBGbrU7yM/FP5W/tT5mtKOauCL4dYeq7l8iFNj
         S8uXHo4i3T8cZr6RCIJ4Qn7fHwKvo6UxU1ps+s3wYvzLyhOphwK6pqVgQGyJbXoHbt
         ciZ40KzGCLQnZmVNbMirN+WbEmSkyc+50Z/cjmPN/BC1Mc8e9/0XJyH7A0EiE5jcew
         iDNigWHpuATigciuXObiPdheOPSxuY8lL7iyPhf++m38Rt+6Mv1T4QF7U7NPIrsa+t
         LWReV+N6ZSfyQ==
Date:   Tue, 28 Jan 2020 10:03:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: linux-next: manual merge of the generic-ioremap tree with the
 drivers-x86 tree
Message-ID: <20200128100311.3ca81231@canb.auug.org.au>
In-Reply-To: <20200124161558.7cbb88c9@canb.auug.org.au>
References: <20200124161558.7cbb88c9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Hzh09TDofALlGaQm7euNQV+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Hzh09TDofALlGaQm7euNQV+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 24 Jan 2020 16:15:58 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the generic-ioremap tree got a conflict in:
>=20
>   drivers/platform/x86/intel_scu_ipc.c
>=20
> between commit:
>=20
>   74e9748b9b21 ("platform/x86: intel_scu_ipc: Drop intel_scu_ipc_i2c_cntr=
l()")
>=20
> from the drivers-x86 tree and commit:
>=20
>   4bdc0d676a64 ("remove ioremap_nocache and devm_ioremap_nocache")
>=20
> from the generic-ioremap tree.
>=20
> I fixed it up (the former removed the code updated by the latter, so I
> just did that) and can carry the fix as necessary. This is now fixed as
> far as linux-next is concerned, but any non trivial conflicts should be
> mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.

This is now a conflict between the driver-x86 tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Hzh09TDofALlGaQm7euNQV+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4vbC8ACgkQAVBC80lX
0Gy1jAf/ZfCi1Xh0XmIwZ+ct8u63y9hKTj+uaIo9RRh5WxQKDzU2dE18GU6ZGybQ
lP4BzWaKjj9SbalyLzPQjLcrttdPFHJE/X8iNmIGjFvsm+3fPrYrVQig2lHBMD2C
BNM1Zcxrzg6oUOXP/T7OMx7yfKKqYbt9iNUxkPR73xYnPmql5DxOBB9JWVQy355J
nSC4mQDkJCk0r7Y/GoheYiaGQTP9XtStWwnIjBaPWItvJZuysepc3fshEzrRkP3L
B/9uyjed/lqH57k2IHeRY43ww9ZlRNMH40PNLRCIwcHHiE+6VBVxEhIWOe600613
5LYoyqzbwEAWXz9e88PB5R3dbavIqA==
=nsDB
-----END PGP SIGNATURE-----

--Sig_/Hzh09TDofALlGaQm7euNQV+--
