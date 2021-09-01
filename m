Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DAED3FD21E
	for <lists+linux-next@lfdr.de>; Wed,  1 Sep 2021 06:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234665AbhIAEYE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Sep 2021 00:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhIAEYE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Sep 2021 00:24:04 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12E66C061575;
        Tue, 31 Aug 2021 21:23:08 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GzrWj3PTBz9sRN;
        Wed,  1 Sep 2021 14:22:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630470184;
        bh=QVGYJTbvW0WF1fUfaf4tWknJbshw01BG4Gxa9ed0MUM=;
        h=Date:From:To:Cc:Subject:From;
        b=AI/vxfob+q65nwX5RMt9BfZuccVX26N1NZg+YCXefpMBVbcJjJNx9SWk4blbHjTTc
         23H4d6pOlFVI4WYp6i8ZXg8i40w2PTojHCQU/lYlVVFhMzcGCBEY0NGjVbAvDfXNv9
         2/m3RFHVV4FgNdEirzgGFLHWJbV6Z1OJKpDSprfqa6bYfgu709mfMEO46Pe2ajhtJg
         DUV/g2qwPm2YXrAuxNX0kDlDvlp4L55Clt3qDYU9mnHWHDtWDK4G14lmyTHCfYMUiC
         2/4km8ay46byO5sobEL13wf5q7i5aAcA43Fy2pLVWkihS0u3SlHkDCOWyEJLa67S27
         Z1tUSqP7bDh/Q==
Date:   Wed, 1 Sep 2021 14:22:55 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Conghui Chen <conghui.chen@intel.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Igor Skalkin <igor.skalkin@opensynergy.com>,
        Jie Deng <jie.deng@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Peter Hilber <peter.hilber@opensynergy.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Subject: linux-next: manual merge of the vhost tree with the arm-soc and
 Linus' trees
Message-ID: <20210901142255.1189dd71@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9JNJFV5mlQs9ZSnWjTTHMgh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9JNJFV5mlQs9ZSnWjTTHMgh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vhost tree got a conflict in:

  include/uapi/linux/virtio_ids.h

between commits:

  46abe13b5e3d ("firmware: arm_scmi: Add virtio transport")
  3cfc88380413 ("i2c: virtio: add a virtio i2c frontend driver")

from the arm-soc and Linus' trees and commit:

  df2fd4361a56 ("uapi: virtio_ids: Sync ids with specification")

from the vhost tree.

I fixed it up (the latter included the changes form the former commits,
so I juts used that) and can carry the fix as necessary. This is now
fixed as far as linux-next is concerned, but any non trivial conflicts
should be mentioned to your upstream maintainer when your tree is
submitted for merging.  You may also want to consider cooperating with
the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/9JNJFV5mlQs9ZSnWjTTHMgh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEvAB8ACgkQAVBC80lX
0Gye8wgAky5thkjxdw6QO4Ek88qchgaqQjC/QcWVze5DixqD/LPsuiuHhwwxXDy8
vdhZaW6yyLYGJwCFHMwYMSxlmC9nsq7buUUvjkCpR5RrrqC4qyWoJuzL42GUGbBh
DCC0y7tYPR04c9D21EbaK38VCHXw9vVMp3zGVU6Lfimfh5z90x3sL6kXNmIK7+9M
kFB70YgLnwEKtku/msIpG1i78Gr0xN/YDlCL44fHOiooUiY4O4IQFx9WAC29HMGy
jju4Dc3XsX1UAHIRhjAgaHOx3mmfBiosygtEgMTAcqz4Sd12Jvf8oqobozNm42TZ
IPKBrvBc5ADSY3H9sUchAnhqNez/NA==
=jFO8
-----END PGP SIGNATURE-----

--Sig_/9JNJFV5mlQs9ZSnWjTTHMgh--
