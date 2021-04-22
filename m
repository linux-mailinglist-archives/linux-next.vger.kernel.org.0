Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66C933688B3
	for <lists+linux-next@lfdr.de>; Thu, 22 Apr 2021 23:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236662AbhDVVqp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Apr 2021 17:46:45 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41101 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235977AbhDVVqp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Apr 2021 17:46:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FR9wJ0FVSz9sT6;
        Fri, 23 Apr 2021 07:46:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619127968;
        bh=+/GdKVMvzu8DR/MyPFYQEvspu6EJiuISmlwNSYEWz+c=;
        h=Date:From:To:Cc:Subject:From;
        b=kywH3SX3KG3s8jvc4+zM/gffL8ZNAZEF6i7zi75MnxVsco60eiRVlmAniKPtb5jgy
         KgrQQVP/ka+F/W09vQ+aP2A4++GW7Ix9eoljs+3+zCGpZrdegen2C3hdY/IQSvbWHL
         6+s3msrEuDDhztAammYUFcVSoyPUvKOpmYmnVh1Fwu8R5ldFgA9z2KbSuv9qYbQh/p
         jUtIdMjUDQVsYck74WwaXa2QJB9CYLSsTpKv4Jolm0q90Vlm89DSAMTxiuo2C/BktF
         Pzuflv60NYjekot+2KKuLq2UZKReRCP3fNTt487dIp/2AKKNxMb5TqP7egN8gsPpqB
         4ebFDM4py66qQ==
Date:   Fri, 23 Apr 2021 07:46:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the thermal tree
Message-ID: <20210423074607.6de179ee@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=w6zSSooCZachU3bL9fqNb7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=w6zSSooCZachU3bL9fqNb7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  4e1de36ef598 ("thermal/core/power_allocator: Update once cooling devices =
when temp is low")
  5a015faf21c4 ("thermal/core/power_allocator: Maintain the device statisti=
cs from going stale")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/=w6zSSooCZachU3bL9fqNb7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCB7p8ACgkQAVBC80lX
0Gwquwf/c+bbgywNrnvk5yirGAwxQRya0kFzRgAQO57nqbIGDZ58GOWGQa3HaxsM
1RbpCalVBXkyvtxSKoAf9puOoADilO5f6TRTEwNK3QX+wqH3m8tXwdABS+ZKR8DB
K4XVaVAL0rKlzrXB92cV/0732FuyOdd8OR8MRks+wu1MLsTr5HOE8ZRAoRnpn7vj
X9KuH1+4Gy3rTyEStYg3mgjJ2QHyFfBFAWmuSR1lYF5SffmqOWlHRGQ845PByrjE
oZUSIS88VMuzwHvKiEohr2ak7bCMiPCcYL9iBhLeY8atRsUgJYyL/Bcpgae3YsU3
Vrn//x2u2O6QWf3cp2rbWq90eBbLig==
=30QN
-----END PGP SIGNATURE-----

--Sig_/=w6zSSooCZachU3bL9fqNb7--
