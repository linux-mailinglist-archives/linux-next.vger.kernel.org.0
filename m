Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02E992638EF
	for <lists+linux-next@lfdr.de>; Thu, 10 Sep 2020 00:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgIIWXb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 18:23:31 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45693 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726426AbgIIWXb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Sep 2020 18:23:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BmxP83Zpvz9sTM;
        Thu, 10 Sep 2020 08:23:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599690206;
        bh=/LELMHd64D8Vw4FvapsmxQ+3yrnc8Bc03jaD12MveK4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EG6bdLnyFPv+CMjFMQrdRZ9MPyKy0ImM7aAnNRkfPxy1eMx+uLfgg7aQbemxy7RoC
         hc2EiqgwA738c1J2/O/K8wFZXkb9NarqYk4BXUMeiul5dUr9LaGJT8le3+DR/SNz+v
         XM5nZj8lL1AgyUiOdqL8Xl3NJxyH89wI8LCs02tVZDza81s+51rivwHRPBJmeQFCEq
         xFFSReZzPEQF3535FGmh+1UVRtQM2q5OGDLCKkeBDMp1iFde/roRgg1DkVjGfHd4iB
         Qay2TarR8b249awhR0l+hXOPhB4aUGlV1GDDYLKfrgsq9eTcPMahu/KyEF3/3rikgK
         7jVYR/d/c3XlA==
Date:   Thu, 10 Sep 2020 08:23:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     jim.cromie@gmail.com, Petr Mladek <pmladek@suse.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, Jason Baron <jbaron@akamai.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>
Subject: Re: kernel BUG at /usr/src/kernel/lib/dynamic_debug.c:267!
Message-ID: <20200910082323.59e41def@canb.auug.org.au>
In-Reply-To: <20200909181251.GA1007128@kroah.com>
References: <CA+G9fYvg7voMNArr3nPpv_dRn10RwYos075NW_b5rFbBLZ=-8g@mail.gmail.com>
        <20200909144745.504c4cbfeea9bc298e3c6b9b@kernel.org>
        <20200909080025.GC3864@alley>
        <20200909122502.GB668220@kroah.com>
        <CAJfuBxzNFmgY=Wbz99K8QTxkBVDaJn5+gTTxUTJTtkJe7nxfsQ@mail.gmail.com>
        <20200909181251.GA1007128@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+KVPDKbrXvUrBxeMPlr_fAU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+KVPDKbrXvUrBxeMPlr_fAU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Wed, 9 Sep 2020 20:12:51 +0200 Greg Kroah-Hartman <gregkh@linuxfoundatio=
n.org> wrote:
>
> I'll go revert both patches from my tree in the morning, which should
> clear these issues up.

I have reverted them from linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/+KVPDKbrXvUrBxeMPlr_fAU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9ZVdsACgkQAVBC80lX
0GxGRAf/Zy1vE3KdsI6KlcgGDBQvA3vUsWVPwh/atRg9acrTyzUGedKKx8dB8Q3o
Pu0LVptygbCo7ne51xER4g0Xpo5sGpAHBHqoQV74s6kx2HgLD10q3vKTgzWKHQme
5nBHPMWty/kwPDvhF0pMgq8hCQvPb2Vm/fV8ujwVCdoC2rXeif3diPfyQE51WQ7x
Ijm6M5H44gQVjh3a5WxG0lo6ZgYcz9QrOS45D956RdxhOM+HM+ARM1ousOXKz+tS
32D2w7iXrxMcAUnh1u1g97KBB0jzzPNmyGbKt00QHnP0Q5oGyXwAsKbIN43wsZp+
HDRHyBD7QXDJ2pwr+TYVA/0y57lP8Q==
=nc1L
-----END PGP SIGNATURE-----

--Sig_/+KVPDKbrXvUrBxeMPlr_fAU--
