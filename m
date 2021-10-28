Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82B7D43E0F9
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 14:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbhJ1M3W (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 08:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhJ1M3W (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 08:29:22 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF45C061570;
        Thu, 28 Oct 2021 05:26:55 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hg4Yn1V0dz4xbr;
        Thu, 28 Oct 2021 23:26:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635424014;
        bh=J43BOHXi3s6ZgPk25TW9tHUw2VoU1KG5nl6oX8vdGuo=;
        h=Date:From:To:Cc:Subject:From;
        b=sqbwWTEp9NGLBY8h9H24M4ETUggKgpMisV0Kz+I3Tgh+kxVk+x84ZLwQkfDizyCSo
         n+e6TqmZ/SQa779zSp7fjJT1fVMANwGXPzA8EO6841njxAzO/JuJwmPit6Ads3zQ9w
         YcneJuXjMpxT9Xi3Stm7yT7IOBs1gK6ITtA0KpL5d9A52btTbLNpBHlRR8ooc+fwcK
         14TJrf++lwCsP5DM6fJV9Zpqd/ppo+IAfBXZuiMEUIpYQorRr5D8PcrnUM19hNQb6n
         2Wu1en7SxwC4of8eM6BehB2XDcvfJJvs35TopgbzmpE91mg3rXya91Uq27w27dgO9f
         zrZ7zfhNvDYEQ==
Date:   Thu, 28 Oct 2021 23:26:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Borislav Petkov <bp@suse.de>,
        "Chang S. Bae" <chang.seok.bae@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20211028232651.31c01c86@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gnZxGiik2qDnuEnbS2yzXQE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gnZxGiik2qDnuEnbS2yzXQE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/x86/xstate.rst:15: WARNING: Title underline too short.

Using dynamically enabled XSTATE features in user space applications
-------------------------------------------------------------------

Introduced by commit

  93175ec299f8 ("Documentation/x86: Add documentation for using dynamic XST=
ATE features")

--=20
Cheers,
Stephen Rothwell

--Sig_/gnZxGiik2qDnuEnbS2yzXQE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF6lwsACgkQAVBC80lX
0GxSMwf9FjzaUVcD0hGx6SNA9oN/Y50RmNDYOCDWE3ESzk+r5eDyS6nTqg4EnM6H
luCxVAjlLpdCNDd7KobGIeN93HOIE5HTOZmTBAyZT8NObpGY8fk8pcMco7+fgv6J
wfC8PFgDmirFUXi8Gp+pWUbr6C+4GAb0HY3lfX7YS4/G8pDCDrUyTZB7zk3oWBcN
2FmepMovIxBvf0XTcKjcQWbH0mwfpXL9OlBdLfF6fIwA9izQWytPmgNBkkn0SjB4
Rhwn/hArUXoUH0LF5Tg8KOC/Lzn896oaXcmGdzrE0OqqUIrN2CO4mHncX0enfzUL
Tzm7O8QouEiHnvgrpX3qdiIg1ZQ3qg==
=de3Y
-----END PGP SIGNATURE-----

--Sig_/gnZxGiik2qDnuEnbS2yzXQE--
