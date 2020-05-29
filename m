Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 336211E7614
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 08:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgE2Gli (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 02:41:38 -0400
Received: from ozlabs.org ([203.11.71.1]:54655 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725601AbgE2Glh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 May 2020 02:41:37 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49YFMy1cXdz9sSn;
        Fri, 29 May 2020 16:41:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590734495;
        bh=smWG36mAPIVyzN2ASjNimHX0BZ8wOLn26RqgNFswFDE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=p9bkdisenRDTkrbleDmSFTuzAyQ2Xa6n00imEge/e29FPjpAoGESdwnUc0WpdYL6U
         uRSLqZxQ1EPIeRxwnfKC3taggX21KDyO0fHy1izdAQqBNuiYcPP2IxcJLKgojgnKUG
         5GxolH6nkGNFVofCRdZpxJnu0YG/aCOJaP8kpBlSUeJ7E8R782CI8XoHuVf6FjrsFi
         U2lgUqGf9mIS2K02JTozBmkFyDojoj84eksX1dogIU3bHi64/NTgnujYCyBWQ0CqcL
         rA5bvCj9KUjev7o9jpR8MH5TJ7He0yCdawi3NPktDhmyLv68uOpZX6x3m/UWyxcX1w
         Var8pxYFe0KXA==
Date:   Fri, 29 May 2020 16:41:32 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Message-ID: <20200529164132.6fb46471@canb.auug.org.au>
In-Reply-To: <20200529162234.4f1c3d58@canb.auug.org.au>
References: <20200529162234.4f1c3d58@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rnJh5OiWfyudZ=C6ByR3Xr5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rnJh5OiWfyudZ=C6ByR3Xr5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 29 May 2020 16:22:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> Today's linux-next merge of the rcu tree got a conflict in:
>=20
>   kernel/rcu/tree.c
>=20
> between commits:
>=20
>   806f04e9fd2c ("rcu: Allow for smp_call_function() running callbacks fro=
m idle")
>   aaf2bc50df1f ("rcu: Abstract out rcu_irq_enter_check_tick() from rcu_nm=
i_enter()")
>=20
> from the tip tree and commit:
>=20
>   c0601bb42994 ("rcu/tree: Clean up dynticks counter usage")
>   3f3baaf3ac07 ("rcu/tree: Remove dynticks_nmi_nesting counter")
>=20
> from the rcu tree.
>=20
> I fixed it up (I punted and took some from the former and some from the
> latter) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be mentioned
> to your upstream maintainer when your tree is submitted for merging.
> You may also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.

I redid this and the resolution is below, but you should look at the
final file when I do the release.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/rcu/tree.c
index c716eadc7617,78125749638f..1426b968eec1
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@@ -427,14 -385,8 +386,12 @@@ EXPORT_SYMBOL_GPL(rcu_momentary_dyntick
   */
  static int rcu_is_cpu_rrupt_from_idle(void)
  {
- 	long nesting;
-=20
 -	/* Called only from within the scheduling-clock interrupt */
 -	lockdep_assert_in_irq();
 +	/*
 +	 * Usually called from the tick; but also used from smp_function_call()
 +	 * for expedited grace periods. This latter can result in running from
 +	 * the idle task, instead of an actual IPI.
 +	 */
 +	lockdep_assert_irqs_disabled();
 =20
  	/* Check for counter underflows */
  	RCU_LOCKDEP_WARN(__this_cpu_read(rcu_data.dynticks_nesting) < 0,
@@@ -778,24 -718,6 +723,21 @@@ void rcu_irq_exit_preempt(void
  			 "RCU in extended quiescent state!");
  }
 =20
 +#ifdef CONFIG_PROVE_RCU
 +/**
 + * rcu_irq_exit_check_preempt - Validate that scheduling is possible
 + */
 +void rcu_irq_exit_check_preempt(void)
 +{
 +	lockdep_assert_irqs_disabled();
 +
 +	RCU_LOCKDEP_WARN(__this_cpu_read(rcu_data.dynticks_nesting) <=3D 0,
 +			 "RCU dynticks_nesting counter underflow/zero!");
- 	RCU_LOCKDEP_WARN(__this_cpu_read(rcu_data.dynticks_nmi_nesting) !=3D
- 			 DYNTICK_IRQ_NONIDLE,
- 			 "Bad RCU  dynticks_nmi_nesting counter\n");
 +	RCU_LOCKDEP_WARN(rcu_dynticks_curr_cpu_in_eqs(),
 +			 "RCU in extended quiescent state!");
 +}
 +#endif /* #ifdef CONFIG_PROVE_RCU */
 +
  /*
   * Wrapper for rcu_irq_exit() where interrupts are enabled.
   *

--Sig_/rnJh5OiWfyudZ=C6ByR3Xr5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7QrpwACgkQAVBC80lX
0GzQdQf/Yzwjt0iLOW0KI1e2FncqWoYdDYPR4BuCXJ0k/nyX8oA+FtdJISdvAo4u
TrVGcMTIAkC5y5GMdpa8jzPSjsTmDGwDABmwmoMBwBldmLPtJQBeuFelDDzc85lW
OWskaE+TC4Uoj+knA0j/2v7tclPgkAAnSxZl7eN2NFwS+oBbJM3Y1xWiPvmw6Vgm
tZJs99tuTu0mvEofcoEezz2Uz8zc53YRr6IrvmqKUv9cf3LKRxPWe0d+vkxF32Gf
G4FMrz6UC7X9D+oYdNG1UXNL2TNuAJqIPuYFLqZbjVdPXMunKGDeNWjy3+PTdYyI
2kWsuQjtLOxyaV5JuONRN1jLUgdcSQ==
=Dolx
-----END PGP SIGNATURE-----

--Sig_/rnJh5OiWfyudZ=C6ByR3Xr5--
