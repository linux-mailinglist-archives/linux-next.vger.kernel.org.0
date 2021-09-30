Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 757AA41D062
	for <lists+linux-next@lfdr.de>; Thu, 30 Sep 2021 02:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346824AbhI3ADX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Sep 2021 20:03:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:34466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347859AbhI3ADW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Sep 2021 20:03:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B87E60184;
        Thu, 30 Sep 2021 00:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632960100;
        bh=dJu+qoSYytXCntZ9VoyDUnxKzy7n3SvCY1HOqOstcDA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mHyO+6z9jqRCC3lycddn6do3eaxVZSsH6Ilql0at70vpT5T8rodyw40+KtN07CM8U
         FhmhjNwUyeyQVoHJMRWPHi8PR7WVUOKaEwZo2HZ0rAwtaI4vVP+C4Pdyc1Cmcg3ark
         MK5Wi3jPDJIrT8YWmuygS9d1T/i1S0U1fEhCGhQr50MPtU1uLrrkUmlk8tB/CCfE/A
         6YUxWYadEMtNZBDuDAisnJS/N25uda6W9J9PuzPOI5cHLetKiKM0iryinhW86YnUjd
         3zuzlq6fduX68S9L16UEVvFpS/LxX5SLx7CYSnLHor0w3vV7XYHDXV0QOU39Op/Yed
         k/7iIyEiqLoDw==
Date:   Wed, 29 Sep 2021 19:05:45 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the kspp-gustavo tree
Message-ID: <20210930000545.GA358523@embeddedor>
References: <20210930095300.73be1555@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930095300.73be1555@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 30, 2021 at 09:53:00AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kspp-gustavo tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> kernel/trace/ftrace.c: In function 'ftrace_ops_get_list_func':
> kernel/trace/ftrace.c:128:31: warning: cast between incompatible function types from 'void (*)(long unsigned int,  long unsigned int)' to 'void (*)(long unsigned int,  long unsigned int,  struct ftrace_ops *, struct ftrace_regs *)' [-Wcast-function-type]
>   128 | #define ftrace_ops_list_func ((ftrace_func_t)ftrace_ops_no_ops)
>       |                               ^
> kernel/trace/ftrace.c:174:10: note: in expansion of macro 'ftrace_ops_list_func'
>   174 |   return ftrace_ops_list_func;
>       |          ^~~~~~~~~~~~~~~~~~~~
> kernel/trace/ftrace.c: In function 'update_ftrace_function':
> kernel/trace/ftrace.c:128:31: warning: cast between incompatible function types from 'void (*)(long unsigned int,  long unsigned int)' to 'void (*)(long unsigned int,  long unsigned int,  struct ftrace_ops *, struct ftrace_regs *)' [-Wcast-function-type]
>   128 | #define ftrace_ops_list_func ((ftrace_func_t)ftrace_ops_no_ops)
>       |                               ^
> kernel/trace/ftrace.c:207:10: note: in expansion of macro 'ftrace_ops_list_func'
>   207 |   func = ftrace_ops_list_func;
>       |          ^~~~~~~~~~~~~~~~~~~~
> kernel/trace/ftrace.c:128:31: warning: cast between incompatible function types from 'void (*)(long unsigned int,  long unsigned int)' to 'void (*)(long unsigned int,  long unsigned int,  struct ftrace_ops *, struct ftrace_regs *)' [-Wcast-function-type]
>   128 | #define ftrace_ops_list_func ((ftrace_func_t)ftrace_ops_no_ops)
>       |                               ^
> kernel/trace/ftrace.c:220:14: note: in expansion of macro 'ftrace_ops_list_func'
>   220 |  if (func == ftrace_ops_list_func) {
>       |              ^~~~~~~~~~~~~~~~~~~~
> kernel/trace/ftrace.c: In function 'ftrace_modify_all_code':
> kernel/trace/ftrace.c:128:31: warning: cast between incompatible function types from 'void (*)(long unsigned int,  long unsigned int)' to 'void (*)(long unsigned int,  long unsigned int,  struct ftrace_ops *, struct ftrace_regs *)' [-Wcast-function-type]
>   128 | #define ftrace_ops_list_func ((ftrace_func_t)ftrace_ops_no_ops)
>       |                               ^
> kernel/trace/ftrace.c:2698:35: note: in expansion of macro 'ftrace_ops_list_func'
>  2698 |   err = ftrace_update_ftrace_func(ftrace_ops_list_func);
>       |                                   ^~~~~~~~~~~~~~~~~~~~
> kernel/trace/ftrace.c:128:31: warning: cast between incompatible function types from 'void (*)(long unsigned int,  long unsigned int)' to 'void (*)(long unsigned int,  long unsigned int,  struct ftrace_ops *, struct ftrace_regs *)' [-Wcast-function-type]
>   128 | #define ftrace_ops_list_func ((ftrace_func_t)ftrace_ops_no_ops)
>       |                               ^
> kernel/trace/ftrace.c:2708:41: note: in expansion of macro 'ftrace_ops_list_func'
>  2708 |  if (update && ftrace_trace_function != ftrace_ops_list_func) {
>       |                                         ^~~~~~~~~~~~~~~~~~~~

The above are new to me, thanks for the report, Stephen. I'll address
them. 

> In file included from kernel/bpf/hashtab.c:8:
> kernel/bpf/hashtab.c: In function 'htab_map_gen_lookup':
> include/linux/filter.h:366:4: warning: cast between incompatible function types from 'void * (*)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
>   366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
>       |    ^
> include/linux/filter.h:374:14: note: in definition of macro 'BPF_EMIT_CALL'
>   374 |   .imm   = ((FUNC) - __bpf_call_base) })
>       |              ^~~~
> kernel/bpf/hashtab.c:671:26: note: in expansion of macro 'BPF_CAST_CALL'
>   671 |  *insn++ = BPF_EMIT_CALL(BPF_CAST_CALL(__htab_map_lookup_elem));
>       |                          ^~~~~~~~~~~~~
> kernel/bpf/hashtab.c: In function 'htab_lru_map_gen_lookup':
> include/linux/filter.h:366:4: warning: cast between incompatible function types from 'void * (*)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
>   366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
>       |    ^
> include/linux/filter.h:374:14: note: in definition of macro 'BPF_EMIT_CALL'
>   374 |   .imm   = ((FUNC) - __bpf_call_base) })
>       |              ^~~~
> kernel/bpf/hashtab.c:712:26: note: in expansion of macro 'BPF_CAST_CALL'
>   712 |  *insn++ = BPF_EMIT_CALL(BPF_CAST_CALL(__htab_map_lookup_elem));
>       |                          ^~~~~~~~~~~~~
> kernel/bpf/hashtab.c: In function 'htab_of_map_gen_lookup':
> include/linux/filter.h:366:4: warning: cast between incompatible function types from 'void * (*)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
>   366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
>       |    ^
> include/linux/filter.h:374:14: note: in definition of macro 'BPF_EMIT_CALL'
>   374 |   .imm   = ((FUNC) - __bpf_call_base) })
>       |              ^~~~
> kernel/bpf/hashtab.c:2400:26: note: in expansion of macro 'BPF_CAST_CALL'
>  2400 |  *insn++ = BPF_EMIT_CALL(BPF_CAST_CALL(__htab_map_lookup_elem));
>       |                          ^~~~~~~~~~~~~
> In file included from include/linux/bpf_verifier.h:9,
>                  from kernel/bpf/verifier.c:12:
> kernel/bpf/verifier.c: In function 'jit_subprogs':
> include/linux/filter.h:366:4: warning: cast between incompatible function types from 'unsigned int (*)(const void *, const struct bpf_insn *)' to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
>   366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
>       |    ^
> kernel/bpf/verifier.c:12472:16: note: in expansion of macro 'BPF_CAST_CALL'
> 12472 |    insn->imm = BPF_CAST_CALL(func[subprog]->bpf_func) -
>       |                ^~~~~~~~~~~~~
> kernel/bpf/verifier.c: In function 'do_misc_fixups':
> include/linux/filter.h:366:4: warning: cast between incompatible function types from 'void * (* const)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
>   366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
>       |    ^
> kernel/bpf/verifier.c:12953:17: note: in expansion of macro 'BPF_CAST_CALL'
> 12953 |     insn->imm = BPF_CAST_CALL(ops->map_lookup_elem) -
>       |                 ^~~~~~~~~~~~~
> include/linux/filter.h:366:4: warning: cast between incompatible function types from 'int (* const)(struct bpf_map *, void *, void *, u64)' {aka 'int (* const)(struct bpf_map *, void *, void *, long long unsigned int)'} to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
>   366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
>       |    ^
> kernel/bpf/verifier.c:12957:17: note: in expansion of macro 'BPF_CAST_CALL'
> 12957 |     insn->imm = BPF_CAST_CALL(ops->map_update_elem) -
>       |                 ^~~~~~~~~~~~~
> include/linux/filter.h:366:4: warning: cast between incompatible function types from 'int (* const)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
>   366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
>       |    ^
> kernel/bpf/verifier.c:12961:17: note: in expansion of macro 'BPF_CAST_CALL'
> 12961 |     insn->imm = BPF_CAST_CALL(ops->map_delete_elem) -
>       |                 ^~~~~~~~~~~~~
> include/linux/filter.h:366:4: warning: cast between incompatible function types from 'int (* const)(struct bpf_map *, void *, u64)' {aka 'int (* const)(struct bpf_map *, void *, long long unsigned int)'} to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
>   366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
>       |    ^
> kernel/bpf/verifier.c:12965:17: note: in expansion of macro 'BPF_CAST_CALL'
> 12965 |     insn->imm = BPF_CAST_CALL(ops->map_push_elem) -
>       |                 ^~~~~~~~~~~~~
> include/linux/filter.h:366:4: warning: cast between incompatible function types from 'int (* const)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
>   366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
>       |    ^
> kernel/bpf/verifier.c:12969:17: note: in expansion of macro 'BPF_CAST_CALL'
> 12969 |     insn->imm = BPF_CAST_CALL(ops->map_pop_elem) -
>       |                 ^~~~~~~~~~~~~
> include/linux/filter.h:366:4: warning: cast between incompatible function types from 'int (* const)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
>   366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
>       |    ^
> kernel/bpf/verifier.c:12973:17: note: in expansion of macro 'BPF_CAST_CALL'
> 12973 |     insn->imm = BPF_CAST_CALL(ops->map_peek_elem) -
>       |                 ^~~~~~~~~~~~~
> include/linux/filter.h:366:4: warning: cast between incompatible function types from 'int (* const)(struct bpf_map *, u32,  u64)' {aka 'int (* const)(struct bpf_map *, unsigned int,  long long unsigned int)'} to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
>   366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
>       |    ^
> kernel/bpf/verifier.c:12977:17: note: in expansion of macro 'BPF_CAST_CALL'
> 12977 |     insn->imm = BPF_CAST_CALL(ops->map_redirect) -
>       |                 ^~~~~~~~~~~~~

All these are already fixed in bpf-next:

https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=3d717fad5081b8e3bda76d86907fad95398cbde8
https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=102acbacfd9a96d101abd96d1a7a5bf92b7c3e8e

> 
> Introduced by commit
> 
>   ffea83dd8823 ("Makefile: Enable -Wcast-function-type")
> 
> Please either fix all these or revert that commit for now.

Yep; I'll remove the commit and go take a look at ftrace.

Thanks for the report!
--
Gustavo


