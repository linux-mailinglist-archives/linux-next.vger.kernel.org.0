Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0753119A3E7
	for <lists+linux-next@lfdr.de>; Wed,  1 Apr 2020 05:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731574AbgDADOO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Mar 2020 23:14:14 -0400
Received: from ozlabs.org ([203.11.71.1]:47957 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731556AbgDADON (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 31 Mar 2020 23:14:13 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48sWWQ2WXjz9sPF;
        Wed,  1 Apr 2020 14:14:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585710852;
        bh=qppD3VaBMroI5+kNa0d+EAkJTB/0+a4Msi+tMCBmFF0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pC20x8sPHjqGIHNic38SUWahdy0y1+QHMg6pxSpzOacDGDHrYQjTXCF1HBnYdGOrF
         24FlgA1Ssp1dvvSDYQcmCjmyFoVt5dYwcszXA5Ca6Zk5LS4lEtMsd0Fj6JJCFZn7ao
         fGgG4xQ5nAdqID4HsOliea/xLqHnKfn1MKs3JwMNKN+AqGyfSYJZsSsz4UtSWKiT0A
         lRC9rUVJU0ndhW3NBbhwYHjIdNcYzmkw5VJv4BfOuzhivdOEQi04J8vOyvdfZDawyr
         Qwt79AVC6K01aBUFAgr2qFhbJ+FxuNs7qBwvTNQ/Fb3U+Vm9qqGh6uhvWDfT44vkaC
         vchWG/iJr4k9g==
Date:   Wed, 1 Apr 2020 14:14:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Gayatri Kammela <gayatri.kammela@intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Borislav Petkov <bp@suse.de>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the tip
 tree
Message-ID: <20200401141409.446e989b@canb.auug.org.au>
In-Reply-To: <20200326150523.02c4ec48@canb.auug.org.au>
References: <20200326150523.02c4ec48@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UCk/pWw7YoTr5yoPdAvwp5g";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UCk/pWw7YoTr5yoPdAvwp5g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 26 Mar 2020 15:05:23 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drivers-x86 tree got a conflict in:
>=20
>   drivers/platform/x86/intel_pmc_core.c
>=20
> between commit:
>=20
>   a69b3b1d4cf0 ("platform/x86: Convert to new CPU match macros")
>=20
> from the tip tree and commit:
>=20
>   16292bed9c56 ("platform/x86: intel_pmc_core: Add Atom based Jasper Lake=
 (JSL) platform support")
>=20
> from the drivers-x86 tree.
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
> diff --cc drivers/platform/x86/intel_pmc_core.c
> index 3df33ff50faa,d265cd5b1f45..000000000000
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@@ -871,18 -1144,19 +1144,19 @@@ static inline void pmc_core_dbgfs_unreg
>   #endif /* CONFIG_DEBUG_FS */
>  =20
>   static const struct x86_cpu_id intel_pmc_core_ids[] =3D {
>  -	INTEL_CPU_FAM6(SKYLAKE_L, spt_reg_map),
>  -	INTEL_CPU_FAM6(SKYLAKE, spt_reg_map),
>  -	INTEL_CPU_FAM6(KABYLAKE_L, spt_reg_map),
>  -	INTEL_CPU_FAM6(KABYLAKE, spt_reg_map),
>  -	INTEL_CPU_FAM6(CANNONLAKE_L, cnp_reg_map),
>  -	INTEL_CPU_FAM6(ICELAKE_L, icl_reg_map),
>  -	INTEL_CPU_FAM6(ICELAKE_NNPI, icl_reg_map),
>  -	INTEL_CPU_FAM6(COMETLAKE, cnp_reg_map),
>  -	INTEL_CPU_FAM6(COMETLAKE_L, cnp_reg_map),
>  -	INTEL_CPU_FAM6(TIGERLAKE_L, tgl_reg_map),
>  -	INTEL_CPU_FAM6(TIGERLAKE, tgl_reg_map),
>  -	INTEL_CPU_FAM6(ATOM_TREMONT, tgl_reg_map),
>  -	INTEL_CPU_FAM6(ATOM_TREMONT_L, tgl_reg_map),
>  +	X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE_L,		&spt_reg_map),
>  +	X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE,		&spt_reg_map),
>  +	X86_MATCH_INTEL_FAM6_MODEL(KABYLAKE_L,		&spt_reg_map),
>  +	X86_MATCH_INTEL_FAM6_MODEL(KABYLAKE,		&spt_reg_map),
>  +	X86_MATCH_INTEL_FAM6_MODEL(CANNONLAKE_L,	&cnp_reg_map),
>  +	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_L,		&icl_reg_map),
>  +	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_NNPI,	&icl_reg_map),
>  +	X86_MATCH_INTEL_FAM6_MODEL(COMETLAKE,		&cnp_reg_map),
>  +	X86_MATCH_INTEL_FAM6_MODEL(COMETLAKE_L,		&cnp_reg_map),
>  +	X86_MATCH_INTEL_FAM6_MODEL(TIGERLAKE_L,		&tgl_reg_map),
>  +	X86_MATCH_INTEL_FAM6_MODEL(TIGERLAKE,		&tgl_reg_map),
>  +	X86_MATCH_INTEL_FAM6_MODEL(ATOM_TREMONT,	&tgl_reg_map),
> ++	X86_MATCH_INTEL_FAM6_MODEL(ATOM_TREMONT_L,	&tgl_reg_map),
>   	{}
>   };
>  =20


This is now a conflict between the drivers-x86 tree and Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/UCk/pWw7YoTr5yoPdAvwp5g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6EBwEACgkQAVBC80lX
0Gxm8wf/S+jju3n5XIGVmNeohmJdVMA6fIb3xe2owDjd5Fgb+Arkk6YFodbksHWb
ce+Snn0W6nWyj8FjskI42ng2VQulHwWIOdEsRLEpG1bpiasMO1h2pqHNDYx28YtL
GP2kWRLRnVT4Iw+Xjy0OlHZN8uF/o8aXc1NvhtbItdmFWpDGfrhXM4Y9RrE92oXW
eGSkfhF0ndyC6TPlYk5yN6NWUZa7KKMYw2NIiB993xMYPzV4zK8gn1SgikoGL0gX
AOUv5ioolioyi2QFFuBOYJJZ905TRR13ej4ea9YmYouuNlPiJ2XkLuIXZAAwNpHb
aMG+IppKi3p8mJ3dvcFWfnc3/uP+2g==
=hn46
-----END PGP SIGNATURE-----

--Sig_/UCk/pWw7YoTr5yoPdAvwp5g--
