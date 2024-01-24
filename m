Return-Path: <linux-next+bounces-817-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5696E83A2F4
	for <lists+linux-next@lfdr.de>; Wed, 24 Jan 2024 08:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BABD71F24DB0
	for <lists+linux-next@lfdr.de>; Wed, 24 Jan 2024 07:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0AB168A8;
	Wed, 24 Jan 2024 07:31:26 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEAD168BA
	for <linux-next@vger.kernel.org>; Wed, 24 Jan 2024 07:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706081486; cv=none; b=Ww7ay85T5O4+DlIXF8HR3HFKb2ZAZZgUvdxWoyfxRDVlx+XjUaSYLn6DZC4BeWExMWNGboUWnX/wQwSQsq3ZbHuuswoy8H/n4brQtgIUYHImq7ZaT+BOp0UaPW3/DvYGUZ3zM1PD9hmsQec2wOvR6DNvoHBvFV0fYQe20gKDd8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706081486; c=relaxed/simple;
	bh=AcWni+NFrksIe5zjVTjCtHoikNin3b/G+HHbKeW67HA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sH7yxK8ykiOeBxI1Vuda38MWTsVCPX6a/jWtk4c8aMHzPm02aTilfXHR5veXK23ezWjY8BNeFZRnwSVMBrVFAr8M4ffgPuozB5/fda2GJpe8KfxEu73zfazd3e+ljKST0yejM30WIOfwQi3ltzo4gMorN7I2WnyxBBZ66/LsuNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4TKbGh4pYPzbcJJ;
	Wed, 24 Jan 2024 15:30:52 +0800 (CST)
Received: from dggpeml500021.china.huawei.com (unknown [7.185.36.21])
	by mail.maildlp.com (Postfix) with ESMTPS id 99B3418006D;
	Wed, 24 Jan 2024 15:31:15 +0800 (CST)
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500021.china.huawei.com (7.185.36.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 15:31:15 +0800
Message-ID: <7e5a5144-0b56-14c2-d946-0b3f531cd1cc@huawei.com>
Date: Wed, 24 Jan 2024 15:31:14 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [brauner-vfs:vfs.misc 12/13] include/linux/fs.h:911:9: error:
 call to '__compiletime_assert_207' declared with 'error' attribute: Need
 native word sized stores/loads for atomicity.
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: kernel test robot <lkp@intel.com>, <sfr@canb.auug.org.au>,
	<llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Christian Brauner
	<christianvanbrauner@gmail.com>, Christian Brauner <brauner@kernel.org>,
	yangerkun <yangerkun@huawei.com>, "zhangyi (F)" <yi.zhang@huawei.com>,
	<linux-next@vger.kernel.org>
References: <202401230837.TXro0PHi-lkp@intel.com>
 <59fae3eb-a125-cd5f-224e-b89d122ecb46@huawei.com>
 <CAHk-=whoNcNpojRUjg65ixWDOJS-D1kvSHQvtNFtEq7aJw=5Fw@mail.gmail.com>
From: Baokun Li <libaokun1@huawei.com>
In-Reply-To: <CAHk-=whoNcNpojRUjg65ixWDOJS-D1kvSHQvtNFtEq7aJw=5Fw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500021.china.huawei.com (7.185.36.21)

On 2024/1/24 1:46, Linus Torvalds wrote:
> On Mon, 22 Jan 2024 at 23:08, Baokun Li <libaokun1@huawei.com> wrote:
>>>>> include/linux/fs.h:911:9: error: call to '__compiletime_assert_207' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
>>>        911 |         return smp_load_acquire(&inode->i_size);
> Ahh, yes. We used to allow READ_ONCE() on non-atomic data structures
> (we still do, but we used to too), but with truly atomic cases it's
> wrong, since reading a 64-bit value with two 32-bit instructions is
> clearly ever atomic.
>
> So your patch is hitting the "these atomic and/or ordered accesses
> need to be able to actually be done as *one* access" sanity check.
>
> And the reason is that while we have special-cases 32-bit AMP and
> preemption code to avoid this:
>
>>>      891       static inline loff_t i_size_read(const struct inode *inode)
>>>      892       {
>>>      893       #if BITS_PER_LONG==32 && defined(CONFIG_SMP)
>>>      894               loff_t i_size;
>>>      895               unsigned int seq;
>>>      896
>>>      897               do {
>>>      898                       seq = read_seqcount_begin(&inode->i_size_seqcount);
>>>      899                       i_size = inode->i_size;
>>>      900               } while (read_seqcount_retry(&inode->i_size_seqcount, seq));
>>>      901               return i_size;
>>>      902       #elif BITS_PER_LONG==32 && defined(CONFIG_PREEMPTION)
>>>      903               loff_t i_size;
>>>      904
>>>      905               preempt_disable();
>>>      906               i_size = inode->i_size;
>>>      907               preempt_enable();
>>>      908               return i_size;
> We have *not* special-cased the UP and non-preempt code, because in
> that case doing a 64-bit load with two 32-bit accesses is obviously
> fine (modulo interrupts, which *really* shouldn't be changing i_size.
>
> So this last case:
>
>>>      909       #else
>>>      910               /* Pairs with smp_store_release() in i_size_write() */
>>>    > 911               return smp_load_acquire(&inode->i_size);
>>>      912       #endif
> used to be just a simple
>
>          return inode->i_size;
>
> but now that you changed it to smp_load_acquire(), our "native size"
> sanity checks kick in.
>
> The solution is either to add a new case here (saying "if we're not
> SMP, the smp_load_acquire() is pointless"), or to just remove the size
> check from the non-SMP version of smp_load_acquire().
>
> Honestly, that sounds like the right thing to do anyway. Our non-SMP
> case looks like this:
>
> #ifndef smp_load_acquire
> #define smp_load_acquire(p)                                             \
> ({                                                                      \
>          __unqual_scalar_typeof(*p) ___p1 = READ_ONCE(*p);               \
>          compiletime_assert_atomic_type(*p);                             \
>          barrier();                                                      \
>          (typeof(*p))___p1;                                              \
> })
> #endif
>
> and that compiletime_assert_atomic_type() might as well go away. Yes,
> it removes some type-checking coverage, but honestly, the non-SMP case
> simply isn't relevant. No developer uses a UP build for testing
> anyway, so the "less coverage" is pretty much completely theoretical.
>
> So I *think* the fix is as trivial as something like this:
>
>    --- a/include/asm-generic/barrier.h
>    +++ b/include/asm-generic/barrier.h
>    @@ -193,7 +193,6 @@ do {                                      \
>     #ifndef smp_store_release
>     #define smp_store_release(p, v)                              \
>     do {                                                         \
>    -     compiletime_assert_atomic_type(*p);                     \
>          barrier();                                              \
>          WRITE_ONCE(*p, v);                                      \
>     } while (0)
>    @@ -203,7 +202,6 @@ do {                                      \
>     #define smp_load_acquire(p)                                  \
>     ({                                                           \
>          __unqual_scalar_typeof(*p) ___p1 = READ_ONCE(*p);       \
>    -     compiletime_assert_atomic_type(*p);                     \
>          barrier();                                              \
>          (typeof(*p))___p1;                                      \
>     })
>
> because the extra type checking here only makes for extra work, not
> for extra safety.
>
> Hmm?
>
>                  Linus
Thank you very much for the detailed explanation! 😊

Now I understand that the cause of this problem is that on 32-bit
architectures the size of the long type and the long long type are
not equal, so this compilation error is triggered when both
CONFIG_SMP and CONFIG_PREEMPTION are not enabled, which
is also why I don't have it triggered on x86 and arm64. I will
include the patch in the next version of the patch set.

Thanks again!
-- 
With Best Regards,
Baokun Li
.

