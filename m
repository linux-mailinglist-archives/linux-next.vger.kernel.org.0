Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B40337B109
	for <lists+linux-next@lfdr.de>; Tue, 11 May 2021 23:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbhEKVwQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 May 2021 17:52:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbhEKVwO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 May 2021 17:52:14 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A560AC061574;
        Tue, 11 May 2021 14:51:02 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ffs770PQxz9sWB;
        Wed, 12 May 2021 07:50:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620769859;
        bh=od4h2PGWQFMzYvvwxJucYgVHgo1iQMpW5/aSXTDIzWo=;
        h=Date:From:To:Cc:Subject:From;
        b=GGFQRBS9rlIj93urezSWF/XtWB+PnZxN5BquBggjT8KeEE6m0mjOpsGCxI1QsOte6
         to4jlGrYpAeVLzDa2r9D/rQA6ghWBRuxbVZyyHWFWSuvdTEG9GoWv7aJHi5EMuSMk5
         AF3DJn1v/ih0YvWXOGH1gI1w9ZfH2jaNqxKbripiOOiZToZ+q3lQ4yIxWU34lbSyyl
         1tBsLnp8mJClslXcxo6tZP1X17EzPA2osgGTTK34VFbLupmEM1BYQaEYIrlSRAgZQE
         cjNmyrhhoQemUXHPgOVYMGkkMZVtdzHToehP3UwYZPnWOYfFG9LH6cS01rdwSiOaZr
         IIoxHtteJfYYA==
Date:   Wed, 12 May 2021 07:50:55 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the soundwire tree
Message-ID: <20210512075055.69047ec0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b6a5BK8LoePKHE/k5jx0o1I";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/b6a5BK8LoePKHE/k5jx0o1I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f136f3279d85 ("soundwire: qcom: fix handling of qcom,ports-block-pack-mod=
e")

Fixes tag

  Fixes: 5943e4fb14e3 ("soundwire: qcom: check of_property_read status")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: a5943e4fb14e ("soundwire: qcom: check of_property_read status")

--=20
Cheers,
Stephen Rothwell

--Sig_/b6a5BK8LoePKHE/k5jx0o1I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCa/D8ACgkQAVBC80lX
0Gxr6gf9EgnY5GiazmqsHZJgdIa35GWaSFKNcd3WcKaTNsXh3K3X7gZ/ow2jyI4V
D1YEkueYyDcRK9AgXXjPCbiv0RJLAOiNHx3CJ4pEeyu/PM59rOvbWpKqUVZALqCS
UPbcuIts1LwV3ztjfpiDVpgcCXNxQdwlkRXG2IVJ9PJsi5yR6kHZ7VHGPXOhxfcz
76Cyq3PdEO+ZLNb4Wuho9wDcbnzqNIz28imjh3SdyqwGXiVQQYgoXYVq9mC7WkGi
aByOd6iXlOxtXsmcw9z/beuYscMByON9le91m9+bnR7BOpjp/3E9QZRC+wAHKInJ
6lYgwwsbN01Oevjv9dC/1EzKySwujQ==
=kbxm
-----END PGP SIGNATURE-----

--Sig_/b6a5BK8LoePKHE/k5jx0o1I--
