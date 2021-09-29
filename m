Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 939E441D033
	for <lists+linux-next@lfdr.de>; Thu, 30 Sep 2021 01:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233892AbhI2Xyo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Sep 2021 19:54:44 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:45701 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347189AbhI2Xyo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Sep 2021 19:54:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HKY8s0qLVz4xbL;
        Thu, 30 Sep 2021 09:53:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632959581;
        bh=PnJijGDdKuT9E1lBjViMVlj0jt+9hPzVlSeQjhASvG0=;
        h=Date:From:To:Cc:Subject:From;
        b=QknSj+Kh/43GsvHbnIkZWJsyw9XdHhXdHZCqBtsdbqvlE910XrNCfHlQ7Fksr8VYa
         FZtlzkah1g322Le1j8DuW6SiV2ew1frmJOX7OwmfqOoyYTlFaE8+3cOd9NoESy/zN9
         c9mHy/My3spopSfWucxzL/9SMpxEOQzT05rNbC+GQVYrddUiSIHs1hM6pYXPgNqQ3x
         iq8GQKDop0r7ermeg7NsMAjRQbdsOWa0ssjqogXTcGYMAsgOMXI5romYGCdFwinZjM
         J7gjrYg7m22widJKPZNq/aBNYIKxrVIrMI4TzxgKoVBmC9cjILhwwszo95T+rkc6tx
         L8jyE9d3VaScw==
Date:   Thu, 30 Sep 2021 09:53:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the kspp-gustavo tree
Message-ID: <20210930095300.73be1555@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+Q1Zs3egvfWq8.nlaVy2_Yw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+Q1Zs3egvfWq8.nlaVy2_Yw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kspp-gustavo tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

kernel/trace/ftrace.c: In function 'ftrace_ops_get_list_func':
kernel/trace/ftrace.c:128:31: warning: cast between incompatible function t=
ypes from 'void (*)(long unsigned int,  long unsigned int)' to 'void (*)(lo=
ng unsigned int,  long unsigned int,  struct ftrace_ops *, struct ftrace_re=
gs *)' [-Wcast-function-type]
  128 | #define ftrace_ops_list_func ((ftrace_func_t)ftrace_ops_no_ops)
      |                               ^
kernel/trace/ftrace.c:174:10: note: in expansion of macro 'ftrace_ops_list_=
func'
  174 |   return ftrace_ops_list_func;
      |          ^~~~~~~~~~~~~~~~~~~~
kernel/trace/ftrace.c: In function 'update_ftrace_function':
kernel/trace/ftrace.c:128:31: warning: cast between incompatible function t=
ypes from 'void (*)(long unsigned int,  long unsigned int)' to 'void (*)(lo=
ng unsigned int,  long unsigned int,  struct ftrace_ops *, struct ftrace_re=
gs *)' [-Wcast-function-type]
  128 | #define ftrace_ops_list_func ((ftrace_func_t)ftrace_ops_no_ops)
      |                               ^
kernel/trace/ftrace.c:207:10: note: in expansion of macro 'ftrace_ops_list_=
func'
  207 |   func =3D ftrace_ops_list_func;
      |          ^~~~~~~~~~~~~~~~~~~~
kernel/trace/ftrace.c:128:31: warning: cast between incompatible function t=
ypes from 'void (*)(long unsigned int,  long unsigned int)' to 'void (*)(lo=
ng unsigned int,  long unsigned int,  struct ftrace_ops *, struct ftrace_re=
gs *)' [-Wcast-function-type]
  128 | #define ftrace_ops_list_func ((ftrace_func_t)ftrace_ops_no_ops)
      |                               ^
kernel/trace/ftrace.c:220:14: note: in expansion of macro 'ftrace_ops_list_=
func'
  220 |  if (func =3D=3D ftrace_ops_list_func) {
      |              ^~~~~~~~~~~~~~~~~~~~
kernel/trace/ftrace.c: In function 'ftrace_modify_all_code':
kernel/trace/ftrace.c:128:31: warning: cast between incompatible function t=
ypes from 'void (*)(long unsigned int,  long unsigned int)' to 'void (*)(lo=
ng unsigned int,  long unsigned int,  struct ftrace_ops *, struct ftrace_re=
gs *)' [-Wcast-function-type]
  128 | #define ftrace_ops_list_func ((ftrace_func_t)ftrace_ops_no_ops)
      |                               ^
kernel/trace/ftrace.c:2698:35: note: in expansion of macro 'ftrace_ops_list=
_func'
 2698 |   err =3D ftrace_update_ftrace_func(ftrace_ops_list_func);
      |                                   ^~~~~~~~~~~~~~~~~~~~
kernel/trace/ftrace.c:128:31: warning: cast between incompatible function t=
ypes from 'void (*)(long unsigned int,  long unsigned int)' to 'void (*)(lo=
ng unsigned int,  long unsigned int,  struct ftrace_ops *, struct ftrace_re=
gs *)' [-Wcast-function-type]
  128 | #define ftrace_ops_list_func ((ftrace_func_t)ftrace_ops_no_ops)
      |                               ^
kernel/trace/ftrace.c:2708:41: note: in expansion of macro 'ftrace_ops_list=
_func'
 2708 |  if (update && ftrace_trace_function !=3D ftrace_ops_list_func) {
      |                                         ^~~~~~~~~~~~~~~~~~~~
In file included from kernel/bpf/hashtab.c:8:
kernel/bpf/hashtab.c: In function 'htab_map_gen_lookup':
include/linux/filter.h:366:4: warning: cast between incompatible function t=
ypes from 'void * (*)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u6=
4,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  l=
ong long unsigned int,  long long unsigned int,  long long unsigned int,  l=
ong long unsigned int)'} [-Wcast-function-type]
  366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
      |    ^
include/linux/filter.h:374:14: note: in definition of macro 'BPF_EMIT_CALL'
  374 |   .imm   =3D ((FUNC) - __bpf_call_base) })
      |              ^~~~
kernel/bpf/hashtab.c:671:26: note: in expansion of macro 'BPF_CAST_CALL'
  671 |  *insn++ =3D BPF_EMIT_CALL(BPF_CAST_CALL(__htab_map_lookup_elem));
      |                          ^~~~~~~~~~~~~
kernel/bpf/hashtab.c: In function 'htab_lru_map_gen_lookup':
include/linux/filter.h:366:4: warning: cast between incompatible function t=
ypes from 'void * (*)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u6=
4,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  l=
ong long unsigned int,  long long unsigned int,  long long unsigned int,  l=
ong long unsigned int)'} [-Wcast-function-type]
  366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
      |    ^
include/linux/filter.h:374:14: note: in definition of macro 'BPF_EMIT_CALL'
  374 |   .imm   =3D ((FUNC) - __bpf_call_base) })
      |              ^~~~
kernel/bpf/hashtab.c:712:26: note: in expansion of macro 'BPF_CAST_CALL'
  712 |  *insn++ =3D BPF_EMIT_CALL(BPF_CAST_CALL(__htab_map_lookup_elem));
      |                          ^~~~~~~~~~~~~
kernel/bpf/hashtab.c: In function 'htab_of_map_gen_lookup':
include/linux/filter.h:366:4: warning: cast between incompatible function t=
ypes from 'void * (*)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u6=
4,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  l=
ong long unsigned int,  long long unsigned int,  long long unsigned int,  l=
ong long unsigned int)'} [-Wcast-function-type]
  366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
      |    ^
include/linux/filter.h:374:14: note: in definition of macro 'BPF_EMIT_CALL'
  374 |   .imm   =3D ((FUNC) - __bpf_call_base) })
      |              ^~~~
kernel/bpf/hashtab.c:2400:26: note: in expansion of macro 'BPF_CAST_CALL'
 2400 |  *insn++ =3D BPF_EMIT_CALL(BPF_CAST_CALL(__htab_map_lookup_elem));
      |                          ^~~~~~~~~~~~~
In file included from include/linux/bpf_verifier.h:9,
                 from kernel/bpf/verifier.c:12:
kernel/bpf/verifier.c: In function 'jit_subprogs':
include/linux/filter.h:366:4: warning: cast between incompatible function t=
ypes from 'unsigned int (*)(const void *, const struct bpf_insn *)' to 'u64=
 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long lo=
ng unsigned int,  long long unsigned int,  long long unsigned int,  long lo=
ng unsigned int,  long long unsigned int)'} [-Wcast-function-type]
  366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
      |    ^
kernel/bpf/verifier.c:12472:16: note: in expansion of macro 'BPF_CAST_CALL'
12472 |    insn->imm =3D BPF_CAST_CALL(func[subprog]->bpf_func) -
      |                ^~~~~~~~~~~~~
kernel/bpf/verifier.c: In function 'do_misc_fixups':
include/linux/filter.h:366:4: warning: cast between incompatible function t=
ypes from 'void * (* const)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u6=
4,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned i=
nt,  long long unsigned int,  long long unsigned int,  long long unsigned i=
nt,  long long unsigned int)'} [-Wcast-function-type]
  366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
      |    ^
kernel/bpf/verifier.c:12953:17: note: in expansion of macro 'BPF_CAST_CALL'
12953 |     insn->imm =3D BPF_CAST_CALL(ops->map_lookup_elem) -
      |                 ^~~~~~~~~~~~~
include/linux/filter.h:366:4: warning: cast between incompatible function t=
ypes from 'int (* const)(struct bpf_map *, void *, void *, u64)' {aka 'int =
(* const)(struct bpf_map *, void *, void *, long long unsigned int)'} to 'u=
64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long =
long unsigned int,  long long unsigned int,  long long unsigned int,  long =
long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
  366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
      |    ^
kernel/bpf/verifier.c:12957:17: note: in expansion of macro 'BPF_CAST_CALL'
12957 |     insn->imm =3D BPF_CAST_CALL(ops->map_update_elem) -
      |                 ^~~~~~~~~~~~~
include/linux/filter.h:366:4: warning: cast between incompatible function t=
ypes from 'int (* const)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64, =
 u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,=
  long long unsigned int,  long long unsigned int,  long long unsigned int,=
  long long unsigned int)'} [-Wcast-function-type]
  366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
      |    ^
kernel/bpf/verifier.c:12961:17: note: in expansion of macro 'BPF_CAST_CALL'
12961 |     insn->imm =3D BPF_CAST_CALL(ops->map_delete_elem) -
      |                 ^~~~~~~~~~~~~
include/linux/filter.h:366:4: warning: cast between incompatible function t=
ypes from 'int (* const)(struct bpf_map *, void *, u64)' {aka 'int (* const=
)(struct bpf_map *, void *, long long unsigned int)'} to 'u64 (*)(u64,  u64=
,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned in=
t,  long long unsigned int,  long long unsigned int,  long long unsigned in=
t,  long long unsigned int)'} [-Wcast-function-type]
  366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
      |    ^
kernel/bpf/verifier.c:12965:17: note: in expansion of macro 'BPF_CAST_CALL'
12965 |     insn->imm =3D BPF_CAST_CALL(ops->map_push_elem) -
      |                 ^~~~~~~~~~~~~
include/linux/filter.h:366:4: warning: cast between incompatible function t=
ypes from 'int (* const)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64, =
 u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,=
  long long unsigned int,  long long unsigned int,  long long unsigned int,=
  long long unsigned int)'} [-Wcast-function-type]
  366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
      |    ^
kernel/bpf/verifier.c:12969:17: note: in expansion of macro 'BPF_CAST_CALL'
12969 |     insn->imm =3D BPF_CAST_CALL(ops->map_pop_elem) -
      |                 ^~~~~~~~~~~~~
include/linux/filter.h:366:4: warning: cast between incompatible function t=
ypes from 'int (* const)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64, =
 u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,=
  long long unsigned int,  long long unsigned int,  long long unsigned int,=
  long long unsigned int)'} [-Wcast-function-type]
  366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
      |    ^
kernel/bpf/verifier.c:12973:17: note: in expansion of macro 'BPF_CAST_CALL'
12973 |     insn->imm =3D BPF_CAST_CALL(ops->map_peek_elem) -
      |                 ^~~~~~~~~~~~~
include/linux/filter.h:366:4: warning: cast between incompatible function t=
ypes from 'int (* const)(struct bpf_map *, u32,  u64)' {aka 'int (* const)(=
struct bpf_map *, unsigned int,  long long unsigned int)'} to 'u64 (*)(u64,=
  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsign=
ed int,  long long unsigned int,  long long unsigned int,  long long unsign=
ed int,  long long unsigned int)'} [-Wcast-function-type]
  366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
      |    ^
kernel/bpf/verifier.c:12977:17: note: in expansion of macro 'BPF_CAST_CALL'
12977 |     insn->imm =3D BPF_CAST_CALL(ops->map_redirect) -
      |                 ^~~~~~~~~~~~~

Introduced by commit

  ffea83dd8823 ("Makefile: Enable -Wcast-function-type")

Please either fix all these or revert that commit for now.

--=20
Cheers,
Stephen Rothwell

--Sig_/+Q1Zs3egvfWq8.nlaVy2_Yw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFU/FwACgkQAVBC80lX
0GwAdwf/XsiWe8ECMf8QdhFhLGZ71VMoF/1LzGqIP3uaf9sUyfvDojmJtNdy/TJw
jfYMR8Ioe8WqLtMJy+a09KtmrbWdLg+1YK4d75Sq6iTs+YNxcTMDzhuYObqJA18R
mWaxe8xb2RdRRZDCJeGVXAF8L/kLv8hb3WS6sogbMZzQbGiRjdg7H0/ITh4JixZd
efbmykJ4cttIEa2/AYynqfcrKbXYDRrrqFyO/7Eb3AgNGxYdi7dkH+iBa8XG3CIl
c2ktfls2XGH7LNmOSCYqlD3oTCX0zM1k8ss9eZynlYdEy0bnrOVCZTjpuTJIeL4Q
NqPlqwVXft0yYKnJe33bwC0tv4Qapw==
=6m+J
-----END PGP SIGNATURE-----

--Sig_/+Q1Zs3egvfWq8.nlaVy2_Yw--
