Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28C9B1E7CE5
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 14:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgE2MO3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 08:14:29 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55287 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725865AbgE2MO2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 May 2020 08:14:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49YNm23P9wz9sSy;
        Fri, 29 May 2020 22:14:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590754466;
        bh=du0HVuZZrzEzxlkX6VuarTaT//W7hyhn8KAL8HoXWdA=;
        h=Date:From:To:Cc:Subject:From;
        b=p/KV11BL/iYNWa4CdE3DXFNImhavhncGz8zrNcQ0HnuZtwoP1Tm5M9nEUy0DPfQxu
         GcXJqYTGqWjaQpH8KiBoA6lYeNKfuqFKqVcEJ+7YJsOTU6aD0kpYH+qYWq0ITnbERM
         98D8iNnsnFrNTtQLTtnSs89nHS8+kUaqbuX2bk63oWWI5R5LPoqNZ2M5NOvKyigW3Q
         ScSnkYphOrsH0LZef0X1tj8O0ErHkjJAFdfoyfyeN1hTd0s2wJP87rxhGF+AWNJrT2
         8kim9wAFRyobq01EfmpggPdpkdF/u5B8871vY82S+TAqbX1QnwnRLkwr9KRWne6JJE
         Qmhaoj0vKRN1g==
Date:   Fri, 29 May 2020 22:14:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Zijun Hu <zijuhu@codeaurora.org>
Subject: linux-next: Fixes tag needs some work in the bluetooth tree
Message-ID: <20200529221422.5e181c8e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ArDDKC_sA6ccVSgBl6hu55x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ArDDKC_sA6ccVSgBl6hu55x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  feac90d756c0 ("Bluetooth: hci_qca: Fix suspend/resume functionality failu=
re")

Fixes tag

  Fixes: 41d5b25fed0 ("Bluetooth: hci_qca: add PM support")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/ArDDKC_sA6ccVSgBl6hu55x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Q/J4ACgkQAVBC80lX
0Gyjegf/fjXDq6Yj6GAJw05MDoDdw6eqisXEejnBMtCmGzrTjQb+4+3kDiKP3q9/
jvbUtFHxqT4SxfZRWm50gBuWItX043AnvcReFnTikUXSx13xIH841aDIK5S1VQOr
/fKO5fYVv0HXCI9zjAwv3/guwjqKL2VYXMCD+BOD3GpQltAabOV1DQC30iQo7s7v
597qN3+sW5dFFVBl1BgqGRWqgrcyoyEvvv2cgRlHuPMjo3DJSLOQSwTZbm2x5vJq
Ts1KcoHtnlNnUs2KzY+zZbZ8o348hkaFeT5qkO+mZkiBqygTXF/Y6e8mkK8P//P9
8od5Slbl8dn5hikZA1UGgHRupJ90TA==
=yNBl
-----END PGP SIGNATURE-----

--Sig_/ArDDKC_sA6ccVSgBl6hu55x--
