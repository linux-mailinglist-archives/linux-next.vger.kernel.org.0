Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D48112AE8E8
	for <lists+linux-next@lfdr.de>; Wed, 11 Nov 2020 07:26:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgKKGZB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Nov 2020 01:25:01 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:44551 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726041AbgKKGYn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Nov 2020 01:24:43 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CWF7r2cTlz9s0b;
        Wed, 11 Nov 2020 17:24:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605075881;
        bh=2xSwQqVyZ0Ecq7NEZnOipl3btYunLnZF2jGRnhP49eY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ObBFO/2SK+G8lOjwbMC1I772oAMlpclSsngB122Bgvie27NsL4714EuUsweksQb/5
         jRouPmCkCKR3ANSkGjtAp2APs77NgDqW2zqsxi7zCWwLRKIouRt+bjItvveiJfuHOX
         T9XttWJOQobau85twbnKm1EW/OJ+5cFZYjsiBvxu8xSUXsr8dTJA+hRxlAJTxBi6Nd
         bRxCx3eKHsRo5dbqbp2rnvdTbFsSCERFvhCg6qdL8Hvx+8x4kXtqKQJB1WWbMJqmb3
         zVXinq/fcaCFr2BJ8Ej09LNper2hJems5YDzddAfgsW/wx1xNk4UPJxrS+wcIP0V/M
         1/YIwMphBGXHg==
Date:   Wed, 11 Nov 2020 17:24:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Minchan Kim <minchan@kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: Re: linux-next: manual merge of the notifications tree with Linus'
 tree
Message-ID: <20201111172439.60d5a8f0@canb.auug.org.au>
In-Reply-To: <20201021124733.344e5107@canb.auug.org.au>
References: <20201021124733.344e5107@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Bn/SVxCl+1D9c_0C_p1jnnX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Bn/SVxCl+1D9c_0C_p1jnnX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Wed, 21 Oct 2020 12:47:33 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the notifications tree got conflicts in:
>=20
>   arch/alpha/kernel/syscalls/syscall.tbl
>   arch/arm/tools/syscall.tbl
>   arch/arm64/include/asm/unistd32.h
>   arch/ia64/kernel/syscalls/syscall.tbl
>   arch/m68k/kernel/syscalls/syscall.tbl
>   arch/microblaze/kernel/syscalls/syscall.tbl
>   arch/mips/kernel/syscalls/syscall_n32.tbl
>   arch/mips/kernel/syscalls/syscall_n64.tbl
>   arch/mips/kernel/syscalls/syscall_o32.tbl
>   arch/parisc/kernel/syscalls/syscall.tbl
>   arch/powerpc/kernel/syscalls/syscall.tbl
>   arch/s390/kernel/syscalls/syscall.tbl
>   arch/sh/kernel/syscalls/syscall.tbl
>   arch/sparc/kernel/syscalls/syscall.tbl
>   arch/x86/entry/syscalls/syscall_32.tbl
>   arch/x86/entry/syscalls/syscall_64.tbl
>   arch/xtensa/kernel/syscalls/syscall.tbl
>   include/uapi/asm-generic/unistd.h
>=20
> between commit:
>=20
>   ecb8ac8b1f14 ("mm/madvise: introduce process_madvise() syscall: an exte=
rnal memory hinting API")
>=20
> from Linus' tree and commit:
>=20
>   4cd92d064cb0 ("watch_queue: Implement mount topology and attribute chan=
ge notifications")
>=20
> from the notifications tree.

Do you intend to keep this change?  If so, will you rebase it?

--=20
Cheers,
Stephen Rothwell

--Sig_/Bn/SVxCl+1D9c_0C_p1jnnX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+rg6cACgkQAVBC80lX
0Gyl9Af+Ndf52osbMBJGqQzqNAzOvK+YECIUK37okJK+0CejhOzyGlqLynwjnj+T
vcr2IsRYXTv61ZxCZPGcn1m2lWCARVgAabK0XodKi/fn9ZmiSQWHik6Jt7fpq+RS
YPzjB1C2s2YfZyAw/0RXhkvBHDSm/97aGUcfeYz3pgmRBVwtHYi3FPfQA6SClxKE
7Mz5fEJFhWvjXlqASfCCHSpYYo4RzrzKkVs0O4W1yqRCzUctQDo1KUBKOzfasDZ6
cRMs7EuaZrqLYDmJ806Cy3wisG3XvdBldaP7KnG1Zh6RLQ++Rlz2FgJMBsEUaBJF
XZstW0+LyM4qwYv+KFGvR6PlSEFBhw==
=CQD0
-----END PGP SIGNATURE-----

--Sig_/Bn/SVxCl+1D9c_0C_p1jnnX--
