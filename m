Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDF8202E1C
	for <lists+linux-next@lfdr.de>; Mon, 22 Jun 2020 03:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgFVBhH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Jun 2020 21:37:07 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50343 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726640AbgFVBhH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 21 Jun 2020 21:37:07 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49qsTW4wTXz9sRf;
        Mon, 22 Jun 2020 11:37:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592789825;
        bh=kenJ1OYeTm0hcWQUZSFsY7snHBZaWYwKS2USb8OTUfk=;
        h=Date:From:To:Cc:Subject:From;
        b=fAhewj1+Lf2W2P25u1cmfvBnTOUfJse051jYQzU46lzW1wlbTjjQhwL029ddUTuUR
         ujhahNVUPubTIhVv2KqhO+AFaSVxjpl9+SNstEw7yl716asObm3PTHctc5EdUOJOF9
         bshFpQFJURuNXIo5vQ7g6RUK+62bQnv38VmPBh9fp5jH2ehbHMumWGXRKjOHF/4fD7
         hyam6U8Iv8lkgnyYoVxcc7YTtI5sy8hUa9baiNFE1TpNz79b3FHkieYhoSqy3Xt679
         Om2aghaEdPgDyOaYaKEGYKDfRtAhCyGlERVGQXTELFhmCQDN8xMJqJgBYlt90fw3Je
         +mBgO//fADItw==
Date:   Mon, 22 Jun 2020 11:37:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20200622113700.3dd74527@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3UZgz7dIQ4s6DP7_dxqLOpY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3UZgz7dIQ4s6DP7_dxqLOpY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: modpost: "sched_setscheduler" [kernel/trace/ring_buffer_benchmark.ko=
] undefined!

Caused by commit

  616d91b68cd5 ("sched: Remove sched_setscheduler*() EXPORTs")

Missed one :-)

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/3UZgz7dIQ4s6DP7_dxqLOpY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7wCzwACgkQAVBC80lX
0GwXhwf5AXeOHmj+mK/VEpY2cM+FR8/mWHbzCCTIz/iE1Ljh3tA5S3P1IEEiRKZt
d9NlLPXHb/P30Iaaa9t4eCY4RI/WLvsRbtnL28QfHAH2sv2Vle47DvfhXD7uZBMn
UMUkMYxYQlaJVtChYUVlv/PmhpAjGuSZHh3lP7APqKBMdLexda7TWOlUtzNNBFG1
ea7O3TqiBpwAI+Jn3yqmw2NJwbEhuf2crb1l2AS+RNeWnauk5SkcUkzzt50jwQLP
af+WIp9H+rsnbHsu/XE5dejxsN8KLsLIXXkZcCLjqNt3rvBbPwADgYVs4h39UOXP
JRGl4USBs/5sao95pbT4lVfwT+dmUQ==
=jTp9
-----END PGP SIGNATURE-----

--Sig_/3UZgz7dIQ4s6DP7_dxqLOpY--
