Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7AB27842D
	for <lists+linux-next@lfdr.de>; Fri, 25 Sep 2020 11:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727248AbgIYJgs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Sep 2020 05:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727201AbgIYJgs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Sep 2020 05:36:48 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A115C0613CE;
        Fri, 25 Sep 2020 02:36:48 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4ByRd70h0Dz9sTM;
        Fri, 25 Sep 2020 19:36:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601026604;
        bh=G+o9bczA2sQhJzQrviePOhyjUsAreWHRtkEN+Ya1jdU=;
        h=Date:From:To:Cc:Subject:From;
        b=IS7FTYSpUGfxBFXHrTV4rGPmfJWc1ezzjDt6PIEyUTgOM2Y+eWohluC1Dmb45Hy0t
         88Uu6/piopZ09FcDZMmYoIejSAvsKdnubroh6XY1aZYQK1KLJ90P2qCSkY/EIOWMK3
         pXUB5/jtTu57RPqMZXrRa0YT7bY0pIlqhCJaApc/SvOMLy26MGJHd9RRl0/x48FsuJ
         YJCDV7cF1zMWSsn2S5noFXuz+9MiR+7pJaBK6Nlj+Y4gF0cx0cvC2uWWKwS5mtom0D
         iRL7whwzJJdWiBMinjz52JTFwFMzBWnlTqawGMaNXmLVsPATXPGdmdV52M7jYwWZEn
         P6OswXwOHejjg==
Date:   Fri, 25 Sep 2020 19:36:38 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20200925193638.4e0d6f5b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Mat4EHH+pDBvC3iG403l6FL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Mat4EHH+pDBvC3iG403l6FL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (powerpc and
powerpc64 allnoconfig) produced this warning:

WARNING: unmet direct dependencies detected for PCI_MSI_ARCH_FALLBACKS
  Depends on [n]: PCI [=3Dn]
  Selected by [y]:
  - PPC [=3Dy]

Introduced by commit

  077ee78e3928 ("PCI/MSI: Make arch_.*_msi_irq[s] fallbacks selectable")

--=20
Cheers,
Stephen Rothwell

--Sig_/Mat4EHH+pDBvC3iG403l6FL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9tuiYACgkQAVBC80lX
0GyzYwf/YVJJiKEB+DhKEYMYOr8U1Tm5tL+c050b+8spHGXuwWdKQYjiJAttniV9
KxrDU0bnb48jCYZcv0G47rsMd455BTW/Jnw/UI6AfLmCT0+VOMbtagMrL7devtkk
1cP9gOKf7eTwgmWsEvtO/MhE7UfE+OxWHFF0Bll8E/7tFxWScVBQ/+/rzHAP21nD
l4Ni4kDoUdbQGqRFGKQGb03NEkLG9vw/MnsAZsolSmtkWi8sJXt+tBjN8u2CXt9u
g8RybUHeyQ41GhpjETv/2uWXZPEQl3Wp08c63ywkPZ2LHzd+V91Vl4OEL8wVOsH5
tJdFt1vo1Tfq4AZn1dVEFAJqNfo9sA==
=muNT
-----END PGP SIGNATURE-----

--Sig_/Mat4EHH+pDBvC3iG403l6FL--
