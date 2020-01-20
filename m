Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12DB4142346
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2020 07:30:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgATGa2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jan 2020 01:30:28 -0500
Received: from ozlabs.org ([203.11.71.1]:34939 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725837AbgATGa2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Jan 2020 01:30:28 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 481MH43wr9z9sRf;
        Mon, 20 Jan 2020 17:30:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579501825;
        bh=ULh8c+M+Meu7IrxmRr9gXX7nZrh656kZljxewgU6B8w=;
        h=Date:From:To:Cc:Subject:From;
        b=RU7uxv5p7zIF8Mxd5NfmpsoCcX/IHBTs+Fn/UYnsk514xEKhQfJjE7egErxDfgYvQ
         uF2V4U9J80LEmYCroS+tFVFPLBVqo8ftlVHMOb2m3JZrbj+koTUfM0mev1e/Oiktcn
         LzHgaGuX9WQD5frBeUarFPmwOt+sD4EdCiYFK1C8S1ASB4ngf7dp5FEk6glmCq9kNg
         RbO+MJSsmDMpoDNlMIrgE1+9T+OVCfd2ilAY8VQIhU8P5Lk5U8aj2ItgbAMRdEcz3+
         Q9kuKwl2mYlmxov4OT9uBT7lPbPtFJzFWguznwU3LFnpoBTxTZU1cXuNgr4/ai8ufW
         QFgkjx7SYgiSw==
Date:   Mon, 20 Jan 2020 17:30:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexey Dobriyan <adobriyan@gmail.com>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Message-ID: <20200120173016.077dfda0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gjXME8QNH4.L5b1_MOJCvQu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gjXME8QNH4.L5b1_MOJCvQu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/x86/kernel/apic/x2apic_uv_x.c

between commit:

  d0b778880448 ("x86/apic/uv: Avoid unused variable warning")

from the tip tree and patch:

  "proc: convert everything to "struct proc_ops""

from the akpm-current tree.

I fixed it up (I just used the tip tree version) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but
any non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/gjXME8QNH4.L5b1_MOJCvQu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4lSPgACgkQAVBC80lX
0GzJwAf/bTjvrM3WnHJzcH/Zak2FR1Si7p2E/hQnIqE/gAF/OjphmSgTjxggsgXU
C56a69ZqPx9Uvtp4pHakKSv8RTvjmhreFpj/ecMTMyfKD97y4wyoXLl42IBZP25n
GNlpJq4M3XrskdOk3DPD1Y4vuaHtMflJ50cTADBGbLSUs7PQ4TIdlsB5lIuNu6ls
tP1Ygxr2sqfixTrSFNgfkTa4d9u8Gy9qu/vakjKjWKSXIMcCKelVyeLY09FzU37c
p6io8R68vAkBWQ8WaeSnthyaunNU9jEjpadCf7xRQ48VrFbDqAJnLXn2vqpSeD/a
H4vfwxZMYrBmlCVJaJ6VTxN5Tf5WnQ==
=DkMj
-----END PGP SIGNATURE-----

--Sig_/gjXME8QNH4.L5b1_MOJCvQu--
