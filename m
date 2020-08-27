Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84EA6254098
	for <lists+linux-next@lfdr.de>; Thu, 27 Aug 2020 10:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgH0IVI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Aug 2020 04:21:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbgH0IVI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Aug 2020 04:21:08 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A44D3C061264;
        Thu, 27 Aug 2020 01:21:06 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BcbKD39XSz9sT6;
        Thu, 27 Aug 2020 18:21:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1598516465;
        bh=q9xgTqiKc5Z0bp79JsrGfN272i1bs7hHiZWI63MsqiQ=;
        h=Date:From:To:Cc:Subject:From;
        b=DskRtKrTzAiV6DizFyUar2LYqrr36J7mAJjWvRtQ++jRqin/DMHZYbj3mkxYdRHEX
         DFkUlW8PLvfO6ziRbmauYqpZhMvHTBw4xhFiQKMIGaSSslAkISxACVU7IkwO0dAXSw
         7KvwvaH+PUKp5Qd1phxIrrfbHOSPYmo8hD5fPYN7hdSR+x0T5+kc2jH+GMwv23RNOC
         aHI+Y3aLdP/t4BiczLKzbk7fr3WIVBe7ZxgW4IxSNjSdOuGHuG70m/yqNaDCKVXwE+
         7ikqOe/wbOFzfBafcodi1raeVXS5wuekqLXyB7j0VR4ZVFgyz3qAoKfa+SBL/zumpM
         OGcGHlsPXh4HA==
Date:   Thu, 27 Aug 2020 18:20:58 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        "kernelci.org bot" <bot@kernelci.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20200827182058.1c7d75ed@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P+U_TtvfBWlbAkU5prXwwlC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/P+U_TtvfBWlbAkU5prXwwlC
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (mips
cavium_octeon_defconfig) failed like this:

arch/mips/cavium-octeon/dma-octeon.c:205:7: error: =E2=80=98mem=E2=80=99 un=
declared (first use in this function); did you mean =E2=80=98sem=E2=80=99?

Caused by commit

  52e1a745395d ("arch, drivers: replace for_each_membock() with for_each_me=
m_range()")

Reported by "kernelci.org bot" <bot@kernelci.org>.

--=20
Cheers,
Stephen Rothwell

--Sig_/P+U_TtvfBWlbAkU5prXwwlC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9HbOoACgkQAVBC80lX
0GyiKQgAoVZsAzb7AxU9YwR6KyRPfd2nrw1e8idT6PGfQZiCOtPkHssEQydDKM3E
qpxSqKsMX1/Fc5hVq+RJlrg8Z1sNZP5d3O2PtyMkGZmzIjozp+HYbfBBey27k/RA
vcAv8smmJUN1AXNWkOHyErDrLtWpgJMQV7kbellzob1wRhY8hbGdofztZAkHOKb9
49s+5t/IvD3Tg7nUgBiXWL/KtqpuGTB7v7HO7A9b7aH4N3VK7Bo9blbc3joysTfd
ZH1KFQowRede4c2fvv3UavOFuY5TrcU0V2SojA8vTOU0nOvY4ms3rUBvwWX0MQC9
RrSPJst0g11cJ8Z1gVOzEEIDWw0kiA==
=ta2p
-----END PGP SIGNATURE-----

--Sig_/P+U_TtvfBWlbAkU5prXwwlC--
