Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4443742E4E1
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 01:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232078AbhJNXuu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Oct 2021 19:50:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbhJNXuu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Oct 2021 19:50:50 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 947CDC061570;
        Thu, 14 Oct 2021 16:48:44 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HVmLy4fLwz4xbG;
        Fri, 15 Oct 2021 10:48:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634255322;
        bh=hOOJzLdSb5SPACXow+S4SsAWlvs2V7xCXloVIMc1PJc=;
        h=Date:From:To:Cc:Subject:From;
        b=c/BHebmXQhrYh6CEsEHMTzZZyRrDM0l7fPN21t9PhHqm6/12pBMkNNaYEvtmOZqot
         Ucw6JzRpKGuANb4MeEG1sqNi2WvQQ1LLMMnOh4Xq69IGjuaJmWAtY0lwIk9ubV7eMm
         sZsTb6xBYOm7MU2tY5kfZZ2IvTJ5KIX3kOYuKtN63V125S1utqgn7zc3CqGPxoXcJW
         81QxXL5cK/UHgcmF1ibwzo4xzdGvPaSGVZEBscVwyYLut9ywl0Pe9TfaLIgsL6r/wc
         iPqxAm4/QwVrCafOoYX/fQVatnSplFuGmzAKQG+m4FFIVuH3zntrNKrMA4hLmI0BvI
         2kla5Sx5aM5rg==
Date:   Fri, 15 Oct 2021 10:48:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kspp-gustavo tree
Message-ID: <20211015104840.4e1ceb89@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+T+zq66izOpOt0XU=GJr7I1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+T+zq66izOpOt0XU=GJr7I1
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

  21078041965e ("Makefile: Enable -Wcast-function-type")

I have used the kspp-gustavo tree from next-20211013 for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/+T+zq66izOpOt0XU=GJr7I1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFowdgACgkQAVBC80lX
0Gygqgf/bb5iQwKjUy0O9o5t8QWk3881mUL9O4KiiLzHntDHBYx3bHNCOfNqmjTW
gWXg8ReeNXqvnUNF59BK5fcIVGY6Yi0iYbYMWK69H6yLOu15e2ZgYPv9x6PA+QTX
prftqdepVusA0qTFKFVUJN9O3ppLeN5aQG0PBiM4uaja23EjJLPkhj1jsBdKGoJh
0YCNpmI1VfHmKXKWftgTRBorb6Bn8z9TQ4Gqivb/KsovTBq2xVA1dLJZ2ni7uFub
CoVqeZ4rF6jrSP8XXAgl1/1fXJaxzSLiuzMdx67sdmYghHkxjT8zpylY4HYvkGun
FuctoBd2QTESj8ARUNVyjendZmsFJg==
=NmKO
-----END PGP SIGNATURE-----

--Sig_/+T+zq66izOpOt0XU=GJr7I1--
