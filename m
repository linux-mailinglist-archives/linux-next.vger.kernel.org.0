Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3E1631E9C1
	for <lists+linux-next@lfdr.de>; Thu, 18 Feb 2021 13:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbhBRMZl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Feb 2021 07:25:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231586AbhBRLjZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Feb 2021 06:39:25 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2898FC06178A;
        Thu, 18 Feb 2021 03:37:43 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DhCKd0DFpz9sRN;
        Thu, 18 Feb 2021 22:34:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613648069;
        bh=VXSHB3U6S26m/drvh4a+pj7NEw/q1khXZJuZz7rXrUE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gSDkhirLQjnW2lGMxOvtuxAzGo2ioIuv5CvfP5rSvUVRaJfJ0/pY+PnvMH7yjbMv6
         aiUp6KFRUxGgfE6W7DRqdRsqFVq94lAHCeL/AX/V3XKfqxvxTlwtYlMh9a7EUzLbwr
         QWTYPtWvUvQVU41GTcQpVzX+5OCe0YhyCtvfL0qy8T5PUM6SwWcgcHFR7XHNF+cOU6
         T+L8ztT6lJiIfcbtbX5OBY4xNJMLRnrVMiH8h0Dt2lqyD/0nRVkyaTt5ZOrfwyPR/m
         kCK0dLmoDJfwFaObw1b9SltvI1ODpAIPiZq3vZtpzLk9EzP4a8tReJd+47WXOD9Kja
         I2KjLPCYEMe+A==
Date:   Thu, 18 Feb 2021 22:34:27 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Rob Herring <robherring2@gmail.com>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: linux-next: manual merge of the devicetree tree with the
 powerpc tree
Message-ID: <20210218223427.77109d83@canb.auug.org.au>
In-Reply-To: <874ki9vene.fsf@mpe.ellerman.id.au>
References: <20210218144815.5673ae6f@canb.auug.org.au>
        <874ki9vene.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Krv4dNl2WGCiT=lWt4ozErY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Krv4dNl2WGCiT=lWt4ozErY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Thu, 18 Feb 2021 21:44:37 +1100 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> I think it just needs this?
>=20
> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
> index 87e34611f93d..0492ca6003f3 100644
> --- a/arch/powerpc/kexec/elf_64.c
> +++ b/arch/powerpc/kexec/elf_64.c
> @@ -104,7 +104,7 @@ static void *elf64_load(struct kimage *image, char *k=
ernel_buf,
> =20
>  	fdt =3D of_kexec_alloc_and_setup_fdt(image, initrd_load_addr,
>  					   initrd_len, cmdline,
> -					   fdt_totalsize(initial_boot_params));
> +					   kexec_fdt_totalsize_ppc64(image));
>  	if (!fdt) {
>  		pr_err("Error setting up the new device tree.\n");
>  		ret =3D -EINVAL;
>=20

I thought about that, but the last argument to
of_kexec_alloc_and_setup_fdt() is extra_fdt_size and the allocation
done is for this:

fdt_size =3D fdt_totalsize(initial_boot_params) +
                   (cmdline ? strlen(cmdline) : 0) +
                   FDT_EXTRA_SPACE +
                   extra_fdt_size;

and kexec_fdt_totalsize_ppc64() also includes
fdt_totalsize(initial_boot_params) so I was not sure.  Maybe
kexec_fdt_totalsize_ppc64() needs modification as well?

--=20
Cheers,
Stephen Rothwell

--Sig_/Krv4dNl2WGCiT=lWt4ozErY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAuUMMACgkQAVBC80lX
0GzMywf/Vkwbwfcyt2jmZE4boVwAlJBei33m6JzQD/llGlrkrbm66R5c8eGWe32d
K9z2RTBFuqqc+RAcYHIoh39nP/ENoYXYMlJsxOptGMv3pRGjP5ptI5wJm9BxtZtD
NJ+zSqPmndklUwNSkzaoZPtbs7d/BpIR+jkLt10w8YMnFeyshBiwPJGcZlhmrUfM
i9kF3NgF1dQCXWtDValsb0SCVlza1GdMNZGI+g62Ykv2IscKZ1tVfOYgfTZ5DZNZ
Yfsqs9CaTnLrnQaY8ai0jLplJPojHbZ3CCmInS6/rSo+K3Pa6KpFtYYgXRYLU72E
Tinhkws2VRmnyOM6lr7w+fhYaaKEqw==
=Ze8C
-----END PGP SIGNATURE-----

--Sig_/Krv4dNl2WGCiT=lWt4ozErY--
