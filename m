Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33EA238AE6E
	for <lists+linux-next@lfdr.de>; Thu, 20 May 2021 14:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238670AbhETMhw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 May 2021 08:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232853AbhETMhd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 May 2021 08:37:33 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADDE8C0E4352;
        Thu, 20 May 2021 04:50:35 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fm7N543tmz9srX;
        Thu, 20 May 2021 21:50:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1621511431;
        bh=7c8ywGXs3kNIFGiItdKujI1W41ZUSbFbF/P0UDF+NEY=;
        h=Date:From:To:Cc:Subject:From;
        b=uHlP6hyi3T/zYcqtrPbx8Cr7ftGZMorfDcMgVN/a115YEFB5pKoq4JehuhCVROrcN
         zWEQYB6xahlR51RfHJeWD1jhK52iVPlQHhoZVDuzJTkkDC6aX5YT4lC3zFu1WEXOiy
         9iBOEpsk51qdBXcnCyZdd5iiJ2VH56ZX7B4pFHkkxU3/KCE44fFb9SzZkqGoLVTsqQ
         tmZAgLf+dB+Edl77iQqaiOE3s6v+TtpRR6RsaQWqEc1raxMMFkr7M7GmIl2pZ+ENYX
         TAacKGW+9VbP0lgX5fW6RQmTd4uT6T8N961axOVDcAMy2UyBl7kMyQjTkbbvYH44TH
         ZapYWtOBSKbVg==
Date:   Thu, 20 May 2021 21:50:26 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Like Xu <like.xu@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the tip tree
Message-ID: <20210520215026.40e1c8ec@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z/gitCO.2DX37TV6FsmCE9K";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/z/gitCO.2DX37TV6FsmCE9K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  488e13a489e9 ("perf/x86/lbr: Remove cpuc->lbr_xsave allocation from atomi=
c context")

Fixes tag

  Fixes: c085fb8774 ("perf/x86/intel/lbr: Support XSAVES for arch LBR read")

has these problem(s):

  - SHA1 should be at least 12 digits long

Probably not worth rebasing to fix, but for the future this can be
fixed by setting core.abbrev to 12 (or more) or (for git v2.11 or later)
just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/z/gitCO.2DX37TV6FsmCE9K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCmTQIACgkQAVBC80lX
0GyMxwf9GMG6jL11/N43ENKGO7BYZ9PIcC5i44Q9Uqc+g+gJiJU90QRCAIP/jTEK
nTP5+a1swU+YgVbRNXuCfcL7EquiiAKBRXR9I58/C+WBgnFmayzvcBuHasf/9Hq4
DbzO3N2B7Dy2tBLQloaZas3MfzmmFersFBVXPE5HEDPUMV3hnyYeqLLsg8SSH3FZ
TSkQ/YAioF29wZdC6KHe3KTM6p9HXFX5G8yBYq/2IeKNz3mnu5mvd5VThZgB6aYl
ueii0essd4lC2nV4ahYIZBOHyLAyoFGSkunllzjciZZAapDDoBD+V7MUTnUN0XLt
gY3YHdgWNLIxEhj/YJdH9GGZk/z8GA==
=yo8z
-----END PGP SIGNATURE-----

--Sig_/z/gitCO.2DX37TV6FsmCE9K--
