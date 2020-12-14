Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50CE42DA177
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 21:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502799AbgLNUZr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 15:25:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502983AbgLNUZh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 15:25:37 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C4B5C0613D3;
        Mon, 14 Dec 2020 12:24:57 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvtD64wtSz9s0b;
        Tue, 15 Dec 2020 07:24:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607977495;
        bh=geJe/dQTScUt1rlFSJVvjotS+qgEY1WuqzHhLRBERnI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AUttmobgOXzU0zVDxipPlDPyymHYSH8FiM+e5AKb5levX3TD6OPAgm+C19yiHKcC1
         5MISZ4MP0Xe/DxiGVasopArg+RL2TvHkQCLf67KBpI1hYu+5l3B3/5Ee9ZNVdil0bN
         SbRR03ChRFiwU1BHRFX9OQzcl+E/rfKgWNysBlZxHsWEYN+25vb9XXo3r4tmdvQjMj
         /GOhnSNTk4Dlr0Uzx+w0sKrI2R6sBuCKzLqGWl/WHiXIl868EyrfCJGxOzk+4xqOEE
         7qD7btq7eUqESnmu62+3TdeL+tEv8J6uiaxZTN3Biaz2eUS4G3MsUVJDJqewmj5GZW
         pQ0Dq4OmpnH4Q==
Date:   Tue, 15 Dec 2020 07:24:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Minchan Kim <minchan@kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: Re: linux-next: manual merge of the notifications tree with Linus'
 tree
Message-ID: <20201215072453.3b61bdc9@canb.auug.org.au>
In-Reply-To: <20201021124733.344e5107@canb.auug.org.au>
References: <20201021124733.344e5107@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jtq9dvA+9Kfd8J/YkiGFfeL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jtq9dvA+9Kfd8J/YkiGFfeL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

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

Just a reminder that I am still getting this conflict.

--=20
Cheers,
Stephen Rothwell

--Sig_/jtq9dvA+9Kfd8J/YkiGFfeL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/XyhUACgkQAVBC80lX
0GxHqAf9ETA8/9ciUkjrUQ8ndi8rudKmhSezfjxNZzrtGUP22uRZdANAJLHXVpHM
AU+raGQ5nyOtogtGTcxv2Zis11TRDKajBKyJ2tGjbjyOpljEWo8ujFKUvmd6EAn0
xKXwh9GO6IwgSpMtPQwX4lFdGB+w+00+zfZ/gwYlTqYOAG3i8tkv1S+i7l+WfX32
zy9DTUv5bxJn1qaKkqQbSy10EIIGCkLoFFVCImDWI9lhaaf53r9KCqz5so0eX1ll
dPneAKPfdvyfmA+V8AC7fkVY2na8mIkvOWniDLms91oKUQwAQWnuBk+f++fz5YjX
CoI7U7L+lnj+EOVQ3GrlszWeANMuXw==
=efIM
-----END PGP SIGNATURE-----

--Sig_/jtq9dvA+9Kfd8J/YkiGFfeL--
