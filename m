Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A63B13CD86
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2020 20:56:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729268AbgAOT4N (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jan 2020 14:56:13 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:50597 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729025AbgAOT4N (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Jan 2020 14:56:13 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47ydP55yHWz9sPW;
        Thu, 16 Jan 2020 06:56:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579118170;
        bh=VTfQ6EkdMl10C6Rosx3bqpTYw61hQ2UeI7wLuUE6c8A=;
        h=Date:From:To:Cc:Subject:From;
        b=k1O5EC3mqbg88paDtd62zE8kYnQl5cN9o3b3K4N0D9rJi39Q1qT0uDvbgRQdXJNrd
         fVGhwVvLqPQvXaHH0g0Q/s2Zxyr+EU8c/n6yZzGk0ymO5J03tpe40g/kgJ0A9qX4JI
         Br8Oadmcykk4l9J4Eb+aw0EuEsGfEH7TP0WcNkJ2gW8S2VCfzpFGc3ixQYgthWTLBu
         eSxBIDQjXi2hm8da2YQYCcTSpLfh7bhbKCmAoLfedJ5APi0RLab/88Sfs/+nF97uQo
         GOkKZRur+VG2EMNjfakngSMOpalR98vANi8AapTt6M3w9f/nM+8pFSCgnmzaUK60y3
         lTyYzOB822xUA==
Date:   Thu, 16 Jan 2020 06:56:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chen Wandun <chenwandun@huawei.com>
Subject: linux-next: Fixes tag needs some work in the battery tree
Message-ID: <20200116065608.704b7331@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cASzhwhBhHBsccXdFsQiwDX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/cASzhwhBhHBsccXdFsQiwDX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  89cfe2fc3ad4 ("power: suppy: ucs1002: Make the symbol 'ucs1002_regulator_=
enable' static")

Fixes tag

  Fixes: a3d70dacc727 ("power: suppy: ucs1002: disable power when maxcurren=
t is 0")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/cASzhwhBhHBsccXdFsQiwDX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4fblgACgkQAVBC80lX
0GwaRQf9EWbn6PZqkTqUi4RLz+TNST8ZDZdn3UE5yqn/qF1nknHMWaX34kr4C2nj
WF1HL+bGk5qyF14pyLPZZx4iHRicTsiYY9r7VBsKL0PllmWwml3LWkHPM/p3rPSu
QN36+OvW0p5tyuj5EWqBmqicgXWlm/TpqKYO+n24aqWavQxF/ZlHxCU5XK4+LIIV
TSQYa6kdcqltxfABx2HQTfYY+qeuQwewqrxH2af3xpRtqXLMHikSMOwbfNvsXO9l
cUFPvbnz1PBp8k7NuOjqd0lIAi6CklizXkvKvfg1Aw7Xt3GDJIrkgRkFF1Thd91K
l8NC5BIw+SaPFZagene4U/X8GX+UkQ==
=H0FF
-----END PGP SIGNATURE-----

--Sig_/cASzhwhBhHBsccXdFsQiwDX--
