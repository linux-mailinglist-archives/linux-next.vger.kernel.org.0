Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 408A922E571
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 07:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726064AbgG0FfP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 01:35:15 -0400
Received: from ozlabs.org ([203.11.71.1]:48161 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726116AbgG0FfP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jul 2020 01:35:15 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFT674WvTz9sRN;
        Mon, 27 Jul 2020 15:35:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595828113;
        bh=1EsiQmtDkiYBzy+8n8vWV2DMhajK8DJZlvg2WwmEZYk=;
        h=Date:From:To:Cc:Subject:From;
        b=qVUWNj74ZWUqEVoZEx/4cgO1IJ4ZFE5iCdwp/E9Vbb98cTvYi9IBbzgfjH2CMIce1
         yeCmYCkUfaL+tzLIfz5GaUeUh4IQK0T/U2/CgupZRCbkNFk5BVR2wTLL9e7JkeoISL
         P9esV1ALMy0dMP6ZxrUX1xoYR4T62dkgC4oCQMKjJK8h8lKUBgLluT1bVVazZYUnhP
         jqjN3m10L8HfgWy9WJ8beLjwsdhC9NcQ8gGmbcVKr9muepMVGTZrKpNEW/JnNKpxzZ
         /MJukrn85NjQcJe5knLdWTzABUS3TAJ0gLxYGjGvl6SWcQscLzRJh/MZhlBhq9q1G4
         FEvTvNXopvfyg==
Date:   Mon, 27 Jul 2020 15:35:10 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kan Liang <kan.liang@linux.intel.com>
Subject: linux-next: manual merge of the tip tree with the vfs tree
Message-ID: <20200727153510.0996a35c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jwXeHYB_R_DZH5TsxTSeBRK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jwXeHYB_R_DZH5TsxTSeBRK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/include/asm/fpu/xstate.h

between commit:

  c196049cc732 ("x86: switch to ->regset_get()")

from the vfs tree and commit:

  ce711ea3cab9 ("perf/x86/intel/lbr: Support XSAVES/XRSTORS for LBR context=
 switch")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/include/asm/fpu/xstate.h
index f691ea1bc086,1559554af931..000000000000
--- a/arch/x86/include/asm/fpu/xstate.h
+++ b/arch/x86/include/asm/fpu/xstate.h
@@@ -71,8 -103,9 +103,9 @@@ extern void __init update_regset_xstate
  void *get_xsave_addr(struct xregs_state *xsave, int xfeature_nr);
  const void *get_xsave_field_ptr(int xfeature_nr);
  int using_compacted_format(void);
+ int xfeature_size(int xfeature_nr);
 -int copy_xstate_to_kernel(void *kbuf, struct xregs_state *xsave, unsigned=
 int offset, unsigned int size);
 -int copy_xstate_to_user(void __user *ubuf, struct xregs_state *xsave, uns=
igned int offset, unsigned int size);
 +struct membuf;
 +void copy_xstate_to_kernel(struct membuf to, struct xregs_state *xsave);
  int copy_kernel_to_xstate(struct xregs_state *xsave, const void *kbuf);
  int copy_user_to_xstate(struct xregs_state *xsave, const void __user *ubu=
f);
  void copy_supervisor_to_kernel(struct xregs_state *xsave);

--Sig_/jwXeHYB_R_DZH5TsxTSeBRK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8eZ44ACgkQAVBC80lX
0Gy93gf/QMamEr9rHGIpLq4msB/JhcFzuNHEFPlAdmUO32Vq49lESHK0AinH3/WT
7FvdVr7g3inO5c1DOo27p04DihMDaSW6LLo9IOPNvikwrKkS3N1umd8nH+/v4RLk
EPnuXn5fhflZf7P2vYJu7OymmBTP2zRr8ByOOxf1IlEg+lcy5X4hTtDi9B1/LZDc
NmH7Ol5EVOFaYNXqXoFv6oQOYGkVsLZ+jnXJGqV0KdZaqggcQmvIvHmgy2uZeolF
6gCkKT3O7AEegL8C3PO7NoHJp06i/de3N/CN5wOdj0qnYdlUWxdqmDhSRlcAZa+I
M0ieB/Sa0DHhgtHTyLTiiDqg2iakSQ==
=oNRR
-----END PGP SIGNATURE-----

--Sig_/jwXeHYB_R_DZH5TsxTSeBRK--
