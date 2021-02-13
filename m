Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8DA531A998
	for <lists+linux-next@lfdr.de>; Sat, 13 Feb 2021 03:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbhBMCGC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Feb 2021 21:06:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbhBMCGB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 12 Feb 2021 21:06:01 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A49D7C061574;
        Fri, 12 Feb 2021 18:05:21 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DctxC3hcFz9rx8;
        Sat, 13 Feb 2021 13:05:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613181919;
        bh=XsSI0kKcuiqW8vPfo9ITlUSKmuSdJcyqoYRVGlk/jew=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=RxrgEDPXk9xqmvA1Z2MCy1lcMAEptWpDL62YFKqjZo/loqm8ETS25XaAp898yubeU
         LqqiVGbU9HvvXBvOLqcfdZNahnxSWKiP93GIWecXewIhQulXWsYUS7/1ztIUKJpSi1
         Sr8wpav0sH/OmRvdW/c32uChwNugADjr7wArgpagZeOK8irQYIlnR/AsctNaYYbmx7
         qYzhyP8Q28QdEbz6Jq30foJ9BUPEjsApg+x58UIQ7MCoRJjtDdMajxrQOtf/90iMDR
         kGL+Eluvj5bRHFW00r9FiE5pgP4J3U2ZiVIUqjK+ddhpmyY8gEndnKmyHhztYxRtOS
         gRYzUFS2lDv8g==
Date:   Sat, 13 Feb 2021 13:05:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Frederic Weisbecker <frederic@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the rcu tree with the block tree
Message-ID: <20210213130518.3747a678@canb.auug.org.au>
In-Reply-To: <858e7874-83c9-e4b9-a0a9-31be5a0c853e@kernel.dk>
References: <20210211164852.7489b87d@canb.auug.org.au>
        <20210212151853.GC94816@lothringen>
        <858e7874-83c9-e4b9-a0a9-31be5a0c853e@kernel.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I2YT3FdOFfP0ik0SKo8Ba3u";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/I2YT3FdOFfP0ik0SKo8Ba3u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 12 Feb 2021 08:30:27 -0700 Jens Axboe <axboe@kernel.dk> wrote:
>
> On 2/12/21 8:18 AM, Frederic Weisbecker wrote:
> > On Thu, Feb 11, 2021 at 04:48:52PM +1100, Stephen Rothwell wrote: =20
> >> Hi all,
> >>
> >> Today's linux-next merge of the rcu tree got conflicts in:
> >>
> >>   include/linux/rcupdate.h
> >>   kernel/rcu/tree.c
> >>   kernel/rcu/tree_plugin.h
> >>
> >> between commits:
> >>
> >>   3a7b5c87a0b2 ("rcu/nocb: Perform deferred wake up before last idle's=
 need_resched() check")
> >>   e4234f21d2ea ("rcu: Pull deferred rcuog wake up to rcu_eqs_enter() c=
allers")
> >>   14bbd41d5109 ("entry/kvm: Explicitly flush pending rcuog wakeup befo=
re last
> >>   rescheduling point")
> >> from the block tree and commits: =20
> >=20
> > Isn't it tip:/sched/core instead of block? =20
>=20
> It must be, maybe block just got merged first? It's just sched/core in a
> topic branch, to satisfy a dependency.

Well, yes, it is a topic branch merge into the block tree.  However,
that topic branch has not been merged into the tip/auto-latest branch
which is what linux-next pulls in as the tip tree.  (And the tip tree
and block trees were both merged before the rcu tree.)

--=20
Cheers,
Stephen Rothwell

--Sig_/I2YT3FdOFfP0ik0SKo8Ba3u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAnM94ACgkQAVBC80lX
0Gx7Agf9EoLO6f4jX0seNCyDmYzGJ9dPRMu1V08p0HvcfRJ71r/iLUg4iw4iSBVd
h9yMLTxxYuQlzdwSqZTY/ABu1H9jletypGDa1LKmqTP5IaQYBXYvdo38Wo/qBDhM
2ojeiRsf5/Pj08vnn1Sfzk48gu/c+zniDZ3uTkyON0cRHFKoxiFeLvrYMwF1bUlT
M7gmsBf2Id3JOfymSI01o7QAVGj0Eqct3EZ+Cht+/hUp211hnXMUgXP+Nf2W7zCU
548EGdv57rG1m/l4MRpZ7Yw9GGe4PSBtz+0OLzG6dM+fvrV9V+Wjmr/RgHeUVaep
C3o6961PnB67oyQ+/cdiBzY4NLUFyg==
=kQd+
-----END PGP SIGNATURE-----

--Sig_/I2YT3FdOFfP0ik0SKo8Ba3u--
