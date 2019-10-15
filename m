Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83997D6D0F
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2019 04:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbfJOCAJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Oct 2019 22:00:09 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:48273 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726786AbfJOCAJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Oct 2019 22:00:09 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46sdsy5x4Yz9sPV;
        Tue, 15 Oct 2019 13:00:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571104806;
        bh=yA4DbFhBAM62vN7U/ESBg++PdJzv892SaHMWHwRMMQg=;
        h=Date:From:To:Cc:Subject:From;
        b=E7bPF9uIN5tU+uDWIRwKMR7yJ0KwQJf/vDT3MmVQtrrH815rAAFbQ3dl1CUzhC4KF
         0ehuY/PMo+iKKlNV6qxJewLkY76VUZZfdyqR3+u2WEdwY4sZ4uXaxJc1Fzm3o0WbT0
         ZsCypSIQvo4tK+V3a69sBnUzWwuEiL/zy0qeol0AqLMb8P23QKUkZy8vbvxAnDwh5w
         S46OIEmfOAMFYJAFzuzVBkUXwxb9Ih38uafzKbUXL1a2wQ3jhsW65iVDxcgj0YLG9S
         /uwvx6rdwcAr1px9/ZzMLaWW2Y5mApXtsz6KdRu5X6yqbQg0ht+NSTUaADUY2jIy6e
         NxOdIHhB4bGcA==
Date:   Tue, 15 Oct 2019 13:00:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ayman Bagabas <ayman.bagabas@gmail.com>
Subject: linux-next: build failure after merge of the drivers-x86 tree
Message-ID: <20191015130006.39f58992@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aSX8W2EVAtF1WyjK_DvbCEg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/aSX8W2EVAtF1WyjK_DvbCEg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drivers-x86 tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/platform/x86/huawei-wmi.c: In function 'huawei_wmi_exit':
drivers/platform/x86/huawei-wmi.c:890:41: error: 'struct huawei_wmi' has no=
 member named 'pdev'; did you mean 'idev'?
  890 |  platform_device_unregister(huawei_wmi->pdev);
      |                                         ^~~~
      |                                         idev

Caused by commit

  eda34f06b2e0 ("platform/x86: huawei-wmi: No need to keep pointer to platf=
orm device")

interacting with commit

  7532afb35012 ("platform/x86: huawei-wmi: Move to platform driver")

I have used the drivers-x86 tree from next-20191014 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/aSX8W2EVAtF1WyjK_DvbCEg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2lKCYACgkQAVBC80lX
0Gxp3Qf/SGOoHgfSeOcXB5eHo2vjKqlvdfN2ph98DEQFEOjuWCL/JBqna2ECa7dz
5Ndmw5vlQ6eVcVQwkuVtPH7XK32ngHqXXZOoQb+PYsS/Q6Nu4bf3KQYqWZ+gKTjy
aoMzI61krNiJAzm5o7u2wm4/c4n9RtzH/CCgwVWmfNNRbHfxKqxeoY0vvBG9iBQK
L0xiib4Rb/CeDJEFTrWqN6F4ybINp3Ffx/jdGrWGyMHHBj5VcpgytIS3CmFaOesG
3/Aga7XIU7Md+DEvf/V7m66UMWgE6+n5PlvsVpS6bWwweMjw5AU/C5GWwB7cLOas
qEXw+EQUe0q8JaaNWZlH8/7BEUyzYA==
=G80J
-----END PGP SIGNATURE-----

--Sig_/aSX8W2EVAtF1WyjK_DvbCEg--
