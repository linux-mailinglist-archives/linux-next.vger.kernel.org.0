Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1B86379BB4
	for <lists+linux-next@lfdr.de>; Tue, 11 May 2021 02:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbhEKAwZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 May 2021 20:52:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbhEKAwY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 May 2021 20:52:24 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A5C4C061574;
        Mon, 10 May 2021 17:51:19 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FfK9b6WFfz9sWD;
        Tue, 11 May 2021 10:51:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620694276;
        bh=jOGKuDETNtGAVGs0iI+kjiRw3gsZUZU63hQA/yrKvN0=;
        h=Date:From:To:Cc:Subject:From;
        b=MNMmpGaWjxiagJnRX+5AvR8TBk4H3mBjofXOdeuS0hvKcUvJJATImzoo8Cq7zIzVK
         pM++jIJd9OGvo7ZbqDHFttjcAajPbisG4vojGUTmARzWLPx8rSEGbZaSseqHznOgKD
         EWl+yJspssGAb2S8bt35Jhs/wIOoMTt+hS5+KWdfdEkPxwO/L4aZOmDbmsgUZD2EEG
         MkLKMpqaJOoZgZr8q17h/FNGLdmUJmpazutKRtrxcvvk4lpgv8LoRcJMo6t59dtC06
         qtydz+QMQQxFfkmXQohW9hL8pwn/E6wKHscM1G+jUtYqjLI6CseX8r6bmxIld11fT9
         tNjhbGh9pwPjg==
Date:   Tue, 11 May 2021 10:51:14 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Tejun Heo <tj@kernel.org>
Cc:     Roman Gushchin <guro@fb.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the cgroup tree
Message-ID: <20210511105114.55e90534@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/62nkJIloVlHuEbj6hgITbXT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/62nkJIloVlHuEbj6hgITbXT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cgroup tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from include/linux/string.h:6,
In file included from include/linux/string.h:6,
                 from arch/powerpc/include/asm/paca.h:15,
                 from arch/powerpc/include/asm/current.h:13,
                 from include/linux/sched.h:12,
                 from include/linux/cgroup.h:12,
                 from kernel/cgroup/cgroup-internal.h:5,
                 from kernel/cgroup/cgroup.c:31:
kernel/cgroup/cgroup.c: In function 'cgroup_exit':
kernel/cgroup/cgroup.c:6270:17: error: 'task' undeclared (first use in this=
 function); did you mean 'tsk'?
 6270 |  if (unlikely(!(task->flags & PF_KTHREAD) &&
      |                 ^~~~
include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
   78 | # define unlikely(x) __builtin_expect(!!(x), 0)
      |                                          ^
kernel/cgroup/cgroup.c:6270:17: note: each undeclared identifier is reporte=
d only once for each function it appears in
 6270 |  if (unlikely(!(task->flags & PF_KTHREAD) &&
      |                 ^~~~
include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
   78 | # define unlikely(x) __builtin_expect(!!(x), 0)
      |                                          ^

Caused by commit

  c740aad01e41 ("cgroup: inline cgroup_task_freeze()")

I have used the cgroup tree from next-20210510 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/62nkJIloVlHuEbj6hgITbXT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCZ1QIACgkQAVBC80lX
0GzbhAgAlOksoCsNs+sNiq5/9jLwp3iPepoCT1u0HD4NprS9cKnPORs3yL5Vk8ST
GejCJnBj3dtMAYJ3R6A7XKqysEk54XNxGDXxd9cWs+SnlNNulu5PSp4V990ooj5l
8vvEhJufbUCbe+7LULzAgcg1mZvrIUMQw1FjaZquMlriqZUMtWqe76ZrSEI3yZJ7
tPqT5CoHD9EEu1lSKDwK8glhFWnco5xRB+y/x9lsRNPKhthcsMDYBkABXJ9+pEqx
ApFDm7uLsePT/AA5WJ3rJl/wwRCyDdH7UBaN9zjjvAmTsLffk0rHtgVoIscJD7yE
RSjTZMTb8nh/kk1wB8HkzMydNeIh0g==
=OYpH
-----END PGP SIGNATURE-----

--Sig_/62nkJIloVlHuEbj6hgITbXT--
