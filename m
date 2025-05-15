Return-Path: <linux-next+bounces-6785-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BFCAB8000
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 10:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC9551BA6E8E
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 08:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F219284B4B;
	Thu, 15 May 2025 08:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="F5AEXmFx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD521E0E08;
	Thu, 15 May 2025 08:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747296863; cv=none; b=aCsIvU5FNOYpZh8ZtHpmDuVSisqOLl9x6rltckzMQ8S5L3ZenzG6YbTK2IbJILkRu7p2XgsmxRrJKDwZ/Id2ScZKYqawjkH6eWiI6mvA6hjt+7DNb29gCifQdN+RnaGSIZRouVMjNoRafxaTYcK9bzWnz1HtVxRMdhYq57JoZPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747296863; c=relaxed/simple;
	bh=XM1eqMpcg+t2ZtQwuWYYjSlAcLCEY9gs2OBdffgmX74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ME3onp+duzt2urYmcO7TnRxarcF7Y39QJ+UpDqLI9DqOF1/J+oOLRQqFqrehEAoXw/pKuvlvqTA1wtEtiLb9HacrLR8+IjQDYy9hdyKdDWfmwco8n8qVqhbx4AcElyPeTvhLf9qUCvPuqkf6mpT7p6yu8i9ZtBJNFmclT3NjMVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=F5AEXmFx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747296856;
	bh=Usb534oc0GkUVSDJGUUCLoGE2h4LZ1RiACjkJpJzRcY=;
	h=Date:From:To:Cc:Subject:From;
	b=F5AEXmFxj9x+3Md5/yxuxrosRSGdFNG0GGWp8enb+T1I/Pfxy9d07XNAgrIDKUFhz
	 epc5ivZjP0yQdrKozpKe88P20OmpSkQY37wbXyFc1JJjwfO7bdw1VJjer8dDTp1tEf
	 OeN11FjIoSMZkrDX//9D2sc2iNTtBfnAUTOKzUEhKh0WMlS04We3oixEByeIIsVstJ
	 sfaAw3MKVr4COKFutoGzp1xSTA9/eE5/yPz76RSnDBIzVvLP3W21mzDa548+JYGGjH
	 gJRzkAm5aveL8TjTrDZrG2oXGv5lNyQpB8/5gN789c/u3jjfwQSTEsaJsCXbwHLR6T
	 cHBsqgbE8X9+w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zyjfb0wf2z4wcn;
	Thu, 15 May 2025 18:14:15 +1000 (AEST)
Date: Thu, 15 May 2025 18:14:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wei Liu <wei.liu@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Ashish Kalra <ashish.kalra@amd.com>, "Borislav Petkov (AMD)"
 <bp@alien8.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, Roman Kisel
 <romank@linux.microsoft.com>
Subject: linux-next: manual merge of the hyperv tree with the tip-fixes tree
Message-ID: <20250515181414.354d8ef7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1li4/kuB_8W7c6j+4YPYNJ7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1li4/kuB_8W7c6j+4YPYNJ7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the hyperv tree got a conflict in:

  arch/x86/coco/sev/core.c

between commit:

  d2062cc1b1c3 ("x86/sev: Do not touch VMSA pages during SNP guest memory k=
dump")

from the tip-fixes tree and commit:

  266a5698a408 ("arch/x86: Provide the CPU number in the wakeup AP callback=
")

from the hyperv tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/coco/sev/core.c
index fae73ae5a486,7780d55d1833..000000000000
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@@ -869,12 -1166,26 +869,12 @@@ static void *snp_alloc_vmsa_page(int cp
  	return page_address(p + 1);
  }
 =20
- static int wakeup_cpu_via_vmgexit(u32 apic_id, unsigned long start_ip)
 -static void snp_cleanup_vmsa(struct sev_es_save_area *vmsa, int apic_id)
 -{
 -	int err;
 -
 -	err =3D snp_set_vmsa(vmsa, NULL, apic_id, false);
 -	if (err)
 -		pr_err("clear VMSA page failed (%u), leaking page\n", err);
 -	else
 -		free_page((unsigned long)vmsa);
 -}
 -
+ static int wakeup_cpu_via_vmgexit(u32 apic_id, unsigned long start_ip, un=
signed int cpu)
  {
  	struct sev_es_save_area *cur_vmsa, *vmsa;
 -	struct ghcb_state state;
  	struct svsm_ca *caa;
 -	unsigned long flags;
 -	struct ghcb *ghcb;
  	u8 sipi_vector;
- 	int cpu, ret;
+ 	int ret;
  	u64 cr4;
 =20
  	/*

--Sig_/1li4/kuB_8W7c6j+4YPYNJ7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmglolYACgkQAVBC80lX
0GzUwwf/QFrrv7GG5ZzvxQBf6XLjQ9pVqV1IUwihbAmX+3AkiFpcC3eg9CKEOviN
/PGn47/RnGt0QIFVOenIrslN78gXSpkIR05TABveEF0B2Bt7Lj9LPHsKXbcCAlnS
IMwhFg+dpfZpNpXfJQcZronGNDc+PdCmd9rDFVdUDKkwqA3uTDgQCRpl4/h6Hs1T
uxtacQzZELSn+bVcznwcnGcXgbUK/SllXkDoSuhRtRcCTESckZT40tkrlQwi2AKu
kMEuRp1S75WLtEPcav8lb3BxaP8GPGTDquYzAXmPnGjlCRuVQZs4Hv5KYF2X14lt
1m3AUyKrzPc+3DQ3ZhmVUgW6HxAjlA==
=WFb0
-----END PGP SIGNATURE-----

--Sig_/1li4/kuB_8W7c6j+4YPYNJ7--

