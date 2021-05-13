Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62FCD37F11D
	for <lists+linux-next@lfdr.de>; Thu, 13 May 2021 04:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbhEMCGa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 May 2021 22:06:30 -0400
Received: from ozlabs.org ([203.11.71.1]:58911 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229630AbhEMCG2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 12 May 2021 22:06:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FgZk472Txz9sWP;
        Thu, 13 May 2021 12:05:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620871518;
        bh=l1TnfDBLgZS56JHv3aiPuxRjNqwIJx/l19ZliNilTeE=;
        h=Date:From:To:Cc:Subject:From;
        b=sEWWfS2SNUFACnCA+45NHPHXKhcS4ccoEUsuk0x2BLVwvawG1rJqy58Xk8vivDz7E
         PA8gWt9bDLa21K/zMui5oEo4j3/YmPqfCfTq+553ZHUcER3osa2lFrv9dFslb6Hs/c
         /v4L0gk8voEmuBkUm1ARb0subK0x3kcBaazxIJBm1nDroJjW/NX1dEgtf9Gs/tmiW+
         oKwapuUE6v3RN5/bQ9A0KiiiMI1J3MCv+0td6POJquAhaI/neVPzYRbqYn3GsqrAla
         mx77UawttgQ9EP0QQ5PmjSF8MT5LWD/yNml1N4pi3zBEp+RjYCF31lzN4Ro7bbTeqg
         GdyULzZEoMrdg==
Date:   Thu, 13 May 2021 12:05:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20210513120515.7060879c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O1nRwKj67qoBTXuteephxLO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/O1nRwKj67qoBTXuteephxLO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from tools/arch/x86/include/asm/nops.h:5,
                 from arch/x86/decode.c:15:
tools/arch/x86/include/asm/asm.h:185:24: error: invalid register name for '=
current_stack_pointer'
  185 | register unsigned long current_stack_pointer asm(_ASM_SP);
      |                        ^~~~~~~~~~~~~~~~~~~~~

Caused by commit

  eef23e72b78b ("x86/asm: Use _ASM_BYTES() in <asm/nops.h>")

I have used the tip tree from next-20210512 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/O1nRwKj67qoBTXuteephxLO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCciVsACgkQAVBC80lX
0GybeQf/RhJX3EW+Kqukm2IGK+GSkV2T8L9KC0BSyjWBd+JJ9WmW3z/XBgTUOXSC
8ExtINncxDPcMrDx9qc/RlTicRMz5JBguBaUaWQITQ6tWIzaxBN1Pm6nzk8K/g4Y
qPAovRULc9FXxaWPCvoEIGL8al1DbeIFJUBANTJQhy2ZG8gzBfzKVMNHiqhFQ5MY
ps9r/y1LTX9IGTjYI9sBVXAb1iraws/nv3FLONTJQR/CKDKg8btJ650auWIcWt5f
MUpYu90ZTZZy1q/TBVcBcAdD8T/TcBQALTx/3UzxhQBcZ6xpDoXBibuWVOU7x3PJ
niyKmF4qpDqpT7ebGyzUficipfkzgw==
=7c38
-----END PGP SIGNATURE-----

--Sig_/O1nRwKj67qoBTXuteephxLO--
