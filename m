Return-Path: <linux-next+bounces-698-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDA2828AEB
	for <lists+linux-next@lfdr.de>; Tue,  9 Jan 2024 18:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9304A1C21F0B
	for <lists+linux-next@lfdr.de>; Tue,  9 Jan 2024 17:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CD63AC25;
	Tue,  9 Jan 2024 17:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Am1vwS8P"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98463AC19
	for <linux-next@vger.kernel.org>; Tue,  9 Jan 2024 17:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FFA2C433F1;
	Tue,  9 Jan 2024 17:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704820806;
	bh=8yGgRj7fPlbci/X8KI83YHvsv/ZnWePP1jniO+LULHg=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Am1vwS8Pa0xUyha/G3A/dnRvFEnHoTyjfUSE+bN0W8HdgjgKfedz8NUHM+Q7kZkqn
	 g//HGm5jpuh8DEsQg4+7/9WyptQ1aVfQ1tOqmYPztx7rhqtkXVu66sQq/NzKmJwWKS
	 R+ng6rj6CCoeHiNllDgIKDlNzSB8GpllNnTTAUeugNscbwz15IkvhmOTzDlGEwgo7q
	 UgRFId6hyk7RP7icyaNZj6eQhiKmyA0+8XapxfHK8EiqZmN0eLntjR7vWUVHROo957
	 ZOAmid4sZZ5AWPc8ak7qa6lOt5VBhJqEfc71AqtOuTmXEVvb7FNAj97n+nwn7xsGtB
	 dYtzr54abIHqA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id CDF93CE0460; Tue,  9 Jan 2024 09:20:05 -0800 (PST)
Date: Tue, 9 Jan 2024 09:20:05 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kasan-dev@googlegroups.com
Subject: Re: [BUG] KASAN "INFO: trying to register non-static key"
Message-ID: <3c1213bf-783b-49de-b012-00494e7e991c@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <5cc0f83c-e1d6-45c5-be89-9b86746fe731@paulmck-laptop>
 <20240109155127.54gsm6r67brdev4l@revolver>
 <CA+fCnZewUEv2BMX-D=a+5wosusM-H3tOBpeJe6oyu51mMLXQnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+fCnZewUEv2BMX-D=a+5wosusM-H3tOBpeJe6oyu51mMLXQnA@mail.gmail.com>

On Tue, Jan 09, 2024 at 05:07:54PM +0100, Andrey Konovalov wrote:
> On Tue, Jan 9, 2024 at 4:51 PM Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> >
> > * Paul E. McKenney <paulmck@kernel.org> [240109 09:04]:
> > > Hello!
> > >
> > > I get the splat shown below when running rcutorture on next-20240108
> > > (and some less-recent -next versions) on scenarios that run KASAN and
> > > that also enable CONFIG_DEBUG_LOCK_ALLOC=y.  I am running gcc 8.5.0.
> > >
> > > Bisection fingers this commit:
> > >
> > > a414d4286f34 ("kasan: handle concurrent kasan_record_aux_stack calls")
> > >
> > > This commit does not appear to be trying to change the annotation
> > > required of KASAN users, so I suspect that the commit is at fault.  I am
> > > including Liam in case Maple Tree is the bad guy, and should call_rcu()
> > > need adjustment, here I am.  ;-)
> > >
> > > Thoughts?
> >
> >
> > I think this is ma_free_rcu() registering mt_free_rcu() in
> > lib/maple_tree.c.
> >
> > The commit you point to saves and restores the irq state in
> > __kasan_record_aux_stack(), but the trace below shows it is called prior
> > to irqs being initialized.  This isn't what lockdep is yelling about, so
> > what am I missing?  Maybe it will be caught after this issue is
> > resolved?
> 
> Hm, I see a discrepancy in the KASAN code related to the guilty
> commit. I believed it to be harmless, but perhaps it is not.
> 
> Paul, could you check if the attached patch fixes the issue for you?
> This is rather a quick fix than a proper one, but let's see if this
> one works.
> 
> Thanks!

> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index 223af53d4338..0143c1b82004 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -208,10 +208,6 @@ static inline u8 assign_tag(struct kmem_cache *cache,
>  void * __must_check __kasan_init_slab_obj(struct kmem_cache *cache,
>  						const void *object)
>  {
> -	/* Initialize per-object metadata if it is present. */
> -	if (kasan_requires_meta())
> -		kasan_init_object_meta(cache, object);
> -
>  	/* Tag is ignored in set_tag() without CONFIG_KASAN_SW/HW_TAGS */
>  	object = set_tag(object, assign_tag(cache, object, true));
>  
> @@ -338,6 +334,10 @@ void * __must_check __kasan_slab_alloc(struct kmem_cache *cache,
>  	if (is_kfence_address(object))
>  		return (void *)object;
>  
> +	/* Initialize per-object metadata if it is present. */
> +	if (kasan_requires_meta())
> +		kasan_init_object_meta(cache, object);
> +
>  	/*
>  	 * Generate and assign random tag for tag-based modes.
>  	 * Tag is ignored in set_tag() for the generic mode.

Thank you!

But no joy, please see below.

							Thanx, Paul

------------------------------------------------------------------------

[    0.131589] INFO: trying to register non-static key.
[    0.131590] The code is fine but needs lockdep annotation, or maybe
[    0.131591] you didn't initialize this object before use?
[    0.131592] turning off the locking correctness validator.
[    0.131594] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.7.0-next-20240108-00001-g1dac0fe718dd #24
[    0.131597] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.15.0-1 04/01/2014
[    0.131599] Call Trace:
[    0.131601]  <TASK>
[    0.131603]  dump_stack_lvl+0x37/0x50
[    0.131608]  register_lock_class+0xba4/0xf30
[    0.131612]  ? x86_64_start_kernel+0xcf/0xe0
[    0.131615]  ? secondary_startup_64_no_verify+0x16d/0x17b
[    0.131618]  ? lock_release+0x1e1/0x690
[    0.131621]  ? __pfx_register_lock_class+0x10/0x10
[    0.131624]  ? lock_acquire+0x11f/0x290
[    0.131626]  ? debug_object_active_state+0x144/0x3e0
[    0.131631]  __lock_acquire.constprop.0+0x7e/0xe80
[    0.131634]  ? __pfx_lock_release+0x10/0x10
[    0.131637]  lock_acquire+0x11f/0x290
[    0.131639]  ? __kasan_record_aux_stack+0xa1/0xe0
[    0.131644]  _raw_spin_lock_irqsave+0x31/0x50
[    0.131648]  ? __kasan_record_aux_stack+0xa1/0xe0
[    0.131651]  __kasan_record_aux_stack+0xa1/0xe0
[    0.131653]  ? __pfx_mt_free_rcu+0x10/0x10
[    0.131656]  __call_rcu_common.constprop.0+0x99/0x750
[    0.131659]  ? mas_pop_node+0x12a/0x280
[    0.131662]  mas_wr_node_store+0x8c1/0x17e0
[    0.131666]  ? __pfx_register_lock_class+0x10/0x10
[    0.131669]  ? __pfx_mas_wr_node_store+0x10/0x10
[    0.131671]  ? pcpu_alloc+0x8c9/0xb10
[    0.131676]  ? find_held_lock+0x2c/0x110
[    0.131678]  ? __debug_object_init+0x2f7/0x450
[    0.131681]  ? lock_release+0x1e1/0x690
[    0.131684]  ? __pfx_lock_release+0x10/0x10
[    0.131686]  ? __pfx_do_raw_spin_lock+0x10/0x10
[    0.131690]  ? do_raw_spin_unlock+0x53/0x220
[    0.131693]  ? _raw_spin_unlock_irqrestore+0x22/0x50
[    0.131697]  mas_wr_store_entry.isra.0+0x40e/0x1480
[    0.131700]  ? __pfx___debug_object_init+0x10/0x10
[    0.131704]  mas_store_gfp+0xc2/0x1d0
[    0.131707]  ? __pfx_mas_store_gfp+0x10/0x10
[    0.131712]  ? alloc_desc+0x69b/0x990
[    0.131715]  early_irq_init+0x1c7/0x270
[    0.131719]  ? __pfx_early_irq_init+0x10/0x10
[    0.131722]  ? tracepoint_probe_register+0xaf/0xf0
[    0.131727]  ? kmem_cache_create_usercopy+0xce/0x230
[    0.131731]  start_kernel+0x162/0x390
[    0.131734]  x86_64_start_reservations+0x18/0x30
[    0.131736]  x86_64_start_kernel+0xcf/0xe0
[    0.131738]  secondary_startup_64_no_verify+0x16d/0x17b

