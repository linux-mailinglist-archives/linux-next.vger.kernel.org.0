Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 099782DCA81
	for <lists+linux-next@lfdr.de>; Thu, 17 Dec 2020 02:26:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388949AbgLQBYk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Dec 2020 20:24:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731391AbgLQBYk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Dec 2020 20:24:40 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE024C061794;
        Wed, 16 Dec 2020 17:23:59 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CxDmC3yH1z9sTX;
        Thu, 17 Dec 2020 12:23:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608168237;
        bh=TnFujtbZ+cKkokGS0FUWxHGmo/iJu4wjsqoiJItDnPE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=iyz4hzeTPD2R9vkZGfL2dA2jENrCamZCLhVnHBlQ1nNI18Jfwbf40U9mSi2JsfsJR
         JI+lhSR2Cr63OQfumtF5OxPaW/K14IUANyWhobctS9o/cW99vhSI6Y46GXK+TeK4B5
         EhTiuXek4LutFiKuSWX5ijgn2Di4i7ltgRe/9liMuSOi2dKHqaMzkg1/E0R4uK5FhO
         iwOp4a5jYFdbA63rNYgAcTlit5wx+N/bxEiftCTpsEmSiuolwVNoOCVA1zmX6R3rYg
         95O7xAFV5qDznk91S9GimUWYuO5C3zMQ/NPLNR/OtuCX7wQMU3XnR1ZU/LrcBmX1CM
         lUH/YgS2YdOsA==
Date:   Thu, 17 Dec 2020 12:23:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Guo Ren <ren_guo@c-sky.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Guo Ren <guoren@linux.alibaba.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        YiFei Zhu <yifeifz2@illinois.edu>
Subject: Re: linux-next: manual merge of the seccomp tree with the csky tree
Message-ID: <20201217122354.6ad6b052@canb.auug.org.au>
In-Reply-To: <20201125173824.0e3dbcd7@canb.auug.org.au>
References: <20201125173824.0e3dbcd7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_YEESlslusO/vFPud8uiykD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_YEESlslusO/vFPud8uiykD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi aa,

On Wed, 25 Nov 2020 17:38:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the seccomp tree got a conflict in:
>=20
>   arch/csky/include/asm/Kbuild
>=20
> between commit:
>=20
>   fed76f8679a6 ("csky: Add QUEUED_SPINLOCKS supported")
>=20
> from the csky tree and commit:
>=20
>   6e9ae6f98809 ("csky: Enable seccomp architecture tracking")
>=20
> from the seccomp tree.
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
> diff --cc arch/csky/include/asm/Kbuild
> index f814d46d347f,93372255984d..000000000000
> --- a/arch/csky/include/asm/Kbuild
> +++ b/arch/csky/include/asm/Kbuild
> @@@ -3,9 -3,6 +3,8 @@@ generic-y +=3D asm-offsets.
>   generic-y +=3D gpio.h
>   generic-y +=3D kvm_para.h
>   generic-y +=3D local64.h
>  +generic-y +=3D mcs_spinlock.h
>   generic-y +=3D qrwlock.h
>  +generic-y +=3D qspinlock.h
> - generic-y +=3D seccomp.h
>   generic-y +=3D user.h
>   generic-y +=3D vmlinux.lds.h

This is now a conflict between the csky tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/_YEESlslusO/vFPud8uiykD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/asyoACgkQAVBC80lX
0GyzmwgApaL3mGGiGQANYUuXgT4qThPujLzmYt3JqHLWamGbLmpZnoCtQzK/Aw4d
Bwyhc+nHe5PEWnPH6/8vWoFdjj1JE7FdWREnvZvAD1nj4N7mX1CczAEbbnEcLLqO
8ZMak2e7UDW0aNJfdvqXTbMSV3oDqeB0bPlLpkB8Kim3SOMGSyGPg0ZPuZ4rlKv+
AKiuRAJ6R1rb1n7Em5iIUJsCcxQxWdO/o45j8gdc0LOnY4eTJr0g7LLTdB4M6Fxm
Ch95I3QX8PVhA8ruHcVbaklntnfnc1WVsuBqknuyMe4vv453QQz7qDZhhFhpBOnM
EaUjGVPCbwaRRq0tjMrxI2q/8R3S3g==
=kmnD
-----END PGP SIGNATURE-----

--Sig_/_YEESlslusO/vFPud8uiykD--
