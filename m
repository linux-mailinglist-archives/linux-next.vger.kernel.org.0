Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A141209893
	for <lists+linux-next@lfdr.de>; Thu, 25 Jun 2020 04:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389456AbgFYCpA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Jun 2020 22:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388930AbgFYCo7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Jun 2020 22:44:59 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8C0C061573;
        Wed, 24 Jun 2020 19:44:59 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49skrR0c5jz9sRf;
        Thu, 25 Jun 2020 12:44:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593053096;
        bh=VVSAjiLyV7COvx0YNfYqse7TDusXYaqOlMjXzJpATs4=;
        h=Date:From:To:Cc:Subject:From;
        b=EJKKw4SC7IQKNwFHP3gg7ID8Jb7g63c8qwjDZzzqoQZbyh3YvveXnleZfuYRTPDCu
         X7N9Ah1HjnvwgmCqJiDt8xi3+Z+bY6ZLpxiKrjztD240uAu99BIAiosLC9OmOr6HSD
         drWPFvHwApCq7KN6eOs19wy38KlH73Q2xx//4AHY/V4WGe2s6v8VDGkrFmuDgQ/78R
         5M1XLNV5RP4hldHuGiBRjYRsCmeBqMZvCqQvEh1MI1yIlsnkv9qY85tWeIaBAFjtFS
         c0dASkS8iXqX+Iaa19xBMxpQGu0iPYhywzJlF/ZNkfupI2ilxndqG43Cza4iqld1b5
         d3Aucs1fkVNsg==
Date:   Thu, 25 Jun 2020 12:44:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the rcu tree with the tip tree
Message-ID: <20200625124452.1310f04f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fEvWYtZ9cP6ejStimlUurrX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fEvWYtZ9cP6ejStimlUurrX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got a conflict in:

  include/linux/smp.h

between commit:

  380dc20ce843 ("smp, irq_work: Continue smp_call_function*() and irq_work*=
() integration")

from the tip tree and commit:

  7effc6f7b465 ("EXP kernel/smp: Provide CSD lock timeout diagnostics")

from the rcu tree.

I have no idea how to fix this up ...

I fixed it up (I just effectively reverted the rcu tree commit) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/fEvWYtZ9cP6ejStimlUurrX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl70D6QACgkQAVBC80lX
0GxCqwf8DT9SUVTlkSpf2C0O5qXXa9bSAl+Dmp7m5gUzDNfv5iyhkLc71cyMfbYM
Az3vuhY7Hc5kc7nHA8HclOFkSQFZSRXqIHTW6Xrg/X2AZxsAWi52GeLU9o+NTEyj
ifjMR+/xVsYdh7MFxY8raMF97EXuIuoCeV4mtBPkURVnH7d0WZ0Ww5NPTSJPOJ82
qjsbJKBL56FaIICFRvlGnKPWqjs2nn1kKljsvbUepVOhcam2tTRGTRSpHMbnQHgS
0mupwNikUjHa2BV8drhOsw6/oH0fwYk2/UESi1IYiZAmbv3Wlc/GZIbBibinSMid
MQTm20YSlWV5btJiXasF23kyYOxa3A==
=tfVh
-----END PGP SIGNATURE-----

--Sig_/fEvWYtZ9cP6ejStimlUurrX--
