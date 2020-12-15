Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF9002DB676
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 23:22:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbgLOWW1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Dec 2020 17:22:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728268AbgLOWWN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Dec 2020 17:22:13 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03AB3C0613D3;
        Tue, 15 Dec 2020 14:21:32 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CwXm95mQyz9sTK;
        Wed, 16 Dec 2020 09:21:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608070890;
        bh=u+95PQzLuGL4WzoqaGkOVE7pG5FgjGZ5GJ1+iJ4TGTE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KWlngHrzFMRAQeC0MW0Ap7MyNklxTX2S6QNVj7tW+A4VLxAYX9QtKfwD/6qTCzAoy
         RNZ265yYfnVaGssGq1LCKhxDG7Zj+hKetjZkexPLwF4QKCc4ti78wlLPOQ6SQ+DQH7
         S+K6IGg6ox96EBkYsujmwRcJ/tJhoFO4M0lkUtxCIIQ7VyRrLq/wKtBNqQ/gPuOqo2
         MCfmoojmqtCT+I6p94dFtACDmWG52ST6OdeNQwllqr3IoF7qHej+cb0PbhdbfuKmvV
         CKUmsu2s+RQrExJp542UNJm/aZwp3CWDn+ufck4oVuPHCaRRGTzQlmm3FK+bXzXkE4
         UuSKn1E2AtWqA==
Date:   Wed, 16 Dec 2020 09:21:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: manual merge of the s390 tree with the asm-generic
 tree
Message-ID: <20201216092117.4f6447d0@canb.auug.org.au>
In-Reply-To: <20201124102514.0bea1349@canb.auug.org.au>
References: <20201124102514.0bea1349@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/spRJ7_4pE8nU+j1CqlA4VdH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/spRJ7_4pE8nU+j1CqlA4VdH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 24 Nov 2020 10:25:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the s390 tree got a conflict in:
>=20
>   arch/s390/include/asm/mmu_context.h
>=20
> between commit:
>=20
>   93e2dfd39438 ("s390: use asm-generic/mmu_context.h for no-op implementa=
tions")
>=20
> from the asm-generic tree and commits:
>=20
>   ab177c5d00cd ("s390/mm: remove unused clear_user_asce()")
>   87d598634521 ("s390/mm: remove set_fs / rework address space handling")
>=20
> from the s390 tree.
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
> diff --cc arch/s390/include/asm/mmu_context.h
> index 66f9cf0a07e3,87a84fc59fc3..000000000000
> --- a/arch/s390/include/asm/mmu_context.h
> +++ b/arch/s390/include/asm/mmu_context.h
> @@@ -70,23 -69,8 +70,6 @@@ static inline int init_new_context(stru
>   	return 0;
>   }
>  =20
> - static inline void set_user_asce(struct mm_struct *mm)
> - {
> - 	S390_lowcore.user_asce =3D mm->context.asce;
> - 	__ctl_load(S390_lowcore.user_asce, 1, 1);
> - 	clear_cpu_flag(CIF_ASCE_PRIMARY);
> - }
> -=20
> - static inline void clear_user_asce(void)
> - {
> - 	S390_lowcore.user_asce =3D S390_lowcore.kernel_asce;
> - 	__ctl_load(S390_lowcore.kernel_asce, 1, 1);
> - 	set_cpu_flag(CIF_ASCE_PRIMARY);
> - }
> -=20
> - mm_segment_t enable_sacf_uaccess(void);
> - void disable_sacf_uaccess(mm_segment_t old_fs);
>  -#define destroy_context(mm)             do { } while (0)
> --
>   static inline void switch_mm(struct mm_struct *prev, struct mm_struct *=
next,
>   			     struct task_struct *tsk)
>   {
> @@@ -121,18 -98,18 +97,18 @@@ static inline void finish_arch_post_loc
>   		__tlb_flush_mm_lazy(mm);
>   		preempt_enable();
>   	}
> - 	set_fs(current->thread.mm_segment);
> + 	__ctl_load(S390_lowcore.user_asce, 7, 7);
>   }
>  =20
>  -#define enter_lazy_tlb(mm,tsk)	do { } while (0)
>  -#define deactivate_mm(tsk,mm)	do { } while (0)
>  -
>  +#define activate_mm activate_mm
>   static inline void activate_mm(struct mm_struct *prev,
>                                  struct mm_struct *next)
>   {
>   	switch_mm(prev, next, current);
>   	cpumask_set_cpu(smp_processor_id(), mm_cpumask(next));
> - 	set_user_asce(next);
> + 	__ctl_load(S390_lowcore.user_asce, 7, 7);
>   }
>  =20
>  +#include <asm-generic/mmu_context.h>
>  +
>   #endif /* __S390_MMU_CONTEXT_H */

This is now a conflict between the asm-generic tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/spRJ7_4pE8nU+j1CqlA4VdH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/ZNt0ACgkQAVBC80lX
0GxaJgf/dXiV/qimRuyQXNxr3JHTf7HN+NCM3OFd2HXaUYkLUDxP3tyTw1AgQB7M
ZeYqKdgLRia5p4fVtwO19MXU9dlWd3Zodm4zwO8WRM2Z5NNUh9/uBflbSls70tJ4
AHr9YAaScvvy1ZcFoQ5g4WroihkMMj5QWnz+7c3mQd7NOYLDz426NNeAaimaOJAH
ucJ6KxP+dIy8ScmavpPOMLOi114UGMaQvj2uW4ZIPHlxltFGBdiN7MehODN9xhQ1
MUiB/hLf0wYGZiJMpNqnx6tX7UdwY8SpROmFPrAYOjsouJ4Aa5TYGDp1JJSQiZkP
YH/wYiQNYjpQ8KN/OdQ/GQ0Atb3jzw==
=+7lz
-----END PGP SIGNATURE-----

--Sig_/spRJ7_4pE8nU+j1CqlA4VdH--
