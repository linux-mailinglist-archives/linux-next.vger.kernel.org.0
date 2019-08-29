Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13156A294A
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2019 23:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbfH2V7N (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 17:59:13 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42863 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727956AbfH2V7N (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Aug 2019 17:59:13 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46KGj86KKWz9sDB;
        Fri, 30 Aug 2019 07:59:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567115950;
        bh=+dWKz4qdfHg7KwKEzWI+jshc8JO5ef2SjhmNbS20et0=;
        h=Date:From:To:Cc:Subject:From;
        b=YOczcEhg7sJbnnbMLCJLzuztDxmTFEx+RUMmK/okTxyLtdDjmzRx03sJbEdlJKssf
         6q1URJrh2E5670FJJaQ+Lnxo36OMLqusnP5upZgYvEt7cTVbuPmfRKAU9f2l09sC31
         tMebANhTYB6Vht4cNJrA4oycBKrdI26Ofuc6KCJT4ZHhk6PVvjItwfQDJ14dQjoatp
         x4/LUjgofm6cPg4p/n14TkSraAEoiZ/dgTUUuiB9gjFlcSH3VyqFUcV++RemowatuT
         c9l4EU0ysf6Z9TfClOoD9JSR7C7N+a2sxz/btaM1x4ycq3hpm8dwV6THLBilRaPFXU
         dKmSEf/Vf8ddQ==
Date:   Fri, 30 Aug 2019 07:59:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warnings from Linus' tree
Message-ID: <20190830075902.255b9c70@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YIpyK4wjFksG+_d6t+fNZa6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YIpyK4wjFksG+_d6t+fNZa6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

With just Linus' tree, today's linux-next build (ppc64le perf) produced
these warnings:

util/parse-events.y:1.1-12: warning: deprecated directive, use '%define api=
.pure' [-Wdeprecated]
    1 | %pure-parser
      | ^~~~~~~~~~~~
util/parse-events.y: warning: fix-its can be applied.  Rerun with option '-=
-update'. [-Wother]
util/expr.y:13.1-12: warning: deprecated directive, use '%define api.pure' =
[-Wdeprecated]
   13 | %pure-parser
      | ^~~~~~~~~~~~
util/expr.y: warning: fix-its can be applied.  Rerun with option '--update'=
. [-Wother]

I assume this is because I have upgraded bison to version 3.4.1 (from
3.3.2).

--=20
Cheers,
Stephen Rothwell

--Sig_/YIpyK4wjFksG+_d6t+fNZa6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1oSqYACgkQAVBC80lX
0Gy1FggAmpbr9SA0QbuTeCDiwUYJQdaEQ5UN5uvZMV9MMwu9tBiACdPGb2GFfrBF
0dlEq/QMnQfxvWqSvWmxt7AiMiDT1ecO7GRWli4jV/mUC7ec0xLGVTATcxBw7/x7
kJigr9sLDFaLoGDInpByUFL//h2cPgQp5r0eeZTDayVJi5jMwR2noT5S5SvbbT7R
E3B92tqfCM+SONgT5qtxLoFZ3Kg6AUHfe3WTjPAmOwX9iruaDIKJuNpZduw0OWmP
WOC0v42Od7JoU6YbYBaOFclWEIEPOerhJ7UjjL2xjXwice47Ge3iPMPaMytOvXmM
I4v05H4EghDb66r/GrLLoCtT9Z6r1g==
=fAa3
-----END PGP SIGNATURE-----

--Sig_/YIpyK4wjFksG+_d6t+fNZa6--
