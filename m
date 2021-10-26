Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5F8243AB89
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 07:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231801AbhJZFJ1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 01:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbhJZFJ0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 01:09:26 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DBACC061745;
        Mon, 25 Oct 2021 22:07:03 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hdfv64nhmz4xbW;
        Tue, 26 Oct 2021 16:06:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635224820;
        bh=m7qV0fLxVzTOZcHTlGWomPFtu4I4WQaZIWAPToKi6P0=;
        h=Date:From:To:Cc:Subject:From;
        b=MMQCF6XWk96qU7x93plXZdh1rT83o+SYajPMWPhHhvmrDFIfQ4RhCqUWrMQZnsjTT
         chy3ft5PnJ1gV/bgTjTtkMKNUtFmgVMZTtDSAy8tQSBO+Nd47q4y/rVyWJX8lZCGNd
         7JAzVHLRhsy9uEo6X1rDXgmvPN0Yp73+htfxpWMAFkqWX3wCcZYhtp18cr8/Xnovpc
         jidFHg4/wyMhU9shrSyJGxALZjogYYHh7gJ4G0brq5TFpa+T84URIPvtNhQ9hA/Zww
         fMRsKs4lONx9zZKgC/n4ltmZ6neh3yY3bUE7499JaRAatpUerxwF8dWZZfaFyfkROe
         vDHD4dEnuRDYQ==
Date:   Tue, 26 Oct 2021 16:06:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Qing Wang <wangqing@vivo.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the dmaengine tree
Message-ID: <20211026160657.63ceb380@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4q9wou1QTmPH13m1rFEejaV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4q9wou1QTmPH13m1rFEejaV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the dmaengine tree, today's linux-next build (x86_64
allmodconfig) failed like this:


Caused by commit

  981b43434b28 ("message: fusion: switch from 'pci_' to 'dma_' API")

I have used the dmaengine tree from next-20211025 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/4q9wou1QTmPH13m1rFEejaV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF3jPEACgkQAVBC80lX
0GynqggAnBiXdmpe9vc+qV8YK8h4gc40A3T1XWdT1jTmSrg8Tr9MrJAOtG5Rte30
2ojYqDd7A/In8yEnEh4ax5Tcxygaqmt7Ji4z6THeS4hFW2l3hTgFH6/dF88ET5J0
KE/HMsp9Wp1eVEMbgoTSaO7QeSmr9vh2mABB9UZ2uO2PVVlFBysMXc6apZ1tp1Qy
K4zkQSXaRqfVeKAiFqaKI3YMQmJSzGxtTzp27SXb3a5L7l9Rt1MmmlbrI9/qMDCV
VfxXyr+ezWxH54EJvxLpr0K+tsp+1ul5jZfF/I1QEDh+enxUUdoC87lq5Wt1MZFj
DgPxmoYr6uUgiF8voiR+fXVHP6V19Q==
=ck0I
-----END PGP SIGNATURE-----

--Sig_/4q9wou1QTmPH13m1rFEejaV--
