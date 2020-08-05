Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD20423C28C
	for <lists+linux-next@lfdr.de>; Wed,  5 Aug 2020 02:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727957AbgHEASI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Aug 2020 20:18:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726788AbgHEASI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Aug 2020 20:18:08 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE21C06174A;
        Tue,  4 Aug 2020 17:18:08 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BLsf570n4z9sR4;
        Wed,  5 Aug 2020 10:18:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596586686;
        bh=pow6c+JnSdcVxC8CKIGSGqXlWyzMAXaUMRNXNWJ8Rso=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cvoUNqgScztPDNbGPwWdzUxVjaHm98HYVXTz9TmR1k3yxuysFeXWmR5ofgnEoJ7vC
         6Hh4HRbGpHgbUnUUO5G+cFlLi81AfwI8xjogH9g4Z34pSS+m7irTPg91OUx1AlzRb5
         icG+RgjRcJttMa2gEmY7oF+AQ01rE4CT1KcDvepLBy6/Ma7FJ791L8mm38ZdcLEUba
         yPCuiVaIUIUOGzp8FRW7/dXrvfeaEdYtWdjdZjPFeFLFRCi9NMzGVpRVQLS88HuSqZ
         C1Nb63yo5d2eBLTNhLmYNhEhNPAvLe6c4Yoyzz6VihkWbNxzq60QY0+2hpiACnVzwr
         wCtfN0B179zWg==
Date:   Wed, 5 Aug 2020 10:18:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Guo Ren <ren_guo@c-sky.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tobias Klauser <tklauser@distanz.ch>
Subject: Re: linux-next: manual merge of the pidfd tree with the csky tree
Message-ID: <20200805101805.32c157b1@canb.auug.org.au>
In-Reply-To: <20200706150613.738d3c7c@canb.auug.org.au>
References: <20200706150613.738d3c7c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mw3y=enAj8Np03PeUTt3fCz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mw3y=enAj8Np03PeUTt3fCz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 6 Jul 2020 15:06:13 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the pidfd tree got a conflict in:
>=20
>   arch/csky/kernel/process.c
>=20
> between commit:
>=20
>   29adb883aa77 ("csky: remove unusued thread_saved_pc and *_segments func=
tions/macros")
>=20
> from the csky tree and commit:
>=20
>   714acdbd1c94 ("arch: rename copy_thread_tls() back to copy_thread()")
>=20
> from the pidfd tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc arch/csky/kernel/process.c
> index 3da63cf0bfde,28cfeaaf902a..000000000000
> --- a/arch/csky/kernel/process.c
> +++ b/arch/csky/kernel/process.c
> @@@ -30,7 -30,17 +30,7 @@@ asmlinkage void ret_from_kernel_thread(
>    */
>   void flush_thread(void){}
>  =20
> - int copy_thread_tls(unsigned long clone_flags,
>  -/*
>  - * Return saved PC from a blocked thread
>  - */
>  -unsigned long thread_saved_pc(struct task_struct *tsk)
>  -{
>  -	struct switch_stack *sw =3D (struct switch_stack *)tsk->thread.sp;
>  -
>  -	return sw->r15;
>  -}
>  -
> + int copy_thread(unsigned long clone_flags,
>   		unsigned long usp,
>   		unsigned long kthread_arg,
>   		struct task_struct *p,

This is now a conflict between the csky tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/mw3y=enAj8Np03PeUTt3fCz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8p+r0ACgkQAVBC80lX
0GydFgf/Q8vaf9Hf0ziZCZbVvGwg3gNDiNlHBfnKDPKWsPZUsTzp+knx2lSzYG4+
MAFyFoqmBeLIqEzgoFv4rQdQdx4qKOLDHjR5wLV1XYgCpF7FgpwboxiwAzn01UQn
Gl0qnYZoSPa5IJgdALzVViQylYOiErofgcKh9wNhz4wS+UJ4nSgvO51PUR08CdLs
A3XpRVDhW3M8ZpuwUGsGIAXf/hFqzOXTAY/c8nVGdRMbVlUGxU/dT8Iwq5e4PxJ0
S5ujZxfUPqz3Hyd6RVKxPVdvcgfU5jlYYCNhLQZPDD8srCs8sx13HhJr7xEnfpts
0Y0DtIrElIHftuyP4vInSgLtaMmveg==
=yszt
-----END PGP SIGNATURE-----

--Sig_/mw3y=enAj8Np03PeUTt3fCz--
