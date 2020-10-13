Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB2ED28C79B
	for <lists+linux-next@lfdr.de>; Tue, 13 Oct 2020 05:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729124AbgJMDid (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Oct 2020 23:38:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727831AbgJMDid (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Oct 2020 23:38:33 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66BCEC0613D0;
        Mon, 12 Oct 2020 20:38:33 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C9LqM62qzz9sT6;
        Tue, 13 Oct 2020 14:38:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602560310;
        bh=7Q6dHh5rKb36dYWMn1hj4Ipq04e2RltnH6fkbGLEdVo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Psw6dOKcwb8yxK40PZXIxg2bQEvdeRCxC6qojimrDEiFhRAEprYBIOZS+MwwlYB1J
         4wlF6FkdL8h3rb52Kt6BEBKuaSFAXtzzaGFljFhhSX/ya7ixD+EfS11vZQzHljW6LQ
         +HmNJO6mCPeJqHbJycmVX5ZIxFEhDwrPahOcMCVbD+zfmJZdOZy2S46fj9PQB3ZBk+
         mTWjPgpfG19MBe4dEEORJkE8iydx1/WhePt/UEKRvOm3Wmsw4OnIFTIuhh7YdB1T1o
         DPqhKJi2ggVohlZmYGsKeyUwk1Z31OuQA/KxnwIrEvrUthyJkSKd2Vhocyxqot9RDs
         arKhsj012T/Mw==
Date:   Tue, 13 Oct 2020 14:38:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Borislav Petkov <bp@suse.de>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>,
        Jacob Pan <jacob.pan.linux@gmail.com>,
        Joerg Roedel <jroedel@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Liu Yi L <yi.l.liu@intel.com>
Subject: Re: linux-next: manual merge of the tip tree with the iommu tree
Message-ID: <20201013143823.09c4ccf8@canb.auug.org.au>
In-Reply-To: <20201002152224.3077f9f8@canb.auug.org.au>
References: <20201002152224.3077f9f8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7K9Y8T0hJXHA3Alfj6GYnPT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7K9Y8T0hJXHA3Alfj6GYnPT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 2 Oct 2020 15:22:24 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   include/linux/iommu.h
>=20
> between commits:
>=20
>   23cc3493b5e1 ("iommu/uapi: Rename uapi functions")
>   d90573812eea ("iommu/uapi: Handle data and argsz filled by users")
>=20
> from the iommu tree and commit:
>=20
>   c7b6bac9c72c ("drm, iommu: Change type of pasid to u32")
>=20
> from the tip tree.
>=20
> I fixed it up (I used the former version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This is now a conflict between the iommu tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/7K9Y8T0hJXHA3Alfj6GYnPT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+FIS8ACgkQAVBC80lX
0GzIDAf/U50AodD0rWqY9ecDTxqrEPSmFoa+kZJGmnlmVZJ3IFrppebc1um7T32R
5gBJPMit1oKX2ejhT2s2VbqBWThNoSDiETQVkNSWULejfCdMQ285yJn8PSSpFgaa
66Ll8q+AFXQSwO/KH+4Tp/yETVKTIdwAldXRhxzAijhMdTWYAvnuWercb4W7Aa5T
gIa5fgNs9D3Wn4vv5fU12Wn9H2P0vBuyz7lBLCe8DHCrLyo33AjTqf35dyG7Dhta
OLRMZbhUSCgEHrshFNa9O62mbWrv58Ts86KTlGiBjRF4VaihGdXQxuoNZDZH8ilg
r3LBFjfGCZtMtbwOM5NURxKwJ4QScg==
=Why5
-----END PGP SIGNATURE-----

--Sig_/7K9Y8T0hJXHA3Alfj6GYnPT--
