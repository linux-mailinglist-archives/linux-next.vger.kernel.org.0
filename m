Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A054253A91
	for <lists+linux-next@lfdr.de>; Thu, 27 Aug 2020 01:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbgHZXKO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Aug 2020 19:10:14 -0400
Received: from ozlabs.org ([203.11.71.1]:39269 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726186AbgHZXKM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 26 Aug 2020 19:10:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BcM5Z11lMz9sTg;
        Thu, 27 Aug 2020 09:10:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1598483410;
        bh=z5ctlCqfpQSiaaUKhhW3pm7OPm/2TmtJuwJi1Rv8Ufw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Sr7J5md8r6piGynzMzHZybOXBaT9XnvSMRz5slWVrfefUev98iL/dK3363+z6DFZx
         nxKX2a81DtgPCAt181hfG3/x2TiVIjFzoifWbhVmPVqBZcWH5pmdNUqH54iij1v6GR
         tICKhxdmXFLY9OpMHi/uUtygb+keb2pHkLB/3kY9jbRKq3a6iF2rfMLxZwkSPl/WeZ
         3c+n//QfbKoQtLKyUfFOF4BNrBQALWo0OPMRCyzwUV9Hpfh5CLTaShy1IwMsQWUhu8
         6cMQoKOuaAplok+mSqO/QIV0ZhyiIyLTVWE7ASvQsjA6sv//V61aKYwYtG667LVTQd
         YJTV9xfZanyDw==
Date:   Thu, 27 Aug 2020 09:10:09 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warnings from perf build in Linus' tree
Message-ID: <20200827091009.54789c17@canb.auug.org.au>
In-Reply-To: <20200827083839.276cc0d0@canb.auug.org.au>
References: <20200827083839.276cc0d0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sh0yxupyRf/2dvxaYK2bPMO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sh0yxupyRf/2dvxaYK2bPMO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 27 Aug 2020 08:38:39 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> /home/sfr/next/next/tools/perf/util/namespaces.c: In function 'nsinfo__ne=
w':
> /home/sfr/next/next/tools/perf/util/namespaces.c:139:12: note: the layout=
 of aggregates containing vectors with 8-byte alignment has changed in GCC 5
>   139 |   nsi->pid =3D pid;
>       |   ~~~~~~~~~^~~~~
>=20
> I assume they are because I have changed all my toolcahins to gcc
> v10 today.

=46rom gcc v9, so I have no idea what the GGC 5 note is about.
--=20
Cheers,
Stephen Rothwell

--Sig_/sh0yxupyRf/2dvxaYK2bPMO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9G69EACgkQAVBC80lX
0GxNOgf/T5P7hf3R7SSGlGzduko4UfMAL/zp/p6R5+8ICzxDqs6IXJr4fcCDbjXp
4ajuf3ZNCdEsEI2lL9PNfGJpMx/57lR/q6Fe5HrdT1EnZ+1Bif1xFX23vNPm1/Mf
8NCxechKgNHvbPxAp/pjc/j8AvOMQlQWF5scQ56LeZa2pPU18KjwOcQGSgJYgMPQ
2uxhkgS4GFou98mQ5iMwHk8VzkSekwFu7A+bi8oQHfSoG9PKvrJ16VQCZElT8pNE
MgXKS0Cr0CvudVeV5FZPXSmGJTmmfpffmSswz0+6UAjlHKyXckpKtYYcDYBCVBFR
IyNb1piBQhllMeFpyi39NDXMFnOQPw==
=xhtC
-----END PGP SIGNATURE-----

--Sig_/sh0yxupyRf/2dvxaYK2bPMO--
