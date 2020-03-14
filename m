Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3243B185834
	for <lists+linux-next@lfdr.de>; Sun, 15 Mar 2020 02:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727569AbgCOB5i (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 14 Mar 2020 21:57:38 -0400
Received: from ozlabs.org ([203.11.71.1]:60199 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726853AbgCOB5i (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 14 Mar 2020 21:57:38 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48ffCQ440Bz9sP7;
        Sat, 14 Mar 2020 21:37:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584182261;
        bh=/+k6rMtfVfK26MXBdszOPziWnmCG+r5GGKB2pVEsbpY=;
        h=Date:From:To:Cc:Subject:From;
        b=F4F6yKEhjPWHgccBmq1kLf/YDYSYi8gjtkHGV0auAGleFaJ5u4h9Gc7B7B1STrqPf
         xub17n//c9KiqMCpze6X0oACr6OO6/j2q1b04ydZJD83rNqCgxQjjA0AUQna3P7tZB
         7bOjq3FRcyEmi4KMEi4JN9oreilv1G8cSkUleA96KZJm/f06pMnN+qBBms7tG6z0yd
         ZtxXU7UDm43hwk6KBDhFmwbXq3wBK3Aa9N/DhjV4KJo7zaL/w2qG1kFuZasvI+uOYJ
         G/YKZ1AtYxoTceJI1Ank30X9yc/OcVNL+RqUfCKacvuZwCRg05yA6HtsUHrnP8tC5w
         JfHEuPkAETI5w==
Date:   Sat, 14 Mar 2020 21:37:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tomasz Maciej Nowak <tmn505@gmail.com>
Subject: linux-next: Fixes tags need some work in the mvebu tree
Message-ID: <20200314213736.2d5822ca@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i+LuZgULGyZFMMRwKAiHv94";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/i+LuZgULGyZFMMRwKAiHv94
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

n commit

  17ac1b98b905 ("arm64: dts: marvell: build ESPRESSObin variants")

Fixes tag

  Fixes: 447b878935 ("arm64: dts: marvell: add ESPRESSObin variants")

has these problem(s):

  - SHA1 should be at least 12 digits long

In commit

  bb771464c19a ("arm64: dts: marvell: espressobin: indicate dts version")

Fixes tag

  Fixes: 447b878935 ("arm64: dts: marvell: add ESPRESSObin variants")

has these problem(s):

  - SHA1 should be at least 12 digits long

Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/i+LuZgULGyZFMMRwKAiHv94
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5ss/AACgkQAVBC80lX
0GzZigf/TfxLvYTBHpWVRbrTEqZTg/S8iCOlIU8iyzim4H9BHoMaAU1WPIsZXXaZ
VlWqW41G5cjEGIZjReq88DEBnhwJ/2l4klyUZRVKhoulFXQK8DyfXXKoRfzkG+KF
iZd7e7CeqQynRprp31Vqs8BtyIXcZeNItm+vx/cO8OIR/827cFmz1bqHfu7KN8Uk
Lr3D8OJPE1geI2i9OKEO7pLynrTS6dETF1TZbHR5FSqiVm5qwu+7xbZrHazWb2Qh
sgZo2P5kT1lpGOyyaNfNqBQzqgHgNoBOD+PAnzsatk427RuQaoe8dJbOOSLGfFNh
feWZV5Pvgtiuu6SQlrLUdi80fPvxjQ==
=gzaJ
-----END PGP SIGNATURE-----

--Sig_/i+LuZgULGyZFMMRwKAiHv94--
