Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56207424C43
	for <lists+linux-next@lfdr.de>; Thu,  7 Oct 2021 05:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232404AbhJGDs6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Oct 2021 23:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232389AbhJGDs6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Oct 2021 23:48:58 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70095C061746;
        Wed,  6 Oct 2021 20:47:05 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HPy1g1GRMz4xR9;
        Thu,  7 Oct 2021 14:47:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633578423;
        bh=42ih9NkINQFcNhSK+JpSpUpUaP9Q8m5arSAYH2VHwHM=;
        h=Date:From:To:Cc:Subject:From;
        b=rJstF5x/jqrzviBHKJKKv0nYPP/qchbVh2TQwhltIEt5LnTnasF75wfmOVTbhwGLv
         7WmjmqhqXu2khnVz3CrrEYevJExrW6xzXsyvSQTnkG2P47YfgC6Tvbeymutm/itsIT
         Kzv3rG9pCYUYQgmfXybBLhIOAIi/wULVvgTVg01ThYqSjXEB6ZpY1dOPqvTq9oa94D
         lIYOPhqJ9KzqTqeFnbW6ZfpXfX5Gh296B6+3/tr5Wzd2Ajvn5WyWuorCxAh2irrrE0
         NIPfTtLQFuYWtBsVe68JXZtz1UIoivWBNhAncbnSvnUNawKMg5LYL3Z7T7VCjcqW1M
         KYYKtPc2EgsIg==
Date:   Thu, 7 Oct 2021 14:47:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the userns tree
Message-ID: <20211007144701.67592574@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=zhTghZGMTEf07gSVInv.qI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=zhTghZGMTEf07gSVInv.qI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the userns tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/kernel.h:19,
                 from mm/debug.c:9:
mm/debug.c: In function 'dump_mm':
mm/debug.c:251:28: error: 'const struct mm_struct' has no member named 'cor=
e_state'
  251 |   mm->binfmt, mm->flags, mm->core_state,
      |                            ^~
include/linux/printk.h:418:19: note: in definition of macro 'printk_index_w=
rap'
  418 |   _p_func(_fmt, ##__VA_ARGS__);    \
      |                   ^~~~~~~~~~~
include/linux/printk.h:459:2: note: in expansion of macro 'printk'
  459 |  printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
      |  ^~~~~~
mm/debug.c:208:2: note: in expansion of macro 'pr_emerg'
  208 |  pr_emerg("mm %px mmap %px seqnum %llu task_size %lu\n"
      |  ^~~~~~~~

Caused by commit

  483f2bb374b7 ("coredump: Limit coredumps to a single thread group")

I have used the userns tree from next-20211006 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/=zhTghZGMTEf07gSVInv.qI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFebbUACgkQAVBC80lX
0GwTmwf9GAYKvo5JzaA2NSFm1F814w4iVz+PIgGfEMueL8AFoCxRV1/EMU+sLmRv
LT0r0GoI0Sts3Ob2e0sN+zHC+M2C4STAQVnr8qxfJKO40lT+ri5PfYuU4O33PXwU
39kjqJpR8OZ0cbptk0rI8yGB5AiqpxNPn4/O4nlzeUpksuZ2v9vPKGrl7ik8F3Ka
xPEgtmePFTNHesLhJDzpADWi/vqQNXaHmTva7eBoUWc6cKFgaWpoN1WE596cAHGJ
WeTxCjovvgDlSqy0yU9tEHe1JhlPHG3fSqlH3NtikYvhSEQvmqnMcbcDAjVZYaF6
SSRg4mFQnYHxarCGLM3tcdyjK1daoA==
=nzPg
-----END PGP SIGNATURE-----

--Sig_/=zhTghZGMTEf07gSVInv.qI--
