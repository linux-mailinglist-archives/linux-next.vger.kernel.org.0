Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20B7A43DE76
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 12:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbhJ1KNY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 06:13:24 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:52967 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhJ1KNX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 06:13:23 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hg1Xv08SQz4xYy;
        Thu, 28 Oct 2021 21:10:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635415855;
        bh=KZq+uHgjcPovo34UfHLnGheGhNYCsfawH2RecSYwsro=;
        h=Date:From:To:Cc:Subject:From;
        b=WUP1cvMiiem6s9Df0Nsu5svXqyNn6U77aKDbVGV1BrrJmar8yJMuouydmMqPSt5im
         hD5krYJifLYo6DU556ZEBNHEmDxO5bjEC8PoJdVBHiMBNyxtQFOGcTBlDxD1t2Gr8f
         bntwMoK4m+qtBM7vn3Qk8IIpI5SnDuFPyMliKL/qN8tLYlIJ2S9tgs3VBcOoujZdUv
         ZjgBpZn/YcZ7+RDD01uVhivWqOJM9qqys+53YWyAoVInPyn2RQRhXVHwLV6CCYzUm0
         dlY38WjhsDpQ8nQff7FgsG+Xio8x8xTISj9Rm2hYecj2ymuz9p37OGuTcae01gtOjW
         kzS2IeDvD1zyw==
Date:   Thu, 28 Oct 2021 21:10:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jan Kara <jack@suse.cz>
Cc:     Gabriel Krisman Bertazi <krisman@collabora.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the ext3 tree
Message-ID: <20211028211053.0c504d48@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8P+vNdjY=w8Ds+iscvZNoof";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8P+vNdjY=w8Ds+iscvZNoof
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ext3 tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

samples/fanotify/fs-monitor.c: In function 'handle_notifications':
samples/fanotify/fs-monitor.c:68:36: warning: format '%llx' expects argumen=
t of type 'long long unsigned int', but argument 2 has type '__u64' {aka 'l=
ong unsigned int'} [-Wformat=3D]
   68 |    printf("unexpected FAN MARK: %llx\n", event->mask);
      |                                 ~~~^     ~~~~~~~~~~~
      |                                    |          |
      |                                    |          __u64 {aka long unsig=
ned int}
      |                                    long long unsigned int
      |                                 %lx

Introduced by commit

  5451093081db ("samples: Add fs error monitoring example")

--=20
Cheers,
Stephen Rothwell

--Sig_/8P+vNdjY=w8Ds+iscvZNoof
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF6dy0ACgkQAVBC80lX
0GwLgwgAmvQqRPc1GKPOCb+rkkM7PK+oMVUrsq15CBJbn+Xmd0sSC9VC868MBIFg
RJzHYwUoBi0Ax/T/xSBQSgj/xhPyIjCgcUq9/klGzRbo5mGlcJBJe00Zu2Of2NCk
m6pL7Ri6FSkST6p7a1eOtRAMlzSxe9n4BWfyamJ2TPQPnDnMvx4e7Kf/cRIiPsJh
XUqWKgGpwZzc5wvFjcsHdshIrzX+4X98K82rCD/RRXPNbWxNMcd1jU1f0RT+SlIo
cERyKfnSanlbaOnoxJEpiwlAp2KieHzhnobkD1QYYLzxiyycMjXBgjdcqb4wZWyw
dMn6O30swDUmPedRIT9+kgzhz0CoiQ==
=Gi33
-----END PGP SIGNATURE-----

--Sig_/8P+vNdjY=w8Ds+iscvZNoof--
