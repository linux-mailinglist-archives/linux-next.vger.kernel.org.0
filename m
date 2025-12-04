Return-Path: <linux-next+bounces-9320-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C503ACA223E
	for <lists+linux-next@lfdr.de>; Thu, 04 Dec 2025 03:02:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 837DA3024891
	for <lists+linux-next@lfdr.de>; Thu,  4 Dec 2025 02:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DE81E2614;
	Thu,  4 Dec 2025 02:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bt3jyKo4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C053315853B;
	Thu,  4 Dec 2025 02:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764813759; cv=none; b=OC+cNWSLmsAaUgY2smnznUIQ3KtdNCRacHWNyoNNfZT5NpFzm2vtLDv0jaBtoFSyJs8/kKxJab+uNRhtr9Nh8+zRx6KOuLxOCkTT5paU3QWD1g3pJXtv/sc8xlE6JZGfZeIFNcKPpsAe8AMGR6/PAo/IFAFTlajpFcMUHofyC/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764813759; c=relaxed/simple;
	bh=/6FRLU2b3MchkLqtfbeNVzyg1BlnXUrUAgPEovc9huA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NHd02P1arHdf+xpZjl50bHOBkYi4lnAs+v6BjNhRiC+R//nsYxY6FMiJkg7RLNNtbzUGYacpW+5ZlK8QExHUN/iNSVMigpC+Kh7J/ghKAPfziuunofCLoWIg7VzZfUggDc/FaZhqLPTihjK/lbU9xfxmv4ssnTKsOEEimFP7cz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bt3jyKo4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764813754;
	bh=NFG2hM85FsqVCjSrW0HnTUKp931E0Z8qoe+8VDVX7sA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bt3jyKo4Mp/LRSuaZ3avBZAS8gp7GbtZmgttCd6OarjyXjGmcMqtFFqkSm08YGSrk
	 DVuCopAFVuTWv1MDV+rzPxHZto7e5fz+sGT06Alb20Rh2kelYbJTAFX9QmwSNiIPqI
	 f8LsNeydVdVCN1BGMVvDcsfNVolaH7Zx6QB6jJaS0x5yTn3mjbxIEfCezYeG661soG
	 BvLI6hU03kZIdg5NLDoBjCNIh0gmNoQpoY7ejwwniDGxPgZnSBSozGTaiWAFKDJg9O
	 Nsiyn1k+JY589KOq19GEAoOX09NCuMcENqgqU03br6JhLoWBpOCKF1j+lBoOAN+ZfI
	 o6pGX7giIWpTg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMHp15BPZz4w9r;
	Thu, 04 Dec 2025 13:02:33 +1100 (AEDT)
Date: Thu, 4 Dec 2025 13:02:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Huang Ying <ying.huang@linux.alibaba.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Huang, Ying" <ying.huang@linux.alibaba.com>
Subject: Re: linux-next: manual merge of the arm64 tree with the mm-unstable
 tree
Message-ID: <20251204130233.5a24b42c@canb.auug.org.au>
In-Reply-To: <20251120102532.670ba5b6@canb.auug.org.au>
References: <20251120102532.670ba5b6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Xrws0F.0+AcRq3iNuQKBZ/a";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Xrws0F.0+AcRq3iNuQKBZ/a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 20 Nov 2025 10:25:32 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the arm64 tree got a conflict in:
>=20
>   mm/memory.c
>=20
> between commit:
>=20
>   b08b123ead1a ("mm: avoid unnecessary use of is_swap_pmd()")
>=20
> from the mm-unstable tree and commit:
>=20
>   79301c7d605a ("mm: add spurious fault fixing support for huge pmd")
>=20
> from the arm64 tree.
>=20
> I fixed it up (I think - see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>=20
>=20
> diff --cc mm/memory.c
> index 50b93b45b174,6e5a08c4fd2e..000000000000
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@@ -6342,40 -6314,37 +6369,43 @@@ retry_pud
>   	if (pmd_none(*vmf.pmd) &&
>   	    thp_vma_allowable_order(vma, vm_flags, TVA_PAGEFAULT, PMD_ORDER)) {
>   		ret =3D create_huge_pmd(&vmf);
>  -		if (!(ret & VM_FAULT_FALLBACK))
>  +		if (ret & VM_FAULT_FALLBACK)
>  +			goto fallback;
>  +		else
>   			return ret;
>  -	} else {
>  -		vmf.orig_pmd =3D pmdp_get_lockless(vmf.pmd);
>  +	}
>  =20
>  -		if (unlikely(is_swap_pmd(vmf.orig_pmd))) {
>  -			VM_BUG_ON(thp_migration_supported() &&
>  -					  !is_pmd_migration_entry(vmf.orig_pmd));
>  -			if (is_pmd_migration_entry(vmf.orig_pmd))
>  -				pmd_migration_entry_wait(mm, vmf.pmd);
>  +	vmf.orig_pmd =3D pmdp_get_lockless(vmf.pmd);
>  +	if (pmd_none(vmf.orig_pmd))
>  +		goto fallback;
>  +
>  +	if (unlikely(!pmd_present(vmf.orig_pmd))) {
>  +		if (pmd_is_device_private_entry(vmf.orig_pmd))
>  +			return do_huge_pmd_device_private(&vmf);
>  +
>  +		if (pmd_is_migration_entry(vmf.orig_pmd))
>  +			pmd_migration_entry_wait(mm, vmf.pmd);
>  +		return 0;
>  +	}
>  +	if (pmd_trans_huge(vmf.orig_pmd)) {
>  +		if (pmd_protnone(vmf.orig_pmd) && vma_is_accessible(vma))
>  +			return do_huge_pmd_numa_page(&vmf);
>  +
>  +		if ((flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) &&
>  +		    !pmd_write(vmf.orig_pmd)) {
>  +			ret =3D wp_huge_pmd(&vmf);
>  +			if (!(ret & VM_FAULT_FALLBACK))
>  +				return ret;
>  +		} else {
> - 			huge_pmd_set_accessed(&vmf);
> ++			vmf.ptl =3D pmd_lock(mm, vmf.pmd);
> ++			if (!huge_pmd_set_accessed(&vmf))
> ++				fix_spurious_fault(&vmf, PGTABLE_LEVEL_PMD);
> ++			spin_unlock(vmf.ptl);
>   			return 0;
>   		}
>  -		if (pmd_trans_huge(vmf.orig_pmd)) {
>  -			if (pmd_protnone(vmf.orig_pmd) && vma_is_accessible(vma))
>  -				return do_huge_pmd_numa_page(&vmf);
>  -
>  -			if ((flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) &&
>  -			    !pmd_write(vmf.orig_pmd)) {
>  -				ret =3D wp_huge_pmd(&vmf);
>  -				if (!(ret & VM_FAULT_FALLBACK))
>  -					return ret;
>  -			} else {
>  -				vmf.ptl =3D pmd_lock(mm, vmf.pmd);
>  -				if (!huge_pmd_set_accessed(&vmf))
>  -					fix_spurious_fault(&vmf, PGTABLE_LEVEL_PMD);
>  -				spin_unlock(vmf.ptl);
>  -				return 0;
>  -			}
>  -		}
>   	}
>  =20
>  +fallback:
>   	return handle_pte_fault(&vmf);
>   }
>  =20

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Xrws0F.0+AcRq3iNuQKBZ/a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkw67kACgkQAVBC80lX
0GzGRgf+OrBdSrxzkZIGQltw3qhZ4TM6IcDveYtXkUJAWkfKylOPNg8l4eaU3cf7
oYefBSGcXw0gudoTEB34/b5DMESBbNHa8qbK78K5UXA5Kz7nGfE1rAAW4c7Q3ly4
1ZiQSsp1K6QiowemdYm8q1VNnv5FSRUa+waIfGyuK8+YNhD0M3ZdCsTixs57ynaN
WoUJGPijrILJOAiQPzzGfg91GelHE4LH4GoQ6G/kQc2fFoA1yGaM/nwnvHq78oGo
eoNHmbKlYmn1LyDO/AE1knrI6PKXbmCNwjjqYZdaSIQiuZBVenWlPfUO/frXiWjx
/Kvjf5MHgVqEs1hOIwsbrfXcFJUcMw==
=xLgW
-----END PGP SIGNATURE-----

--Sig_/Xrws0F.0+AcRq3iNuQKBZ/a--

