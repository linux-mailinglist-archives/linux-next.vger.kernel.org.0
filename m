Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94C334412BE
	for <lists+linux-next@lfdr.de>; Mon,  1 Nov 2021 05:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbhKAEh3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Nov 2021 00:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbhKAEh3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Nov 2021 00:37:29 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0CBAC061714;
        Sun, 31 Oct 2021 21:34:56 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HjKvG1499z4xbG;
        Mon,  1 Nov 2021 15:34:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635741294;
        bh=kUAMvzaleDb6jyDupmX8DAn2jNnpXYP40FQ2Cu+RRK4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Izpr156fl4IvGOeMVxhLpowpLoxJtXR3B9pam5VViRNz2TaxuP+/Zg/avRG/2mRD5
         gRaj5n5wgb0vjUs6VRXyyrRX1Irv6l1BAxo53kT7xAhFvnWL9jLiHUAEYCOWRLKTl+
         U+Zq0jf7Y8kXPWMneG97/wFUFjeQBmXQgGV42eicBO13SU8kUD3KdnqD7E7INZ+/GN
         c+ggVQ13FFQ5y0u41FnoSOJBYnNfXJ7uYcdu7AsVviJNp2Pn+6K+pX5+JY6L/vITDI
         BiXWYCTHc8SgIPSDKIs8kEevdX5kBNb/45UrW3lHztCvc3K0daRMUsb5DQwgGc1Z3+
         FZSZTdvSfKC6w==
Date:   Mon, 1 Nov 2021 15:34:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: linux-next: manual merge of the irqchip tree with the risc-v
 tree
Message-ID: <20211101153448.4ee33b3a@canb.auug.org.au>
In-Reply-To: <20211027135550.399f81b7@canb.auug.org.au>
References: <20211027135550.399f81b7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1Bzw_q.l22SHy_JXEmAowEq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1Bzw_q.l22SHy_JXEmAowEq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 27 Oct 2021 13:55:50 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the irqchip tree got a conflict in:
>=20
>   arch/riscv/Kconfig
>=20
> between commit:
>=20
>   dffe11e280a4 ("riscv/vdso: Add support for time namespaces")
>=20
> from the risc-v tree and commit:
>=20
>   0953fb263714 ("irq: remove handle_domain_{irq,nmi}()")
>=20
> from the irqchip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc arch/riscv/Kconfig
> index 0050a2adf67b,353e28f5f849..000000000000
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@@ -62,8 -62,6 +62,7 @@@ config RISC
>   	select GENERIC_SCHED_CLOCK
>   	select GENERIC_SMP_IDLE_THREAD
>   	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
>  +	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
> - 	select HANDLE_DOMAIN_IRQ
>   	select HAVE_ARCH_AUDITSYSCALL
>   	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
>   	select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL

This is now a conflict between the tip tree and the risc-v tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/1Bzw_q.l22SHy_JXEmAowEq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF/bmgACgkQAVBC80lX
0GwENgf+NBvEpUoxdUZT6hVcbzrv3mPtvlin6Eeszfd70p16ZuAc6q+qrR7EexE0
scSOjJa0uI2FwXqLj96zXucZg25CUFIvUcUjbgHOaLvWeayYw0yvDRY7uHVQvROp
GPBsvdNRqn+caiILWxqKrerQCSBfKpz0a3wYmEvc+pn5GfMzGrWE2/bvMS1zI7QC
S1bcCW9giDejDulGNSb+Q2aQ0ELQFlvEKsAfXKg7BFj3qy+1eK8qdqbVYWD2OHNe
qj0r+X/r/d08kX047T5QLKe63iT9w5y/rsLrrK9Ud2MNblp4+1yym0jYXNjm00/A
mCwjyOUsIHzjW4cH87635MA1prNJFg==
=Udad
-----END PGP SIGNATURE-----

--Sig_/1Bzw_q.l22SHy_JXEmAowEq--
