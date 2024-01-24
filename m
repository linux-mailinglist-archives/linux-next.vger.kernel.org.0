Return-Path: <linux-next+bounces-824-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0902383A6D5
	for <lists+linux-next@lfdr.de>; Wed, 24 Jan 2024 11:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78D181F22693
	for <lists+linux-next@lfdr.de>; Wed, 24 Jan 2024 10:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4022578;
	Wed, 24 Jan 2024 10:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9EtoOPx"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6E953BA;
	Wed, 24 Jan 2024 10:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706092266; cv=none; b=r39HO+JzwS6v9YOKRO+ERrv8LQ+oWN+Pmms6h0qFwmLwDp7VvwPeMpuh7Vk6LSbusMU7nwgIfQxX+Hlye7VT7kTgjYcPdxC/UkpSCr1KQgkIKhTmcWkg5fn593t0cs34l8WirCGF4+mKifcWzVTMX7nXwThYBXSEy/ev7iBOSU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706092266; c=relaxed/simple;
	bh=cLpluENgJDCrtehrHQFnaAiG6q6Y78nWqLJvoE2yvyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzV3t7PxtboVlyz0PqSCoiiaRu/DDQo+O3Mjk/b1qKAxO/LkVEHO5QIU8wvUU8G7glc6C9ZlK48AMImY/PH0U3nIPASK9bDmSYsUI0Xvu6OFeIZBkDvESoBzsseMpUK8nJ4tClbxKwyLt/fjdbhaMX1Rd1/+rdpYejdKsD3h4mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9EtoOPx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B256C433C7;
	Wed, 24 Jan 2024 10:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706092265;
	bh=cLpluENgJDCrtehrHQFnaAiG6q6Y78nWqLJvoE2yvyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c9EtoOPxy41pRplsV+siQBEbpLCGuG8EaNtbpN7929DgmDKdQqBmu49osjHKvYCcy
	 lbVxZo57VmJeaylvSYjk2xHuA8EJd89Z+2ClVjw9O39ZhCBVZwkl4hX90NyBs4SV5u
	 NeeGQMaoqLaFlY9kmC3vHNZBddusl3pLBXIIu6HhGAHT9VmCnqz206OsNVkKfawJdE
	 9s9kK/m9YPBovoQfplSAvVq3P0VJz2OzHnKkePzgfnB4RuA9Zc6nNjtAjRUikH6AyO
	 UTqveczae9MicoDH9hLzhi3okNu6BelcZ6RpjGMLUGnzE1o9l4MhrWO8VUi4/3EcKV
	 5xOdHCSO29e/A==
Date: Wed, 24 Jan 2024 11:30:59 +0100
From: Christian Brauner <brauner@kernel.org>
To: Baokun Li <libaokun1@huawei.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, sfr@canb.auug.org.au, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Christian Brauner <christianvanbrauner@gmail.com>, yangerkun <yangerkun@huawei.com>, 
	"zhangyi (F)" <yi.zhang@huawei.com>, linux-next@vger.kernel.org
Subject: Re: [brauner-vfs:vfs.misc 12/13] include/linux/fs.h:911:9: error:
 call to '__compiletime_assert_207' declared with 'error' attribute: Need
 native word sized stores/loads for atomicity.
Message-ID: <20240124-abbaggern-oblag-67346f8dee9f@brauner>
References: <202401230837.TXro0PHi-lkp@intel.com>
 <59fae3eb-a125-cd5f-224e-b89d122ecb46@huawei.com>
 <20240123-glatt-langgehegter-a239e588ae2c@brauner>
 <2abc7cc4-72eb-33c9-864a-9f527c0273d3@huawei.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2abc7cc4-72eb-33c9-864a-9f527c0273d3@huawei.com>

On Wed, Jan 24, 2024 at 03:52:16PM +0800, Baokun Li wrote:
> On 2024/1/24 0:24, Christian Brauner wrote:
> > On Tue, Jan 23, 2024 at 03:07:50PM +0800, Baokun Li wrote:
> > > On 2024/1/23 8:12, kernel test robot wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.misc
> > > > head:   297983dc9011461cba6278bfe03f4305c4a2caa0
> > > > commit: 4bbd51d0f0ad709c0f02c100439d6c9ba6811d4b [12/13] fs: make the i_size_read/write helpers be smp_load_acquire/store_release()
> > > > config: i386-randconfig-015-20240123 (https://download.01.org/0day-ci/archive/20240123/202401230837.TXro0PHi-lkp@intel.com/config)
> > > > compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240123/202401230837.TXro0PHi-lkp@intel.com/reproduce)
> > > > 
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202401230837.TXro0PHi-lkp@intel.com/
> > > > 
> > > > All errors (new ones prefixed by >>):
> > > > 
> > > >      In file included from fs/netfs/buffered_read.c:10:
> > > >      In file included from fs/netfs/internal.h:9:
> > > >      In file included from include/linux/seq_file.h:12:
> > > > > > include/linux/fs.h:911:9: error: call to '__compiletime_assert_207' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
> > > >        911 |         return smp_load_acquire(&inode->i_size);
> > > >            |                ^
> > > >      include/asm-generic/barrier.h:206:2: note: expanded from macro 'smp_load_acquire'
> > > >        206 |         compiletime_assert_atomic_type(*p);                             \
> > > >            |         ^
> > > >      include/linux/compiler_types.h:438:2: note: expanded from macro 'compiletime_assert_atomic_type'
> > > >        438 |         compiletime_assert(__native_word(t),                            \
> > > >            |         ^
> > > >      include/linux/compiler_types.h:435:2: note: expanded from macro 'compiletime_assert'
> > > >        435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> > > >            |         ^
> > > >      include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
> > > >        423 |         __compiletime_assert(condition, msg, prefix, suffix)
> > > >            |         ^
> > > >      include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
> > > >        416 |                         prefix ## suffix();                             \
> > > >            |                         ^
> > > >      <scratch space>:38:1: note: expanded from here
> > > >         38 | __compiletime_assert_207
> > > >            | ^
> > > >      1 error generated.
> > > > 
> > > > 
> > > > vim +911 include/linux/fs.h
> > > > 
> > > >      874	
> > > >      875	void filemap_invalidate_lock_two(struct address_space *mapping1,
> > > >      876					 struct address_space *mapping2);
> > > >      877	void filemap_invalidate_unlock_two(struct address_space *mapping1,
> > > >      878					   struct address_space *mapping2);
> > > >      879	
> > > >      880	
> > > >      881	/*
> > > >      882	 * NOTE: in a 32bit arch with a preemptable kernel and
> > > >      883	 * an UP compile the i_size_read/write must be atomic
> > > >      884	 * with respect to the local cpu (unlike with preempt disabled),
> > > >      885	 * but they don't need to be atomic with respect to other cpus like in
> > > >      886	 * true SMP (so they need either to either locally disable irq around
> > > >      887	 * the read or for example on x86 they can be still implemented as a
> > > >      888	 * cmpxchg8b without the need of the lock prefix). For SMP compiles
> > > >      889	 * and 64bit archs it makes no difference if preempt is enabled or not.
> > > >      890	 */
> > > >      891	static inline loff_t i_size_read(const struct inode *inode)
> > > >      892	{
> > > >      893	#if BITS_PER_LONG==32 && defined(CONFIG_SMP)
> > > >      894		loff_t i_size;
> > > >      895		unsigned int seq;
> > > >      896	
> > > >      897		do {
> > > >      898			seq = read_seqcount_begin(&inode->i_size_seqcount);
> > > >      899			i_size = inode->i_size;
> > > >      900		} while (read_seqcount_retry(&inode->i_size_seqcount, seq));
> > > >      901		return i_size;
> > > >      902	#elif BITS_PER_LONG==32 && defined(CONFIG_PREEMPTION)
> > > >      903		loff_t i_size;
> > > >      904	
> > > >      905		preempt_disable();
> > > >      906		i_size = inode->i_size;
> > > >      907		preempt_enable();
> > > >      908		return i_size;
> > > >      909	#else
> > > >      910		/* Pairs with smp_store_release() in i_size_write() */
> > > >    > 911		return smp_load_acquire(&inode->i_size);
> > > >      912	#endif
> > > >      913	}
> > > >      914	
> > > Sorry to cause this compilation error, I have not encountered this
> > > before when testing compilation with gcc on x86 and arm64.
> > > Is there a special config required for this, or is it just clang that
> > > triggers this compile error?
> > > 
> > > The compile error seems to be that some architectural implementations
> > > of smp_load_acquire() do not support pointers to long long data
> > > types. Can't think of a good way to avoid this problem, any ideas
> > > from linus and christian?
> > That code in i_size_{read,write}() is terrible to look at.
> > Pragmatically, we can probably just do READ_ONCE() + smp_rmb() and
> > smp_wmb() + WRITE_ONCE(). This guarantees the ordering and it works
> > (compiles) on 32bit as well. I think it's still possible that on 32bit
> > the READ_ONCE()/WRITE_ONCE() are compiled as two accesses. But I'm not
> > sure that this matters because iiuc that problem would've already been
> > there with the barrier in mm/filemap.c instead of here.
> Thank you very much for your suggestion!
> 
> READ_ONCE()/WRITE_ONCE() now allows 64-bit accesses on 32-bit
> architectures. Linus suggests smp_load_acquire()/smp_store_release()
> to do the same in non-SMP case. I think this is better, what do you think?

Practically it doesn't matter what option we choose.

If we want to remove the compile time assert from smp_load_acquire() and
smp_store_release() we should do so from all architectures that define
it. So that's arm, arm64, loongarch, parisc, powerpc, riscv, s390,
sparc, x86.

Otherwise I think this might be a bit messy. And we can do that but I'm
not sure that should be an accompanying patch to this change?

Linus, if you prefer to remove the compile time asserts from
smp_load_acquire() and smp_store_release() do you just want to apply a
patch to the tree directly? Otherwise maybe a patch separate from this
series might be better?

In the meantime or if we don't choose to remove it we should just be
able to do?

Thoughts?

diff --git a/include/linux/fs.h b/include/linux/fs.h
index ed5966a70495..e46fe5d0dfc0 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -890,8 +890,8 @@ void filemap_invalidate_unlock_two(struct address_space *mapping1,
  */
 static inline loff_t i_size_read(const struct inode *inode)
 {
-#if BITS_PER_LONG==32 && defined(CONFIG_SMP)
 	loff_t i_size;
+#if BITS_PER_LONG==32 && defined(CONFIG_SMP)
 	unsigned int seq;
 
 	do {
@@ -900,14 +900,16 @@ static inline loff_t i_size_read(const struct inode *inode)
 	} while (read_seqcount_retry(&inode->i_size_seqcount, seq));
 	return i_size;
 #elif BITS_PER_LONG==32 && defined(CONFIG_PREEMPTION)
-	loff_t i_size;
 
 	preempt_disable();
 	i_size = inode->i_size;
 	preempt_enable();
 	return i_size;
 #else
-	return inode->i_size;
+
+	i_size = READ_ONCE(inode->i_size);
+	smp_rmb();
+	return i_size;
 #endif
 }
 
@@ -929,7 +931,8 @@ static inline void i_size_write(struct inode *inode, loff_t i_size)
 	inode->i_size = i_size;
 	preempt_enable();
 #else
-	inode->i_size = i_size;
+	smp_wmb();
+	WRITE_ONCE(inode->i_size, i_size);
 #endif
 }

