Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6CA32BB7A
	for <lists+linux-next@lfdr.de>; Wed,  3 Mar 2021 22:23:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348014AbhCCM3q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Mar 2021 07:29:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234698AbhCCLam (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Mar 2021 06:30:42 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9EBDC061756;
        Wed,  3 Mar 2021 03:29:26 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DrBbY6T37z9sXh;
        Wed,  3 Mar 2021 22:29:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614770962;
        bh=/wsM2mA+T5A4Y8Ehx50y1a70I8AFyZO1tygp3HzNI1c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZfVTiyPkbEaLdB22CkQvYCUefdNn/ooA9t9/yqpAID/nt4co+tXPO82BYDJ5zg1Hc
         g8MREH27zYtGeUPtaOwXYO372IYSZOZF4s//fyUgh646BLtzAMW9BEOSSMrb5eQ725
         OIhaDMGqAFipDYne3VssUXeM11wcJ/CCCmYMJwQr97F3LN+ZUptjQ7d5av76fsIV4I
         +5VQq2q0JJDdXXMmuMMNLYUVq1UYMbLuAqjvGz3Zli2nMPhV5RezYXfGD9jWgzqv26
         MOCt94Fhh/jB+mRmfuEXLYz+2/erZh2TL67WO6pmELIkPzNn3eHBi/U7Wswm4cQoEv
         sduFvGQBc5Prg==
Date:   Wed, 3 Mar 2021 22:29:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20210303222908.4b46ea60@canb.auug.org.au>
In-Reply-To: <YD9agIC1d6bOGYu3@hirez.programming.kicks-ass.net>
References: <20210303103842.1a0ccc8f@canb.auug.org.au>
        <YD9agIC1d6bOGYu3@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GGvPOwNS.q8f79ify8yTE3Y";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GGvPOwNS.q8f79ify8yTE3Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Wed, 3 Mar 2021 10:44:32 +0100 Peter Zijlstra <peterz@infradead.org> wro=
te:
>
> Damn, sorry about that. I've rebased tip/sched/core and all should be
> well now.

Excellent, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/GGvPOwNS.q8f79ify8yTE3Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA/cwQACgkQAVBC80lX
0GxShAgAhLizB08Kmvrr6JFLYVLN+iQcYk8bpJXGrYD/dnHCRepwaz3VAt8yiY/l
zO7N9hPtNBBiP9BB/srGJHLbD8Y+KON495GCBIkPdFOQKYBeeDTJcP431CKyZq5W
luc/CztIuWp6W/JIIhtroqDx7As/cuytB9CItFv8nqL2NNfyWFz70c5mJvrYkOPO
2ZYakkGoPz7hlsFmgQoz09gAG3EdGcKrV+dvGq2RvWZp5ciYe9cAQFGg9eSZvStc
jBhA/D4n3dCS8YlIT3Lt4JUnxxBQ3uaFDpGWl7I5MpFoMHKT8wPiB9YXgYXb2MNi
0+BydjzcNIv3d+oV4H7NbUogJaKzJA==
=9W8q
-----END PGP SIGNATURE-----

--Sig_/GGvPOwNS.q8f79ify8yTE3Y--
