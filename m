Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 900C589713
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 08:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbfHLGMl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Aug 2019 02:12:41 -0400
Received: from ozlabs.org ([203.11.71.1]:35127 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725822AbfHLGMl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Aug 2019 02:12:41 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 466QVs64CLz9sN1;
        Mon, 12 Aug 2019 16:12:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565590358;
        bh=pOEPhG+/RGwGtNl2Qa47jqW4DKafXj0rUWcYO1vB2Xo=;
        h=Date:From:To:Cc:Subject:From;
        b=E4CmTLZgQcV6f0nEZHp7rJhVr44nrj8SAe9rzWKCQTYl1WB8O3lv3ju1vmuznk3QJ
         lI/bstRXjSmrgZ/scNjDzaEnKsOA7RirGu4cWjPW6cPkUv3uyjUDhKROXU6Tmz4n58
         UF7sweFyTMsds2Dx+sRQ6tnnIBX++E2gHWVmR8GZAhmvSyOgdLckrDSihXYU5ThGXx
         4f7JgzWabMOk3/9Qs2I5tS/42vhx1r/HZ25hb1llLNpznSbMwMJMkw1IkOBcgNRQ88
         7RRsKdhWvttZ5u4baLnmhlU1fHEHb3Pszp8VAzVWD7Fe9EOi5TpAP7ac8VzPdSw3fx
         ZYSgNEtiHiHhQ==
Date:   Mon, 12 Aug 2019 16:12:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: linux-next: build failure after merge of the rcu tree
Message-ID: <20190812161236.21defb17@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//CSq7Gt6RsUb+TNh9NYHfeD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//CSq7Gt6RsUb+TNh9NYHfeD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

arch/x86/xen/smp_pv.c: In function 'xen_pv_play_dead':
arch/x86/xen/smp_pv.c:439:2: error: implicit declaration of function 'tick_=
nohz_idle_stop_tick_protected'; did you mean 'tick_nohz_idle_stop_tick'? [-=
Werror=3Dimplicit-function-declaration]
  tick_nohz_idle_stop_tick_protected();
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  tick_nohz_idle_stop_tick

Caused by commit

  a96f9dca9820 ("idle: Prevent late-arriving interrupts from disrupting off=
line")

Also:

In file included from <command-line>:
include/linux/rcu_segcblist.h:69:2: error: unknown type name 'atomic_long_t'
  atomic_long_t len;
  ^~~~~~~~~~~~~
include/linux/rcu_segcblist.h:74:2: error: unknown type name 'u8'
  u8 enabled;
  ^~
include/linux/rcu_segcblist.h:75:2: error: unknown type name 'u8'
  u8 offloaded;
  ^~

Caused by commits:

  e084617762b7 ("rcu/nocb: Use separate flag to indicate disabled ->cblist")
  5e114ba3d7a5 ("rcu/nocb: Use separate flag to indicate offloaded ->cblist=
")
  9f3ca0945104 ("rcu/nocb: Atomic ->len field in rcu_segcblist structure")

We prefer our include files to be standalone now if at all possible.

I have used the rcu tree from next-20190809 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_//CSq7Gt6RsUb+TNh9NYHfeD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1RA1QACgkQAVBC80lX
0Gy+ywf/RLWpPZS6gUI31MOJ8x+REwGZSn76bsaJd8z4d0htogdXtDsUQdL/FJWS
5S5zI5V7XoUqYuXqmco6/59mcLYIS0JWtxfpaVSKEQTblXHgP59sbzSKIxlfIekF
tE3W6I6lUbziRIYWggYA8EnnwB6T7oqPvhjghJyyuCwPixoBTb7JoqE5y0zr7KgZ
PwSXnV5h7YFoh8DN/lpJx/suWIhiGwkR0IL2neHSBxK3tikcoiMmdzzqTD3ao6Y4
NWtU20y8KPz0Bhl9Riudbwz/bc5SE9fxjvvvzR0WQU5VDgO1tXHIqdgYAw2yLEx0
0zNi82acCXhpwzNEc+Q1B+upn1y3NA==
=jpAy
-----END PGP SIGNATURE-----

--Sig_//CSq7Gt6RsUb+TNh9NYHfeD--
