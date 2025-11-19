Return-Path: <linux-next+bounces-9089-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E378FC7170C
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 00:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8569234C69D
	for <lists+linux-next@lfdr.de>; Wed, 19 Nov 2025 23:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E68B2D9491;
	Wed, 19 Nov 2025 23:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Qa4DPc0r"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4C720C490;
	Wed, 19 Nov 2025 23:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763594739; cv=none; b=nQWeVJengNeB6FgdAu+0bTZRVj3+Y1q1RFgTNkfvLJiHS9E47/gQSKoNVO/XTRk2OpvV3ZUUe+R8xOTWF9TEXSH1+qiTmrgnqItd1lsSFJ5vzD64ivsfnHNivOZI4kXGcY2A0ZHpMm0Scr+Na6BK4SF7o/DtURFaf4EmmbwqDZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763594739; c=relaxed/simple;
	bh=DFIeZIa782n9Q5TKOnc2+e/e32nLQOJJIpELR9MfjJE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CZImmZtju5xBP628sReU5ZxDgjvMjpHD7hle+o0UmcVDp5zWrZVlcxQ6E+033PMFDb+bx1xSdQk+DRbOQVDE0a/pStB9BX7DO3ooq/Abv8jH8pa8fwPbjfKxpbVYo27370sUZyyZhHgDRi4WnkMKgWoJ48H0tvLsW1mTlmdVgeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Qa4DPc0r; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763594733;
	bh=hkzH5xQEZzNqsvogeKCjGHElmw4p1N8xQl9Oe4YxIPM=;
	h=Date:From:To:Cc:Subject:From;
	b=Qa4DPc0rsC6y6NcGYNpb9aDED2WOwNs8oZAxk5wjWTI9luMuoXwZbPN/VxtigL0+X
	 a8nl1un73mWU1tDlYlKTKPJNaWTy+LNMv2O/bZJBhvJb2MaWPe9ZHwRur+dFL+Q+/2
	 ZmkL5T9eECD8qQ3Ct8Aoo0EIgGrdzGCRynUi4WBKtWY9QwVonQTWB0N7Bot6W7ccWN
	 ftHpIH7+wf+h2B5mwiszQbhJf8ugWR5l3Zc6yjXZFoFEAbFGdBZUrHbrPr/WsL1QoG
	 SGbR3iDGSRW9CV76b7JgZoAG2IrTPWvsD81tsMJ5y5GzDnymnNc8FauWwg7AZovAN+
	 6tOXSj6rg//Ew==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dBczK0jRwz4w9q;
	Thu, 20 Nov 2025 10:25:32 +1100 (AEDT)
Date: Thu, 20 Nov 2025 10:25:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Huang Ying <ying.huang@linux.alibaba.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: linux-next: manual merge of the arm64 tree with the mm-unstable
 tree
Message-ID: <20251120102532.670ba5b6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mS7XCyIyb9SbM5KbiGOfC_F";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mS7XCyIyb9SbM5KbiGOfC_F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  mm/memory.c

between commit:

  b08b123ead1a ("mm: avoid unnecessary use of is_swap_pmd()")

from the mm-unstable tree and commit:

  79301c7d605a ("mm: add spurious fault fixing support for huge pmd")

from the arm64 tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc mm/memory.c
index 50b93b45b174,6e5a08c4fd2e..000000000000
--- a/mm/memory.c
+++ b/mm/memory.c
@@@ -6342,40 -6314,37 +6369,43 @@@ retry_pud
  	if (pmd_none(*vmf.pmd) &&
  	    thp_vma_allowable_order(vma, vm_flags, TVA_PAGEFAULT, PMD_ORDER)) {
  		ret =3D create_huge_pmd(&vmf);
 -		if (!(ret & VM_FAULT_FALLBACK))
 +		if (ret & VM_FAULT_FALLBACK)
 +			goto fallback;
 +		else
  			return ret;
 -	} else {
 -		vmf.orig_pmd =3D pmdp_get_lockless(vmf.pmd);
 +	}
 =20
 -		if (unlikely(is_swap_pmd(vmf.orig_pmd))) {
 -			VM_BUG_ON(thp_migration_supported() &&
 -					  !is_pmd_migration_entry(vmf.orig_pmd));
 -			if (is_pmd_migration_entry(vmf.orig_pmd))
 -				pmd_migration_entry_wait(mm, vmf.pmd);
 +	vmf.orig_pmd =3D pmdp_get_lockless(vmf.pmd);
 +	if (pmd_none(vmf.orig_pmd))
 +		goto fallback;
 +
 +	if (unlikely(!pmd_present(vmf.orig_pmd))) {
 +		if (pmd_is_device_private_entry(vmf.orig_pmd))
 +			return do_huge_pmd_device_private(&vmf);
 +
 +		if (pmd_is_migration_entry(vmf.orig_pmd))
 +			pmd_migration_entry_wait(mm, vmf.pmd);
 +		return 0;
 +	}
 +	if (pmd_trans_huge(vmf.orig_pmd)) {
 +		if (pmd_protnone(vmf.orig_pmd) && vma_is_accessible(vma))
 +			return do_huge_pmd_numa_page(&vmf);
 +
 +		if ((flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) &&
 +		    !pmd_write(vmf.orig_pmd)) {
 +			ret =3D wp_huge_pmd(&vmf);
 +			if (!(ret & VM_FAULT_FALLBACK))
 +				return ret;
 +		} else {
- 			huge_pmd_set_accessed(&vmf);
++			vmf.ptl =3D pmd_lock(mm, vmf.pmd);
++			if (!huge_pmd_set_accessed(&vmf))
++				fix_spurious_fault(&vmf, PGTABLE_LEVEL_PMD);
++			spin_unlock(vmf.ptl);
  			return 0;
  		}
 -		if (pmd_trans_huge(vmf.orig_pmd)) {
 -			if (pmd_protnone(vmf.orig_pmd) && vma_is_accessible(vma))
 -				return do_huge_pmd_numa_page(&vmf);
 -
 -			if ((flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) &&
 -			    !pmd_write(vmf.orig_pmd)) {
 -				ret =3D wp_huge_pmd(&vmf);
 -				if (!(ret & VM_FAULT_FALLBACK))
 -					return ret;
 -			} else {
 -				vmf.ptl =3D pmd_lock(mm, vmf.pmd);
 -				if (!huge_pmd_set_accessed(&vmf))
 -					fix_spurious_fault(&vmf, PGTABLE_LEVEL_PMD);
 -				spin_unlock(vmf.ptl);
 -				return 0;
 -			}
 -		}
  	}
 =20
 +fallback:
  	return handle_pte_fault(&vmf);
  }
 =20

--Sig_/mS7XCyIyb9SbM5KbiGOfC_F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkeUewACgkQAVBC80lX
0GyUoggAnlnkd30LO6VRWOMcPPMDn8URyznWL5KwWn+eT/VpEG2U8CNSl50V29MV
6NGWyfKHWb0rV7Y5xnSoxxqQRb0FZKXCDw8puNM/EXS2x2Hw+HL7RFjWj/x7sX8W
kglNHO686U5nk734keiIeq51MOnH3Cn5TtDvrVPpbqI9i3NcjI4FvbNknffalN7r
h+tD7AmFizdSpF3Rxdvf9yWcVCyVr1f2f67X/7rbE0mL1EBYD1dYoL6M0fnmKOBj
OF5oD1x0VzW0kWYU6KRaAdebI2geVCfQj3W3JGPguCCciyw32qlkIUCn+gwWBYCE
5nVy2KsTR5QpBoIY3Ujb2rYSWmyfWg==
=x2aF
-----END PGP SIGNATURE-----

--Sig_/mS7XCyIyb9SbM5KbiGOfC_F--

