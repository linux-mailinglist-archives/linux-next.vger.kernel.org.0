Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E204B3EB116
	for <lists+linux-next@lfdr.de>; Fri, 13 Aug 2021 09:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239183AbhHMHIi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Aug 2021 03:08:38 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44503 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239052AbhHMHIh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 13 Aug 2021 03:08:37 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GmF542898z9sX5;
        Fri, 13 Aug 2021 17:08:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628838489;
        bh=cSQZZr9Vw+irm1Sj/LhL6f4p46464iC1L24zuQ44qPg=;
        h=Date:From:To:Cc:Subject:From;
        b=S+w3nFc4HWkeHoyCuNYgRtCzIIFK52jGkcBogmAl+RH/pv3/epyglhmK4UFqurrZ9
         cM3nwIOP71j3Z7MoFf5XmSoTegUIPPgmRhgSGCByyJ6SSnVvWSBcAREl+uicEUXisC
         KWbtbf3p6IUui1bVyPIQZWdywWLDLUYxCtQ2fvQiIHU1MWHgOBd95WQq00QzGJkDgq
         8hNKZsnBsCXPxJG2NK0jLr1UwZ+FsAkWjn9017B/a82TjY7aCQAiLphv7XpFbdHbRE
         EXswubunZDplQzsct3qwGWqBfygtbYHngLI3Tv8IawlZFg8Pkq6YWkRXcl7qmSiltm
         5vhGHxxvq4tPg==
Date:   Fri, 13 Aug 2021 17:08:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20210813170806.226b9510@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Hxe/x=Xa3LHuFTBco.G+/Rr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Hxe/x=Xa3LHuFTBco.G+/Rr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, yesterday's linux-next build (htmldocs)
produced this warning:

include/linux/device.h:577: warning: Function parameter or member 'msi_lock=
' not described in 'device'

Introduced by commit

  77e89afc25f3 ("PCI/MSI: Protect msi_desc::masked for multi-MSI")

--=20
Cheers,
Stephen Rothwell

--Sig_/Hxe/x=Xa3LHuFTBco.G+/Rr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEWGlYACgkQAVBC80lX
0Gx/xAf/UXegx7Bqb4f/kwct3BGon1gxBcgkiSpxw2F/AnnIO7JfPRKFZcX0biAE
mr3C6JPL4rxj8Z85/zBNv4PGQb9+R0TyKEOOyd05NNGS1U4H3JNBfiGvWMMUaEzt
knyYu3lz/y7F+ONbrm5vpuibYUx9ATjTwv0VSeWIATLE+owvvoVygVqIOY70azr3
TRe0gzugi7/GOnHNo/wIf+rxYvRpB+fZzbxHjC34A4J/k6xdZMZiqGRS/b+YLOw9
F9pDr9ldOY7ndGKbW0J/Ng2a+lnD0uSGIezYx9SzBWDY1XBYgU+fXd1+qV1+isPo
6+ja8hFhCWB4i2lm1Zrqpx3xBcVX3A==
=4AUD
-----END PGP SIGNATURE-----

--Sig_/Hxe/x=Xa3LHuFTBco.G+/Rr--
