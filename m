Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4EED10FA3E
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2019 09:56:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbfLCI4n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Dec 2019 03:56:43 -0500
Received: from ozlabs.org ([203.11.71.1]:51267 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725773AbfLCI4n (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 3 Dec 2019 03:56:43 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Rwny06Zpz9sP6;
        Tue,  3 Dec 2019 19:56:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1575363400;
        bh=rLUZ5I8nkV1Qs7Hb4D7S8/qNMVguWkmV6p7J2AUZm+g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HvzCemeYNhQojbC3koJJprxVGIF0P186zzCZF7XDyrcOgH4huGOi6fYo9kCEPXQht
         FQSe1ZBB/Ep6MDVk5qPGKJQZsaB5ea/ZBueCcFqjF2iJRGFIPtKeUHl/I/GUqxDILI
         HRaM2Jf07NSLBhbs/sd4iXOARVvb8U80WigarRgMcaoV0E2VYhUut6MI28rhUXqRMH
         YIgGUUycFu6oIO56WP/YHuCfxU5zdwHqIyldLtxYmEekUlCok53mmaQtzYHXlibm2b
         TBaPKCqYnxGVaxOKqAkm5QJwanDropTI61z5LuojEg3/a4hUT/rnhIhSXIlb32c5Xk
         3y8AD2ZfWP2+g==
Date:   Tue, 3 Dec 2019 19:56:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ingo Molnar <mingo@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20191203195442.27ecc269@canb.auug.org.au>
In-Reply-To: <20191203065709.GA115767@gmail.com>
References: <20191203131024.6e36ed88@canb.auug.org.au>
        <20191203065709.GA115767@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VUWcxgQPttfZ6N6uBlvWJj5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VUWcxgQPttfZ6N6uBlvWJj5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Tue, 3 Dec 2019 07:57:09 +0100 Ingo Molnar <mingo@kernel.org> wrote:
>
> No, the correct resolution is to apply the 91298f1a302d fix to the new=20
> file - which is in -tip and which I've now also pushed out to -next, so=20
> -next should pick it up tomorrow.

Excellent, thanks for that.

--=20
Cheers,
Stephen Rothwell

--Sig_/VUWcxgQPttfZ6N6uBlvWJj5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3mIz8ACgkQAVBC80lX
0Gz+twf8Dq18fRNU5bKBQT1toG3PwW8SH4WZf/SsLjrpeWqYXPoOtanW/mwmQlci
W4aH9xKlspcc3WDFJjZtq4wuSgG2DqS7kT0ag57TNQ9hNO+Wws9ASE0eSJuDbV/I
iYMcRxhyr5RKkFrpZa/nJDzhFesoqqLnQGMqFh6n4OWwbH8lNdaapVy2TCzyIb2N
d4NYLZNJ1KTTYNJjAkBWMfoqbR1vO4hmZPFfKVOZ6oEFxAuLyANhkG+RYqR/rGq3
xyrdTSTFqDQSdNGpMbjM6unyl0yE9lSE2qSFOaGXMGEYrD8nhOFomRAxWT0r+uSr
RcMmMkD/c0oNlaEzIxvg7iPrwNJ8ew==
=YrwZ
-----END PGP SIGNATURE-----

--Sig_/VUWcxgQPttfZ6N6uBlvWJj5--
