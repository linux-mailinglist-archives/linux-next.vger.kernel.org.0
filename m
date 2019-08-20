Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9061396B4F
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2019 23:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729900AbfHTVTo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Aug 2019 17:19:44 -0400
Received: from ozlabs.org ([203.11.71.1]:49629 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729887AbfHTVTn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Aug 2019 17:19:43 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46CkFn22G5z9s4Y;
        Wed, 21 Aug 2019 07:19:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566335981;
        bh=hcUxzUsiChBJ4VT++JpmDf67lPbT67XA0tJypiVpa80=;
        h=Date:From:To:Cc:Subject:From;
        b=LEtZk2ifrovCluJChC4OuzeKYfGI0iKFJdnmoK8T1l1ZWjPOBUOukYg+09YJJHS6S
         uGF8gY8F+xnCD63T6IzwjLh+RRAGY2LsRygvg1KZDrA9RnD7S1m9KfvZqar7x0gQDB
         NHRTVzbp8FPTbiA6aLKr90jWecTBm2U9fsgc+Tf976hrLfVt4qOkAHMPuu5sWhPsDH
         FF5td9SQFxwHLfqAq5C6Vv/kGbWwgQNyeUwW92UkMKl3OfcUuOQw6iXToPs3m4G/iU
         dsTPr/HqqqGFNzR/WQDpUTLUBf/GpP2aLtU6cMa8CP3ZRUacMJX87nRjuUzZC4ffO6
         Hpz4kcrlAOMSw==
Date:   Wed, 21 Aug 2019 07:19:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sasha Levin <sashal@kernel.org>,
        Haiyang Zhang <haiyangz@microsoft.com>
Subject: linux-next: Signed-off-by missing for commit in the pci tree
Message-ID: <20190821071939.11382b44@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6OLNl3lWoxVMMpMl1hJBE/3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6OLNl3lWoxVMMpMl1hJBE/3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  c4a29fbba415 ("PCI: hv: Use bytes 4 and 5 from instance ID as the PCI dom=
ain numbers")

is missing a Signed-off-by from its committer.

Also, all the tags should be kept together, please.

--=20
Cheers,
Stephen Rothwell

--Sig_/6OLNl3lWoxVMMpMl1hJBE/3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1cY+sACgkQAVBC80lX
0Gy54Qf8CSogT6X3S7y9GYoqUeXN+BIqfyHRaWcFN/R7JrxcANevSaNrUmJ6hx13
Q2QCikuIJKWPU2B1frN+QudzLZkoWVnzY2H3RJGvhbDWGpzJh60TAX5j7a9F8hmz
J9xJ0gCwnC86BeUx36nj89F2fuuxvlZsctoHJgH38ONuSn0AV/tV4UZ9x2GTVUwp
TySf6rOtJN1da/539Z3Ck6I/QBk0FiqmxacW4b8SVrQLjfJbUIlyKZdpHavgmDlj
s6pzhoK4uIIhGGHlDAO/spL77WTevIhWtriWr//T+rNVkVAxj6NHeVsRJIVwRcVp
Nnh/uRbsUHG7tK2iwRJNwmZW6Ua2KQ==
=NLtA
-----END PGP SIGNATURE-----

--Sig_/6OLNl3lWoxVMMpMl1hJBE/3--
