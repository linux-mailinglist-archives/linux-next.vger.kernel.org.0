Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE0D2399DA2
	for <lists+linux-next@lfdr.de>; Thu,  3 Jun 2021 11:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhFCJY0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Jun 2021 05:24:26 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42639 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229567AbhFCJYZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Jun 2021 05:24:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FwgR31x90z9s5R;
        Thu,  3 Jun 2021 19:22:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622712160;
        bh=o4DLtiN5sP62zwU54/f9xi2XLm35z+AtTBorh4DX36s=;
        h=Date:From:To:Cc:Subject:From;
        b=VVQvMBU90VAxtSmFARi0S4yl0Zd+jk/kt2ICAFiIoxb4ST+ip+Sbd+ewU6/4pZ0Dw
         BJUs7K+FKFyoAJ4dxvv821qVj4b/uUVItECpQr7NOegsw5WBBtfPl4Z8A2BXkC5WMj
         kl9ZRtckFZcT0owrGY0t5cnaEv3qYSNgydXkfUt+Mq8jmqe9BeI95nuhMnXOb0778u
         E4KMatmbz8B72Y0CAENCZRXCcQaL/UHehFT+kAXF6PO6enwJQjJBCvbQjEoDRFViQO
         bfZ/Bd11nILi3+TKtbOt6bmLrDe66w6FRYuq6L9poM/byZ8iRQitQv5xswXpmXW7Ax
         w+MsUD41eA0rg==
Date:   Thu, 3 Jun 2021 19:22:38 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Yu Kuai <yukuai3@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210603192238.0bbc6686@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bQzx9==Wo3UvO8FUvsu+f_V";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bQzx9==Wo3UvO8FUvsu+f_V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

include/drm/drm_atomic.h:908: warning: Function parameter or member '__stat=
e' not described in 'for_each_new_plane_in_state_reverse'
include/drm/drm_atomic.h:908: warning: Function parameter or member 'plane'=
 not described in 'for_each_new_plane_in_state_reverse'
include/drm/drm_atomic.h:908: warning: Function parameter or member 'new_pl=
ane_state' not described in 'for_each_new_plane_in_state_reverse'
include/drm/drm_atomic.h:908: warning: Function parameter or member '__i' n=
ot described in 'for_each_new_plane_in_state_reverse'

Introduced by commit

  a6c3c37b661d ("drm/amd/display: fix gcc set but not used warning of varia=
ble 'old_plane_state'")

--=20
Cheers,
Stephen Rothwell

--Sig_/bQzx9==Wo3UvO8FUvsu+f_V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC4n14ACgkQAVBC80lX
0Gya2wf/X2P3k89JyfPAnmbHzg0faIjXNUE/+SkMTCOBThAkYRaKJuiSQQTjSE4T
RAoUjvKtYY1FDy8n35cUc5IWRNYeZI4HtUsul3+llrOSRkrg3SrPWuWBmThhzWqe
nijdnCCnoNX+zAir/7xwx14sofh8WyoKD905mMFglX+bYFJnMPkSFLNMeqXHmKBV
cxzfiRlgSdAmOxfY+6cSEWYZA6q0sVA/TjiA3LMewRxcHLUx0SznYtSzo5j3MZRg
fspYrICbO+A7mSPpm5wnMKv0Z73eCJY1yI6HWhd5xV18socy2aUwx9GXIDP5x57S
s4kKdyHXIFR4YDddVq8UV0MUYKQLGQ==
=aQ3o
-----END PGP SIGNATURE-----

--Sig_/bQzx9==Wo3UvO8FUvsu+f_V--
