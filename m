Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE7C1C8194
	for <lists+linux-next@lfdr.de>; Thu,  7 May 2020 07:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725845AbgEGFgo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 May 2020 01:36:44 -0400
Received: from ozlabs.org ([203.11.71.1]:58869 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbgEGFgo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 7 May 2020 01:36:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49HhzG3Dgwz9sRY;
        Thu,  7 May 2020 15:36:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588829802;
        bh=STWxULA8O436yla6PM2R9Jncrivrdds2uj6ty7ERlK0=;
        h=Date:From:To:Cc:Subject:From;
        b=gABopanHXWkLviZFpWpF9g3WxXbXaBiEz1GzaSLl9MdajEfb4NHxur0OX4O4cJIck
         FB+PintvWys0XkDt2m4/eACj7KvFt7gba4SySDwZpjqpDC/FsMgI8ol4Ncpx6yU0es
         3UuKOmG9V2+tCTXNqNiEGt/bwGzY8qanQb3y7Xi/XDmsKm6JaG1QMt7GhrGnBnqv2f
         YX/ACfL4C56kGkNiaX2rS8vJKLgg56uDtqta+Iz7zURbXMXgouK8G0Hm1SHtP6X+zZ
         TbL92bwzUYu7xiGpgt6pFl3cPYWRq3RAuKFdFiw3Iro1mA428wbTBfSa9yx5ONh6oK
         brZ7eFSXlmyJw==
Date:   Thu, 7 May 2020 15:36:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the vhost tree
Message-ID: <20200507153640.290402bd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.8twKrNHx.x0WvEt.e+r3EH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.8twKrNHx.x0WvEt.e+r3EH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vhost tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/net/virtio_net.c: In function 'try_fill_recv':
drivers/net/virtio_net.c:1250:3: error: too few arguments to function 'u64_=
stats_update_end_irqrestore'
 1250 |   u64_stats_update_end_irqrestore(&rq->stats.syncp);
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/net/snmp.h:47,
                 from include/net/netns/mib.h:5,
                 from include/net/net_namespace.h:17,
                 from include/linux/netdevice.h:38,
                 from drivers/net/virtio_net.c:7:
include/linux/u64_stats_sync.h:149:1: note: declared here
  149 | u64_stats_update_end_irqrestore(struct u64_stats_sync *syncp,
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  fa74db4261e1 ("virtio_net: fix lockdep warning on 32 bit")

I have used the version of the vhost tree from next-20200505.

--=20
Cheers,
Stephen Rothwell

--Sig_/.8twKrNHx.x0WvEt.e+r3EH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6znmgACgkQAVBC80lX
0GxPEwf/a/hhXuBVGLoTfZlcQ3Z7ahna8d/3cUjsuPGiV3Pq5ryoErrY8pyccb/C
xhqwwWuRlN45irOCocAFwGov1+BJ4WCiI4u9VBfi0o8hf5XnFZHTOiTFPDN3u8pl
EI+CH+4rr3wSaGJn+vmGGhtFvdy9xqhFjOI2EvIoYSdkTXHhI9Jq9ShXHnZIx2D7
ZlR3ctHnp7KaHX/DrRLA0ncTfFuHQnuhUMztemIqQkr8KIRRUrf4Nlzc73t8wukC
HW1ys48hkLfRtU5Cc8mI5dJjWWZthm9bSN4NDAkWQDSvntdZSZxfx3CXz4qI4JTm
3Rl3sXaG3YY8M+ny5oI3h3Vm39bWGg==
=+FK2
-----END PGP SIGNATURE-----

--Sig_/.8twKrNHx.x0WvEt.e+r3EH--
