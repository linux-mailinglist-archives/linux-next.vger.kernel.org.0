Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B06E2FF75B
	for <lists+linux-next@lfdr.de>; Thu, 21 Jan 2021 22:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbhAUVdt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Jan 2021 16:33:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727412AbhAUVdk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Jan 2021 16:33:40 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E61EC06174A;
        Thu, 21 Jan 2021 13:32:55 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DMFwy29jpz9rx8;
        Fri, 22 Jan 2021 08:32:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611264771;
        bh=WqD6nMsWfm8wkWrN0VuKrvbVqutP657Jy9gvshg5kEM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qvc01sF+zowe5R5ce2pTR9hN4IWaUabGoFuaWi4QOVuo1c+AXSkE/rubP7VGYCdzd
         XcOKVMmQKt+lyyeBnJEN1dE6OGCBPwDv5pkz9/3hf3zW2zgSNAcvCF9d+gUIwoxugK
         PINlw+HWTvA0jVGA9091WwCYprg7v7+j+MCLlrG58rwgudxnctNrTlqTwcvrPa3kR2
         klS/8015j15T++9d7VCToiwEl+2QxOybn7b96Mmu/qEwc6Fw+aLVVRgjamIURkTPed
         3UJgckaWeicOKE7/BBojdUOUXwwnpv8E6FOwkN9lusgFTSW4KYyoGkkHhadQlu6z44
         JSsx92tUdmDTQ==
Date:   Fri, 22 Jan 2021 08:32:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Sven Schnelle <svens@linux.ibm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] s390: allow reschedule on syscall restart
Message-ID: <20210122083249.60d29c33@canb.auug.org.au>
In-Reply-To: <20210121143926.21440-2-svens@linux.ibm.com>
References: <20210121143926.21440-1-svens@linux.ibm.com>
        <20210121143926.21440-2-svens@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/03Jr4fuQBFBteIb9I_.t_qw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/03Jr4fuQBFBteIb9I_.t_qw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 21 Jan 2021 15:39:26 +0100 Sven Schnelle <svens@linux.ibm.com> wrot=
e:
>
> Commit 845f44e8ef28 ("sched: Report local wake up on resched blind zone
> within idle loop") from next-20210121 causes a warning because s390
> doesn't call sched_resched_local_allow() when restarting a syscall.
>=20
> Signed-off-by: Sven Schnelle <svens@linux.ibm.com>
> ---
>  arch/s390/kernel/syscall.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/s390/kernel/syscall.c b/arch/s390/kernel/syscall.c
> index bc8e650e377d..2b39ac40f970 100644
> --- a/arch/s390/kernel/syscall.c
> +++ b/arch/s390/kernel/syscall.c
> @@ -162,6 +162,7 @@ void noinstr __do_syscall(struct pt_regs *regs, int p=
er_trap)
>  		do_syscall(regs);
>  		if (!test_pt_regs_flag(regs, PIF_SYSCALL_RESTART))
>  			break;
> +		sched_resched_local_allow();
>  		local_irq_enable();
>  	}
>  	exit_to_user_mode();

I add that today as a merge fixup patch to the merge of the rcu tree
(which contains commit 845f44e8ef28 ("sched: Report local wake up on
resched blind zone within idle loop") ).

--=20
Cheers,
Stephen Rothwell

--Sig_/03Jr4fuQBFBteIb9I_.t_qw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAJ8wEACgkQAVBC80lX
0GyRKwgApHeYDUXwAm0A6CmTZ8jd0sYi6V7cHZ1/MRl+HsHUYYRKL6JMe+a79DMp
FDZpBDX2SkA85O/LUyHCACNQffK7gj7hMnuippWjygnS/FPeKtjLsv20+dmAkkWx
Yb5zSo5eGrmyJebiXZZttcMjyXiYQWnlR1ylPT+TDUlWEXXGJNrcylqwiZzyuANU
RVc02VRwuplx9eyVdGG4VWiKoQ5IWE23zxxq7x3BV9Q5LCVMwZ3H+1dY57lKFODg
Pd/plnSLmHzX3UesHtA+tPCzj6J4mT7CaQeHU5pV//V0XDW95g8EQZiHpfCTK8OD
tc47l8lFX4Q2oVcLm/yNna+UjOJBQQ==
=+0ME
-----END PGP SIGNATURE-----

--Sig_/03Jr4fuQBFBteIb9I_.t_qw--
