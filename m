Return-Path: <linux-next+bounces-4811-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3F79D318C
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 01:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88274B228BE
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 00:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C512A920;
	Wed, 20 Nov 2024 00:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="M5rzBuy7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7654617F7;
	Wed, 20 Nov 2024 00:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732064342; cv=none; b=LaEN4w17neNXYzxck/wA92rgpeY1RekHFQ+ZrSbg/w54c1NjtSEZRvozGfn9SbCkGEtjH1xsECSkYJo1GGsxEtCC+gRnil5CnqKkEctHPPi0bJFe9r3/R2jIX7HevBaNCIn74V8ksIKV8k4Uo5lCg7RXYmB40jF+j/XbufsSZ2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732064342; c=relaxed/simple;
	bh=dPsVuIqByVSEzbk5ELNgNs2vWgnwvzg+/r8zPH/FiOs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KmmyPi27YEVfOAtWYwYlcql2GqbOB9vr+zSkc5IVc5Z3dBal66AjUCKJMhb39AW6tQy/e7wMSszrwQ72+qdmes5nbQ3jIh1TiSl6HBSoi26W0iyL6LnoY0YtJQjN7QZY/aW+TTG8SZDLtM7F2ejPqJy/DtyGF71jv2ROZx5DO2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=M5rzBuy7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732064333;
	bh=xQKMHJUS0U1xYBofJyWPqIk+kiRjyymfvR4VnSs6We8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=M5rzBuy7HumMq83n/L5B4R3SnLxHTBnp1ejjChl9XL9s4M+JZQZwwi1ZuzZ7c285J
	 kZGdCU4PRjuwDIQABvfU+ZZAe9mo84mroLO0esomJ1HdoeTVDplqFn9Wb5aJtdx/DZ
	 pMcfmbJmGIF3JMcOH2FhRqPeMU76333YzxlodJZ5PRfnBSsp3h/MVs0YE/EMbtHNUN
	 p79YkX7gZTLO6Md3K1G7j5JOKeXru9BzHDUOHPXNYnMRC5kY7oiLDV4wm2IW7rym5Z
	 izcSa9Cdexh1IbUomRFHPS5ld0qUhXWThyC8aRiyS/jJvbwIaXCTFIhVInVsti6r8l
	 ljG9SzaauvMiw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XtNKT29vHz4x04;
	Wed, 20 Nov 2024 11:58:52 +1100 (AEDT)
Date: Wed, 20 Nov 2024 11:58:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Mike Rapoport (Microsoft)"
 <rppt@kernel.org>, Steven Price <steven.price@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>
Subject: Re: linux-next: manual merge of the arm64 tree with the mm tree
Message-ID: <20241120115855.582867a7@canb.auug.org.au>
In-Reply-To: <20241024103709.082a6950@canb.auug.org.au>
References: <20241024103709.082a6950@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.E1IF2pE2BqD4+Vqg6eA/Ou";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.E1IF2pE2BqD4+Vqg6eA/Ou
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 24 Oct 2024 10:37:09 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the arm64 tree got a conflict in:
>=20
>   arch/arm64/mm/pageattr.c
>=20
> between commit:
>=20
>   040ee4186d6c ("arch: introduce set_direct_map_valid_noflush()")
>=20
> from the mm-unstable branch of the mm tree and commit:
>=20
>   42be24a4178f ("arm64: Enable memory encrypt for Realms")
>=20
> from the arm64 tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc arch/arm64/mm/pageattr.c
> index 01225900293a,6ae6ae806454..000000000000
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@@ -192,16 -202,86 +202,96 @@@ int set_direct_map_default_noflush(stru
>   				   PAGE_SIZE, change_page_range, &data);
>   }
>  =20
>  +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool v=
alid)
>  +{
>  +	unsigned long addr =3D (unsigned long)page_address(page);
>  +
>  +	if (!can_set_direct_map())
>  +		return 0;
>  +
>  +	return set_memory_valid(addr, nr, valid);
>  +}
>  +
> + static int __set_memory_enc_dec(unsigned long addr,
> + 				int numpages,
> + 				bool encrypt)
> + {
> + 	unsigned long set_prot =3D 0, clear_prot =3D 0;
> + 	phys_addr_t start, end;
> + 	int ret;
> +=20
> + 	if (!is_realm_world())
> + 		return 0;
> +=20
> + 	if (!__is_lm_address(addr))
> + 		return -EINVAL;
> +=20
> + 	start =3D __virt_to_phys(addr);
> + 	end =3D start + numpages * PAGE_SIZE;
> +=20
> + 	if (encrypt)
> + 		clear_prot =3D PROT_NS_SHARED;
> + 	else
> + 		set_prot =3D PROT_NS_SHARED;
> +=20
> + 	/*
> + 	 * Break the mapping before we make any changes to avoid stale TLB
> + 	 * entries or Synchronous External Aborts caused by RIPAS_EMPTY
> + 	 */
> + 	ret =3D __change_memory_common(addr, PAGE_SIZE * numpages,
> + 				     __pgprot(set_prot),
> + 				     __pgprot(clear_prot | PTE_VALID));
> +=20
> + 	if (ret)
> + 		return ret;
> +=20
> + 	if (encrypt)
> + 		ret =3D rsi_set_memory_range_protected(start, end);
> + 	else
> + 		ret =3D rsi_set_memory_range_shared(start, end);
> +=20
> + 	if (ret)
> + 		return ret;
> +=20
> + 	return __change_memory_common(addr, PAGE_SIZE * numpages,
> + 				      __pgprot(PTE_VALID),
> + 				      __pgprot(0));
> + }
> +=20
> + static int realm_set_memory_encrypted(unsigned long addr, int numpages)
> + {
> + 	int ret =3D __set_memory_enc_dec(addr, numpages, true);
> +=20
> + 	/*
> + 	 * If the request to change state fails, then the only sensible cause
> + 	 * of action for the caller is to leak the memory
> + 	 */
> + 	WARN(ret, "Failed to encrypt memory, %d pages will be leaked",
> + 	     numpages);
> +=20
> + 	return ret;
> + }
> +=20
> + static int realm_set_memory_decrypted(unsigned long addr, int numpages)
> + {
> + 	int ret =3D __set_memory_enc_dec(addr, numpages, false);
> +=20
> + 	WARN(ret, "Failed to decrypt memory, %d pages will be leaked",
> + 	     numpages);
> +=20
> + 	return ret;
> + }
> +=20
> + static const struct arm64_mem_crypt_ops realm_crypt_ops =3D {
> + 	.encrypt =3D realm_set_memory_encrypted,
> + 	.decrypt =3D realm_set_memory_decrypted,
> + };
> +=20
> + int realm_register_memory_enc_ops(void)
> + {
> + 	return arm64_mem_crypt_ops_register(&realm_crypt_ops);
> + }
> +=20
>   #ifdef CONFIG_DEBUG_PAGEALLOC
>   void __kernel_map_pages(struct page *page, int numpages, int enable)
>   {

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/.E1IF2pE2BqD4+Vqg6eA/Ou
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc9NE8ACgkQAVBC80lX
0Gw9CwgApF0IrpbE9J73WhmxnMDvnYz2f0l2l0iDvA+HHcVFIvXivMxktZwHcS14
35ZEBUMFN4ZbtWJCAolNtnyP3B2xwLfGH5b5/MQMx31SOaz6P1f8/cLAT6VjCqHV
SgoIHTbmrXrSIrTSruFHMe4TCz8H69bB3mJYG7T6loKsAPdMg3+rZhxKg8vTec/w
z+xLY/Scz8L3kLfvHTSIxEraE6BxroKEt8utcZDAJBtmTahlVaWzI0UWcq5ANN/h
P+4xBckpn+zS1clobRI7CtK4MkKvpt1tcmOqWSl9+XT1InAHcls3CwMraOLz/AMf
CNRVlTZXabuEaSTJzn+vJGFWRUqMrQ==
=DVGe
-----END PGP SIGNATURE-----

--Sig_/.E1IF2pE2BqD4+Vqg6eA/Ou--

