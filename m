Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE5B240052
	for <lists+linux-next@lfdr.de>; Mon, 10 Aug 2020 00:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgHIWn5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 9 Aug 2020 18:43:57 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60853 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726323AbgHIWn4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 9 Aug 2020 18:43:56 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BPvK65BSQz9sT6;
        Mon, 10 Aug 2020 08:43:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597013035;
        bh=4nMOKZaWxxwngO9iJuEubL5v26JVaec30V8Us1Hi4NQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=V5bIbYjztGzMMhJXp4DlnwK7TkKuqoXpQVpOv1/jxSrxTW5vGIDU0hllyyQFnJ8U7
         Nw2hKRvJQ+mPGcyZp2POwdY7tmD3UI7fHS9M0d9b9RkXhLRBgfZu9CpAIwZMy++EcG
         TvJHOkVNpwrObGznL+rb7Drh9VaLYcFDqh6I3SGMXeYAVm0yFScINTPcXg82xX9ESU
         PWywjOr/sS0RT8B7QD6siTdxUlskc+S2BN5TsAUqUa0s0LMJHBikoidYGMLz+K8ykH
         qud/Nvv2AKlpW8XCsjVsER2Db6QrMZi979l3I+muhrU4nAI0NsRhmWqxypDr4CtKw7
         CpApeAnYjf+1A==
Date:   Mon, 10 Aug 2020 08:43:53 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jerry Snitselaar <jsnitsel@redhat.com>
Subject: Re: linux-next: manual merge of the iommu tree with the dma-mapping
 tree
Message-ID: <20200810084353.7833a05c@canb.auug.org.au>
In-Reply-To: <20200730152006.7d012668@canb.auug.org.au>
References: <20200730152006.7d012668@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/d/ml_pyDAUDBho1m+xE2+/n";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/d/ml_pyDAUDBho1m+xE2+/n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 30 Jul 2020 15:20:06 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the iommu tree got a conflict in:
>=20
>   drivers/iommu/Kconfig
>=20
> between commit:
>=20
>   2f9237d4f6df ("dma-mapping: make support for dma ops optional")
>=20
> from the dma-mapping tree and commit:
>=20
>   ab65ba57e3ac ("iommu/vt-d: Move Kconfig and Makefile bits down into int=
el directory")
>=20
> from the iommu tree.
>=20
> I fixed it up (I used the ;atter and applied the folowing merge fix
> patch as well) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 30 Jul 2020 15:14:18 +1000
> Subject: [PATCH] merge fix for "dma-mapping: make support for dma ops opt=
ional"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/iommu/intel/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/iommu/intel/Kconfig b/drivers/iommu/intel/Kconfig
> index 877beec9d987..5337ee1584b0 100644
> --- a/drivers/iommu/intel/Kconfig
> +++ b/drivers/iommu/intel/Kconfig
> @@ -6,6 +6,7 @@ config DMAR_TABLE
>  config INTEL_IOMMU
>  	bool "Support for Intel IOMMU using DMA Remapping Devices"
>  	depends on PCI_MSI && ACPI && (X86 || IA64)
> +	select DMA_OPS
>  	select IOMMU_API
>  	select IOMMU_IOVA
>  	select NEED_DMA_MAP_STATE
> --=20
> 2.27.0

This is now a conflict between the iommu tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/d/ml_pyDAUDBho1m+xE2+/n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8wfCkACgkQAVBC80lX
0Gzy7ggAk0qx9Isx6ouK1wW//cagE/kg+LT5Yn/j4+CXquJCLmzx/F4iDD3Guco5
u6pcNuZPVGE6SVEbNAxrgjHfGkkRp2xAof99zcKqcsZIdFUvTmDjXuVTLgmdNPpe
k6XExwYQrvy0iFnDJT7yv2p+KzQpp6xzBtsV/PEgrgMXwyUiAPI8x/HK3dtKbeLb
VrxFNx8FTWJphvpP5wmNk3AIa874N71lFVGTfc30dFgxyjo0W1hIkwepEgXNYOZ0
FelhRZckji2RbET5pJK+FbsMGW+i5Si2FAoOxEugi2wtOUqVKhQ3/e7FuZ6/QedI
RnDeO3kyhfB2yddTKkq8WMLqo3fDbA==
=xDj+
-----END PGP SIGNATURE-----

--Sig_/d/ml_pyDAUDBho1m+xE2+/n--
