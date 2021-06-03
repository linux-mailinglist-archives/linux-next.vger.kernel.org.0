Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD0D3998CE
	for <lists+linux-next@lfdr.de>; Thu,  3 Jun 2021 06:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbhFCEGD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Jun 2021 00:06:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhFCEGC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Jun 2021 00:06:02 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A9DC06174A;
        Wed,  2 Jun 2021 21:04:18 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FwXMc74jRz9sVb;
        Thu,  3 Jun 2021 14:04:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622693055;
        bh=+MJqkEyNsaOg3W3/cuxwms0AdYl/ByhzysLZs6pCUg4=;
        h=Date:From:To:Cc:Subject:From;
        b=k44hPEXjUtzhoMaxlBa6epFcCVHRuJdBKnb5yk60BraY+UTYOcdYfgIJHMfR4+75a
         kewiJkv8IUXhR7VFQ2kfFXFmLMpNaouGV3CHuPQ9qqAcrM3IvF+Dqjs0Y78hK6Qv0u
         waQmzQjA3MTuOR3GTy48+adxx5dAooabzmUFkxS1i97NfE08T7bpUtwS9xsTDYYTrt
         UFDfE5kfGSb4hc0IvB03A//ykJjMoAStfZrE6nYKueVUA06Y6UEHyQNJuN3BqVlpDn
         WSq/j6XCQCWRUJd3hjOiy4PXHsc0HFT+DYdG+mmZkQ9jWk9cWOB4iLF/XLqIsRWjQJ
         oYbS7IOWFkK0Q==
Date:   Thu, 3 Jun 2021 14:04:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: linux-next: manual merge of the tip tree with the jc_docs tree
Message-ID: <20210603140411.79f67380@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/34bdRs_Z80iXccn9Si3Z=ZY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/34bdRs_Z80iXccn9Si3Z=ZY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  samples/kprobes/kprobe_example.c

between commits:

  61fa308f23b5 ("samples/kprobes: Fix typo in handler_fault()")
  db1ea668843e ("samples/kprobes: Fix typo in handler_post()")

from the jc_docs tree and commit:

  ec6aba3d2be1 ("kprobes: Remove kprobe::fault_handler")

from the tip tree.

I fixed it up (the latter removed some code updated by the former) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/34bdRs_Z80iXccn9Si3Z=ZY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC4VLsACgkQAVBC80lX
0GyQIAf/Yvp6r32npa0Fgtr+2xIJu8peZIdhm0UOKJwXb0QbCtVqO1JAMG0uPmgF
c032MbXkGwYyR3Fsav0zudoNZH0s/HwLcN17nE+rCmL42e4wZgzmcQ0jL4OyOuT+
9nzf+M/2NqGMq5NG0eElXDjDIWxQJ3t3Lcs7hNqfwvchP9YTNFxHrPBT0eB29+3x
E3kS+5gBgZ1NbtAUf4/hmOgaNnjJYQmVqlFkiDgebqUjiw/+Byf2oukYjApazmQ2
y4qJi4euFwFuy9rKHW6Nf/PoO3oIRriMsSDbkJfLfCIM+Ey94MAoaVj93PLQOvke
GYyjF6arNWSB5PvQPEKchnnRuFwJAw==
=lw9J
-----END PGP SIGNATURE-----

--Sig_/34bdRs_Z80iXccn9Si3Z=ZY--
