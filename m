Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 059FC240050
	for <lists+linux-next@lfdr.de>; Mon, 10 Aug 2020 00:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726361AbgHIWj7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 9 Aug 2020 18:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbgHIWj7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 9 Aug 2020 18:39:59 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 246E6C061756;
        Sun,  9 Aug 2020 15:39:58 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BPvDR2Wnhz9sT6;
        Mon, 10 Aug 2020 08:39:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597012793;
        bh=7ka+PPpKYTC2okkl81seR+XRtYr2bKPFf+xXLPpJc2Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bnv3HvBqQxRnaAC9+tup+NY3lyuPpqGjdTVB+lKvIv2jSvc/CYc/hd9hXSj8ZpSzX
         ufrfC3IHRxmz3XzPxXBUyMirYdbAlIw6lW19nfEfxTZpyuWtaVXGl5MkaDo1jgZgIh
         eZn2Cf3iWsD9mAfOY3B8ncA0qIcz5K45SIRgmVbKYPQnoIxFwuD0AEKzurtExnnnYQ
         GXMYXJheIr2/BTjDyG511p0keAIuJe7qsWuoj8dKPAcK+8YbWguQWmoxT0D9VTajcm
         R3ZOeJIWNqDDkv8Tv4xITCmPOUfiISaEFqzrNFWugjvPQPTjFnNhkN06RKzX94+x91
         VA/3jDdnthwRQ==
Date:   Mon, 10 Aug 2020 08:39:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rich Felker <dalias@libc.org>, Guo Ren <ren_guo@c-sky.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Subject: Re: linux-next: manual merge of the sh tree with the csky tree
Message-ID: <20200810083949.4ab8963b@canb.auug.org.au>
In-Reply-To: <20200728101846.73cf063c@canb.auug.org.au>
References: <20200728101846.73cf063c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fQFP9gOGye96/Po_IrVpiCb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fQFP9gOGye96/Po_IrVpiCb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 28 Jul 2020 10:18:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the sh tree got a conflict in:
>=20
>   tools/testing/selftests/seccomp/seccomp_bpf.c
>=20
> between commit:
>=20
>   f4dd2edafba0 ("csky: add support for SECCOMP and SECCOMP_FILTER")
>=20
> from the csky tree and commit:
>=20
>   469023465e79 ("sh: Add SECCOMP_FILTER")
>=20
> from the sh tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc tools/testing/selftests/seccomp/seccomp_bpf.c
> index 8d18a0ddafdd,6eb21685c88f..000000000000
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@@ -1703,8 -1699,7 +1709,8 @@@ void change_syscall(struct __test_metad
>   	EXPECT_EQ(0, ret) {}
>  =20
>   #if defined(__x86_64__) || defined(__i386__) || defined(__powerpc__) ||=
 \
>  -	defined(__s390__) || defined(__hppa__) || defined(__riscv) || defined(=
__sh__)
>  +	defined(__s390__) || defined(__hppa__) || defined(__riscv) || \
> - 	defined(__csky__)
> ++	defined(__csky__) || defined(__sh__)
>   	{
>   		regs.SYSCALL_NUM =3D syscall;
>   	}

This is now a conflict between the sh tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/fQFP9gOGye96/Po_IrVpiCb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8wezUACgkQAVBC80lX
0GxMSgf+Iu3w44IN5Z9wHbexiHvSw70evUEHDsNosbeETDWVBLRE9UHR5JSirOWG
aTGwRD2Gb+p99WAUPzhr8s+YcTbHsEQXnX3FJIp3AKHF++J7Z4UlSW8uLO4wAZDQ
eXhIJ5c5V0lm5jxLPgXT1HJCk7+5VrfkVHTEVVSXqx4BtbWVhsGMeUIH+nuinAfw
K553FnpPfr5O40o8qvsOinsPrYQ8xn7BIB0HmjltswJv0sdAyHlkVNGBjiHw0IKy
ta3XmynHn/gD15kkr5jap7Hf6CPUzCokQE0KvNBXFBnme/GQQXg9ErUCskN+I41d
X+3Wso3RP4nWMWMpQns9dOZ6/p1PzA==
=AT+g
-----END PGP SIGNATURE-----

--Sig_/fQFP9gOGye96/Po_IrVpiCb--
