Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0BF29CB1D
	for <lists+linux-next@lfdr.de>; Tue, 27 Oct 2020 22:22:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505289AbgJ0VWH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Oct 2020 17:22:07 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44953 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2442341AbgJ0VWH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Oct 2020 17:22:07 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CLPmF03cTz9sRk;
        Wed, 28 Oct 2020 08:22:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603833725;
        bh=pqd82jAjDY41bsYyotx+WCKI/i5ce4Hh3wPTjPIpzIw=;
        h=Date:From:To:Cc:Subject:From;
        b=XhFkp2NKjgeVx7FPa7eACNXxyS2D9yoDlQcsT4QGUWEI1i2E25FNatPB0KUhnl3Tx
         qIAPugTU2uBHN85aChymsj4uuOAqjB8kae3Qa7NSkI/sZzaKjjNo5JZQmuXKZNyti8
         cwbGZhZJRhbHffl/e3QV55h2PwG3YzmuQfHbgopg8ABUHY5ziIsZQW/vnih8U2TkPG
         ZYi5OhSXJU4pAZgjMD0Envjzo/LNZ+K28eRyv+LmNSGdxd1IuCLG8oBsdlnG4JoZoZ
         7b5gbcN7g5dRzlr+hriOsZmOEo88gg31KmtINoVFvskMu/V6iCMiDMHh/KbUV3+D/O
         t1g1fJLCC6c0A==
Date:   Wed, 28 Oct 2020 08:22:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the amdgpu tree
Message-ID: <20201028082204.364242de@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3ZpcyTADX4FYbKIoTnYeI8F";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3ZpcyTADX4FYbKIoTnYeI8F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8f76b1bbe713 ("drm/amdgpu/pm: fix the fan speed in fan1_input in manual m=
ode for navi1x")

Fixes tag

  Fixes: 3033e9f1c2de ("drm/amdgpu/swsmu: handle manual fan readback on SMU=
11")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: f6eb433954bf ("drm/amdgpu/swsmu: handle manual fan readback on SMU11=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/3ZpcyTADX4FYbKIoTnYeI8F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+Yj3wACgkQAVBC80lX
0GzxaQf+KbCHPTb5o9vVAkoN6hPnRWKlopbyJfkbqPIC1awwHaj9ts6CdbLtGwm2
xl103K2vGOryjpu1z0xK1eN/xkR5QdlXGaJrAeXowubq7p/0AtglxCvd0TAF8lde
tuaOF0tWo0Tok8tVgUeRxSpBaH2C1KJz4SKj1PuoliP/4+73MCu4QKZ6oTZXPEEv
VeeX8dtXktWV39iYcMAxLitzocZr/AKOUiXea3MfcLTitQKpCl7hDRsa11+x1cmU
uPTTXh6OJzKq/EmrqokmNqV3PfHEhfopVcGOPs3LhjQQK2WVimz73WLK9aa95P/t
O3ndScECh6nrofqiLJfuPUfEOvDT/w==
=CbHP
-----END PGP SIGNATURE-----

--Sig_/3ZpcyTADX4FYbKIoTnYeI8F--
