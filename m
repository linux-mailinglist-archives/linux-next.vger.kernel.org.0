Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61D2A2422BB
	for <lists+linux-next@lfdr.de>; Wed, 12 Aug 2020 01:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbgHKXKY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 Aug 2020 19:10:24 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47975 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726115AbgHKXKX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 11 Aug 2020 19:10:23 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BR7pk00hmz9sTR;
        Wed, 12 Aug 2020 09:10:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597187422;
        bh=AM6QLJKSoPTOWnFoSsN812sDOwIBi2sHVlPyFg4Yw2c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=p6YwdKzYYdamETp5iHH5GApTxtTewijgWo+iIWUYHscXk5RT/Jw+3K2IXeWnksuXw
         Cr45pMnD8S4dMFY97eElPOpjvtJau3eleWFrB8tpo8E3ljCXXwIPdaMgNopVMPLdj9
         juXtYAEhsYLtjRTDolTpPuMsYaMAD+vzUHI/v6nnJnftqlTOMhAzQ2adCAnabRvWaC
         ziIxmAlCGJX5E4tLwzaKT7uO6+OGZZv0StBtv74dcYyy4PHUu/hRJxqfgzpClMar11
         RCvuPpNXz7Z71Y6RGGiCV7xQyLqxD92ZBrVhdQTjdmZKZkTBHMWDCXQU4mth0pxCnj
         Ugtw4MskJyR/w==
Date:   Wed, 12 Aug 2020 09:10:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Trond Myklebust <trondmy@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the nfs tree
Message-ID: <20200812091021.7865278d@canb.auug.org.au>
In-Reply-To: <20200807103640.116e82f6@canb.auug.org.au>
References: <20200807103640.116e82f6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5Oph7D8GgpbtTAqk13z8q_l";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5Oph7D8GgpbtTAqk13z8q_l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 7 Aug 2020 10:36:40 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the nfs tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
>=20
> In file included from include/trace/define_trace.h:102,
>                  from fs/nfs/nfs4trace.h:2316,
>                  from fs/nfs/nfs4trace.c:13:
> fs/nfs/./nfs4trace.h: In function 'trace_event_raw_event_nfs4_read_event':
> fs/nfs/./nfs4trace.h:1767:34: warning: unused variable 'lo' [-Wunused-var=
iable]
>  1767 |    const struct pnfs_layout_hdr *lo =3D lseg ?
>       |                                  ^~
> include/trace/trace_events.h:707:4: note: in definition of macro 'DECLARE=
_EVENT_CLASS'
>   707 |  { assign; }       \
>       |    ^~~~~~
> fs/nfs/./nfs4trace.h:1759:3: note: in expansion of macro 'TP_fast_assign'
>  1759 |   TP_fast_assign(
>       |   ^~~~~~~~~~~~~~
> fs/nfs/./nfs4trace.h: In function 'trace_event_raw_event_nfs4_write_event=
':
> fs/nfs/./nfs4trace.h:1844:34: warning: unused variable 'lo' [-Wunused-var=
iable]
>  1844 |    const struct pnfs_layout_hdr *lo =3D lseg ?
>       |                                  ^~
> include/trace/trace_events.h:707:4: note: in definition of macro 'DECLARE=
_EVENT_CLASS'
>   707 |  { assign; }       \
>       |    ^~~~~~
> fs/nfs/./nfs4trace.h:1836:3: note: in expansion of macro 'TP_fast_assign'
>  1836 |   TP_fast_assign(
>       |   ^~~~~~~~~~~~~~
> fs/nfs/./nfs4trace.h: In function 'trace_event_raw_event_nfs4_commit_even=
t':
> fs/nfs/./nfs4trace.h:1917:34: warning: unused variable 'lo' [-Wunused-var=
iable]
>  1917 |    const struct pnfs_layout_hdr *lo =3D lseg ?
>       |                                  ^~
> include/trace/trace_events.h:707:4: note: in definition of macro 'DECLARE=
_EVENT_CLASS'
>   707 |  { assign; }       \
>       |    ^~~~~~
> fs/nfs/./nfs4trace.h:1911:3: note: in expansion of macro 'TP_fast_assign'
>  1911 |   TP_fast_assign(
>       |   ^~~~~~~~~~~~~~
> In file included from include/trace/define_trace.h:103,
>                  from fs/nfs/nfs4trace.h:2316,
>                  from fs/nfs/nfs4trace.c:13:
> fs/nfs/./nfs4trace.h: In function 'perf_trace_nfs4_read_event':
> fs/nfs/./nfs4trace.h:1767:34: warning: unused variable 'lo' [-Wunused-var=
iable]
>  1767 |    const struct pnfs_layout_hdr *lo =3D lseg ?
>       |                                  ^~
> include/trace/perf.h:66:4: note: in definition of macro 'DECLARE_EVENT_CL=
ASS'
>    66 |  { assign; }       \
>       |    ^~~~~~
> fs/nfs/./nfs4trace.h:1759:3: note: in expansion of macro 'TP_fast_assign'
>  1759 |   TP_fast_assign(
>       |   ^~~~~~~~~~~~~~
> fs/nfs/./nfs4trace.h: In function 'perf_trace_nfs4_write_event':
> fs/nfs/./nfs4trace.h:1844:34: warning: unused variable 'lo' [-Wunused-var=
iable]
>  1844 |    const struct pnfs_layout_hdr *lo =3D lseg ?
>       |                                  ^~
> include/trace/perf.h:66:4: note: in definition of macro 'DECLARE_EVENT_CL=
ASS'
>    66 |  { assign; }       \
>       |    ^~~~~~
> fs/nfs/./nfs4trace.h:1836:3: note: in expansion of macro 'TP_fast_assign'
>  1836 |   TP_fast_assign(
>       |   ^~~~~~~~~~~~~~
> fs/nfs/./nfs4trace.h: In function 'perf_trace_nfs4_commit_event':
> fs/nfs/./nfs4trace.h:1917:34: warning: unused variable 'lo' [-Wunused-var=
iable]
>  1917 |    const struct pnfs_layout_hdr *lo =3D lseg ?
>       |                                  ^~
> include/trace/perf.h:66:4: note: in definition of macro 'DECLARE_EVENT_CL=
ASS'
>    66 |  { assign; }       \
>       |    ^~~~~~
> fs/nfs/./nfs4trace.h:1911:3: note: in expansion of macro 'TP_fast_assign'
>  1911 |   TP_fast_assign(
>       |   ^~~~~~~~~~~~~~
>=20
> Introduced by commit
>=20
>   34daa637f2b2 ("NFS: Add layout segment info to pnfs read/write/commit t=
racepoints")

I am still getting this warning ...

--=20
Cheers,
Stephen Rothwell

--Sig_/5Oph7D8GgpbtTAqk13z8q_l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8zJV0ACgkQAVBC80lX
0Gw4xgf+IuWFaNVbzDiYqrE08lGLu84RY5ldldDIy+IJiKMXXUxOaHSScGkWUbJq
LJDe6em7uWpCtgHfCEWbGr5z3i1V5xzvP8w2Zg8q8kn/ySY9/aQKVuhDRs4Ewicj
JLarbUZczL6FAf6x222NMjR8JC8Ph4nbkkzwoC1AUUSb1BZYidsNO8QizPMmITGF
ClMrc6FCnSX/7E2K7td9z6QeLEme4iBif0GUXLV54yFPuxG7ZE/Ui1GMfmXwYyIj
Er8HKe1HRnfxJ0ONeI27FV23ikf3R2CHKRxh7+dDEmxsiSfiD7PZhfWzVMAoDVxY
JOITuaAm+PowLfO6LukJuTDpA5Z4Lg==
=603U
-----END PGP SIGNATURE-----

--Sig_/5Oph7D8GgpbtTAqk13z8q_l--
