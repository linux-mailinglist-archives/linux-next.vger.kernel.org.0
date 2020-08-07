Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8D8723E541
	for <lists+linux-next@lfdr.de>; Fri,  7 Aug 2020 02:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbgHGAmh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Aug 2020 20:42:37 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52467 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725998AbgHGAmg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 6 Aug 2020 20:42:36 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BN65M4MR4z9sTC;
        Fri,  7 Aug 2020 10:42:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596760953;
        bh=jRNJx5IfknaND6+jGAaPwyuYIvtYOZjhhbHZBTHzTqU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HEuQszfwZ5Yx7GM8Fjf05TsHNRdKQhtsozdXgo7u1Tv7Xl3f6Cl2pk1FYntcgzzb+
         4Jq8DwmzQqMAap2K+nh/ovtW4OpUnVIUEuzQAq/N/DFeKjGXTzg6Z5KWkEe58su95t
         ndBHcdfHCo4L6DOSyOn1ZiLzIaD3hT1+Sdp1HE+9lcxbss5kDsKsw5Rg9VcgL0/O/r
         DzTl3MztgdUljUOhg3/iR2GBjfyaLxkZjocR+pGxl0uP2VUOmOtKavKteJJd9mYAzb
         zuFB+qD4bOIi6T8z0sFK8ItEIYMrsUX3hvy/uIEvYIHq7FUJprOkFolGGi96YSLYfR
         QE2CxBc3jZjGQ==
Date:   Fri, 7 Aug 2020 10:42:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Max Filippov <jcmvbkbc@gmail.com>, Rich Felker <dalias@libc.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Subject: Re: linux-next: manual merge of the xtensa tree with the sh tree
Message-ID: <20200807104230.7f659cbb@canb.auug.org.au>
In-Reply-To: <20200728102330.11f78570@canb.auug.org.au>
References: <20200728102330.11f78570@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1wtY195/p6ODi2.NtLB12DW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1wtY195/p6ODi2.NtLB12DW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 28 Jul 2020 10:23:30 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the xtensa tree got a conflict in:
>=20
>   tools/testing/selftests/seccomp/seccomp_bpf.c
>=20
> between commit:
>=20
>   469023465e79 ("sh: Add SECCOMP_FILTER")
>=20
> from the sh tree and commit:
>=20
>   deccfc9ce639 ("selftests/seccomp: add xtensa support")
>=20
> from the xtensa tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc tools/testing/selftests/seccomp/seccomp_bpf.c
> index 06d994a34997,1b445c2e7fbe..000000000000
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@@ -124,8 -122,8 +124,10 @@@ struct seccomp_data=20
>   #  define __NR_seccomp 358
>   # elif defined(__s390__)
>   #  define __NR_seccomp 348
>  +# elif defined(__sh__)
>  +#  define __NR_seccomp 372
> + # elif defined(__xtensa__)
> + #  define __NR_seccomp 337
>   # else
>   #  warning "seccomp syscall number unknown for this architecture"
>   #  define __NR_seccomp 0xffff
> @@@ -1634,10 -1624,14 +1636,18 @@@ TEST_F(TRACE_poke, getpid_runs_normally
>   # define SYSCALL_SYSCALL_NUM regs[4]
>   # define SYSCALL_RET	regs[2]
>   # define SYSCALL_NUM_RET_SHARE_REG
>  +#elif defined(__sh__)
>  +# define ARCH_REGS	struct pt_regs
>  +# define SYSCALL_NUM	gpr[3]
>  +# define SYSCALL_RET	gpr[0]
> + #elif defined(__xtensa__)
> + # define ARCH_REGS	struct user_pt_regs
> + # define SYSCALL_NUM	syscall
> + /*
> +  * On xtensa syscall return value is in the register
> +  * a2 of the current window which is not fixed.
> +  */
> + #define SYSCALL_RET(reg) a[(reg).windowbase * 4 + 2]
>   #else
>   # error "Do not know how to find your architecture's registers and sysc=
alls"
>   #endif
> @@@ -1710,7 -1704,7 +1720,7 @@@ void change_syscall(struct __test_metad
>  =20
>   #if defined(__x86_64__) || defined(__i386__) || defined(__powerpc__) ||=
 \
>   	defined(__s390__) || defined(__hppa__) || defined(__riscv) || \
> - 	defined(__csky__) || defined(__sh__)
>  -	defined(__xtensa__)
> ++	defined(__csky__) || defined(__sh__) || defined(__xtensa__)
>   	{
>   		regs.SYSCALL_NUM =3D syscall;
>   	}

This is now a conflict between the sh tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/1wtY195/p6ODi2.NtLB12DW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8so3YACgkQAVBC80lX
0GxTRAf9GNvBk6UmbMk9jCAC13xvYqY5oLUeFiieeeitAdEzpIjGLCV5SfqbILPy
eb6U+B1whGmdBvOeOXB+fVAg1/iKy6V1+mfEzAeCpGsJDIOHa1ApXSyYEE+InVTn
yOJDO8Bv4qkAHQ2u5uY/lINz+IkhDUV/2saUEdKFHqnhAtbAjt1yU5q9WlSTaiMa
VqC71qZLZcC+HdBeUgkmYqXbzlnqXgWjEJ/KOcH1xZzbyZDesnuPdBhgztKxGezH
s/dO3sV5RD91MuSyZ+MMC2EAjz+b3LMO/LaIzdvcWzKKHhQdoLTPEneOYxRy/w/A
TzCQth3WFGX+rj+itrqpxw+Bl09aqw==
=kyJW
-----END PGP SIGNATURE-----

--Sig_/1wtY195/p6ODi2.NtLB12DW--
