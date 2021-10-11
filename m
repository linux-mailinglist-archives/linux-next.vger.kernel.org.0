Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74953428513
	for <lists+linux-next@lfdr.de>; Mon, 11 Oct 2021 04:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbhJKCX1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 Oct 2021 22:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231578AbhJKCX0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 10 Oct 2021 22:23:26 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76DA4C061570;
        Sun, 10 Oct 2021 19:21:27 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HSMwz2wMCz4xbV;
        Mon, 11 Oct 2021 13:21:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633918885;
        bh=qGj4JuuOQ7aMU00GqyhAwyXP3iaQyCXLKl8P0Nd07qM=;
        h=Date:From:To:Cc:Subject:From;
        b=Pq/zV3jDZoVM4vWqyDsrQnk7wnyuxf9syRDdL4OwUIdZGot6yxvyAKljLpWBwlwLu
         kBLhkpvfQDF4omCuYTMPNoVc4A/lRvHf/hMZj2gpmP3VLI5IOBnhnTd3Sxgevngclx
         hJWQnaEiA9SuptcgdtZFTlRQxmtAZLFOFyWqjae4VAmmy8JFP35vK2+c4yRsp2b6XT
         2l3+vLllHBwmrBo73wwAjDry/pKtJZSefdwSjs9unjXGdMVnT2nWQSmG/Zu91Gq+H+
         xepX7REqmgxJ/wzXCUCdDUMs5Nhh36dN7uFixnPKHmJC3BaexthrkgFgJH0BZnUFLh
         flT/HJIG+kjRA==
Date:   Mon, 11 Oct 2021 13:21:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Borislav Petkov <bp@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20211011132120.7bdb70d9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//6sOA+BwMo_Xl7u7csf2ryj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//6sOA+BwMo_Xl7u7csf2ryj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/kernel/fpu/signal.c

between commit:

  d298b03506d3 ("x86/fpu: Restore the masking out of reserved MXCSR bits")

from Linus' tree and commits:

  052adee66828 ("x86/fpu/signal: Change return type of copy_fpstate_to_sigf=
rame() to boolean")
  908d969f88bf ("x86/fpu: Restore the masking out of reserved MXCSR bits")

from the tip tree.

I fixed it up (I just used the version form Linus' tree, but with the
changed return type - see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/kernel/fpu/signal.c
index fa17a27390ab,ae51e50f25e8..000000000000
--- a/arch/x86/kernel/fpu/signal.c
+++ b/arch/x86/kernel/fpu/signal.c
@@@ -377,16 -382,10 +382,16 @@@ static bool __fpu_restore_sig(void __us
  	} else {
  		if (__copy_from_user(&fpu->state.fxsave, buf_fx,
  				     sizeof(fpu->state.fxsave)))
- 			return -EFAULT;
+ 			return false;
 =20
 -		/* Mask out reserved MXCSR bits. */
 -		fpu->state.fxsave.mxcsr &=3D mxcsr_feature_mask;
 +		if (IS_ENABLED(CONFIG_X86_64)) {
 +			/* Reject invalid MXCSR values. */
 +			if (fpu->state.fxsave.mxcsr & ~mxcsr_feature_mask)
- 				return -EINVAL;
++				return false;
 +		} else {
 +			/* Mask invalid bits out for historical reasons (broken hardware). */
 +			fpu->state.fxsave.mxcsr &=3D ~mxcsr_feature_mask;
 +		}
 =20
  		/* Enforce XFEATURE_MASK_FPSSE when XSAVE is enabled */
  		if (use_xsave())

--Sig_//6sOA+BwMo_Xl7u7csf2ryj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFjn6AACgkQAVBC80lX
0GxvgggAis3wR6+vLh2yzpPjW++00CQ06K0GZj6tUVIaGH0kjeeYHIxFqthHEwkU
2d47S2wQFpuq+FkweNjpJ+0PDplSbvJeGR2DGg3ImxJlQ4I201a4IbX2YiSjDDqF
TGzYeAmHa4QEHNq5mlsnGolQV+PSJ1LBOywz6ffLhofopXIJvbSg0YQZnqPhqRFU
qeNeQFzkDM108Y/XAPW667e9hVRXnt78OJ/mBBVRmqeEXAW6lYgOyAfMA1apIsSv
ZqhWrEpKRSd79FuBw/cZmkxoRgd86RLcyB+vTTsrr9LmLpHQEUY8WEZSTVK8NpNu
P7zStT7ERvt4jAwBkcta0YU6ZJhTGw==
=mfAh
-----END PGP SIGNATURE-----

--Sig_//6sOA+BwMo_Xl7u7csf2ryj--
