Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7482194AD
	for <lists+linux-next@lfdr.de>; Thu,  9 Jul 2020 01:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgGHXyR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jul 2020 19:54:17 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47689 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726006AbgGHXyQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Jul 2020 19:54:16 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B2GP23Z26z9s1x;
        Thu,  9 Jul 2020 09:54:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594252454;
        bh=onC3t2q4O01rGQptnXUjDwy19vC68yra6hJkPVHQo7U=;
        h=Date:From:To:Cc:Subject:From;
        b=gr17qQFSo/BwrakkjrCQ90UyJoB6nzb98N6auG1I4KnbpVU+kQg6CB1dlbP9xhXiB
         3GbAuGkB08MGaApA9CVEf5WeKsxtxqCr1EKk6T/70yDCsBBrwKX6aBygZa5K1o5j8S
         whMas1D+K0sRBLLUAjynVdL68KRCSMSbibY6IG6eBMgyqGlGH1xzIWHu3uib/AeQ6J
         JfaS6yStJEH++J6p1zv08Zqci4sa5zmJUnb92cBzO3wVafI9nCFmiviStm99mQImgq
         Z4aeupTHqYcXHFOjVK4uxnyDAiPcJqC9V1aB3l65PqzDrcQhPJknZ94R8A+B3CYrVs
         p9yFb+Of5tK6w==
Date:   Thu, 9 Jul 2020 09:54:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the scmi tree
Message-ID: <20200709095412.051d96ef@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EaJJB4BeLyhN+rphM6to=j0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EaJJB4BeLyhN+rphM6to=j0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scmi tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/firmware/arm_scmi/clock.c: In function 'rate_cmp_func':
drivers/firmware/arm_scmi/clock.c:128:12: warning: initialization discards =
'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
  128 |  u64 *r1 =3D _r1, *r2 =3D _r2;
      |            ^~~
drivers/firmware/arm_scmi/clock.c:128:23: warning: initialization discards =
'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
  128 |  u64 *r1 =3D _r1, *r2 =3D _r2;
      |                       ^~~

Introduced by commit

  f0a2500a2a05 ("firmware: arm_scmi: Keep the discrete clock rates sorted")

--=20
Cheers,
Stephen Rothwell

--Sig_/EaJJB4BeLyhN+rphM6to=j0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8GXKUACgkQAVBC80lX
0GyKFwgAogM77kSorVYZQCGBOqTNjduLttwNXfzghndF8H9QHYZkRY+aNE/ILP6e
Is9i4x5y4l/+QROiTaXucGqZ5SOZdHWdjVkdp9/mJQW44GWJPsw24Umn59GPv/LA
y5d86M3gbzvV65OZqAKpirKzdHzpHRY0QC4+83+V52hiwdCqNwFh7zAivUQ144mN
Dy2PH1sONisasD5ZLw247TcYWP0mPT+fp01UYOuf337455q9kCbLk92XBnm13CDd
aOsc2pSL0kti0JQfXE7KuXxPUB3O4j5FMUwlrdU8/ft3K03fonYE1kThjvkGklUs
wTR0Y3RyVLoOvyFhuwvxQUoAxroCPA==
=DbEj
-----END PGP SIGNATURE-----

--Sig_/EaJJB4BeLyhN+rphM6to=j0--
