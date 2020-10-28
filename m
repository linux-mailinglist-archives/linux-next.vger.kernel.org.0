Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AAF129E2F8
	for <lists+linux-next@lfdr.de>; Thu, 29 Oct 2020 03:45:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgJ1Vd4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Oct 2020 17:33:56 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58847 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726220AbgJ1Vdu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Oct 2020 17:33:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CM1s44ftyz9sWB;
        Thu, 29 Oct 2020 08:28:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603920505;
        bh=snKZekqSj5X0SEu2SYP0oRU9s8xOWUfYN4qbn5e4ONk=;
        h=Date:From:To:Cc:Subject:From;
        b=HtQUq2NVp0YdsmMpBKOQ4c9UaNRuIVbEcQNlwgc0Agzg4CbHttZ+XCvQUPlWtixeO
         7kKAYVuqy/g8okOvLRVdhqhtYjPv7DZX2xxh02TI9Oi3SD5JPC+HHFSe1JaHNA2cmM
         zBKje4XFcH4FuDBxjv3jsnulJnbMqVw9p2Q6pVnNyDlUmNtbvmDg6re5UpHNfqsh/3
         7qfUVaRmP2I1zAwAc3e3mOR01HPzra/YJrOJ7cIru+Zu1CtBkZxsCpqLYHeDa9FPoP
         nn8DwQUVBjOstToerkza9OHy+pM40n99L+GiAxlGF4tAhBAH4FLHFnpmFudZbsNizg
         dzPHeKbZLFbNw==
Date:   Thu, 29 Oct 2020 08:28:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the drm-intel-fixes
 tree
Message-ID: <20201029082823.5607849a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dQULV+0/80.FBln91SwcyY/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dQULV+0/80.FBln91SwcyY/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  d13208a88f41 ("lockdep: Fix nr_unused_locks")

is missing a Signed-off-by from its author.

Also, the author's email name is missing the leading 'P'.

--=20
Cheers,
Stephen Rothwell

--Sig_/dQULV+0/80.FBln91SwcyY/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+Z4ncACgkQAVBC80lX
0Gx3sQf/cVHu8vXAlBPXHnSwfP91xfnhnUdRHNe4kt7TccXf05LmknL83lcVrbnM
RhUlK8M4sZzS1k1HVHtT/Uozj6BqavmFzqjprijnJ3zj3r3CWJ+D6D8Z49THWC+s
MAUDhY7mn0xh/52wN9PaUTM9+QjSQ6gJvJfWqMUZ4OniM/GCYxM4Vw+LZER0yXl3
UJ82jE8sAwtxMN/pFYa3ugNnCfr2YIy+WUjU+CERPCHx+N5LvqQLXocXnSmc99zk
SIg2LBfP7ZYY+blju85IYJUM12JfWCzQN1urqguL4Uf+mA0R2IMqQ6H6d9Q0t/N7
zDg3Ui/I1rfjDWk9j+d5sX6AK94MuQ==
=nvFU
-----END PGP SIGNATURE-----

--Sig_/dQULV+0/80.FBln91SwcyY/--
