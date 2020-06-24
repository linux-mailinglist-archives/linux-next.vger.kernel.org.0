Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3C69206E3E
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 09:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389985AbgFXHwv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Jun 2020 03:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388375AbgFXHwu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Jun 2020 03:52:50 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8400BC061573;
        Wed, 24 Jun 2020 00:52:50 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49sFk75ZQfz9sQt;
        Wed, 24 Jun 2020 17:52:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592985167;
        bh=xCH880zgT3hKqcB0q0Z3S8ZlDJ84/lVH77geTxzFYj4=;
        h=Date:From:To:Cc:Subject:From;
        b=VFb87wIA6/14yZdpIUvjL4ciNlNn3JnPGCyBmMqYUlz9RHJDJTzeM0z3+NlRL/yAH
         yYtvNSnYjj4kAL9Bji9wf62wqhXCz0Fn/qrH02F9G4QMm2caAw6OdZ+q1D36rykNA1
         Pa82FHDXruZ9xDunUdU4aBlEI2w71pat3uY+MHPRsXG9CmrkmKaHYN90XRZmTuzHDk
         NH0d7EWxwFlGmzZ4nVovusmE8XP+66XM8qogkNIcb//FPOZePGRByG8tr8SjaNTf83
         pFaOkQOCEerBa6LD7CaWNwGdRdKUA0/nmTTGfOONLOkh9WtgWRXXVBn9g8mkOzPYXF
         md6iR50yGcZbg==
Date:   Wed, 24 Jun 2020 17:52:47 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the hid tree
Message-ID: <20200624175247.6c7427c8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SzF0bAERJ8=XtW3uroRN=ZO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SzF0bAERJ8=XtW3uroRN=ZO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  6d7ccae2e093 ("Revert "HID: allow building hid.ko as an external module"")

is missing a Signed-off-by from its author and committer.

Reverts are commits as well and need SOB tags and (preferably) an
explanatory commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/SzF0bAERJ8=XtW3uroRN=ZO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7zBk8ACgkQAVBC80lX
0GzE2wf/cg9ICH85Jo9U5JdbTuzFvwYEN+5fsHIPcQW3dOGO16gxQ8Ni6XZZQQaQ
gNG8g8KxzYL96OPU+JdYhwXucwXoYJ4d1Kfnab5TxqudW9Fy5HP+/wbQd+eDm1i/
mVuLUSVln/kbJ7JAOvt7Hhgj7FM7fgQnlPFkXdg8Qd8NGnQQx7sf9b7irY88rUNZ
JOhMbbhCFmjvSiwrcZlgDL7OQNot95ImZRPueH3L9oWENLbaVgVpmo8kBBHSGr8D
/lIOeITQ09TK5cs4bstIIvYhX0YZzuqsOdhkpHmjqf39o5WYyf71mje8FOeqQZf1
FzR2F0BqVn//pJK2HRgsLquOVp10Jw==
=RdtY
-----END PGP SIGNATURE-----

--Sig_/SzF0bAERJ8=XtW3uroRN=ZO--
