Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 710E6117E12
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2019 04:13:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbfLJDN3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Dec 2019 22:13:29 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:46233 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726605AbfLJDN3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Dec 2019 22:13:29 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47X4rl0VXXz9sPW;
        Tue, 10 Dec 2019 14:13:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1575947607;
        bh=XGaFBEWJZznnxeIn8Ek0w48XjZCsYhZ9I08XkW0B8u8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=t4LXaEHTodgmcG1vua4m1yLMdmfkap+jIrBAqwoseVkpmCuZt1WIHm51/UW6MAPUu
         gO2K7kBYJSuori5YlCDcBP39+Dp/F2+kdZbm6auy9x2UjgQ/4LiUb3DYGXz1/P+tBD
         wG0+hItoHPu0998Pdx7rAb6NA9BYfvsD/owN3iqbugztlZ4PMUQnejZN8oqD//2grx
         dAlNJSVUJ/5n2Hi9R6dI7xBbzARUz/J0F0CYj3llSmRax46tw6Ys49x6zptbjohuXW
         dbS91hURtRgV9XT4oyizXzSUb1uwgplquNKxMu1VAKSitIcJoRwlNmjVROH0c0e8EF
         2pBdorQ+lldRA==
Date:   Tue, 10 Dec 2019 14:13:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: stats (Was: Linux 5.5-rc1)
Message-ID: <20191210141326.1e440603@canb.auug.org.au>
In-Reply-To: <CAHk-=wiEJK=yo9vEhX_4b4ROvCqUA_rjK7g996h-5MbfOMeDrw@mail.gmail.com>
References: <CAHk-=wiEJK=yo9vEhX_4b4ROvCqUA_rjK7g996h-5MbfOMeDrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OJSzA1eX5Reyx+y9Y0VhIKE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OJSzA1eX5Reyx+y9Y0VhIKE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

As usual, the executive friendly graph is at
http://neuling.org/linux-next-size.html :-)

(No merge commits counted, next-20191126 was the first linux-next after
the merge window opened.)

Commits in v5.5-rc1 (relative to v5.4):            12632
Commits in next-20191126:                          12623
Commits with the same SHA1:                        11691
Commits with the same patch_id:                      280 (1)
Commits with the same subject line:                   40 (1)

(1) not counting those in the lines above.

So commits in -rc1 that were in next-20191126:     12011 95%

Some breakdown of the list of extra commits (relative to next-20191126)
in -rc1:

Top ten first word of commit summary:

     56 net
     46 perf
     41 drm
     36 s390
     30 x86
     25 io_uring
     19 pipe
     15 rtc
     14 alsa
     12 selftests

Top ten authors:

     20 axboe@kernel.dk
     20 acme@redhat.com
     18 gor@linux.ibm.com
     18 adrian.hunter@intel.com
     16 luto@kernel.org
     16 dhowells@redhat.com
     13 krzk@kernel.org
     11 will@kernel.org
      9 viro@zeniv.linux.org.uk
      9 treding@nvidia.com

Top ten commiters:

     98 davem@davemloft.net
     52 axboe@kernel.dk
     48 acme@redhat.com
     36 mingo@kernel.org
     33 gor@linux.ibm.com
     21 torvalds@linux-foundation.org
     16 rafael.j.wysocki@intel.com
     15 alexandre.belloni@bootlin.com
     14 tiwai@suse.de
     14 mpe@ellerman.id.au

There are also 612 commits in next-20191126 that didn't make it into
v5.5-rc1.

Top ten first word of commit summary:

    243 drm
     44 xtensa
     40 arm
     33 x86
     29 arm64
     27 mm
     11 nfc
      9 dt-bindings
      8 nvmem
      8 fsi

Top ten authors:

     40 jcmvbkbc@gmail.com
     29 alexander.deucher@amd.com
     26 steven.price@arm.com
     22 leo.liu@amd.com
     20 olof@lixom.net
     18 zhengbin13@huawei.com
     18 yong.zhao@amd.com
     17 peterz@infradead.org
     17 bhawanpreet.lakha@amd.com
     16 akpm@linux-foundation.org

Some of Andrew's patches are fixes for other patches in his tree (and
have been merged into those).

Top ten commiters:

    245 alexander.deucher@amd.com
     96 sfr@canb.auug.org.au
     48 jcmvbkbc@gmail.com
     28 mingo@kernel.org
     20 olof@lixom.net
     16 joel@jms.id.au
     15 heiko@sntech.de
     11 sameo@linux.intel.com
     11 dhowells@redhat.com
     10 srinivas.kandagatla@linaro.org

Those commits by me are from the quilt series (mainly Andrew's mmotm
tree).

--=20
Cheers,
Stephen Rothwell

--Sig_/OJSzA1eX5Reyx+y9Y0VhIKE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3vDVYACgkQAVBC80lX
0GzU6QgAmGfZur4X3UenEWFtBsIv5jxvUv0N9jm34MZx6Ul2XstHQ+0DlgwFtsEU
7f3icttQKblMNrEFzrKSYxrpfxCjVv8bV04naE2dV2XC1k3M1cEx9bqJWi/T8y5h
DtowyaLLyddfTIgz/gQpKu26mEoDv7fEL+Kead/+7pXLGdtTGHCZt+ClVEziS7XF
shpOcw5Ns/xDLVigd5vVoN3j96WBhWZyEQEMFTGf1wcD+Z4Dql8TcTeiGXDTJRl7
DGrTot8GyxHHdwxe5VunCjC9b2jGvchfr8j7ARE+dFKpKiMojQVf8363feWb7/rH
3lsbn/0Pew4oNiJd6LIkf1zyWwSw1w==
=TldX
-----END PGP SIGNATURE-----

--Sig_/OJSzA1eX5Reyx+y9Y0VhIKE--
