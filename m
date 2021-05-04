Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8353732E0
	for <lists+linux-next@lfdr.de>; Wed,  5 May 2021 01:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbhEDXkH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 May 2021 19:40:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbhEDXkH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 May 2021 19:40:07 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9666DC061574;
        Tue,  4 May 2021 16:39:11 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FZbs75QKkz9sRR;
        Wed,  5 May 2021 09:39:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620171547;
        bh=1/63ulrN9a6j+3PMmtVqcCCKOdXQXQ3gqOZsun/dszg=;
        h=Date:From:To:Cc:Subject:From;
        b=TuWVl1//knfCsLiixwBzUT/uMmIzQo798yznRn0lPlOYo+xxGPKIcrjGpWJ3Q4w3F
         ZUN3RQVBCPdBOOG/SiegIKdHd/9mkwQK1BeeQe+EjeoWBm+wi1w2NhGvLRQvJe6NWE
         ywzQaC/luF7f68ARzU9BNB7k3uOuwR3pp8FE28bAeBOm1hl44wCE2J5Qn8bLHdwVpb
         8GcPksrZfKyEqCHpqmLWCrH5TQrEN5epxqB0ZedT/3PDvFk/qy3HuO2Y2XBuLM+6F8
         fEGxcd+K7w2whgezQnru3kMB0otpFKkffwPz/3Ioy0CeCxylEVoBGKpWlzXTtTFVf9
         +7lESZWgW2zHQ==
Date:   Wed, 5 May 2021 09:39:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Jude Shih <shenshih@amd.com>, Hanghong Ma <Hanghong.Ma@amd.com>,
        Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
        Daniel Wheeler <daniel.wheeler@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210505093907.6e6c9556@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uoWibIRRTmuuaR4irsuighH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uoWibIRRTmuuaR4irsuighH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

At top level:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:633:13: warning=
: 'dm_dmub_outbox1_low_irq' defined but not used [-Wunused-function]
  633 | static void dm_dmub_outbox1_low_irq(void *interrupt_params)
      |             ^~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  77a49c458931 ("drm/amd/display: Support for DMUB AUX")

--=20
Cheers,
Stephen Rothwell

--Sig_/uoWibIRRTmuuaR4irsuighH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCR2xsACgkQAVBC80lX
0Gxc/Af/fpymtBkfnbeKPntSiGdoUneMZD3565qgJIdcEFyEN72TPokk7ycAUl0N
KY++AGSYhm9pHYNASCbjb+1kFtwyhnNIQS1Tl/KiaaTeAUImHbykb+ZDZ0g7O7pY
Gtcw8AA9PCMZGwS2KY2f4uW9twR92p0sx6B7x8dxO8Q6RMmkNxeynO/GfhpAop5Q
NhW81cVm5+Pz5afHwRFxRZ7t1ChqS+PvKkKGCsfM5dkh6osUYmTitlhMp0wyJxkk
CMQ/EakcJtGHKXiv66gDKmUrzVI4uf1qQ8yTrXKr0D9VsG/Atzoz5dJ0CmUDcviZ
V3TzFkPCJJRpVc00VfWITizVq8qKzw==
=43Sb
-----END PGP SIGNATURE-----

--Sig_/uoWibIRRTmuuaR4irsuighH--
