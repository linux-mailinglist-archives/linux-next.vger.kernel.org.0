Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C65E1F6F58
	for <lists+linux-next@lfdr.de>; Thu, 11 Jun 2020 23:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgFKVVj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Jun 2020 17:21:39 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53863 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726153AbgFKVVi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 11 Jun 2020 17:21:38 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49jcHL5wQHz9sRh;
        Fri, 12 Jun 2020 07:21:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591910496;
        bh=LP6dfWVzNYu5JDIRnMwCCMrr0eameV/tnUR4235EhgY=;
        h=Date:From:To:Cc:Subject:From;
        b=cAEmko245aHm38SC010P5vYvQozKNiyqNv63mshEB0mcoRysQNSq4xxrTs+ZXwPC1
         4j4gpsCKwz5tMHpaLklPummDP22s8eFZeMQMadB88VtfdoTjfvuBycb3T+5mCSmQ0U
         9weFh6h0o9JpsDT0LCWZjc2OpNWa2mV+9pJB0AoVp0xVAh/IGp2rCyO5xD/60+b+2x
         PQOfYTk3zl/AxXVf4YX3axSh70cw4QZM0hco0IelCaymSYU5JBLFcTxFkeVSOok+yW
         wXHcpfjAF1v4qVKK8IgXfI2U/MCRzm1OxXjHlHdntukeO/RUrUuoEqyNu7BTCTmrl9
         rdoR8+BUuCNuA==
Date:   Fri, 12 Jun 2020 07:21:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <20200612072134.185a8c8c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W9Uw5LzDxc6m0.my.bF0BAz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/W9Uw5LzDxc6m0.my.bF0BAz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  7102cb071326 ("x86/entry: Fix allnoconfig build warning")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/W9Uw5LzDxc6m0.my.bF0BAz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7ioF4ACgkQAVBC80lX
0GyIJAf/WP0WjPh82hXkCOwUUwy/CnVCWC4r8H/wqbNJB4P9K/3/L+Ho9ieUjnhj
s0NgQmMxQBKcHlzAG7ApsSI/ecjJRSFPBDVOjD/C14jUBumiNwM9NmcboWGTKdUl
QE/DMR7rvBmlX5j0bG/ilNpAJm3MXxIMEsjNTgHtsG6fFvZgCiKVCGuhDxRb6hg5
5scjVWhGbBA9k5i2J/s8qV+ZmPt+13c9udVTbsJnB2Pljmexv7xs13zC7lc8sJXI
jmb3edf1ZRF2GOSgAefXSaOLWBUN0SqYcmQ9bRH8dvSQC86OZxGcVsYWSNnX1RUv
O6C2pcwhXlxBsdqn9X4jnD7aDRwdMA==
=LcUB
-----END PGP SIGNATURE-----

--Sig_/W9Uw5LzDxc6m0.my.bF0BAz--
