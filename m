Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66C002A77B7
	for <lists+linux-next@lfdr.de>; Thu,  5 Nov 2020 08:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728580AbgKEHGJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Nov 2020 02:06:09 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41297 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726371AbgKEHGJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 5 Nov 2020 02:06:09 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CRZLM6vm9z9sTD;
        Thu,  5 Nov 2020 18:06:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604559965;
        bh=eiiw0DqvLdQmISYZqz1lj2XBa6bUyAaabWn2L2ldxzs=;
        h=Date:From:To:Cc:Subject:From;
        b=L7Nv/T565lNXhyWuUmTVoaOyC9e0+8nj5P3UdaE9BJp+vGR/MyLXn8wj3oyMPAM2F
         T9PtpVCT9iMsCXeRjft9n2kzCGJWYCv7Ivo7Hl+Wi2ej1JOXhza+Ek+QGjpROYcf/Z
         sLpmB3/RIIt4tbdApMLsubFATdE7Ka6/FYtVeqFj0MOjwWjfwulJoeKOyzq7yUFYtn
         YkNm9yXNbZj+UIHFahzOp+gFY63uhtZWDtlq4acGrEEIryW7mon6IXQlRQRX7Y5ifL
         qoTJ5l5S+2Pl+DsRK95GB7SwPtPefFZjheLSQQ/lexPsp7IlNGdRz0pF0iz8US1QKy
         FV3zykvI5xJ9A==
Date:   Thu, 5 Nov 2020 18:06:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Balbir Singh <sblbir@amazon.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20201105180600.08137bc5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Cd3yzi2=WyhwHzCtCbCJNQt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Cd3yzi2=WyhwHzCtCbCJNQt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/admin-guide/hw-vuln/l1d_flush.rst:25: WARNING: undefined labe=
l: documentation/userspace-api/spec_ctrl.rst (if the link has no caption th=
e label must precede a section header)

Introduced by commit

  767d46ab566d ("Documentation: Add L1D flushing Documentation")

--=20
Cheers,
Stephen Rothwell

--Sig_/Cd3yzi2=WyhwHzCtCbCJNQt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+jpFgACgkQAVBC80lX
0GwWVQf/V5/FxRPV5MuGL9pn8qmvN2FNPS1Aoj4nDa8A3S8I0myn7DbY07E9ApG0
ztPfMorL4S1ofTEDQoMVA9zz9RZFDhW1XD24fGp7Xv2/gXzWz19koe8O3MS2xTGP
Alo82+hpBMLsHBUj6JJMlS/bkAuU7m52nu0/eA2t9JJ10t+sJdkV/smEkRY/lhMS
4Yo9759KAMHUwMXQ9IcpUpv4LjZoH6g6Doo7RHLMcaR3BSnVg4ECaMyuPjnEwkEz
CGb1ABzWp4tXtQJf920CYBZSdUj26nBlDImzd+kx+lYjs6SBlcYazZILFY0cPqmy
Wqk11dugbLEBBIITeV7Dq0vyf2kKgQ==
=MpI2
-----END PGP SIGNATURE-----

--Sig_/Cd3yzi2=WyhwHzCtCbCJNQt--
