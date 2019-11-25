Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F39641094AF
	for <lists+linux-next@lfdr.de>; Mon, 25 Nov 2019 21:37:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbfKYUhx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Nov 2019 15:37:53 -0500
Received: from ozlabs.org ([203.11.71.1]:53187 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725818AbfKYUhw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 Nov 2019 15:37:52 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47MJkk2MZhz9sP6;
        Tue, 26 Nov 2019 07:37:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574714270;
        bh=0yhI/YgajjJApcUcRmCos4l4PimPdbi7Y3eazdjLUpg=;
        h=Date:From:To:Cc:Subject:From;
        b=Mv94NdbWAzDwu7/FC4Zu/MMrTpBm2ILSR/1AKXdLAV6XfySKndbLJU54NFgeWBCdP
         Dqzmfk8iCXkL1p3c2yqnYjSOZn3H/9qOkh/7h1ZvHUitOK0eqm/DH7kuQaUDDSEHcN
         c0Kj46g/hfOAOb9LH3zPUERfGdDOoR61Vgeb0ojqa1A2oRg9j2TijNWBO5xI3hWL+E
         MDyo3mDdH8WSUEA0fIrhXUKMQdPOdqP9G7j1xG1bRUenlwjg9LsCRFy0T/OvQltdM7
         UJNcqkR6l5YX9Hi9hk3s7WwmvnfiLhhhr+Bw4NmUhtur75YZJypiFf0RMFoXrDbACa
         iLnn0KPB4Oc0Q==
Date:   Tue, 26 Nov 2019 07:37:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the y2038 tree
Message-ID: <20191126073742.4422e60d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9mn/JmV+QUlYo2gIaWr+FoE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9mn/JmV+QUlYo2gIaWr+FoE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  9dbda081bcd8 ("y2038: alarm: fix half-second cut-off")

Fixes tag

  Fixes: 3f58eae704d7 ("y2038: itimer: change implementation to timespec64")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: bd40a175769d ("y2038: itimer: change implementation to timespec64")

--=20
Cheers,
Stephen Rothwell

--Sig_/9mn/JmV+QUlYo2gIaWr+FoE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3cO5YACgkQAVBC80lX
0GxdPwf/WQA+jlAW59/xyD7ewpiv7sfd/YNFhSlPspON3Fjnh80xva5VdFz/0Tlr
jAbyBIt+0V0q9ojKciifNAntYHFCFgStHwIHhss88X4GD524mDa3YA+W+byyD7mR
KPuXCztC9P0DV77e/wekJjw66JUL3DkdXGJ043cg5r/FZEpS18a4UGW0fSigmPQJ
BaF6/A+O5UgA75LtsJ4WIWNlbQVo+Uwz/Bq4mYBYIiZgqhwkUhcaogdL6h/p+2qJ
FLNhQYG0Pt6X/ZrsSsDitag7boH81HgMB/IOkhy4Zyi3PYi7YEuufacsG0eqMmdK
Nd+9pp4oURiJMWe57jnwR+t3IaDKzQ==
=OuJ4
-----END PGP SIGNATURE-----

--Sig_/9mn/JmV+QUlYo2gIaWr+FoE--
