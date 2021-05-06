Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 603EC374CE5
	for <lists+linux-next@lfdr.de>; Thu,  6 May 2021 03:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhEFBe3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 May 2021 21:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbhEFBe2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 5 May 2021 21:34:28 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 006BBC061574;
        Wed,  5 May 2021 18:33:29 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FbGLT2dVSz9sRf;
        Thu,  6 May 2021 11:33:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620264805;
        bh=As4u6JGsuKsh735yt+Kt6L02htYKLMZj8E3IGhFRXwc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UUxcpABDIOhMBay5IKLhnp3JVUZ0nIBhXEevwOqp5A6uQ6LzRET5bFzp0Bsefay7Q
         YeNFMyu4W+BU8jfNRZcvz61/ZJt7OabgOdOb9q8/VeH1LZPAQryDUwLcXx8shAf9xX
         FFAw/7CUmp1Q9TLlAHvFtlpqjZ8YflKwIL8tR5+iS48bKDjEXshkteK+ZToRSrzGkW
         5ygPDGpGVKwlGqCaWwowi2aIBEgM1iUxP7i5iPzeyz1XAABOpA3vSBEu5AdflUzkYe
         iE+Tt/vOXj05Qk8RNsVnZZFEBBaqvUu9xMJajuLljEWni2/hJprdBbDskkOTX27RCa
         a2pd+RNWzhFpA==
Date:   Thu, 6 May 2021 11:33:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Oscar Salvador <osalvador@suse.de>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 risc-v tree
Message-ID: <20210506113319.3fdf410f@canb.auug.org.au>
In-Reply-To: <20210312173702.18c4512a@canb.auug.org.au>
References: <20210312173702.18c4512a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zX=aDu/y=vIQ0yQnBGz5Pf2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zX=aDu/y=vIQ0yQnBGz5Pf2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 12 Mar 2021 17:37:02 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Tomorrow's linux-next merge of the akpm-current tree will get a
> conflict in:
>=20
>   Documentation/admin-guide/kernel-parameters.txt
>=20
> between commit:
>=20
>   f6e5aedf470b ("riscv: Add support for memtest")
>=20
> from the risc-v tree and commit:
>=20
>   6b8f5ba8661b ("mm,memory_hotplug: add kernel boot option to enable memm=
ap_on_memory")
>=20
> from the akpm-current tree.
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
> diff --cc Documentation/admin-guide/kernel-parameters.txt
> index b816481dfaef,04b4e76be65b..000000000000
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@@ -2800,23 -2802,7 +2808,23 @@@
>   			seconds.  Use this parameter to check at some
>   			other rate.  0 disables periodic checking.
>  =20
>  +	memory_hotplug.memmap_on_memory
>  +			[KNL,X86,ARM] Boolean flag to enable this feature.
>  +			Format: {on | off (default)}
>  +			When enabled, memory to build the pages tables for the
>  +			memmap array describing the hot-added range will be taken
>  +			from the range itself, so the memmap page tables will be
>  +			self-hosted.
>  +			Since only single memory device ranges are supported at
>  +			the moment, this option is disabled by default because
>  +			it might have an impact on workloads that needs large
>  +			contiguous memory chunks.
>  +			The state of the flag can be read in
>  +			/sys/module/memory_hotplug/parameters/memmap_on_memory.
>  +			Note that even when enabled, there are a few cases where
>  +			the feature is not effective.
>  +
> - 	memtest=3D	[KNL,X86,ARM,PPC] Enable memtest
> + 	memtest=3D	[KNL,X86,ARM,PPC,RISCV] Enable memtest
>   			Format: <integer>
>   			default : 0 <disable>
>   			Specifies the number of memtest passes to be

This is now a conflict between the risc-v tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/zX=aDu/y=vIQ0yQnBGz5Pf2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCTR18ACgkQAVBC80lX
0GwnHgf+OpNUwYJWTzhmmxAX0c9X2kgjqX+4RTBp5rZs0ZcWU7QDlc0wnVeapikC
Pf9i7DsBXFq9hGxKhvGeWUoavsHTLO7UOFjWcB7aokSQDdilHWAhFfGJXq3yOukj
Gk7/IX7I+GtxTQ/mEvwL8/qTv0bnslFGptEapdn9W5+GRsfjT0ZK6mebIrlCRWaL
T70XlNSck1lkQhJFKx6P63tz2wTUtA7/BJ+uv8uoDUT2qq+b3npOzHbqlLfG81xm
Wrs+Ciy2MXanjTcAwAMihsy9W+wQdnlybG/XMuGNgmT/75uWcBI0q/6Yg/Iljlwz
IUodvVR58BvV3PMW9vUA/VogM0gOkg==
=Ac0P
-----END PGP SIGNATURE-----

--Sig_/zX=aDu/y=vIQ0yQnBGz5Pf2--
