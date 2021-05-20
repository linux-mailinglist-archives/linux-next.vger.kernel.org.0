Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB1E738B962
	for <lists+linux-next@lfdr.de>; Fri, 21 May 2021 00:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231300AbhETWNZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 May 2021 18:13:25 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:49853 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230407AbhETWNZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 May 2021 18:13:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FmP9F64G3z9sRf;
        Fri, 21 May 2021 08:12:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1621548722;
        bh=TqnHHxzneSUM+Vtm7yQ0B6Jtgr79ZSgUUEtGGe9dkQo=;
        h=Date:From:To:Cc:Subject:From;
        b=G4pV//4E9IBiTFnQtY0DE8mnSR6orBK3Y9H0FlZhQMB/JgnjIdgkd/Pn6dw/67ZQ3
         j+UdXJXF8d//O6yAUali/hDURQhKIhov5VOHEAyJcqh4edGZhJW4RcIKVd71rw+Ccq
         r8z8xX3Zv3hg1qPyEjw/s4OAq5IVrqhr+AJzZMc6uywZ4APAhqYfsC9SE1zyWGFF9W
         8FzN5r13UQZLJ8VyNvW+GYk0es6dwGbyZE/XjrYd9HUqy7eUAcjQvJHeqAuH422FQa
         vwnmsHce8TpeKe94BnxZonst5nR+YIgcBRG7PyZHI+PXcId6IyYnnV7VrmyKMS9HYa
         1+3vDqna1KPFQ==
Date:   Fri, 21 May 2021 08:12:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the integrity tree
Message-ID: <20210521081200.48ab785b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Gk_aNiJotpqKDCOYYVCYThT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Gk_aNiJotpqKDCOYYVCYThT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  ae67dd38c193 ("evm: fix writing <securityfs>/evm overflow")

Fixes tag

  Fixes: f00d79750712 ("EVM: Allow userspace to signal an RSA key has been

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/Gk_aNiJotpqKDCOYYVCYThT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCm3rAACgkQAVBC80lX
0GxnTAgAmwsNglnSiGt9XHpXWmUcRlFmWBUaJlgYJ7CkbLrRiJQqIGtkYFAmlpL4
sSE0kLbLtCLNQ/o33BETmrJBnyf49e7x6nDLiwxf0aMv6il4oo1SGxVhQ4Z5LcQr
9hSgFwHVX82TEl40KjY/hvYN5MNxCagIyaZF0XaAgyX0J1+oqoXVJbeugnSk92At
Cm2UTu34CdGxj7llt0lmkrVNkaVe3JXE+MYlDHdwM3oDgIdIoWyjmZFlPDjGZNSX
T+g6UsBPuCNTfmrX1i6/kUyS++AYe8mzflsdinURgqMTWDMB0gpsUK858F5PItQc
YRXFRq5Flqa4eizHXaEgKTiSqIr/Qg==
=ZyFX
-----END PGP SIGNATURE-----

--Sig_/Gk_aNiJotpqKDCOYYVCYThT--
