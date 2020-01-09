Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9C861354E2
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2020 09:56:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728967AbgAII4e (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Jan 2020 03:56:34 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:52843 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728782AbgAII4e (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 9 Jan 2020 03:56:34 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47tg2l4VSNz9sR0;
        Thu,  9 Jan 2020 19:56:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578560191;
        bh=80jI77AOoYFB7RRyd6uDjLgdDaixjsEjEGudOjmOH/A=;
        h=Date:From:To:Cc:Subject:From;
        b=JCOdhCaXZ5S1ODqx4HOTSwZAQqa7f5B5wIEZVMRNVeeFNUfo4Vhc+pnG4e+TfLG+G
         1D81VF1EnMfrQq9hyh/WUc0pbtyxSs88pDfuspfpo4D/xWnnDlwvpz8TijeLo9BmBQ
         r5gTmNzT9XBCOIRxgEXEMYXrkbykZx/2wfhhFuLwwyS774rTyVS4HcsmIanTtXT4pq
         xtzKnaxZGsRjBWoodOFTOczsjq8zJgPSjYalDHqqtVcD+1CBoHlg7Bf/EVMnd5qyfF
         fh5NczIvS7yAmll2GeN0/weBcvKi3CFhdR30/rfw3+kjEQ3gpvIzoGVh3KUoj82RMd
         3sTdVK0HUnFXg==
Date:   Thu, 9 Jan 2020 19:56:30 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: linux-next: Signed-off-by missing for commit in the arm-soc tree
Message-ID: <20200109195630.2dba4028@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/824GcS9jCs456SzDeQhXmGM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/824GcS9jCs456SzDeQhXmGM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  4386aa866d99 ("cpuidle: psci: Align psci_power_state count with idle stat=
e count")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/824GcS9jCs456SzDeQhXmGM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4W6r4ACgkQAVBC80lX
0GwZlQgAirkY8xW4wHeY2GrIGzjzWjMtLySs51/+GFxYIQkiukdFuzXStFgI6sqZ
m02dL0NKR2rmKx9Imk2Q/NI5Y+J0pOId2l8HSCGLBJqYJnYeqzG+8/eSuYYngmHr
OVQ0WvgR32aD90t10v+0B6ynscsROyCc/e+kUDuQoeQpod1xmME3J50g3a3sbGr8
VHusxWauZifmjl2IWzvaVIgGo+CGpf79iiEue7pMMkodrfAIF93Ie933ai9wTwIu
ycUjU4kgRC20myd1bPjvi/977JsrC/lDp//jUkhX31sWl1z82Jqnzem18ePzJ1b2
bRo5rCD9sTF454g9dMy0rfCJUeTyhA==
=l+fn
-----END PGP SIGNATURE-----

--Sig_/824GcS9jCs456SzDeQhXmGM--
