Return-Path: <linux-next+bounces-818-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F3A83A38E
	for <lists+linux-next@lfdr.de>; Wed, 24 Jan 2024 08:52:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45A8128DE1F
	for <lists+linux-next@lfdr.de>; Wed, 24 Jan 2024 07:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A36617556;
	Wed, 24 Jan 2024 07:52:22 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E9E1755B
	for <linux-next@vger.kernel.org>; Wed, 24 Jan 2024 07:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706082742; cv=none; b=ZUV0ozQnuLEOMjUWLKDZo0gw+rbZAlO2bThmtWS7Gx3/NtwcwYIw5J0XKGot0yVUgXiSgaPb1qkYs2yMF36XJLlJWH1mpgi6g3cEJ5Na6vQvXWwwM/WOam/7zrU6Sof1ScIcuhnDJfZDiMjSGc3R3eRtOA5rWrDA30nXcCuB23A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706082742; c=relaxed/simple;
	bh=Uf4iVPTBqCOpy7VrMu2j7/q3nPZSVTG6tGVrQSaAogU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uJBWfZE1FZNawNXKvhaY2k9tBQeXPsm/ntsV4kBEqCmgeV7jOSowV4iSbIay8kpG+jxMdGkLWNyr50YRQqN6MGRjgm2Khz7bfy+DZ11c3U8KJDEevWb30GXMrw96B9IdY8Pt2mJ77dD50DejVkqkKqza2UgEIHt3NIAhVlKm8hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4TKbkx6qrfzbcHg;
	Wed, 24 Jan 2024 15:51:53 +0800 (CST)
Received: from dggpeml500021.china.huawei.com (unknown [7.185.36.21])
	by mail.maildlp.com (Postfix) with ESMTPS id ECFE51402CB;
	Wed, 24 Jan 2024 15:52:16 +0800 (CST)
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500021.china.huawei.com (7.185.36.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 15:52:16 +0800
Message-ID: <2abc7cc4-72eb-33c9-864a-9f527c0273d3@huawei.com>
Date: Wed, 24 Jan 2024 15:52:16 +0800
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
To: Christian Brauner <brauner@kernel.org>
CC: kernel test robot <lkp@intel.com>, <sfr@canb.auug.org.au>,
	<llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, Christian Brauner
	<christianvanbrauner@gmail.com>, yangerkun <yangerkun@huawei.com>, "zhangyi
 (F)" <yi.zhang@huawei.com>, Linus Torvalds <torvalds@linux-foundation.org>,
	<linux-next@vger.kernel.org>, Baokun Li <libaokun1@huawei.com>
References: <202401230837.TXro0PHi-lkp@intel.com>
 <59fae3eb-a125-cd5f-224e-b89d122ecb46@huawei.com>
 <20240123-glatt-langgehegter-a239e588ae2c@brauner>
From: Baokun Li <libaokun1@huawei.com>
In-Reply-To: <20240123-glatt-langgehegter-a239e588ae2c@brauner>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500021.china.huawei.com (7.185.36.21)

On 2024/1/24 0:24, Christian Brauner wrote:
> On Tue, Jan 23, 2024 at 03:07:50PM +0800, Baokun Li wrote:
>> On 2024/1/23 8:12, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.misc
>>> head:   297983dc9011461cba6278bfe03f4305c4a2caa0
>>> commit: 4bbd51d0f0ad709c0f02c100439d6c9ba6811d4b [12/13] fs: make the i_size_read/write helpers be smp_load_acquire/store_release()
>>> config: i386-randconfig-015-20240123 (https://download.01.org/0day-ci/archive/20240123/202401230837.TXro0PHi-lkp@intel.com/config)
>>> compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240123/202401230837.TXro0PHi-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202401230837.TXro0PHi-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>      In file included from fs/netfs/buffered_read.c:10:
>>>      In file included from fs/netfs/internal.h:9:
>>>      In file included from include/linux/seq_file.h:12:
>>>>> include/linux/fs.h:911:9: error: call to '__compiletime_assert_207' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
>>>        911 |         return smp_load_acquire(&inode->i_size);
>>>            |                ^
>>>      include/asm-generic/barrier.h:206:2: note: expanded from macro 'smp_load_acquire'
>>>        206 |         compiletime_assert_atomic_type(*p);                             \
>>>            |         ^
>>>      include/linux/compiler_types.h:438:2: note: expanded from macro 'compiletime_assert_atomic_type'
>>>        438 |         compiletime_assert(__native_word(t),                            \
>>>            |         ^
>>>      include/linux/compiler_types.h:435:2: note: expanded from macro 'compiletime_assert'
>>>        435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>>>            |         ^
>>>      include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
>>>        423 |         __compiletime_assert(condition, msg, prefix, suffix)
>>>            |         ^
>>>      include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
>>>        416 |                         prefix ## suffix();                             \
>>>            |                         ^
>>>      <scratch space>:38:1: note: expanded from here
>>>         38 | __compiletime_assert_207
>>>            | ^
>>>      1 error generated.
>>>
>>>
>>> vim +911 include/linux/fs.h
>>>
>>>      874	
>>>      875	void filemap_invalidate_lock_two(struct address_space *mapping1,
>>>      876					 struct address_space *mapping2);
>>>      877	void filemap_invalidate_unlock_two(struct address_space *mapping1,
>>>      878					   struct address_space *mapping2);
>>>      879	
>>>      880	
>>>      881	/*
>>>      882	 * NOTE: in a 32bit arch with a preemptable kernel and
>>>      883	 * an UP compile the i_size_read/write must be atomic
>>>      884	 * with respect to the local cpu (unlike with preempt disabled),
>>>      885	 * but they don't need to be atomic with respect to other cpus like in
>>>      886	 * true SMP (so they need either to either locally disable irq around
>>>      887	 * the read or for example on x86 they can be still implemented as a
>>>      888	 * cmpxchg8b without the need of the lock prefix). For SMP compiles
>>>      889	 * and 64bit archs it makes no difference if preempt is enabled or not.
>>>      890	 */
>>>      891	static inline loff_t i_size_read(const struct inode *inode)
>>>      892	{
>>>      893	#if BITS_PER_LONG==32 && defined(CONFIG_SMP)
>>>      894		loff_t i_size;
>>>      895		unsigned int seq;
>>>      896	
>>>      897		do {
>>>      898			seq = read_seqcount_begin(&inode->i_size_seqcount);
>>>      899			i_size = inode->i_size;
>>>      900		} while (read_seqcount_retry(&inode->i_size_seqcount, seq));
>>>      901		return i_size;
>>>      902	#elif BITS_PER_LONG==32 && defined(CONFIG_PREEMPTION)
>>>      903		loff_t i_size;
>>>      904	
>>>      905		preempt_disable();
>>>      906		i_size = inode->i_size;
>>>      907		preempt_enable();
>>>      908		return i_size;
>>>      909	#else
>>>      910		/* Pairs with smp_store_release() in i_size_write() */
>>>    > 911		return smp_load_acquire(&inode->i_size);
>>>      912	#endif
>>>      913	}
>>>      914	
>> Sorry to cause this compilation error, I have not encountered this
>> before when testing compilation with gcc on x86 and arm64.
>> Is there a special config required for this, or is it just clang that
>> triggers this compile error?
>>
>> The compile error seems to be that some architectural implementations
>> of smp_load_acquire() do not support pointers to long long data
>> types. Can't think of a good way to avoid this problem, any ideas
>> from linus and christian?
> That code in i_size_{read,write}() is terrible to look at.
> Pragmatically, we can probably just do READ_ONCE() + smp_rmb() and
> smp_wmb() + WRITE_ONCE(). This guarantees the ordering and it works
> (compiles) on 32bit as well. I think it's still possible that on 32bit
> the READ_ONCE()/WRITE_ONCE() are compiled as two accesses. But I'm not
> sure that this matters because iiuc that problem would've already been
> there with the barrier in mm/filemap.c instead of here.
Thank you very much for your suggestion!

READ_ONCE()/WRITE_ONCE() now allows 64-bit accesses on 32-bit
architectures. Linus suggests smp_load_acquire()/smp_store_release()
to do the same in non-SMP case. I think this is better, what do you think?

Thanks again!
-- 
With Best Regards,
Baokun Li
.

