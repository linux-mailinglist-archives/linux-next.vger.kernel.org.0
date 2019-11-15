Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB6AFD6D7
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 08:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727189AbfKOHUZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Nov 2019 02:20:25 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:39931 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727149AbfKOHUY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 Nov 2019 02:20:24 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47DqW81rMpz9s4Y;
        Fri, 15 Nov 2019 18:20:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573802422;
        bh=LM6xmvHrPreW6mzZu38Dn9qophgxT+bW8lYuLVSPfZE=;
        h=Date:From:To:Cc:Subject:From;
        b=J4F1OP6sNFrCptustRou/gNfz8bFJdDwmkHXzVCZE3Daf9YZzx4G5tSSIstE1k3V8
         YMiIBCTQtkV9WT9oGO4ehEWUv+RMdjY2k6+xkI4hYxrH2GW9Hkr/8gQi2R+Ckgl4hm
         iXOOq+bPkvcZ8ngJdQBVyw2q7R6PFYH4MDXQGn7HIUjpXGn+Nc+5gzBtBRxpUIz64g
         zrYjuYgm7MdINYtpAlmT6WIZca/NLQNJEKmj4wr1Sgk/9FowUo+VDhplV7ALWJDlVN
         7jar2szL/K+0ZcC3pQMRus1ILd8y2KRj4ksd6basvnJ+nleJOnQPE4PZz7MfOeYmhy
         yh7YbdRsIL50Q==
Date:   Fri, 15 Nov 2019 18:19:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Joerg Roedel <jroedel@suse.de>, Qian Cai <cai@lca.pw>,
        Shile Zhang <shile.zhang@linux.alibaba.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20191115181957.4e72c0a2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L9OszikJgm9INM/FZI9NSuJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/L9OszikJgm9INM/FZI9NSuJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[Also reported by Randy Dunlap]

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

mm/vmalloc.c: In function '__purge_vmap_area_lazy':
mm/vmalloc.c:1286:8: error: 'SHARED_KERNEL_PMD' undeclared (first use in th=
is function)
 1286 |   if (!SHARED_KERNEL_PMD && boot_cpu_has(X86_FEATURE_PTI))
      |        ^~~~~~~~~~~~~~~~~
mm/vmalloc.c:1286:8: note: each undeclared identifier is reported only once=
 for each function it appears in
mm/vmalloc.c:1286:29: error: implicit declaration of function 'boot_cpu_has=
' [-Werror=3Dimplicit-function-declaration]
 1286 |   if (!SHARED_KERNEL_PMD && boot_cpu_has(X86_FEATURE_PTI))
      |                             ^~~~~~~~~~~~
mm/vmalloc.c:1286:42: error: 'X86_FEATURE_PTI' undeclared (first use in thi=
s function)
 1286 |   if (!SHARED_KERNEL_PMD && boot_cpu_has(X86_FEATURE_PTI))
      |                                          ^~~~~~~~~~~~~~~

Caused by commit

  07ef40e149bf ("mm-vmalloc-fix-regression-caused-by-needless-vmalloc_sync_=
all-fix")

SHARED_KERNEL_PMD, boot_cpu_has() and X86_FEATURE_PTI are only defined
for X86.

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/L9OszikJgm9INM/FZI9NSuJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3OUZ0ACgkQAVBC80lX
0GxL2wf9Fxo8b0GmHsZw4GufJCuZBc8+Y3x/zDuvSM0K2taHwa4/tWtHnglBXj6a
vwJ0LuEBgU8P98GO+B0IYDve98qJdATNH0LgypA9iDgYXnHxkFFx1A5DKzuY+776
SXhkqsOB5kcDA+890p2tkShB4EqokEjHm220EAKQVrATu9YGgtPYyI3ZHSZpMhoc
w0tsDDNTvYQydogGEkwO0DESBNgbEznuVi7Vc/tJEaI3Ptb4Hu4ykaRcm5oi0Ljd
FtuWjpEUrgpN4NTZXUPQmcrGNFowhiynzk08sCwnJVgbotjcrU0AD/ARf1oILHPj
8cyDcbhfmm94y2PcZGBfMYRklct10w==
=/jTC
-----END PGP SIGNATURE-----

--Sig_/L9OszikJgm9INM/FZI9NSuJ--
