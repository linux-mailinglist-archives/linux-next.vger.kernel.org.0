Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 607D527E8FA
	for <lists+linux-next@lfdr.de>; Wed, 30 Sep 2020 14:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729707AbgI3MwK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Sep 2020 08:52:10 -0400
Received: from ozlabs.org ([203.11.71.1]:34887 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbgI3MwK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Sep 2020 08:52:10 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C1bkG0VVJz9sS8;
        Wed, 30 Sep 2020 22:52:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601470328;
        bh=5uDqlMF7QMOoneOmZeOfQS1ttR1WOO7xw/PHqMk8yVU=;
        h=Date:From:To:Cc:Subject:From;
        b=hmlcrVmApJdPd8+xE8bpq0M43F/hU/dJBNrdcSUZ28dmb68vrdDhGp1XoQYK/hUoo
         bHvlAcQRUTPEQptJPQNdMf38zG0H5td7x1cSg+3eHgdgW3sAdN+3pA6BCxGMhUPgHL
         Vw29AuTt0BM8Pj6I7iAVMqx2P0eGRt8+23IXI+X8XAqNNtIOkaRZ1AuMHkNmcejwG9
         BSMAhv/tIk/hUbbRH851nSCqRkBY2s+zSEIXxQ8J6e6qNQMqjQ+gimus9EUu40t+qu
         y+MoTpv73R3eYQBMzvn1ID0TBcUd2BvWII/9UabKQS9y5SZ4m/w9bYxmxTAUzFW7qj
         +GIdu+lk7Y9qA==
Date:   Wed, 30 Sep 2020 22:52:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Barry Song <song.bao.hua@hisilicon.com>
Subject: linux-next: Fixes tag needs some work in the tip tree
Message-ID: <20200930225204.6a02d9a0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VDja9WA2r_K.PpQq0NRgshM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VDja9WA2r_K.PpQq0NRgshM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  233e7aca4c8a ("sched/fair: Use dst group while checking imbalance for NUM=
A balancer")

Fixes tag

  Fixes: fb86f5b211 ("sched/numa: Use similar logic to the load balancer fo=
r moving between domains with spare capacity")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/VDja9WA2r_K.PpQq0NRgshM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl90f3QACgkQAVBC80lX
0Gwjnwf/WqAmTyah3Ts8LrraXSTm5iNzKaFnjOpav93RKLLuaEIldOpwVECyxJaV
HPDb53YhHLdZaFIVwBNxfwK9WWgBzJ7uzl3uyW3h6jEfdBcu0eQnFxwaWFICXtE7
vRtDKtHhDbREhC2NvQcwZvFXdWPHg/T4cxInGacU9bw8Nq4SURmOpVpex3Aifgoz
ae+nLvK37HWhr3sc5aC0uNA1db4ZmepEMit4/ajm7M3na16zpKmEvTtjUVUlxe51
i5wyr5feVKfNKkDWMI27FUr89y+N3aKRAubfiYdXJFBVXrDPhz0l2aMQrXY5829P
83CqW7+I0vcDUdoJvSdp3U6AQxBN7g==
=TG9w
-----END PGP SIGNATURE-----

--Sig_/VDja9WA2r_K.PpQq0NRgshM--
