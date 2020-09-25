Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D23FE27868A
	for <lists+linux-next@lfdr.de>; Fri, 25 Sep 2020 14:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgIYMBj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Sep 2020 08:01:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728038AbgIYMBj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Sep 2020 08:01:39 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4AA5C0613CE;
        Fri, 25 Sep 2020 05:01:38 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4ByVrB4f2Sz9s0b;
        Fri, 25 Sep 2020 22:01:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601035295;
        bh=QRirj+yDLS5yjKz61G/wdoH7rUbuCEx8YjKMsQKFxkM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=i99Go5k+E1U4aok/P12XugcrDJLiQvTuBDdCQr43RKe6McW8Y0u8p6ysJua3tD9qs
         UP9VUcgU168Z1MMw1otdWMOkQVc2Tn1QJgsdTEkme+Md448/h259J4U/RiZIDkp0L+
         SXLpiqDVCPAN8npsDIk/xyXwOkzWuEZoeeqee9OLxcVx7SB0pVJkbquIgsCMq48NhV
         dAhBiVh4sjIF4t/HANG3WoTRdN3zNgRDtmI+PUtOAWv+r5g1BzoTJjzYN0OHa6u9/G
         a8MVJ9fHFPB2Q+UNJgbe8EACTzqhb59jA6veCusbrKrDSQnUXLffsmH+9sr9aAO7bW
         seXZdjuZ7ewJg==
Date:   Fri, 25 Sep 2020 22:01:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@suse.de>
Subject: Re: linux-next: build failure after merge of the vfs tree
Message-ID: <20200925220128.1604f09b@canb.auug.org.au>
In-Reply-To: <20200924200807.GU3421308@ZenIV.linux.org.uk>
References: <20200924183038.3c6da86e@canb.auug.org.au>
        <20200924200807.GU3421308@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tL/_9cXMWTs2hXUJYOSJPQw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tL/_9cXMWTs2hXUJYOSJPQw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

On Thu, 24 Sep 2020 21:08:07 +0100 Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Thu, Sep 24, 2020 at 06:30:38PM +1000, Stephen Rothwell wrote:
> >=20
> > After merging the vfs tree, today's linux-next build (x86_64 allnoconfi=
g)
> > failed like this:
> >=20
> > arch/x86/include/asm/barrier.h: Assembler messages:
> > arch/x86/include/asm/barrier.h:41: Error: operand type mismatch for `cm=
p'
> > arch/x86/include/asm/barrier.h:41: Error: operand type mismatch for `cm=
p'
> >=20
> > and many more ...
> >=20
> > Caused by commit
> >=20
> >   e33ea6e5ba6a ("x86/uaccess: Use pointer masking to limit uaccess spec=
ulation")
> >=20
> > I am not exactly sure why (but reverting it fixes the build).
> >=20
> > I have reverted that commit for today. =20
>=20
> Can't reproduce here...  This on top of today's -next seems to build with
> allnoconfig here:

I don't know what to tell you ... it still fails for me today.

$ x86_64-linux-gnu-gcc --version
x86_64-linux-gnu-gcc (Debian 10.2.0-9) 10.2.0
$ x86_64-linux-gnu-ld --version
GNU ld (GNU Binutils for Debian) 2.35

and the gcc plugins don't get built for the allnoconfig builds.

> diff --git a/lib/iov_iter.c b/lib/iov_iter.c
> index 35293ad83297..aca828b9b831 100644
> --- a/lib/iov_iter.c
> +++ b/lib/iov_iter.c
> @@ -647,7 +647,7 @@ static int copyout_mc(void __user *to, const void *fr=
om, size_t n)
>  {
>  	if (access_ok(to, n)) {
>  		instrument_copy_to_user(to, from, n);
> -		n =3D copy_mc_to_user((__force void *) to, from, n);
> +		n =3D copy_mc_to_user((__force void *)force_user_ptr(to), from, n);

BTW, You can't do that because force_user_ptr is only defined for x86 ...

I reverted my Revert commit after I finished linux-next today and built
the x86_64 allnoconfig verion of lib/iov_iter.s:

$ grep -A 1 '41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h"' lib/i=
ov_iter.s
# 41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h" 1
	cmp $140737488351232,%rdx; sbb %rcx,%rcx;	#, uaddr, mask
--
# 41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h" 1
	cmp $140737488351232,%r8; sbb %rdx,%rdx;	#, end, mask
--
# 41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h" 1
	cmp $140737488351232,%rdx; sbb %rcx,%rcx;	#, uaddr, mask
--
# 41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h" 1
	cmp $140737488351232,%rdi; sbb %rdx,%rdx;	#, end, mask
--
# 41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h" 1
	cmp $140737488351232,%rdi; sbb %rax,%rax;	#, to.29_334, mask
--
# 41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h" 1
	cmp $140737488351232,%rdi; sbb %rax,%rax;	#, to.29_367, mask
--
# 41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h" 1
	cmp $140737488351232,%rsi; sbb %rax,%rax;	#, from.37_239, mask
--
# 41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h" 1
	cmp $140737488351232,%rsi; sbb %rax,%rax;	#, from.37_272, mask
--
# 41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h" 1
	cmp $140737488351232,%rsi; sbb %rax,%rax;	#, _i, mask
--
# 41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h" 1
	cmp $140737488351232,%rsi; sbb %rax,%rax;	#, _i, mask
--
# 41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h" 1
	cmp $140737488351232,%rsi; sbb %rax,%rax;	#, _i, mask
--
# 41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h" 1
	cmp $140737488351232,%rsi; sbb %rax,%rax;	#, _i, mask
--
# 41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h" 1
	cmp $140737488351232,%rdi; sbb %rax,%rax;	#, to.29_96, mask
--
# 41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h" 1
	cmp $140737488351232,%rdi; sbb %rax,%rax;	#, to.29_244, mask
--
# 41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h" 1
	cmp $140737488351232,%rsi; sbb %rax,%rax;	#, from.37_68, mask
--
# 41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h" 1
	cmp $140737488351232,%rsi; sbb %rax,%rax;	#, from.37_221, mask
--
# 41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h" 1
	cmp $140737488351232,%rsi; sbb %r10,%r10;	#, from.37_281, mask
--
# 41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h" 1
	cmp $140737488351232,%rsi; sbb %rax,%rax;	#, from.37_314, mask
--
# 41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h" 1
	cmp $140737488351232,%rsi; sbb %r10,%r10;	#, from.37_177, mask
--
# 41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h" 1
	cmp $140737488351232,%rsi; sbb %rax,%rax;	#, from.37_210, mask
--
# 41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h" 1
	cmp $140737488351232,%r10; sbb %rsi,%rsi;	#, _i, mask
--
# 41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h" 1
	cmp $140737488351232,%rsi; sbb %rax,%rax;	#, _i, mask

I don't know if that helps.
--=20
Cheers,
Stephen Rothwell

--Sig_/tL/_9cXMWTs2hXUJYOSJPQw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9t3BgACgkQAVBC80lX
0GweNgf+P7OmgNMal5tJfNC/dkKwAT/2vrBIEbMth8GLNdIKKdnR/7HB6gYg2mUW
MWSWs0YwsFbPswuFtj+SewGed6+ylYx0AoncVUvw7qe9D8FYyJ/KXSV0UToM/W7a
Gq1VaioTI8RMpH6fyNXSpguBrodRgXvNMQgS1Rg+1AurAYVCEP8DHClMRopz1+C+
7TnfsiHa9vUuTr4ff/5WoOaD/MbVN037XsLQMnUbZe0jgpAJgnaijukXS0fC5xk0
DDMZAqHJcyJodl1+bmoYDT823x7Fvi8cBXXfLGAt7/ldJp5Z/jwXgMD7l+Idq2LD
tDXDKTzib03cOktFDHJ3wQlvNOuvcw==
=1t+b
-----END PGP SIGNATURE-----

--Sig_/tL/_9cXMWTs2hXUJYOSJPQw--
