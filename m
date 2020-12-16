Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6925A2DB82F
	for <lists+linux-next@lfdr.de>; Wed, 16 Dec 2020 02:04:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727373AbgLPBDG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Dec 2020 20:03:06 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:45599 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727334AbgLPBDF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Dec 2020 20:03:05 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CwcKp4L3Yz9sSn;
        Wed, 16 Dec 2020 12:02:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608080542;
        bh=GRJrQmpTMXq9rGDkMakHSa6LsiyRsrp0g4xaRIol/dI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nTfDdmXx+ytOVcXTR1pcDO4afblmdIhRCa/I3SZFBIpUa8wkz7EfcZMMGdhY4d/X1
         csqXWEH6WfrcJck2GaU9MZXd93hJuOmFpHX4B50uCzhdqDTcxSKUrPfnGC4xR8XoCJ
         uIg5xxbbMKB7BRmWe6sw7lts5YkH9Sf9wT9zMUM113pixx9qNCufhzYzh+ciS79vZg
         mnof6wPhPCBDqv0HWSrM6h1nfZRtnOek4dmr2Wfn+kvCH3vAVI2W2yoCs5z+N2CDc8
         2mw0hAO7jwdWUFK1wYvZ1dOhzQkx7mHvuZXLeMsdfjJLS8g8OLuHvqfn6r6OXsP+bP
         35X7Jhrp04sGA==
Date:   Wed, 16 Dec 2020 12:02:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the userns tree with the tip tree
Message-ID: <20201216120221.3cd7bfce@canb.auug.org.au>
In-Reply-To: <20201211182453.2522566c@canb.auug.org.au>
References: <20201211182453.2522566c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oUyf/sp7r7eLkMog8MUQLJf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oUyf/sp7r7eLkMog8MUQLJf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 11 Dec 2020 18:24:53 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the userns tree got a conflict in:
>=20
>   kernel/events/core.c
>=20
> between commit:
>=20
>   78af4dc949da ("perf: Break deadlock involving exec_update_mutex")
>=20
> from the tip tree and commit:
>=20
>   f7cfd871ae0c ("exec: Transform exec_update_mutex into a rw_semaphore")
>=20
> from the userns tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc kernel/events/core.c
> index 19ae6c931c52,55b2330b556c..000000000000
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@@ -11958,24 -11864,6 +11958,24 @@@ SYSCALL_DEFINE5(perf_event_open
>   		goto err_context;
>   	}
>  =20
>  +	if (task) {
> - 		err =3D mutex_lock_interruptible(&task->signal->exec_update_mutex);
> ++		err =3D down_read_interruptible(&task->signal->exec_update_lock);
>  +		if (err)
>  +			goto err_file;
>  +
>  +		/*
>  +		 * Preserve ptrace permission check for backwards compatibility.
>  +		 *
> - 		 * We must hold exec_update_mutex across this and any potential
> ++		 * We must hold exec_update_lock across this and any potential
>  +		 * perf_install_in_context() call for this new event to
>  +		 * serialize against exec() altering our credentials (and the
>  +		 * perf_event_exit_task() that could imply).
>  +		 */
>  +		err =3D -EACCES;
>  +		if (!perfmon_capable() && !ptrace_may_access(task, PTRACE_MODE_READ_R=
EALCREDS))
>  +			goto err_cred;
>  +	}
>  +
>   	if (move_group) {
>   		gctx =3D __perf_event_ctx_lock_double(group_leader, ctx);
>  =20
> @@@ -12151,10 -12039,7 +12151,10 @@@ err_locked
>   	if (move_group)
>   		perf_event_ctx_unlock(group_leader, gctx);
>   	mutex_unlock(&ctx->mutex);
>  -/* err_file: */
>  +err_cred:
>  +	if (task)
> - 		mutex_unlock(&task->signal->exec_update_mutex);
> ++		up_read(&task->signal->exec_update_lock);
>  +err_file:
>   	fput(event_file);
>   err_context:
>   	perf_unpin_context(ctx);

This is now a conflict between the userns tree and Linus's tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/oUyf/sp7r7eLkMog8MUQLJf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/ZXJ0ACgkQAVBC80lX
0GwkOAf/bL9OWPSNIHmEvInDuyJOtDuNkqkmQVi3s4gv7ArjarRgzh6vrgOwA2rb
2yu8Cg40mG+OONcNJfJDn8/aDSXC7n8A29WgGuye4ZV3wSWpXqQll1ypPO3Id4jM
ska5Krip9tbQ1pmaUkrgYCycoULsF74qeeFPHAs4CAbietjt2FDDTHRsSFKA/Jh/
1Etpvgibi22fI9zfA+P7TRzlflHJpw+fRwMOhEfs9HNxNrmKAYSkdrj1VXi/h/AQ
061Jm3W35NAi57Zz9E6Kn9qUqaxZjGEIQ4qUS1ic38kBQPQmQmEkKgL1rI6tk2M+
piaaTemonOShK86XkpJ2DiSz/oFWfg==
=Tz70
-----END PGP SIGNATURE-----

--Sig_/oUyf/sp7r7eLkMog8MUQLJf--
