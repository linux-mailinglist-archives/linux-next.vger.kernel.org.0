Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 783853AFC63
	for <lists+linux-next@lfdr.de>; Tue, 22 Jun 2021 07:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbhFVFG0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Jun 2021 01:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbhFVFG0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Jun 2021 01:06:26 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B15ABC061574;
        Mon, 21 Jun 2021 22:04:10 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G8Dp04KCkz9sj5;
        Tue, 22 Jun 2021 15:04:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624338248;
        bh=w2EEUuF7Ix/K9Qgs/5IiKeA90auGbj1cJBorFDBCXAI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=REbJ5r7O1ur072LPqprD3ts3YNA18j65u08pCJ7W72fFJIa2Dqp+AQMEzPHLUbi3F
         c2EKKATD1MUTZvXznFXR+3T55bodXtoQzkUnupZ2qkmAdS7YNGZSKcE9yNKKeOwIGC
         3vTMKCuoLu3kvNEaKgIY2WJK4ZXm5okWYMC/gfW9EiIc/fxa0wddRE4a8Y+gFr4I+x
         QMdcJrIQ6uK9meb7uVeq0SnYhqDTgq0V+o6C0QIGbRKb4NttVINpwjv9P66ON5qewF
         sJhr187L/yCSFoC0iaNdl0UfrmXbxLflyl0K61o2SS1EYEz1yqQcGMz4hnIjISNG66
         hNhf9n0ohZf9Q==
Date:   Tue, 22 Jun 2021 15:04:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Message-ID: <20210622150407.14d425dc@canb.auug.org.au>
In-Reply-To: <20210622144757.055a4137@canb.auug.org.au>
References: <20210622144757.055a4137@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TsjfQoXaWQMfiLx0Fw2yHTM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TsjfQoXaWQMfiLx0Fw2yHTM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 22 Jun 2021 14:47:57 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> @@@ -732,23 -816,34 +816,34 @@@ void show_rcu_gp_kthreads(void
>   	struct task_struct *t =3D READ_ONCE(rcu_state.gp_kthread);
>  =20
>   	j =3D jiffies;
> - 	ja =3D j - data_race(rcu_state.gp_activity);
> - 	jr =3D j - data_race(rcu_state.gp_req_activity);
> - 	jw =3D j - data_race(rcu_state.gp_wake_time);
> - 	pr_info("%s: wait state: %s(%d) ->state: %#x delta ->gp_activity %lu -=
>gp_req_activity %lu ->gp_wake_time %lu ->gp_wake_seq %ld ->gp_seq %ld ->gp=
_seq_needed %ld ->gp_flags %#x\n",
> + 	ja =3D j - data_race(READ_ONCE(rcu_state.gp_activity));
> + 	jr =3D j - data_race(READ_ONCE(rcu_state.gp_req_activity));
> + 	js =3D j - data_race(READ_ONCE(rcu_state.gp_start));
> + 	jw =3D j - data_race(READ_ONCE(rcu_state.gp_wake_time));
>  -	pr_info("%s: wait state: %s(%d) ->state: %#lx ->rt_priority %u delta -=
>gp_start %lu ->gp_activity %lu ->gp_req_activity %lu ->gp_wake_time %lu ->=
gp_wake_seq %ld ->gp_seq %ld ->gp_seq_needed %ld ->gp_max %lu ->gp_flags %#=
x\n",
> ++	pr_info("%s: wait state: %s(%d) ->state: %#x ->rt_priority %u delta ->=
gp_start %lu ->gp_activity %lu ->gp_req_activity %lu ->gp_wake_time %lu ->g=
p_wake_seq %ld ->gp_seq %ld ->gp_seq_needed %ld ->gp_max %lu ->gp_flags %#x=
\n",
>   		rcu_state.name, gp_state_getname(rcu_state.gp_state),
> - 		rcu_state.gp_state, t ? t->__state : 0x1ffff,
> - 		ja, jr, jw, (long)data_race(rcu_state.gp_wake_seq),
> - 		(long)data_race(rcu_state.gp_seq),
> - 		(long)data_race(rcu_get_root()->gp_seq_needed),
> - 		data_race(rcu_state.gp_flags));
> + 		data_race(READ_ONCE(rcu_state.gp_state)),
>  -		t ? data_race(READ_ONCE(t->state)) : 0x1ffffL, t ? t->rt_priority : 0=
xffU,
> ++		t ? data_race(READ_ONCE(t->__state)) : 0x1ffffL, t ? t->rt_priority :=
 0xffU,
                                                              ^
I missed removing this 'L' the first time, but have fixed it up now.

--=20
Cheers,
Stephen Rothwell

--Sig_/TsjfQoXaWQMfiLx0Fw2yHTM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDRb0cACgkQAVBC80lX
0Gxpuwf/Rto3oVoqINNvYjcq2OdK3/1MxB8z4jrUAVda7t3KCeiemfWrdLm9MWNC
mxzhKIf+Wzn8LWaIPPa2W9bUsrIsZ2Gc5ienRBxw7PVFGNJM4+LkloIdxgf+BhLY
3EvcXbqvlf4MXYGW6nP86L4cIXxcyN+M7LurJmlHAUE8qP7iK+zNqswzdQ/X2jym
LTVeRBB//1BIYILX8dFNvywZsrtL9kqIlOXfPUBjByoP+Mp3cQAN6DwZL9lU2hxk
m+GUuTmWWuFCP9WLFYjMWCdwUEUTXn/hWrdHxX+6IMZ6DxvTEhjbgskoHjfgT/ev
hWL8cuyMBldZPBAMNWL6ntRnq7Z1wg==
=rts9
-----END PGP SIGNATURE-----

--Sig_/TsjfQoXaWQMfiLx0Fw2yHTM--
