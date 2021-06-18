Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06CE23AC5F8
	for <lists+linux-next@lfdr.de>; Fri, 18 Jun 2021 10:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233719AbhFRI0i (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Jun 2021 04:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233732AbhFRI0h (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 18 Jun 2021 04:26:37 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C4EDC061574;
        Fri, 18 Jun 2021 01:24:28 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G5sQw5VTsz9sRf;
        Fri, 18 Jun 2021 18:24:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624004664;
        bh=FwPCMp6jNhNLVIMSjr0Qp4GBe17sLfHc8OMJ1/7XnVc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=A3SiUVgj6a6TcdEVupKiAFBinc0FOezvWjUoIgGvDcNSSnG4OvAKDgekg8In+PFbv
         e9z9vC4CPofzIfPPQG1lJGsGX+sHLkbKtrS43cr7TOsI9ARdrccFLiLs4j87t2JaLd
         zgBMPRC5EikkDgLNmKM9Y2Ho81eOj8uaUd1MUS4+C+1XnC7+s78E3Zboljc7vv8ddU
         xFO5YQsgDH7QHtOX5ij3CceLi1k6gIIinIHimlAdf0Z/C/84Rndr4ND/zLtPA3ofp0
         oOxAsyhhvd2y4dzDxFFeZBFx1iq8sv/y5ammygLtfxYar2ymURjZSsyG7KWnkzgsGN
         gPzW3ClRbcaGw==
Date:   Fri, 18 Jun 2021 18:24:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm tree
Message-ID: <20210618182420.5832c08b@canb.auug.org.au>
In-Reply-To: <20210616230744.34b8682f@canb.auug.org.au>
References: <20210616230744.34b8682f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dE5bM5n4PFAM=Hn6DnMQST/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dE5bM5n4PFAM=Hn6DnMQST/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 16 Jun 2021 23:07:44 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the akpm tree, today's linux-next build (sparc defconfig)
> failed like this:
>=20
> In file included from arch/sparc/include/asm/pgtable.h:7:0,
>                  from include/linux/pgtable.h:6,
>                  from include/linux/mm.h:33,
>                  from include/linux/ring_buffer.h:5,
>                  from include/linux/trace_events.h:6,
>                  from include/trace/syscall.h:7,
>                  from include/linux/syscalls.h:87,
>                  from fs/io_uring.c:45:
> arch/sparc/include/asm/pgtable_32.h: In function 'pud_pgtable':
> arch/sparc/include/asm/pgtable_32.h:157:10: warning: return makes pointer=
 from integer without a cast [-Wint-conversion]
>    return ~0;
>           ^
>=20
> and many, many more like this.
>=20
> This is an error due to (part of) the tree being built with -Werror
>=20
> Caused by commit
>=20
>   8aef6710db27 ("mm: rename pud_page_vaddr to pud_pgtable and make it ret=
urn pmd_t *")
>=20
> I have applied the following hack fix for today.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 16 Jun 2021 22:51:50 +1000
> Subject: [PATCH] mm: rename pud_page_vaddr to pud_pgtable and make it ret=
urn pmd_t * fix
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/sparc/include/asm/pgtable_32.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm=
/pgtable_32.h
> index 1e6b55425f3d..ffccfe3b22ed 100644
> --- a/arch/sparc/include/asm/pgtable_32.h
> +++ b/arch/sparc/include/asm/pgtable_32.h
> @@ -154,7 +154,7 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
>  static inline pmd_t *pud_pgtable(pud_t pud)
>  {
>  	if (srmmu_device_memory(pud_val(pud))) {
> -		return ~0;
> +		return (pmd_t *)~0;
>  	} else {
>  		unsigned long v =3D pud_val(pud) & SRMMU_PTD_PMASK;
>  		return (pmd_t *)__nocache_va(v << 4);
> --=20
> 2.30.2

Did this get missed in the latest mmotm update?  I still have to apply it .=
..

--=20
Cheers,
Stephen Rothwell

--Sig_/dE5bM5n4PFAM=Hn6DnMQST/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDMWDUACgkQAVBC80lX
0Gwn9wf/cvXgIU5kWpfxvllVs9SeKa8JrmT83u5PBg5SRJix4JAV+MQMf+NFtggF
Ir2lDnHTX8c4ldewNe/71U2xHqJD1FgCqKJE59K3dbQ9mv9EuSH9pUHzNAvbjhH7
N8F44I8tTNdHdlmAa7Ds2s5/mTTLSui2lkr+qkuyMMv8k8SEe2kr4YMog1TjZ7le
QXDa1anMRpsm+ZvVIU+/W9wTaBqceXRKyWUaHLRleI2KmAuvtXI6rV+yxbCbxDHV
RfP1VxpXtauJ/DDEnCpAoPMzmkwUNm6Iff6dk4SMwFXqTyodkOuNKqf8JuxL5Wm4
Lm4PTGcz2HaMbyMyYb8URzwZy47nsw==
=3cbW
-----END PGP SIGNATURE-----

--Sig_/dE5bM5n4PFAM=Hn6DnMQST/--
