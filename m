Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96DA323E530
	for <lists+linux-next@lfdr.de>; Fri,  7 Aug 2020 02:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgHGAgo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Aug 2020 20:36:44 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54613 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725998AbgHGAgo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 6 Aug 2020 20:36:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BN5yf1zybz9sSG;
        Fri,  7 Aug 2020 10:36:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596760602;
        bh=G+kDgt44SsZYuVJDnpFeQASIMFtHjTuJWg69wtHW0j4=;
        h=Date:From:To:Cc:Subject:From;
        b=Yf26EGUtRp5R7Q27/hXK2bPYyCqaXA/bp7xn8HfnUz8adwPouQaFEFQrHsxWs4drs
         JHvFeRq13fxf31ufouWzVDIzdYY1AtOSJ4DVJ/Z4wdBTQw7mIjqdwkDo1XumorDxj2
         pZ6n80hrpBTOZfXxGEly+taqYJp1mhM+uQ2x2olCZSqFNkMX4BhN1QHcTcdwetxJbt
         k+snWIbQqhWjskOrfvACcSh5Ar+zF9EDApTWwzwZSEqafyzW+zpWehjHmiOD+YUGty
         7mxyiCwz71B7iy2cV67eYaqFrxQGo7IELSZQmV7+VyE7F1Ou/ImmDklqBFLMAZdXaa
         LUMb0jKgubgzw==
Date:   Fri, 7 Aug 2020 10:36:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Trond Myklebust <trondmy@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the nfs tree
Message-ID: <20200807103640.116e82f6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZnR5EW090Tzmib=+7x7aWl0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZnR5EW090Tzmib=+7x7aWl0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nfs tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

In file included from include/trace/define_trace.h:102,
                 from fs/nfs/nfs4trace.h:2316,
                 from fs/nfs/nfs4trace.c:13:
fs/nfs/./nfs4trace.h: In function 'trace_event_raw_event_nfs4_read_event':
fs/nfs/./nfs4trace.h:1767:34: warning: unused variable 'lo' [-Wunused-varia=
ble]
 1767 |    const struct pnfs_layout_hdr *lo =3D lseg ?
      |                                  ^~
include/trace/trace_events.h:707:4: note: in definition of macro 'DECLARE_E=
VENT_CLASS'
  707 |  { assign; }       \
      |    ^~~~~~
fs/nfs/./nfs4trace.h:1759:3: note: in expansion of macro 'TP_fast_assign'
 1759 |   TP_fast_assign(
      |   ^~~~~~~~~~~~~~
fs/nfs/./nfs4trace.h: In function 'trace_event_raw_event_nfs4_write_event':
fs/nfs/./nfs4trace.h:1844:34: warning: unused variable 'lo' [-Wunused-varia=
ble]
 1844 |    const struct pnfs_layout_hdr *lo =3D lseg ?
      |                                  ^~
include/trace/trace_events.h:707:4: note: in definition of macro 'DECLARE_E=
VENT_CLASS'
  707 |  { assign; }       \
      |    ^~~~~~
fs/nfs/./nfs4trace.h:1836:3: note: in expansion of macro 'TP_fast_assign'
 1836 |   TP_fast_assign(
      |   ^~~~~~~~~~~~~~
fs/nfs/./nfs4trace.h: In function 'trace_event_raw_event_nfs4_commit_event':
fs/nfs/./nfs4trace.h:1917:34: warning: unused variable 'lo' [-Wunused-varia=
ble]
 1917 |    const struct pnfs_layout_hdr *lo =3D lseg ?
      |                                  ^~
include/trace/trace_events.h:707:4: note: in definition of macro 'DECLARE_E=
VENT_CLASS'
  707 |  { assign; }       \
      |    ^~~~~~
fs/nfs/./nfs4trace.h:1911:3: note: in expansion of macro 'TP_fast_assign'
 1911 |   TP_fast_assign(
      |   ^~~~~~~~~~~~~~
In file included from include/trace/define_trace.h:103,
                 from fs/nfs/nfs4trace.h:2316,
                 from fs/nfs/nfs4trace.c:13:
fs/nfs/./nfs4trace.h: In function 'perf_trace_nfs4_read_event':
fs/nfs/./nfs4trace.h:1767:34: warning: unused variable 'lo' [-Wunused-varia=
ble]
 1767 |    const struct pnfs_layout_hdr *lo =3D lseg ?
      |                                  ^~
include/trace/perf.h:66:4: note: in definition of macro 'DECLARE_EVENT_CLAS=
S'
   66 |  { assign; }       \
      |    ^~~~~~
fs/nfs/./nfs4trace.h:1759:3: note: in expansion of macro 'TP_fast_assign'
 1759 |   TP_fast_assign(
      |   ^~~~~~~~~~~~~~
fs/nfs/./nfs4trace.h: In function 'perf_trace_nfs4_write_event':
fs/nfs/./nfs4trace.h:1844:34: warning: unused variable 'lo' [-Wunused-varia=
ble]
 1844 |    const struct pnfs_layout_hdr *lo =3D lseg ?
      |                                  ^~
include/trace/perf.h:66:4: note: in definition of macro 'DECLARE_EVENT_CLAS=
S'
   66 |  { assign; }       \
      |    ^~~~~~
fs/nfs/./nfs4trace.h:1836:3: note: in expansion of macro 'TP_fast_assign'
 1836 |   TP_fast_assign(
      |   ^~~~~~~~~~~~~~
fs/nfs/./nfs4trace.h: In function 'perf_trace_nfs4_commit_event':
fs/nfs/./nfs4trace.h:1917:34: warning: unused variable 'lo' [-Wunused-varia=
ble]
 1917 |    const struct pnfs_layout_hdr *lo =3D lseg ?
      |                                  ^~
include/trace/perf.h:66:4: note: in definition of macro 'DECLARE_EVENT_CLAS=
S'
   66 |  { assign; }       \
      |    ^~~~~~
fs/nfs/./nfs4trace.h:1911:3: note: in expansion of macro 'TP_fast_assign'
 1911 |   TP_fast_assign(
      |   ^~~~~~~~~~~~~~

Introduced by commit

  34daa637f2b2 ("NFS: Add layout segment info to pnfs read/write/commit tra=
cepoints")

--=20
Cheers,
Stephen Rothwell

--Sig_/ZnR5EW090Tzmib=+7x7aWl0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8sohgACgkQAVBC80lX
0GyfWAf/Uee0eK2oy5lPgp6E3AE82wOteR6aR8QaK6FnH4MyRK0f7/cZybUiwNQt
uA+9PBa/iCHJwWF6+2EAX0dKzRbR8Gsb/GCy0M+zc5De0AE/wSmz1PYYGFfXO8xP
eGMHehoA+M4LGCX657nNzc5jvdfkF52tEc1lDO/mwLLE2X14sBvRD1TO7rn7I2H/
Y5svpu/kRsqLXNUifVS/39Q1+wTN8vqBHv5BHImwRx5BeTe2skOhSnpO5dkmbyph
jn4So0dM0ymqC3a4dHUT8BkezWRn8jOoJp52Mr5tcbtCjH8UZ2RaG9WE2WGf1Bke
/yblRBLPx9GnSYzH+vY4ppmtBbx63g==
=/7HP
-----END PGP SIGNATURE-----

--Sig_/ZnR5EW090Tzmib=+7x7aWl0--
