Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92AD21F662C
	for <lists+linux-next@lfdr.de>; Thu, 11 Jun 2020 13:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727914AbgFKLD0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Jun 2020 07:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbgFKLDZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Jun 2020 07:03:25 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B1B8C08C5C1;
        Thu, 11 Jun 2020 04:03:25 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49jLYx4cPVz9sRW;
        Thu, 11 Jun 2020 21:03:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591873398;
        bh=8qjOfnvHTMjblwCmDB2+E3TJx8c6/1xpyUMWU1DKrZo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZM5+wOAaiJRt5fEN0e2EO1aHm/NRAE2wM3AehVr3SP6k/7M5wNPUer3lxzxnP7Otr
         shrinsWk0sNi4oZogRxA6hCAAliBsmVH9rA/yHg4rakLdYuLB/1wwG+cEub2Y1/Et/
         76GlxLXO3Oa+YayMhm9NFT50WmulMs4NS1ZXDGUbhCXJ6S8j0OUSoatCdFS7xxXi0t
         ExYZYLFcxZqT8WysQTuirC+ua2LniwzykGTrwSjSpxKyjqq/kjIufiagn454YQBrrn
         9iqCHBt7OUd/kfUjYnIevB4wF26dASJ85LR5wDx2B84aI2UI0zkL2SNPlU53V+K4K/
         YOwEHHbAxjHtQ==
Date:   Thu, 11 Jun 2020 21:03:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20200611210304.7a29c1ef@canb.auug.org.au>
In-Reply-To: <878sgtdgs3.fsf@nanos.tec.linutronix.de>
References: <20200611105254.1b14f070@canb.auug.org.au>
        <878sgtdgs3.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3HjU5rZ+OBoWDY5afAYsM/3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3HjU5rZ+OBoWDY5afAYsM/3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Thu, 11 Jun 2020 12:43:24 +0200 Thomas Gleixner <tglx@linutronix.de> wro=
te:
>
> Sorry for that inconveniance. I'm about to get rid of the conflicts on
> the tip side.

Thanks.  I do realise that it can take a little while between when
Linus adds something to his tree and previous versions get purged.  It
doesn't happen to much, thankfully.

--=20
Cheers,
Stephen Rothwell

--Sig_/3HjU5rZ+OBoWDY5afAYsM/3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7iD2gACgkQAVBC80lX
0GxIlwf/VwVbJVOL43+jeDi171/8sDqI7/1c49c6FoNcSZznKgMDSrjpnUL7eR3y
qjegnAisa4U4dN/0xuX6ieR2ZGIHgZDBtbhcYFYF8nn+aZrJo9yOFh2jas+HaY9r
qx5HaLsuAYQ49CrFO7gmw0TKcfUOVED3Bpa4SftG1jaeYHUEN0PG5sDKBVs8afzO
1+i41Xwp0sgweX5YeEQ0fgXMVf760PheUHjog5VCMKCBuJJV40FQFKWFWNvlrEZK
1zMjZTWsznKM35INm7FkVf4UNp0WxACI3+d2wMf7/ETiCoF1DlaUpKkRbaKzgiP4
K3KMur+lw0UA00i7F8I2kUX+yHWU9A==
=CwSZ
-----END PGP SIGNATURE-----

--Sig_/3HjU5rZ+OBoWDY5afAYsM/3--
