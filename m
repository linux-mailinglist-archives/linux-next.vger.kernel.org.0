Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF8662415BE
	for <lists+linux-next@lfdr.de>; Tue, 11 Aug 2020 06:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725942AbgHKEbi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 Aug 2020 00:31:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725929AbgHKEbh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 Aug 2020 00:31:37 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2846C06174A;
        Mon, 10 Aug 2020 21:31:37 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BQfzm2mbNz9sTR;
        Tue, 11 Aug 2020 14:31:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597120293;
        bh=lH0hh9HItAqdFnEsLml057mz7IS57F9ksKMwehLchkA=;
        h=Date:From:To:Cc:Subject:From;
        b=YdYU9RwNViGoTplMNa7WzQWn6y7PP7vjzaF+ngdcHVLUWVUdZbjAIsQ2cyBuykHbB
         jQTJ8UPH4nmv6S3wZRuHmoJHHg7D3UrWer/X8rK+rzLKQyWEWkfltKLFWfLoatw4j0
         KkdmcAFvYhDQfc6cY1irfdBsDv0M3qIqLQHQjIRSSut5OffIxDkUSmlogEFQ93yJzN
         OXOkxcefKEqjlYiK6+myyLU4n/q3al/+MvctgimYd5WeRd6dZZS8WQbvJGHrwKrzIb
         8Asgp3HfFC8e5Km/PGBsqcKh/s3M/On6h/7wSodRLVhBJuItGDSYhZO77E5vPtKN18
         VX6bThmbjmaQQ==
Date:   Tue, 11 Aug 2020 14:31:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: new build warnings after binutils update
Message-ID: <20200811143130.0ca95b8d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/erkJSjbe9OxTryywCfNlziq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/erkJSjbe9OxTryywCfNlziq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After upgading some software, builds of Linus' tree now produce these warni=
ngs:

x86_64-linux-gnu-ld: arch/x86/boot/compressed/head_64.o: warning: relocatio=
n in read-only section `.head.text'
x86_64-linux-gnu-ld: warning: creating DT_TEXTREL in a PIE

I upgraded binutils from 2.34-8 to 2.35-1 (Debian versions).

$ x86_64-linux-gnu-gcc --version
x86_64-linux-gnu-gcc (Debian 9.3.0-13) 9.3.0

Any ideas?

--=20
Cheers,
Stephen Rothwell

--Sig_/erkJSjbe9OxTryywCfNlziq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8yHyIACgkQAVBC80lX
0Gywjwf9H9iISlmNbYp4XqfvPR/XG84Z/w6uHgEi3K1Yhw23/3texNtJa+NAAdML
WrUO25kJ6PhaTWGhL0K0ibo0dFssVZrUr775YSEQk8tvNavlMMmalHWpdO1fe53i
7X2TCWbW1Bj523jh7HtH0e97h7BJa7tqGg7/0Q1PdmSfH/6G2Zu/kNZzaVXpUvef
5pueQnT700gDJS1ScPnWNeofvW5OulXx3nIewirM1qXt0nCe1k8+6wQAU/wFytTv
g9H8rgGKRR3+D5Q7JRnn0ssVzARxdL/i1BQBp48qSlllmKplTJVUjB0RXEEynO8T
uz1JsjL1nXnBgnaV3FYyU1JqPiyq7A==
=T1Kn
-----END PGP SIGNATURE-----

--Sig_/erkJSjbe9OxTryywCfNlziq--
