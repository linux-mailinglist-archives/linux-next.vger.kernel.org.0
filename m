Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A63451E8B98
	for <lists+linux-next@lfdr.de>; Sat, 30 May 2020 00:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727947AbgE2Wze (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 18:55:34 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52761 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726943AbgE2Wze (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 May 2020 18:55:34 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Yfzd3twpz9sPK;
        Sat, 30 May 2020 08:55:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590792932;
        bh=hlq9Gk53DS+vS3yu7QEECnMoYWkjZ/s/2MGtx8XKcic=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dwmkTOCSLJbocrMvVKUYGOsSZ5tK/49ihOJtwiHMybsvmIX8NkrkaKcL4eI82y0aU
         VOQYg2ErmZ0FiSz48whqn3FawjcqCNy2usEr3J2sipPm4A4KTVy+OO1iC7GuV8shCb
         f8gcCm3vTsspw42NmRRDmdyuPmZUnUI96J3VBfKPmOYPk+qkmlcwoac37QaG0VuxPc
         mG6+U30xQNe04X1rGGPn0O2OdTX0Bix3bmiU09oNQrMQijxcp2+PCYAtwGBeaKiPvd
         0EWCuGgfQs90pjroOA8MeT7wW0OpZ+9YsnqTgk9WxWO/xb2Iom/WfPQZ2cfu9HeEHB
         pbktS4MtbVSaQ==
Date:   Sat, 30 May 2020 08:55:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bibo Mao <maobibo@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the mips
 tree
Message-ID: <20200530085524.4100c6b7@canb.auug.org.au>
In-Reply-To: <20200529141546.8fcc75eecdba416a26e269cf@linux-foundation.org>
References: <20200528192943.2bb04a5e@canb.auug.org.au>
        <20200529141546.8fcc75eecdba416a26e269cf@linux-foundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qSXS0ubrsWpgYjYLpPOCovh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qSXS0ubrsWpgYjYLpPOCovh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Fri, 29 May 2020 14:15:46 -0700 Andrew Morton <akpm@linux-foundation.org=
> wrote:
>
> On Thu, 28 May 2020 19:29:43 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >=20
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@@ -2752,9 -2748,6 +2749,8 @@@ static vm_fault_t wp_page_copy(struct v
> >   		/* Free the old page.. */
> >   		new_page =3D old_page;
> >   		page_copied =3D 1;
> >  +	} else {
> >  +		update_mmu_tlb(vma, vmf->address, vmf->pte);
> > - 		mem_cgroup_cancel_charge(new_page, memcg, false);
> >   	}
> >  =20
> >   	if (new_page) =20
>=20
> We decided that the update_mmu_tlb() call is no longer needed here, so
> there is no need to re-add it when resolving this.

OK, I have fixed up my merge resolution to remove those 2 lines.
--=20
Cheers,
Stephen Rothwell

--Sig_/qSXS0ubrsWpgYjYLpPOCovh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7RktwACgkQAVBC80lX
0Gw7ywf/dTJorFgMGny5RowX5Gl3y+F5FiJawxbXCOyCNvoOcE7dIMKmaPkwwQqI
X4KR+k/hbdKe3UawOkXz1mM2nPduI8FAyx3VNUsG4/ryapKC94m25A12kPbh9zFB
caXT/W97F+frr8kcNZxmSecdAWaPBGMz1XTPXliKXgHzjvyUZpTb9hD7VTGM12ZP
m5rVcUu0/EwFmWfjOYd5FD7i75mbyDLbr72VYwE5e1SiTlHg9pyhSX/wNAeb85oz
E8a+4cUPRrw6xXo3oiw1/LJSIRlLy9tU2iXRGHrTLPaTijtkstyxfeqV8QrBv8M0
TUw5ONFrK8x6QBZtxroZV5ZA9dIr4g==
=QxKx
-----END PGP SIGNATURE-----

--Sig_/qSXS0ubrsWpgYjYLpPOCovh--
