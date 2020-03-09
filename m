Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67A2E17EAC8
	for <lists+linux-next@lfdr.de>; Mon,  9 Mar 2020 22:08:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgCIVIN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Mar 2020 17:08:13 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55437 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726118AbgCIVIM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Mar 2020 17:08:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48brRG0C09z9sRN;
        Tue, 10 Mar 2020 08:08:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583788090;
        bh=PvJIsVYHxPMFYB14Ey2gvRgzLeFBRUopGO6J+1r0pGo=;
        h=Date:From:To:Cc:Subject:From;
        b=QqAvgixF0LvbNT7cvUhkrt6gvas3f6Z8v4ETCcw2BTf9/G8wJjlGCrusJqitF1u6u
         FxcGksl+DDk28wExnbI3cSV2dxkNYXsv5dqtPV3Dm3Aj2TzZdpZEOgjnxe2Ugf++7M
         PIUtJRX9yMI6v5Q5Kf3MHZUIeWar4GF/DLWs1m7Z8vPn5H9jNWctvh0hDx3vG3QrCh
         ElYxX4Sf9L/yByCU3GvFyktCTX1860b91c2yXX7c0blT7LR3kR7S/WSenNmNOIfHRh
         vRiWX12mb9pFJep/sTOV7/QWj0CEI24BjQPWut0ABjmQOJTRPvgV1cSpMtrK5lQILs
         vUAP+DurN6qZA==
Date:   Tue, 10 Mar 2020 08:07:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the pidfd-fixes tree
Message-ID: <20200310080758.0b7b6f6b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rW2OhgAG0fd3atcTMj2J=MI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rW2OhgAG0fd3atcTMj2J=MI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pidfd-fixes tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from include/linux/rwsem.h:18,
                 from include/linux/mm_types.h:11,
                 from include/linux/mmzone.h:21,
                 from include/linux/gfp.h:6,
                 from include/linux/mm.h:10,
                 from kernel/pid.c:30:
kernel/pid.c: In function 'alloc_pid':
include/linux/err.h:26:9: warning: 'retval' may be used uninitialized in th=
is function [-Wmaybe-uninitialized]
   26 |  return (void *) error;
      |         ^~~~~~~~~~~~~~
kernel/pid.c:168:6: note: 'retval' was declared here
  168 |  int retval;
      |      ^~~~~~

Introduced by commit

  8deb24dcb89c ("pid: make ENOMEM return value more obvious")

--=20
Cheers,
Stephen Rothwell

--Sig_/rW2OhgAG0fd3atcTMj2J=MI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5msC4ACgkQAVBC80lX
0GzSwwf/eyDQ2Lvm8QB/Dvowfw+331GLu+1fKl0Ic5PEmOFMiPBOncbgjONtNo15
mLBOZuAcloxpHuz+WN7dGM3hytSxADAlAfpI/3UMEqEB9mZ2M9bBHqyU3rGrIkvn
3QTcwXczsjPh/1qapn2BCn65KYvqplukx4DaFkUp+5OVg/akhS5+p3v+MtGsbZNY
3wyyI9f9jqb/7uharBhogLVv690VaRtq3JSvNTTtJS5TrQobpL3qhqyjjJQtdrwM
2/APs4v/QpbTOdnVqWcGI8MqWDw/3t/aw9XnzC8qa5oJcEQSTwhymiabv9kGnDmn
YI1/XQ+omlHHFBH9IQw+cXy5pCEs9Q==
=b0oZ
-----END PGP SIGNATURE-----

--Sig_/rW2OhgAG0fd3atcTMj2J=MI--
