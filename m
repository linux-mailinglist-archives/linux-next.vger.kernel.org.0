Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14A2B30D2CD
	for <lists+linux-next@lfdr.de>; Wed,  3 Feb 2021 06:14:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbhBCFNp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Feb 2021 00:13:45 -0500
Received: from ozlabs.org ([203.11.71.1]:53729 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229539AbhBCFNo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Feb 2021 00:13:44 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DVqZP6r5gz9tjx;
        Wed,  3 Feb 2021 16:13:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612329182;
        bh=sYwKvKMTt9Vma6vmeisb33yV/bsixp32y/csPvOdFCc=;
        h=Date:From:To:Cc:Subject:From;
        b=S0k2wS4fnTh7Nh+KGOimd6mcuMdI6tJig3WnYBMPGncFslAu6AR5FqVfyTvwOp1E8
         Uf9WevH1OSz4F5V7SMusvHITLgXHTst5n30bq106wpqLSkcX0HbJQCoqE+75wrtgiW
         V7Umlxtz7kF8M+aISq/3jECN6LXSGZDZ7hnoI2VrjiGjdrDUJBu785BY26r+CCeQai
         oOcSSp8qLAzYWx4L8G6SrA3wPteadP7bt1FPtKuKxe3xbOP8n2oXeIKM4jBRT89Pli
         QbqKS1OBeW/TMN7lJvLOYp2BKDDH8z1j+p0SBEBqG4iOm0mSuovZrJwVO4Q/2IVJsL
         5x5p1L2+erQWA==
Date:   Wed, 3 Feb 2021 16:13:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Benson Leung <bleung@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the usb tree
Message-ID: <20210203161300.57344f63@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dMOvVGJcTqKIZw/WNSFJipH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dMOvVGJcTqKIZw/WNSFJipH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the usb tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/usb/typec/class.c: In function 'typec_partner_set_pd_revision':
drivers/usb/typec/class.c:763:6: warning: unused variable 'ret' [-Wunused-v=
ariable]
  763 |  int ret;
      |      ^~~

Introduced by commit

  29b01295a829 ("usb: typec: Add typec_partner_set_pd_revision")

--=20
Cheers,
Stephen Rothwell

--Sig_/dMOvVGJcTqKIZw/WNSFJipH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAaMNwACgkQAVBC80lX
0GydfAf/dJkYrj8TP3SVXgQBhvZX/V8mcYiRmLqBw+pwNkBFksYXn3LtMpnzCBY+
h/o7Umh6ZB9GAsKUKwWzvePnG4BXR16AHAgmLcRhu1zBHZO+nCPdbSPHGmLu1UAX
xP2dRtKx1T+pnzzdP3iyI6g3g4izWLaFzwpNegErmscZ/z2F4Y7U2jkTc/PQMB2K
ieKstGes9vPFjMGzEtCFQkCvSpRAMWACL6PXsz2MuHV1QcrCSnWWF2iT7TM9UUH8
MS7UBXQmrIrHahqFNBEBo0+/BjQxgOLUtyebavkl1pfndvp5qUKp4uilbSjwyaTE
0br2k+wLlR2iBw9WzhCN2vMvmCRstQ==
=mVGj
-----END PGP SIGNATURE-----

--Sig_/dMOvVGJcTqKIZw/WNSFJipH--
