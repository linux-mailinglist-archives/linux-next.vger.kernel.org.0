Return-Path: <linux-next+bounces-696-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 734A98289B4
	for <lists+linux-next@lfdr.de>; Tue,  9 Jan 2024 17:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E5F81F24E5F
	for <lists+linux-next@lfdr.de>; Tue,  9 Jan 2024 16:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D133A1A6;
	Tue,  9 Jan 2024 16:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c+WbPgLz"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B90B3A1A0
	for <linux-next@vger.kernel.org>; Tue,  9 Jan 2024 16:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6DC5C433C7;
	Tue,  9 Jan 2024 16:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704816464;
	bh=4HW+UijODWBNElWXE5Sb0q4k/4ugCbPRiJD0fyaBNsA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=c+WbPgLz6aYRl1RvVq69KVoQ6eVhlEMskE5O/VLlB5G6xRUFKNcOZrvptp17zqb30
	 pp6mf7Ann72tVPuJq2SH8YQeHqC0xNrxjJXpED+yzF8z6ZCvk7cB2TcfmnBnlisDiD
	 8Np48juqF5lPKZQf8VCokq5FBjU86GhC9oKQ+sdrl8eC7hXTHo5PS4lzEqUOmKyZ++
	 y/Rcc+fxkA83mkte6ZC6aNnxbqMTk2tGc+paD4mMNDoOIIaqyr8e5mSevLjFovIkRI
	 mt/nNmrawg7qAsEobxkgJ2Z4wDh6FXmDDEen5H8wo6DmLTW58o50VE00m8caSy0yKo
	 Vn6f0nG2lscNA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 50311CE03BC; Tue,  9 Jan 2024 08:07:44 -0800 (PST)
Date: Tue, 9 Jan 2024 08:07:44 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: andreyknvl@gmail.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [BUG] KASAN "INFO: trying to register non-static key"
Message-ID: <dd8cf53b-1cd0-45cc-8087-d09175d2f63d@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <5cc0f83c-e1d6-45c5-be89-9b86746fe731@paulmck-laptop>
 <20240109155127.54gsm6r67brdev4l@revolver>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109155127.54gsm6r67brdev4l@revolver>

On Tue, Jan 09, 2024 at 10:51:27AM -0500, Liam R. Howlett wrote:
> * Paul E. McKenney <paulmck@kernel.org> [240109 09:04]:
> > Hello!
> > 
> > I get the splat shown below when running rcutorture on next-20240108
> > (and some less-recent -next versions) on scenarios that run KASAN and
> > that also enable CONFIG_DEBUG_LOCK_ALLOC=y.  I am running gcc 8.5.0.
> > 
> > Bisection fingers this commit:
> > 
> > a414d4286f34 ("kasan: handle concurrent kasan_record_aux_stack calls")
> > 
> > This commit does not appear to be trying to change the annotation
> > required of KASAN users, so I suspect that the commit is at fault.  I am
> > including Liam in case Maple Tree is the bad guy, and should call_rcu()
> > need adjustment, here I am.  ;-)
> > 
> > Thoughts?
> 
> 
> I think this is ma_free_rcu() registering mt_free_rcu() in
> lib/maple_tree.c.
> 
> The commit you point to saves and restores the irq state in
> __kasan_record_aux_stack(), but the trace below shows it is called prior
> to irqs being initialized.  This isn't what lockdep is yelling about, so
> what am I missing?  Maybe it will be caught after this issue is
> resolved?
> 
> I am also guessing maple tree shows up in the stack trace because it is
> the very first rcu user at boot (just like the rcutiny issue last time).
> I'm just keeping everyone honest/angry.

That is my guess as well, but I wouldn't want you to feel left out.  ;-)

							Thanx, Paul

> > ------------------------------------------------------------------------
> > 
> > [    0.174878] INFO: trying to register non-static key.
> > [    0.174879] The code is fine but needs lockdep annotation, or maybe
> > [    0.174880] you didn't initialize this object before use?
> > [    0.174881] turning off the locking correctness validator.
> > [    0.174884] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.7.0-rc4-00331-ga414d4286f34 #39616
> > [    0.174888] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
> > [    0.174891] Call Trace:
> > [    0.174892]  <TASK>
> > [    0.174895]  dump_stack_lvl+0x36/0x50
> > [    0.174903]  register_lock_class+0x1240/0x1880
> > [    0.174910]  ? kasan_save_stack+0x2e/0x40
> > [    0.174916]  ? kasan_save_stack+0x20/0x40
> > [    0.174919]  ? __kasan_record_aux_stack+0x91/0xe0
> > [    0.174923]  ? __call_rcu_common.constprop.84+0x99/0x740
> > [    0.174927]  ? mas_wr_node_store+0x8c6/0x1700
> > [    0.174931]  ? mas_wr_modify+0x274/0x2500
> > [    0.174934]  ? mas_wr_store_entry+0x3fa/0x1830
> > [    0.174938]  ? mas_store_gfp+0xaa/0x140
> > [    0.174941]  ? __pfx_register_lock_class+0x10/0x10
> > [    0.174945]  ? x86_64_start_reservations+0x18/0x30
> > [    0.174952]  ? x86_64_start_kernel+0x91/0xa0
> > [    0.174956]  ? secondary_startup_64_no_verify+0x178/0x17b
> > [    0.174961]  ? __pfx_lock_release+0x10/0x10
> > [    0.174965]  ? do_raw_spin_lock+0x125/0x290
> > [    0.174968]  ? __pfx_do_raw_spin_lock+0x10/0x10
> > [    0.174971]  __lock_acquire.isra.27+0x81/0x10d0
> > [    0.174976]  ? _raw_spin_unlock_irqrestore+0x22/0x50
> > [    0.174982]  ? debug_object_active_state+0x2e7/0x430
> > [    0.174988]  lock_acquire+0x11e/0x280
> > [    0.174992]  ? __kasan_record_aux_stack+0xa1/0xe0
> > [    0.174996]  _raw_spin_lock_irqsave+0x2f/0x50
> > [    0.175000]  ? __kasan_record_aux_stack+0xa1/0xe0
> > [    0.175003]  __kasan_record_aux_stack+0xa1/0xe0
> > [    0.175006]  ? __pfx_mt_free_rcu+0x10/0x10
> > [    0.175009]  __call_rcu_common.constprop.84+0x99/0x740
> > [    0.175012]  ? mas_alloc_nodes+0x3e7/0x750
> > [    0.175015]  ? mas_pop_node+0x192/0x290
> > [    0.175018]  mas_wr_node_store+0x8c6/0x1700
> > [    0.175022]  ? __free_zapped_classes+0x2af/0x2f0
> > [    0.175026]  ? lock_release+0x1e3/0x660
> > [    0.175030]  ? __pfx_mas_wr_node_store+0x10/0x10
> > [    0.175033]  ? __pfx_lock_release+0x10/0x10
> > [    0.175038]  ? lock_acquire+0x11e/0x280
> > [    0.175042]  ? stack_depot_save_flags+0x148/0x650
> > [    0.175047]  ? find_held_lock+0x33/0x1c0
> > [    0.175051]  ? lock_release+0x1e3/0x660
> > [    0.175054]  ? pcpu_alloc+0x81d/0xa30
> > [    0.175059]  ? stack_depot_save_flags+0x1da/0x650
> > [    0.175062]  ? __pfx_lock_release+0x10/0x10
> > [    0.175066]  ? register_lock_class+0xc9/0x1880
> > [    0.175070]  ? pcpu_alloc+0x60e/0xa30
> > [    0.175074]  mas_wr_modify+0x274/0x2500
> > [    0.175078]  ? __mutex_unlock_slowpath+0x176/0x660
> > [    0.175083]  mas_wr_store_entry+0x3fa/0x1830
> > [    0.175088]  mas_store_gfp+0xaa/0x140
> > [    0.175092]  ? __pfx_mas_store_gfp+0x10/0x10
> > [    0.175097]  ? lockdep_init_map_type+0x2c8/0x7a0
> > [    0.175101]  irq_insert_desc+0xaf/0x100
> > [    0.175107]  ? __pfx_irq_insert_desc+0x10/0x10
> > [    0.175110]  ? kobject_init+0x68/0x1e0
> > [    0.175115]  ? kmem_cache_create_usercopy+0xce/0x240
> > [    0.175119]  early_irq_init+0x10f/0x140
> 
> IRQs are not enabled at this point.
> 
> > [    0.175125]  start_kernel+0x177/0x3a0
> > [    0.175129]  x86_64_start_reservations+0x18/0x30
> > [    0.175133]  x86_64_start_kernel+0x91/0xa0
> > [    0.175138]  secondary_startup_64_no_verify+0x178/0x17b
> > [    0.175143]  </TASK>
> > 

