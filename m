Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B973F2DA0DC
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 20:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393414AbgLNTva (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 14:51:30 -0500
Received: from ozlabs.org ([203.11.71.1]:57949 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387981AbgLNTva (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Dec 2020 14:51:30 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvsSl20Wlz9sSC;
        Tue, 15 Dec 2020 06:50:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607975448;
        bh=SiM6OolBIVz1VZDedujcSYZU0SwArZpvblJttzS4JjE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oUcWc2wcSLG6vMdRDxFvulBd1QpfwBzPcm+OWiXjNzwkR1ei7aE+IAMfWabc6sPkx
         l6iBqgpVnQThJ3MxkFYpySVa/m5hK7Aoq6BksLz9KSJguTgJTWJVibqFm+gGAk/0WM
         H5TTvDoaeDhs7FT4pnGnVRzBBTGRtlrBtrc5woaG1TDdOpmdMWx36QWcHLx8++IxWB
         rSZjDYtFiJj0oocBE/svGaxEN2e4qm74nKLW4NtKnvlrvirL+lX8uBWJtMJVOgtzus
         qMo1Z8JRD/jqEDDcs746ZMl7nSP8U4m12ia+cTB46j5h5NzCOwEuLmH/c3wQ6x2H0W
         4Wz/WUNFu87Fw==
Date:   Tue, 15 Dec 2020 06:50:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm tree
Message-ID: <20201215065045.66421c34@canb.auug.org.au>
In-Reply-To: <20201116104444.044486ea@canb.auug.org.au>
References: <20201105175031.00e0b081@canb.auug.org.au>
        <20201116104444.044486ea@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zipSDVKtS6Y4nnGDoufGEAU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zipSDVKtS6Y4nnGDoufGEAU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 16 Nov 2020 10:44:44 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Thu, 5 Nov 2020 17:50:31 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > After merging the drm tree, today's linux-next build (htmldocs) produced
> > these warnings:
> >=20
> > include/linux/dma-buf-map.h:106: warning: Excess function parameter 'va=
ddr' description in 'DMA_BUF_MAP_INIT_VADDR'
> > include/linux/dma-buf-map.h:106: warning: Function parameter or member =
'vaddr_' not described in 'DMA_BUF_MAP_INIT_VADDR'
> > include/linux/dma-buf-map.h:106: warning: Excess function parameter 'va=
ddr' description in 'DMA_BUF_MAP_INIT_VADDR'
> >=20
> > Introduced by commit
> >=20
> >   20e76f1a7059 ("dma-buf: Use struct dma_buf_map in dma_buf_vunmap() in=
terfaces") =20
>=20
> I am still getting these warnings.

I am still getting these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/zipSDVKtS6Y4nnGDoufGEAU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/XwhUACgkQAVBC80lX
0Gzr1Af/eCI35O+38wh7zrAhZRf2O0N1uLLg7rhej+NLPT0BOHDiQjnd94G0sTNG
BnWkiVmWdqh9HmZwdDsb//5jI6Vs/72GuzKJlEG4agXg/dGdBoNqOaoplIKgiDut
KxticwmdfHmCf6Mn2gnToWY192hvMEYhYjGXSbNCXlWPmBHtB1skgqG718y0GIR1
EQsxW8EWXaRxQDJdVyBiVoeZninP/3dfSupIUke6AFGTmCSeOflpS7RHcLZJsZh/
Q9iApjPyrFZB09IieWsPtoY7z9hJKh4y7qzBaXLcEr+DIFyBSq7XiYizKRdKeINv
Bm/PxL+gdu2KpJ5LJWM/KO67AmYYiA==
=8UTM
-----END PGP SIGNATURE-----

--Sig_/zipSDVKtS6Y4nnGDoufGEAU--
