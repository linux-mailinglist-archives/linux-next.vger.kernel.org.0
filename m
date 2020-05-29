Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA8C1E8C22
	for <lists+linux-next@lfdr.de>; Sat, 30 May 2020 01:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727876AbgE2XiS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 19:38:18 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42981 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726898AbgE2XiR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 May 2020 19:38:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Ygx01cWLz9sRN;
        Sat, 30 May 2020 09:38:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590795495;
        bh=vYXelSLaKYZjwCWrkNAu3O7xZdsEvN6ROiUiIq7h3K8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PyNT7LnnNbX6oGIKWRPChOoG14JwvWo7sgmBYmUIdI65lYwPVfrueu6dIK+IvKpYi
         tCybYpuSiLnFVtysVK2x96t62SPQciBl6335b3BhDjaoDnQDUQGCWS/2IW3bmfvKOh
         kKJPnvOGLY1EOdACp+3hyeztqRrAiEmPUmGP9quNL5FSC90y3fpNGit5jGstcWWRct
         2On+EjcnREIC8Bqu4UdJ4p9ICmfArgRBRcWU3A2nO9hFFatvtHi0aPponr4wCilGDO
         I8o/L3lJqK43B9agPa0J7vKZ0G4FiBkApgnicfXDPltqkyxoMKod5dCz7byzdZSWYr
         QH9N7LVzo6/sg==
Date:   Sat, 30 May 2020 09:38:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Message-ID: <20200530093811.58b1efe2@canb.auug.org.au>
In-Reply-To: <20200529141501.GC2869@paulmck-ThinkPad-P72>
References: <20200529162234.4f1c3d58@canb.auug.org.au>
        <20200529164132.6fb46471@canb.auug.org.au>
        <20200529141501.GC2869@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3WjDfLIKKMwo7UetuSQFz+n";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3WjDfLIKKMwo7UetuSQFz+n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Fri, 29 May 2020 07:15:01 -0700 "Paul E. McKenney" <paulmck@kernel.org> =
wrote:
>
> Given that the merge window might be opening in a couple days, my thought
> is to defer these -rcu commits to my v5.9 pile, and then I resolve this
> conflict in the -rcu tree when v5.8-rc1 comes out.  I just now adjusted
> the -rcu tree's rcu/next branch accordingly.
>=20
> Seem reasonable?

Sure, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/3WjDfLIKKMwo7UetuSQFz+n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7RnOMACgkQAVBC80lX
0GygLwf/ZZjoG8koiW9nYM+yUKrV7DB6YZz/yjlf2Acol2KkeKuAtV+21t3qV7TL
ER2qODQZNRro5ZSlL8PlCkyY9mL7MnKgnU8tJG/RVXQT6kqFLMRpAeKn3DrYS/yu
xyFfnSVeM6T87cJ8cuucjDSNzidfph5n8FJ0EveMDqFlrtnOKC1kP5Z9HFe8CWHA
hidzbiiFcST7dpbitVEtBhPFyy9joRbERV9yGIjXGe+6KuJPEvbVZzFyD2S4MVIT
xYofFHO6DcxrNG2qOaNJnUfS032nSxEbfS0q6CKHsrVmWiZQ2WHR2a9POYUhDYHq
4EtOiejefGoy6ak6oJR90Xw28EgfPw==
=8b73
-----END PGP SIGNATURE-----

--Sig_/3WjDfLIKKMwo7UetuSQFz+n--
