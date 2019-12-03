Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 775D310F557
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2019 04:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbfLCDDE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Dec 2019 22:03:04 -0500
Received: from ozlabs.org ([203.11.71.1]:42311 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbfLCDDE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Dec 2019 22:03:04 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Rmxv4SfRz9sNx;
        Tue,  3 Dec 2019 14:02:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1575342181;
        bh=a1ZIQEFe2YFFyWoEnTwoUf5EuGzvtCnYJIDi0O/mMmA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZATQ9yYYD5syt0EGTFF/nrMhWh/tJIzbJwF+aVeF5Bs0Efbivyz13O1WzsJhm3THE
         Cl6eEh6IL2ADmcV/QjtH95mvum0xoEPtLEGyqEqbVfWzog7nwJ95XQcc+JT25KtJbk
         3NiTnuYjUKBhmYTwwFDyVHX9vFhfdvYAD+qO97EYV/W26LBACVtuRjDjIsPvRq9fCA
         I6/zNTtTMQnoOpSnRaNT+z+MuR3v7Hvpfiaj0m5RNb4tEIJw6QCZRprKEgoRZ2V/6d
         m1GbHnTnmiHe/YHtoFp1g+qTJNa/xQq8GEEvTmlzYad5v+8+truJiH3m3Ngzsf49MY
         tcvpDr+cRuXQQ==
Date:   Tue, 3 Dec 2019 14:02:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Safonov <dima@arista.com>
Subject: Re: linux-next: manual merge of the y2038 tree with the tip tree
Message-ID: <20191203140259.33291393@canb.auug.org.au>
In-Reply-To: <20191127130139.0b16375c@canb.auug.org.au>
References: <20191127130139.0b16375c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nXyU9mSw0+QD_B3HHXlZvgc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nXyU9mSw0+QD_B3HHXlZvgc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

This is now a conflict between the tip tree and Linus' tree.

On Wed, 27 Nov 2019 13:01:39 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the y2038 tree got a conflict in:
>=20
>   kernel/time/time.c
>=20
> between commit:
>=20
>   7b8474466ed9 ("time: Zero the upper 32-bits in __kernel_timespec on 32-=
bit")
>=20
> from the tip tree and commit:
>=20
>   3ca47e958a64 ("y2038: remove CONFIG_64BIT_TIME")
>=20
> from the y2038 tree.
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
> diff --cc kernel/time/time.c
> index 4d434dad6ebc,58e312e7380f..000000000000
> --- a/kernel/time/time.c
> +++ b/kernel/time/time.c
> @@@ -884,8 -879,7 +882,7 @@@ int get_timespec64(struct timespec64 *t
>   	ts->tv_sec =3D kts.tv_sec;
>  =20
>   	/* Zero out the padding for 32 bit systems or in compat mode */
> - 	if (IS_ENABLED(CONFIG_64BIT_TIME) && (!IS_ENABLED(CONFIG_64BIT) ||
> - 					      in_compat_syscall()))
>  -	if (in_compat_syscall())
> ++	if (!IS_ENABLED(CONFIG_64BIT) || in_compat_syscall())
>   		kts.tv_nsec &=3D 0xFFFFFFFFUL;
>  =20
>   	ts->tv_nsec =3D kts.tv_nsec;

--=20
Cheers,
Stephen Rothwell

--Sig_/nXyU9mSw0+QD_B3HHXlZvgc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3l0GMACgkQAVBC80lX
0GyxGwf7BBAAeMU/3GxYclcypuXgTLwy2sd7dwgDZTtL343btbZvpaPbGRdGPB+Y
KIwDOd+2KeBFyQC0+bYja57Qv2uTPDa9dhmtXedRm1UCVE+8yhMoVJnPM/KnZLG/
yhLaXedn8dGx7RyuHqiqzktsQQ2tiUiCKNAnl8CygJX5OwcW9Eu2r8Wmp3bQ5rWR
iTCg2Evp/F56v19fFsyClm/8S5cAqCsfb83kptLGTJrVkk7OpgLJPyIt69B7kdU3
QiWR/HZwX24VhPZk8x144/t1M1PXM9S0JVxYs3/FL8DDHYVR/rxh2u2GE9YcqVfW
f2bYuxzgSjzwIRKh5L5MxWoMYnSgxA==
=Ycig
-----END PGP SIGNATURE-----

--Sig_/nXyU9mSw0+QD_B3HHXlZvgc--
