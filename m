Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A468F40EF05
	for <lists+linux-next@lfdr.de>; Fri, 17 Sep 2021 03:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbhIQCAa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Sep 2021 22:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242552AbhIQCA3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Sep 2021 22:00:29 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B643C061764;
        Thu, 16 Sep 2021 18:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1631843945;
        bh=CE+5U53jWk/6k2//JOnl62EdAYqBM35mzhywjkHbaPs=;
        h=Date:From:To:Cc:Subject:From;
        b=a3MggPQnhfY9FzM+BIffXzgpSmRlxNn/RVnj0OOW8/JwfEJ9rQ+yPAJt/m/rbnKQH
         fa5pcg3kwsw5D4R6cs1h9cEUlBFwYj+XKp7A3/cIAVOm4bUsJejl5Yc0ZRTDsDT5oo
         frslAiDQPL8fgFBOJVctDcLi7t7Od3PAyz6Io5Rqxv8JBS7azolKcp5KuJFZHSOx7Z
         xJApd7Q7Qqz+rTJuvTagK8E0hjqV/iKy4+C4h3R2nWn/fDEl9uSCShjjONswWv6Uiy
         pxpC10b2gzO75YUuBryp1YcwUakhZXyn+HBkaurmqmOOcQaR+ur8ZhjSmQK/YQS1As
         u3QgHqQ6xCPUQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H9cZG573Rz9sVw;
        Fri, 17 Sep 2021 11:59:02 +1000 (AEST)
Date:   Fri, 17 Sep 2021 11:58:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20210917115859.6cfc64a5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+3ufTwsYiHDb_h=MRIgbfSi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+3ufTwsYiHDb_h=MRIgbfSi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

vmlinux.o: warning: objtool: mce_setup()+0x22: call to memset() leaves .noi=
nstr.text section
vmlinux.o: warning: objtool: do_machine_check()+0x51: call to mce_gather_in=
fo() leaves .noinstr.text section
vmlinux.o: warning: objtool: rcu_dynticks_eqs_enter()+0x0: call to rcu_dynt=
icks_task_trace_enter() leaves .noinstr.text section
vmlinux.o: warning: objtool: rcu_dynticks_eqs_exit()+0xe: call to rcu_dynti=
cks_task_trace_exit() leaves .noinstr.text section
vmlinux.o: warning: objtool: rcu_nmi_enter()+0x36: call to __kasan_check_re=
ad() leaves .noinstr.text section

I don't know what produced these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/+3ufTwsYiHDb_h=MRIgbfSi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFD9mMACgkQAVBC80lX
0Gy9bgf/YOfufQj2LDZ9MlbRNY7P0hvhP3nypcSeelTZQ9iUkDFCQI+OrfLJ8AZY
qM9OfgsMF3nCs2asrMA7DzRoXYF9gPqhxqTftnlL/ScBXn3M9dwy6qkSuawekklW
trl/W6jVr9qmiJb2E3ILvd8VxpmjOPSiWvKc8vqDUqdPDS4w2CNWStr2VAHMLLyj
eDNj8XPC+2P0MlS+G0ZMC1NMoUZ8nsxRKJS9iGx2iKXqztahJB0NNgGitEgvRzXP
eygtV8kPcy0cJZyU+e2Rr1QwF5qS5ABoZHi43uU7ITOP86okie4UFm0Et9UYpIqa
w85CCDRbWnuYIEN1JNT6GRq7Ly9Drw==
=cgj4
-----END PGP SIGNATURE-----

--Sig_/+3ufTwsYiHDb_h=MRIgbfSi--
