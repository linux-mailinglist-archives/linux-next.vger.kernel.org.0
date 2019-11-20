Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 832641044F2
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2019 21:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbfKTUXA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Nov 2019 15:23:00 -0500
Received: from ozlabs.org ([203.11.71.1]:48891 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726044AbfKTUXA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 Nov 2019 15:23:00 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47JDdr5C4fz9sPL;
        Thu, 21 Nov 2019 07:22:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574281377;
        bh=pnv2YLiKiI94p3fuN9ODivZcg5XDECfbd07TsDL/Vw8=;
        h=Date:From:To:Cc:Subject:From;
        b=F9juOnaKBEAevXEMoHdmk5Wea95DRkpDCjRjAcA14WrBUN61V0oHn1mbLy0QyxJoD
         lIhBtLOnej3TygfTABnQuQqTIG2JtO/3rAGxEWGM4OyVKgUZ80Aua6cpLibRmcCyNv
         2YzU+wz934FbZGPNGmUK6H+fLkkBYsd7fGsbDFmwxVd5F3voOGOOyk0KzzF9fCfNrE
         sHmr6UboHIB02FV/qpjAfiouacItoVk9wtU53JSUxcBjPzlzsU/7pF5k8m3D0g9/VL
         MqH+mXWmYK/b8fcz/uB/7D39x62XPIvQFxRPzihS0836laigwRhUe4j78b35qsRLHG
         3RtGyxVmpBc6Q==
Date:   Thu, 21 Nov 2019 07:22:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: linux-next: Fixes tag needs some work in the omap tree
Message-ID: <20191121072254.79e13f56@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9wo/LBqFlePA2XNZRgQZFV3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9wo/LBqFlePA2XNZRgQZFV3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  e130d53f2599 ("ARM: dts: dra7: fix cpsw mdio fck clock")

Fixes tag

  Fixes: commit 1faa415c9c6e ("ARM: dts: Add fck for cpsw mdio for omap var=
iants")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/9wo/LBqFlePA2XNZRgQZFV3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3VoJ4ACgkQAVBC80lX
0GxWdQf/U6wuhsNsmqp+9tTCyLLNQ4JABmjC9OEC3fzrFYK6sV318F6c3N58WNM5
q6/MDWekD4ym/Sw/0V1QYuD8SW0lywImBGpSbxaya2Yb4fWpteK4hJBvBf8cLWlN
r8Wtclrv1mjngkaTE2skEaXdb+708G0hZDtJ+2HUeMLy+xFBn6+ePetGmnl1+/U7
ZA3PomRnfQt/guI85O84/w4+HuGczBVmDcEM3By5yqjcBzybK1aJDP+8EDgtNm7i
YbyJSjpnIlMZYrHPVcs+qMrtd+C8kwKW1ZU/kowtLS4G+rAiDmz2vlCMm0rKNn/c
wjre88RD6FscCrEyOCXGI2utVnH2hw==
=Eekv
-----END PGP SIGNATURE-----

--Sig_/9wo/LBqFlePA2XNZRgQZFV3--
