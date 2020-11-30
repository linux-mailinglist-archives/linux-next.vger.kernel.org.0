Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 885A92C91FF
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 00:06:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729456AbgK3XGb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 18:06:31 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33263 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725861AbgK3XGb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Nov 2020 18:06:31 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4ClLSD4Hn6z9sSf;
        Tue,  1 Dec 2020 10:05:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606777548;
        bh=j10y7Pia6yomnRBQd0edKArcsyQ5ywX/FomootgRMRg=;
        h=Date:From:To:Cc:Subject:From;
        b=lDdnXWaInkR7f2reF2WiYBuP5k20/DDjrLGXZSOrK+qznDGzldRo2m3GqWNWm8+iw
         f1RBGyq0ohNkFVQ6h8Lk92XJt+aQOOQan5bnwxWeCCg6IFDH9C/hoqh+2+qHIAHeBe
         gyODtqAC+XWA6a1G4FBAcOkUTNQeVJDkp5qsyZjQf2/bbaPJhJ4q3Gr15Lt/5m03vS
         134SeAAs1Tt2PhdQFvxOffuzFx2Het/A7u49ZHvUQBFjiL4La4TQKrbvgr5i035yW9
         akqBvymqwX90H/w3mbtibt+V2Q2QGv1qbbfIlrvdUWkMMMA9pEsGbLWN7RETy7KHIj
         sBpJknsSmScIg==
Date:   Tue, 1 Dec 2020 10:05:47 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Collingbourne <pcc@google.com>
Subject: linux-next: manual merge of the arm64 tree with the arm64-fixes
 tree
Message-ID: <20201201100547.16b07093@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cgelLJKHZ9l2WYmmiiAMwH5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/cgelLJKHZ9l2WYmmiiAMwH5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/include/asm/exception.h

between commits:

  23529049c684 ("arm64: entry: fix non-NMI user<->kernel transitions")
  f0cd5ac1e4c5 ("arm64: entry: fix NMI {user, kernel}->kernel transitions")

from the arm64-fixes tree and commit:

  dceec3ff7807 ("arm64: expose FAR_EL1 tag bits in siginfo")

from the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/include/asm/exception.h
index 0756191f44f6,2a8aa1884d8a..000000000000
--- a/arch/arm64/include/asm/exception.h
+++ b/arch/arm64/include/asm/exception.h
@@@ -31,13 -31,8 +31,13 @@@ static inline u32 disr_to_esr(u64 disr
  	return esr;
  }
 =20
 +asmlinkage void noinstr enter_el1_irq_or_nmi(struct pt_regs *regs);
 +asmlinkage void noinstr exit_el1_irq_or_nmi(struct pt_regs *regs);
  asmlinkage void enter_from_user_mode(void);
 +asmlinkage void exit_to_user_mode(void);
 +void arm64_enter_nmi(struct pt_regs *regs);
 +void arm64_exit_nmi(struct pt_regs *regs);
- void do_mem_abort(unsigned long addr, unsigned int esr, struct pt_regs *r=
egs);
+ void do_mem_abort(unsigned long far, unsigned int esr, struct pt_regs *re=
gs);
  void do_undefinstr(struct pt_regs *regs);
  void do_bti(struct pt_regs *regs);
  asmlinkage void bad_mode(struct pt_regs *regs, int reason, unsigned int e=
sr);

--Sig_/cgelLJKHZ9l2WYmmiiAMwH5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/FessACgkQAVBC80lX
0GwIbwf/ajXfI7wh01FSX0MpaI4707DMIiT/9GiT1UnA3nWQKOZ8g5OLPVVDuXuv
GFHCUpQ7z5tOcAfReKjl62fgMHveUGvP7Ee4eYynq9ufrcwcMLBPaRxpmQFHWQVV
RPsq433K+cVo0s1EaZbaiNZuZnt35GKSd3AKktGamENz4He6PiAaCvTRxfXPK1WE
81ognDt5ZdFcSN+XMZfPX6HbtphtaIzlPkCIJfulGC04WMLd2z7r9DGNo5c6HYmr
WlZ5Ec0WC8aDCMmnayxUVyN+LGMB8xtAwy5JU7tCWvCRze3m0LJoG4eG+XyYKgia
rZMQDAOvZfkpw5/I4yRqwOzlt/BG8g==
=rvbK
-----END PGP SIGNATURE-----

--Sig_/cgelLJKHZ9l2WYmmiiAMwH5--
