Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBAA23291D2
	for <lists+linux-next@lfdr.de>; Mon,  1 Mar 2021 21:34:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232476AbhCAUdo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Mar 2021 15:33:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240270AbhCAU31 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Mar 2021 15:29:27 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06B77C061756;
        Mon,  1 Mar 2021 12:28:33 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DqBfj1GqDz9sS8;
        Tue,  2 Mar 2021 07:28:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614630510;
        bh=Oxcz/AiTnTe3p9R0RWzEjM8EoFiTDOqBpGDLtAtM8xY=;
        h=Date:From:To:Cc:Subject:From;
        b=Xbe0K+QUdLjmPknNhhfKQFOQFHI4bY/aFu9TrK0QjovVjlh0LmAm1qei5U17WW9pv
         CF/Ng2DDe/l6Y+MyzuDi4Py5gtw/4rJ5T2srNCHk0z4kJkc45IH0hfgrSWxjDkjdSe
         Jx3lIrucL7NGQpVU/tSR/vusignItYbdtSTCfdT97L2/oaj+mKfUDnZSt0Mgv/l/o0
         admpZ8vwZOTWwsTdyCDBOf+yNhxTzJ/Pq/+fGeTneit9HxbARyUc4Ij0cK2GDuTFLO
         4z2KVa7e354HC1xU/82VbMRqPSS+VF0yfWEoy2mxU/JGxEsdt9Kz7JINLrylDeBO7h
         qthhRGw2gqoaw==
Date:   Tue, 2 Mar 2021 07:28:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the tip tree
Message-ID: <20210302072817.15e64685@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hG9pS+kvQw=7BFWSND/nel_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hG9pS+kvQw=7BFWSND/nel_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  05f7fcc675f5 ("hrtimer: Update softirq_expires_next correctly after __hrt=
imer_get_next_event()")

Fixes tag

  Fixes: da70160462e ("hrtimer: Implement support for softirq based hrtimer=
s")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 5da70160462e ("hrtimer: Implement support for softirq based hrtimers=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/hG9pS+kvQw=7BFWSND/nel_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA9TmEACgkQAVBC80lX
0GygdQf/TrhMvPbHX5cg6aR0dAIhqXbQsbeXJcI5X6tYtSC2k5hpROusXIX/ad5U
NkUaojGE73AxDZc4Pc76aUgsMr2lrq10/OsPpQlGO58zJ2b3JfC0vPqHqUGntWo9
YvI1sXUlO2CRWb2leNJDQLLmb37WQOMvNPumt4LvfUoSs13qPNn7nNMi6q8X1RnC
kQT8ExvwGRLa8cqXdwRND7ybG1wbxx6UdCYuNwWHd/0Ri4J4+re/s0msrSPnK34i
LZEBThPMpbXvrFgJvCZ2XKfymZSuUDUw93/WbIERdvqn8XqE7yPxgHoqeUEaaW2A
SG/qYBlWXVAnCSbnNOwGbe4wl4XG7A==
=HA85
-----END PGP SIGNATURE-----

--Sig_/hG9pS+kvQw=7BFWSND/nel_--
