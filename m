Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07B833EB1F0
	for <lists+linux-next@lfdr.de>; Fri, 13 Aug 2021 09:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239535AbhHMHsu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Aug 2021 03:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239528AbhHMHsm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Aug 2021 03:48:42 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A5BC0617AD;
        Fri, 13 Aug 2021 00:48:15 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GmFzJ6Qy3z9sRf;
        Fri, 13 Aug 2021 17:48:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628840893;
        bh=3GwkGOov2JNrlvSg/FXO8i3tIL+hKHVWG683e6ibvZw=;
        h=Date:From:To:Cc:Subject:From;
        b=MZd5b99723lXkmKu7qrjE4G7CGR9W+FZzOWRRju8DsYY8N1rHfxbQPH1BDdhADYOQ
         GIOPcaV6PF2OhUrCQfBQTfHsBskfT3L/8LMQtfNPm9uqm+xbJ5LJUtiIpr4wGcOvgv
         T4+jbW+7PALLISfcgCg5AZQtYiHP42N7QUAkVnrkJ1RIMdMjPP8TV98LiqVwli59za
         AQateoC1I30t8jluSpZW4mRfcbJjCFgbSYL6iwT/rK9N4g8jZSq8km9dcx4qpS7WJx
         2M0TcG8+8gdOZLMNDP00COWWHASNeeselG+1zBkJnA/1rc9fnAhNNu4YGQ4vVJ/geo
         GwPkOKxBIQKYg==
Date:   Fri, 13 Aug 2021 17:48:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Joel Savitz <jsavitz@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20210813174812.3eb1af5d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LH1wADt7gryIi3Pv/7Sq6LZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LH1wADt7gryIi3Pv/7Sq6LZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/core-api/genericirq:503: /home/sfr/next/next/kernel/irq/manag=
e.c:2111: WARNING: Unexpected indentation.

Introduced by commit

  61377ec14457 ("genirq: Clarify documentation for request_threaded_irq()")

--=20
Cheers,
Stephen Rothwell

--Sig_/LH1wADt7gryIi3Pv/7Sq6LZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEWI7wACgkQAVBC80lX
0Gwlawf+IzYGEJ0xD1IAQXjCYk5MuDaOyBjvsHWjcXFmYebyU74GPHK8WnDZZOkU
XGmk87RArBoF+H7puEmqgsZLLbDme/S8kyffQ/YlKMzbh0X+RxvLmYhAnncgyGo9
B4Q+WVWVgL2AJ/kRNdLirCATC6nG9bWKtREh6fwPGk+y9Sr8ZoMpBQoYtxm+6C2F
r8zrT8EZQmLwScXpoT2jQ/2gfpH80ZDMJorWC7Rl3UU4ecz5Fl2iGkEMDBpFymP0
FqpJCul9sIWr2o50Gopp9tWESrugrTIrTKHKyRnOJMKOaaqfc2AeWe/SoluKeu0h
u7rPVuUN1V7CeM+SwGKevKCGAu9tlg==
=ydfW
-----END PGP SIGNATURE-----

--Sig_/LH1wADt7gryIi3Pv/7Sq6LZ--
