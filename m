Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05CC7381223
	for <lists+linux-next@lfdr.de>; Fri, 14 May 2021 22:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbhENUz7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 May 2021 16:55:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:42888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229504AbhENUz6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 14 May 2021 16:55:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5AFAA611AD;
        Fri, 14 May 2021 20:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621025686;
        bh=S/k4q+muGjsTXY2BL/AcrWALw6U6hOf6msA2dmXNTWU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=I4+EqQcSBB0HHqZwSs85e3h4ZUuByBzMz4gCZlKlaCdlVlLqJ+jnnTie8B1ODBbG1
         eISWLvFbGC+kLbpZPyElE25WTx89mBNYgwKGoMUCqScJ4TE5+nJgOs/J/LLPGRynYU
         e7ei0LbjUiz2iCVtqP3kwaTlktqIK1WLK7CtiGJV8khK3zlh56Ufz6KK1qt21QhHDk
         B5wprGxBDQK0WvXJD0xH7spVMELZBp40gWjUv/uierj4IAjEP9yHmMMeMLaQ4ynXpi
         Y2733U8CCfeaCskv8gZeZvPN4VUb0YgcIJXqr4AI4eg7Z8ky3XNDao///U6GMcojwe
         YtwFvCXCltm+g==
Subject: Re: [next] x86_64 defconfig failed with clang-10
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        lkft-triage@lists.linaro.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Andrew Morton <akpm@linux-foundation.org>
References: <CA+G9fYvYxqVhUTkertjZjcrUq8LWPnO7qC==Wum3gYCwWF9D6Q@mail.gmail.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <e6ee5c21-a460-b4f7-9d0a-e2711ec16185@kernel.org>
Date:   Fri, 14 May 2021 13:54:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CA+G9fYvYxqVhUTkertjZjcrUq8LWPnO7qC==Wum3gYCwWF9D6Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/14/2021 11:12 AM, Naresh Kamboju wrote:
> My two cents,
> We know clang-10 support is stopped, but our build system is still running

For the record, we are still building with clang-10 as that is the 
minimum supported version for the kernel.

> these builds with clang-10. one of those observations is,
> 
> The LKFT build failures were noticed while building x86_64 and i386 with
> clang-10 on linux next-20210514 tag.
> 
>    - x86_64 (defconfig) with clang-10 - FAIL
>    - i386 (defconfig) with clang-10 - FAIL
>    - x86_64 (defconfig) with clang-11 - PASS
>    - i386 (defconfig) with clang-11 - PASS
>    - x86_64 (defconfig) with clang-12 - PASS
>    - i386 (defconfig) with clang-12 - PASS
> 
> Build log:
> ----------
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/current ARCH=x86_64
> CROSS_COMPILE=x86_64-linux-gnu- 'HOSTCC=sccache clang' 'CC=sccache
> clang'
> 
> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool:
> eb_relocate_parse_slow()+0x427: stack state mismatch: cfa1=4+120
> cfa2=-1+0
> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool:
> eb_copy_relocations()+0x1d5: stack state mismatch: cfa1=4+104
> cfa2=-1+0
> x86_64-linux-gnu-ld: arch/x86/kernel/kprobes/opt.o: in function
> `arch_prepare_optimized_kprobe':
> opt.c:(.text+0x798): undefined reference to `__compiletime_assert_251'
> make[1]: *** [/builds/linux/Makefile:1272: vmlinux] Error 1

Thanks for the report. Our CI also reported this:

https://github.com/ClangBuiltLinux/continuous-integration2/runs/2582534773?check_suite_focus=true

My bisect landed on "mm, slub: change run-time assertion in 
kmalloc_index() to compile-time" in -next (I have added the author and 
reviewers to cc):

$ git bisect log
# bad: [cd557f1c605fc5a2c0eb0b540610f50dc67dd849] Add linux-next 
specific files for 20210514
# good: [315d99318179b9cd5077ccc9f7f26a164c9fa998] Merge tag 
'pm-5.13-rc2' of 
git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
git bisect start 'cd557f1c605fc5a2c0eb0b540610f50dc67dd849' 
'315d99318179b9cd5077ccc9f7f26a164c9fa998'
# good: [9634d7cb3c506ae886a5136d12b4af696b9cee8a] Merge remote-tracking 
branch 'drm-misc/for-linux-next'
git bisect good 9634d7cb3c506ae886a5136d12b4af696b9cee8a
# good: [294636a24ae819a7caf0807d05d8eb5b964ec06f] Merge remote-tracking 
branch 'rcu/rcu/next'
git bisect good 294636a24ae819a7caf0807d05d8eb5b964ec06f
# good: [cb753d0611f912439c8e814f4254d15fa8fa1d75] Merge remote-tracking 
branch 'gpio-brgl/gpio/for-next'
git bisect good cb753d0611f912439c8e814f4254d15fa8fa1d75
# bad: [b1e7389449084b74a044a70860c6a1c7466781cb] lib/string_helpers: 
switch to use BIT() macro
git bisect bad b1e7389449084b74a044a70860c6a1c7466781cb
# bad: [bf5570ed0654a21000e5dad9243ea1ba30bfe208] kasan: use 
dump_stack_lvl(KERN_ERR) to print stacks
git bisect bad bf5570ed0654a21000e5dad9243ea1ba30bfe208
# bad: [4a292ff7a819404039588c7a9af272aca22c869e] fixup! mm: gup: pack 
has_pinned in MMF_HAS_PINNED
git bisect bad 4a292ff7a819404039588c7a9af272aca22c869e
# good: [93e440dd0e482b6cde20630d58016a451fb2b431] ocfs2: fix snprintf() 
checking
git bisect good 93e440dd0e482b6cde20630d58016a451fb2b431
# good: [f32aeffdb407b6390ef17ccac87e1a1a76663354] slub: remove 
resiliency_test() function
git bisect good f32aeffdb407b6390ef17ccac87e1a1a76663354
# bad: [2c9b936dae88dbdbb28666a741c87b08abb1b755] mm/page-writeback: 
update the comment of Dirty position control
git bisect bad 2c9b936dae88dbdbb28666a741c87b08abb1b755
# bad: [597da4750c8e8f5f304419f3c66b713a88f3ebbe] 
tools/vm/page_owner_sort.c: check malloc() return
git bisect bad 597da4750c8e8f5f304419f3c66b713a88f3ebbe
# bad: [0ec3603432be3abba93ee7aa512cb6d83dd1c291] kfence: test: fix for 
"mm, slub: change run-time assertion in kmalloc_index() to compile-time"
git bisect bad 0ec3603432be3abba93ee7aa512cb6d83dd1c291
# bad: [ff3daafe3fd3e54c8cf6aeb865099c7bb02e5c51] mm, slub: change 
run-time assertion in kmalloc_index() to compile-time
git bisect bad ff3daafe3fd3e54c8cf6aeb865099c7bb02e5c51
# first bad commit: [ff3daafe3fd3e54c8cf6aeb865099c7bb02e5c51] mm, slub: 
change run-time assertion in kmalloc_index() to compile-time

https://git.kernel.org/next/linux-next/c/ff3daafe3fd3e54c8cf6aeb865099c7bb02e5c51

It looks like LLVM fixed this in 
http://github.com/llvm/llvm-project/commit/6aabb109becfee37126ff7db3d41a41b5779f359.

I think this happens because arch_prepare_optimized_kprobe() calls 
kzalloc() with a size of MAX_OPTINSN_SIZE, which is

#define MAX_OPTINSN_SIZE 				\
	(((unsigned long)optprobe_template_end -	\
	  (unsigned long)optprobe_template_entry) +	\
	 MAX_OPTIMIZED_LENGTH + JMP32_INSN_SIZE)

and the optprobe_template_{end,entry} are not evaluated as constants.

I am not sure what the solution is. There seem to be a growing list of 
issues with LLVM 10 that were fixed in LLVM 11, which might necessitate 
requiring LLVM 11 and newer to build the kernel, given this affects a 
defconfig.

Cheers,
Nathan
