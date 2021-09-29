Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1714C41D046
	for <lists+linux-next@lfdr.de>; Thu, 30 Sep 2021 01:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347800AbhI3ABW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Sep 2021 20:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347770AbhI3ABS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Sep 2021 20:01:18 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8424AC061768;
        Wed, 29 Sep 2021 16:59:36 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HKYJP45yLz4xb9;
        Thu, 30 Sep 2021 09:59:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632959973;
        bh=jsFx6YH3IGu50U9EgE8qnJd35cPlsHqb91eIHTdXCB4=;
        h=Date:From:To:Cc:Subject:From;
        b=Ok+gVgjVp1iGOeYnuVHmDZsXXH27RnyyvMybraqCy9n6OzkIqE4nXziPPdE4zMEmj
         PzFh/V0keBxB9ruOminS05ABaQNam0jMwE1Yd4Rey3vqEuH3kPKWeslyosA8vc+Hgw
         JKs/0gK0A0FOj+uT9ltbvci8ibkfIlqCTp3OUTKeKKK9Lvw+JB+v8pCGT2boYrp/V5
         2rm6snREDp2xmcjZaklRCAZ9Ih42p9FQIl6upEzZ5OTu+IyO6QO4EgQFNhi9btGc3d
         SZ7BfqGE8Es37Wf3jcAHIXzOWC7h7c24AD5r5gKyQvBFFaxje9g6ccKYsRMCx4rbZI
         w+e293STU4kIg==
Date:   Thu, 30 Sep 2021 09:59:32 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kspp-gustavo tree
Message-ID: <20210930095932.03434a3b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.54.dBQ.Asmd0irPU4hd+xG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.54.dBQ.Asmd0irPU4hd+xG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kspp-gustavo tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/bpf_verifier.h:9,
                 from kernel/bpf/verifier.c:12:
kernel/bpf/verifier.c: In function 'jit_subprogs':
include/linux/filter.h:366:4: error: cast between incompatible function typ=
es from 'unsigned int (*)(const void *, const struct bpf_insn *)' to 'u64 (=
*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long=
 unsigned int,  long long unsigned int,  long long unsigned int,  long long=
 unsigned int,  long long unsigned int)'} [-Werror=3Dcast-function-type]
  366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
      |    ^
kernel/bpf/verifier.c:12472:16: note: in expansion of macro 'BPF_CAST_CALL'
12472 |    insn->imm =3D BPF_CAST_CALL(func[subprog]->bpf_func) -
      |                ^~~~~~~~~~~~~
kernel/bpf/verifier.c: In function 'do_misc_fixups':
include/linux/filter.h:366:4: error: cast between incompatible function typ=
es from 'void * (* const)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,=
  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int=
,  long long unsigned int,  long long unsigned int,  long long unsigned int=
,  long long unsigned int)'} [-Werror=3Dcast-function-type]
  366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
      |    ^
kernel/bpf/verifier.c:12953:17: note: in expansion of macro 'BPF_CAST_CALL'
12953 |     insn->imm =3D BPF_CAST_CALL(ops->map_lookup_elem) -
      |                 ^~~~~~~~~~~~~
include/linux/filter.h:366:4: error: cast between incompatible function typ=
es from 'int (* const)(struct bpf_map *, void *, void *, u64)' {aka 'int (*=
 const)(struct bpf_map *, void *, void *, long long unsigned int)'} to 'u64=
 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long lo=
ng unsigned int,  long long unsigned int,  long long unsigned int,  long lo=
ng unsigned int,  long long unsigned int)'} [-Werror=3Dcast-function-type]
  366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
      |    ^
kernel/bpf/verifier.c:12957:17: note: in expansion of macro 'BPF_CAST_CALL'
12957 |     insn->imm =3D BPF_CAST_CALL(ops->map_update_elem) -
      |                 ^~~~~~~~~~~~~
include/linux/filter.h:366:4: error: cast between incompatible function typ=
es from 'int (* const)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u=
64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  =
long long unsigned int,  long long unsigned int,  long long unsigned int,  =
long long unsigned int)'} [-Werror=3Dcast-function-type]
  366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
      |    ^
kernel/bpf/verifier.c:12961:17: note: in expansion of macro 'BPF_CAST_CALL'
12961 |     insn->imm =3D BPF_CAST_CALL(ops->map_delete_elem) -
      |                 ^~~~~~~~~~~~~
include/linux/filter.h:366:4: error: cast between incompatible function typ=
es from 'int (* const)(struct bpf_map *, void *, u64)' {aka 'int (* const)(=
struct bpf_map *, void *, long long unsigned int)'} to 'u64 (*)(u64,  u64, =
 u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,=
  long long unsigned int,  long long unsigned int,  long long unsigned int,=
  long long unsigned int)'} [-Werror=3Dcast-function-type]
  366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
      |    ^
kernel/bpf/verifier.c:12965:17: note: in expansion of macro 'BPF_CAST_CALL'
12965 |     insn->imm =3D BPF_CAST_CALL(ops->map_push_elem) -
      |                 ^~~~~~~~~~~~~
include/linux/filter.h:366:4: error: cast between incompatible function typ=
es from 'int (* const)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u=
64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  =
long long unsigned int,  long long unsigned int,  long long unsigned int,  =
long long unsigned int)'} [-Werror=3Dcast-function-type]
  366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
      |    ^
kernel/bpf/verifier.c:12969:17: note: in expansion of macro 'BPF_CAST_CALL'
12969 |     insn->imm =3D BPF_CAST_CALL(ops->map_pop_elem) -
      |                 ^~~~~~~~~~~~~
include/linux/filter.h:366:4: error: cast between incompatible function typ=
es from 'int (* const)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u=
64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  =
long long unsigned int,  long long unsigned int,  long long unsigned int,  =
long long unsigned int)'} [-Werror=3Dcast-function-type]
  366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
      |    ^
kernel/bpf/verifier.c:12973:17: note: in expansion of macro 'BPF_CAST_CALL'
12973 |     insn->imm =3D BPF_CAST_CALL(ops->map_peek_elem) -
      |                 ^~~~~~~~~~~~~
include/linux/filter.h:366:4: error: cast between incompatible function typ=
es from 'int (* const)(struct bpf_map *, u32,  u64)' {aka 'int (* const)(st=
ruct bpf_map *, unsigned int,  long long unsigned int)'} to 'u64 (*)(u64,  =
u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned=
 int,  long long unsigned int,  long long unsigned int,  long long unsigned=
 int,  long long unsigned int)'} [-Werror=3Dcast-function-type]
  366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
      |    ^
kernel/bpf/verifier.c:12977:17: note: in expansion of macro 'BPF_CAST_CALL'
12977 |     insn->imm =3D BPF_CAST_CALL(ops->map_redirect) -
      |                 ^~~~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  ffea83dd8823 ("Makefile: Enable -Wcast-function-type")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/.54.dBQ.Asmd0irPU4hd+xG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFU/eQACgkQAVBC80lX
0Gy3YQf+NDzXt+H6uOJIaXzrWBpuWYRfktCKThz5EAcU8bjfieTCkp5Zy+Nk76Gf
GEjusjGJox9XJ/PzrCRpk5psJHSxzIwIIZf3oa2BEDDG/0mQB4DogZxr4+Aqw1KM
tfjtkRa8kyTY2q+iRVAEI0IzQX/A7uSS2J1StCqkB1Wo+ZsXYqB1gooJoF1Nlv70
lC3ZLsJ7lMRO4DCvVErlVOiFSSz+gK7Nkt01SsyzXmAXXb8O2GvIlFyW4Ot1AeNM
Rl/Yke24kCdzJkHlwhg37/TZR8sA8PUHS817Tl7Br7icPKInmzcCUO7dQKaC1I+1
a7ZaxvX7kw54GgJb1E5zdXYvYSPSdA==
=SuWo
-----END PGP SIGNATURE-----

--Sig_/.54.dBQ.Asmd0irPU4hd+xG--
