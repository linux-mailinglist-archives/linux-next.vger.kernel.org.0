Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B26023C289
	for <lists+linux-next@lfdr.de>; Wed,  5 Aug 2020 02:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgHEARA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Aug 2020 20:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726788AbgHEAQ7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Aug 2020 20:16:59 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 396ACC06174A;
        Tue,  4 Aug 2020 17:16:58 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BLscl56ZXz9sR4;
        Wed,  5 Aug 2020 10:16:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596586616;
        bh=QEIL/b6Uvy6EtcBZLDtXzJXWTkQH4VBl3I8dxxOX9ZI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=T5OipL0dWt2WtB2tAPY4tP+dszHlPMkRQEbszY6m8RKUH0i7aKgiKa90lDBuGs9x6
         t4jL3issuAcAEV0xSJocV5RPNpEmUqSr3MiVUdZCUyXeD40846pk9sNg/XUI0ElpIh
         KNfMw88GLXZoLCKpiJSN/vdRoGFXIcA0UJ8ER4OEwge6NOXLyvKzpw+/GR375fWnIL
         TOn7sRpH8RnfrIUkqNbGbV0dlsyglbhvHUYD+IW7DtXOj7K6puVc9liTb6/5WIvX1v
         fIezGXsgA2LMma7EUOio20U911bOoY2WS3nYM8DIn/n7kgRgkxYRiHWZAbvO9qS7l9
         nISHlq6lY2jYA==
Date:   Wed, 5 Aug 2020 10:16:53 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Guo Ren <ren_guo@c-sky.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the pidfd tree with the csky tree
Message-ID: <20200805101653.079ef4c0@canb.auug.org.au>
In-Reply-To: <20200803182550.4c7df8ae@canb.auug.org.au>
References: <20200803182550.4c7df8ae@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M+qq5ZXwvr_PHwdkPTQSKK2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/M+qq5ZXwvr_PHwdkPTQSKK2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 3 Aug 2020 18:25:50 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the pidfd tree got a conflict in:
>=20
>   arch/csky/Kconfig
>=20
> between commits:
>=20
>   e95a4f8cb985 ("csky: Add SECCOMP_FILTER supported")
>   953131e5b5a5 ("csky: Use top-down mmap layout")
>   bdcd93ef9afb ("csky: Add context tracking support")
>=20
> from the csky tree and commit:
>=20
>   140c8180eb7c ("arch: remove HAVE_COPY_THREAD_TLS")
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
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc arch/csky/Kconfig
> index af238739811e,902f1142d550..000000000000
> --- a/arch/csky/Kconfig
> +++ b/arch/csky/Kconfig
> @@@ -39,11 -38,6 +39,10 @@@ config CSK
>   	select GX6605S_TIMER if CPU_CK610
>   	select HAVE_ARCH_TRACEHOOK
>   	select HAVE_ARCH_AUDITSYSCALL
>  +	select HAVE_ARCH_MMAP_RND_BITS
>  +	select HAVE_ARCH_SECCOMP_FILTER
> - 	select HAVE_COPY_THREAD_TLS
>  +	select HAVE_CONTEXT_TRACKING
>  +	select HAVE_VIRT_CPU_ACCOUNTING_GEN
>   	select HAVE_DEBUG_BUGVERBOSE
>   	select HAVE_DYNAMIC_FTRACE
>   	select HAVE_DYNAMIC_FTRACE_WITH_REGS

This is now a conflict between the csky tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/M+qq5ZXwvr_PHwdkPTQSKK2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8p+nUACgkQAVBC80lX
0GyWaAf/THy6RPlZTASdT+BQuHHYYjmPVMQ8bW2Qvq31d+zxBE9r+3c1mzNG3JtT
Wr/daJamiKmlRxyEU85f49H43pC1uHTD3aZ7tKrqQJNBnFPpWM8ljaGvolvBKfj3
E79km3retsRxcVk6ebt4/zLUEMnUzNQQOhM2QA7EAnvp448El4hA0xwHNhx5a8Rk
d/mpNuaZqGt7QO/t9GY4SOi/tkw1VhE4HYIZmvNFhpAsTYAndFat0J07BGGLaA19
QDDjkmSn1StwaRFLyMPqxtI8xZ8grQfP/qhl1TEw4YIfoUTrfz72JeU0v7PnZey1
qY9zMW8UyGw7/2EsYnj8pHjzUaSO2w==
=0op+
-----END PGP SIGNATURE-----

--Sig_/M+qq5ZXwvr_PHwdkPTQSKK2--
