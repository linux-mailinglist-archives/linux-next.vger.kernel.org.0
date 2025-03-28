Return-Path: <linux-next+bounces-6064-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B47A74651
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 10:25:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 995263B180D
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 09:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC06213236;
	Fri, 28 Mar 2025 09:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="i3QA6OYQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lMMqJAyU"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636A612C7FD;
	Fri, 28 Mar 2025 09:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743153930; cv=none; b=KD02Np4qzVYWD4l3Le9Pj2oDofs72htqyq4KA/KxVNICdEq0vHTwBpOzcIS3O/FJpv3ZcwWIW8/WtYz2oRUDfwaMZdRsWhCbkCV0Gg9qs/revWqLqvFZa4jPWdvMHii81LFYPdtTx7n19Ci+j5Sdmk9Ogu43i0fZyy9Nk90JzCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743153930; c=relaxed/simple;
	bh=xhFBsjeoLGgOGRPuGt/8d08Sr6dELoN1GfHin7q3I3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOO1VKrvgELnTWOxdv451eitlx+sz5x4bRx7nGHyzhTn/as1lEir9EFlrozVe2p7suQ/F4ARhFOYPK2ngC5iRyZCn3AUJK3O3qZt3+98F+PybFZw8PnkAr6aXqvrPSYBw+Mawt6620KFqiP6ufoJ/PO/Nx+eAzgh1vAFLvrx64o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=i3QA6OYQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lMMqJAyU; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 3E23F11401E6;
	Fri, 28 Mar 2025 05:25:27 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Fri, 28 Mar 2025 05:25:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1743153927; x=
	1743240327; bh=IpJndoTdoboHMgr6DIUn2aGzTrc9XbawnJXXt0pIxak=; b=i
	3QA6OYQ2CEZ4pcoseQ6g77yqLufqYxg7w/BYMgUQpPuM871YNUVmOdoEq47m0DKn
	ysQ0d+AJth6TvxRz7G4U9zL9HhPNKozl5FRJdBtoW40E2KG0/3j+2WxkZDr+3T0X
	eG8b8wNtmtrlR4oWl5qHLGOZ6X/9nGFPEuFhCe5ERxBUEHJS7UWULvVc1IYRHIrD
	eZpJsxuIxjnEIl8ZytRU+uy2VRfXPPBsg9PdNfbo1e+abkTUBuYsNy5Wi9MLtDnY
	XWh+27l6G9iVrUNbwU8WX7/SsYGKpu7+8y5bI7tv9+wByva11nTwCLlzgJ9Jjpk6
	L0MU4leOYmHEjz8uyll7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743153927; x=1743240327; bh=IpJndoTdoboHMgr6DIUn2aGzTrc9XbawnJX
	Xt0pIxak=; b=lMMqJAyUEO9n/ow9HVTZAGTWUNLdIz8Ms+N+OIgtcsoSTyHFkwn
	64bUfIwrXf5FS0Ylapui98JuxwzDL2xj3PQZBZdcuQ4T6HDp8M7zu66BupOIKvfI
	1nzKprPy4YnbiuEwd8JxKDY/QAUOWm/X6Ukt5KW61EjPvo2rHd+Oyxk9Q6MfbRD1
	4/QDJmXN7Byo7EwaJ8Uuz2By43kugPi+2bX4bfgwDW8REOrSxVzcW220gFyjgzgx
	/5gN4i+xp9A3+J4dsGHanVvviE/V4GwecVSuicuVGlBrniZD8MGXQ2U+aXDChSqP
	vuFqJYcglD7vtZpUTmnq3Jkpg2yOkB8j+lg==
X-ME-Sender: <xms:BmvmZ_0hC_YT_xU04KynurEpkbP9yaY8rhk6vP6HCNaBv2IhGrVPdA>
    <xme:BmvmZ-HieMYX7DbMa6Nyk8aBNjXKwLdMWN8DE45Fv4M2DDVyEdwq07do25806bnC1
    T5UMjrFpmiZMYHoijg>
X-ME-Received: <xmr:BmvmZ_4XG1qwkuZ67ayAcPDQz2F1sXFhBCvYjIwGKjVZ3j-RUFAYGIIo4s1P7WFltuS8EA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedtleefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtsfdttddt
    vdenucfhrhhomhepfdfmihhrihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilh
    hlsehshhhuthgvmhhovhdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeffvdevueetudfh
    hfffveelhfetfeevveekleevjeduudevvdduvdelteduvefhkeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghm
    ohhvrdhnrghmvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehsrhgrihhthhgrlhesrghmugdrtghomhdprhgtphhtthhopehrohhsthgv
    ughtsehgohhoughmihhsrdhorhhgpdhrtghpthhtohepkhhirhhilhhlrdhshhhuthgvmh
    hovheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehthhhomhgrshdrlhgv
    nhgurggtkhihsegrmhgurdgtohhmpdhrtghpthhtohepjhgsrghrohhnsegrkhgrmhgrih
    drtghomhdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgt
    phhtthhopehjphhoihhmsghovgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrug
    gssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghr
    rdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:BmvmZ03XIlxEEmXQyyplbNfdlzPYHM1gXEzlk2y2vtHhshCHWqjjlQ>
    <xmx:BmvmZyGehAU9H_uhRiDaVYiczbQMUswhhS8VIj5Bt3SH-6yfoSXxng>
    <xmx:BmvmZ1-W22Q4cKHq1R2yTqJnxTQ-0E2ytrTDPnWvTmXoWrQT9TZJXg>
    <xmx:BmvmZ_nxya4KQKcwuNiVvyPz5t6goJcHi69Iivmlt84xkOexdI5ZAw>
    <xmx:B2vmZ9_-j1TOSAJTWaWpRxEYaoHQ27vOeYx_Ap4d784VzGnd5oSYlpIn>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Mar 2025 05:25:22 -0400 (EDT)
Date: Fri, 28 Mar 2025 11:25:19 +0200
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: "Aithal, Srikanth" <sraithal@amd.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Jason Baron <jbaron@akamai.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"Roth, Michael" <Michael.Roth@amd.com>
Subject: Re: linux-next regression: SNP Guest boot hangs with certain cpu/mem
 config combination
Message-ID: <4tilpszhxhvzvszed2a3ubziloabflrkan54wxvfgodp73yso4@fgzapeplkp2s>
References: <08981771-39ac-af66-e2ec-e8f9bf6aed0a@amd.com>
 <idlcitykk3hxg5by5sltuljyjf7uanmve5fspu6dectubhy5za@mjmv4i5vwyby>
 <ydvzjdcauzyvv7hxtra6l2gh4diz7zp4wx46eqculr7azynjke@z4x6eryq3rqd>
 <4f258a96-42fe-4567-886b-e8e2b949ab1a@akamai.com>
 <xcxcte6tzti7e6gcucf2ylfptie6kkvs2q5edup6mtzo5tenft@d2rm3p2yjoue>
 <20250327110224.68c69c78@gandalf.local.home>
 <2kwzi2qxqualhskbgckk6m7oc6vsgupquceqgfx2gnz5xbkier@rwdrhym7yxhr>
 <vhwle6fj3ifmcouppec5adegqludggsxcsxxveqa43hugtsdgy@pb7vd5cqjmx3>
 <m4cubsijicsrtq3blyzxeknsuc4cqswg35yz45uk5lipza4lps@yeqq2j5hf4y3>
 <f25ba003-7644-46ed-a1bc-760231534a1d@amd.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f25ba003-7644-46ed-a1bc-760231534a1d@amd.com>

On Fri, Mar 28, 2025 at 02:49:27PM +0530, Aithal, Srikanth wrote:
> On 3/28/2025 2:39 PM, Kirill A. Shutemov wrote:
> > On Fri, Mar 28, 2025 at 10:28:19AM +0200, Kirill A. Shutemov wrote:
> > > On Thu, Mar 27, 2025 at 07:39:22PM +0200, Kirill A. Shutemov wrote:
> > > > On Thu, Mar 27, 2025 at 11:02:24AM -0400, Steven Rostedt wrote:
> > > > > On Thu, 27 Mar 2025 16:43:43 +0200
> > > > > "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> wrote:
> > > > > 
> > > > > > > > The only option I see so far is to drop static branch from this path.
> > > > > > > > 
> > > > > > > > But I am not sure if it the only case were we use static branch from CPU
> > > > > > > > hotplug callbacks.
> > > > > > > > 
> > > > > > > > Any other ideas?
> > > > > > > 
> > > > > > > 
> > > > > > > Hmmm, didn't take too close a look here, but there is the
> > > > > > > static_key_slow_dec_cpuslocked() variant, would that work here? Is the issue
> > > > > > > the caller may or may not have the cpu_hotplug lock?
> > > > > > 
> > > > > > Yes. This is generic page alloc path and it can be called with and without
> > > > > > the lock.
> > > > > 
> > > > > Note, it's not the static_branch that is an issue, it's enabling/disabling
> > > > > the static branch that is. Changing a static branch takes a bit of work as
> > > > > it does modify the kernel text.
> > > > > 
> > > > > Is it possible to delay the update via a workqueue?
> > > > 
> > > > Ah. Good point. Should work. I'll give it try.
> > > 
> > > The patch below fixes problem for me.
> > 
> > Ah. No, it won't work. We can get there before workqueues are initialized:
> > mm_core_init() is called before workqueue_init_early().
> > 
> > We cannot queue a work. :/
> > 
> > Steven, any other ideas?
> > 
> 
> I have booted the guest with different memory and CPU combinations and have
> not seen any failures with the fix so far. Are there any other scenarios
> that could trigger the above case? Please let me know.

I saw this:

[    1.828379] BUG: kernel NULL pointer dereference, address: 00000000000001c1
[    1.833122] #PF: supervisor read access in kernel mode
[    1.834907] #PF: error_code(0x0000) - not-present page
[    1.836681] PGD 0
[    1.837386] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
[    1.839051] CPU: 0 UID: 0 PID: 0 Comm: swapper Tainted: G S                 6.14.0-rc5-00015-ga250fa517231-dirty #2266
[    1.842700] Tainted: [S]=CPU_OUT_OF_SPEC
[    1.844036] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS unknown 02/02/2022
[    1.846790] RIP: 0010:__queue_work+0x3f/0x610
[    1.848330] Code: d3 49 89 f5 41 89 fc 83 3d 5d 51 cb 01 00 74 1a 65 8b 05 04 db 94 4a 85 c0 75 0f 65 8b 05 d1 d7 94 4a 85 c0 0f 85 59 03 00 00 <41> 0f b7 85 c1 01 00 00 a9 80 01 00 00 74 57 65 8b 05 23 ec 97 4a
[    1.854803] RSP: 0000:ffffffffb7003c08 EFLAGS: 00010046
[    1.856614] RAX: 0000000000000000 RBX: ff3d51307fb54488 RCX: 0000000000000000
[    1.859083] RDX: ff3d51307fb54488 RSI: 0000000000000000 RDI: 0000000000000200
[    1.861534] RBP: ffffffffb7003e18 R08: 0000000000000001 R09: 0000000000000001
[    1.864018] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000200
[    1.866480] R13: 0000000000000000 R14: 0000000000000092 R15: ff3d51307fb544d8
[    1.868920] FS:  0000000000000000(0000) GS:ff3d513075000000(0000) knlGS:0000000000000000
[    1.871721] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.873710] CR2: 00000000000001c1 CR3: 0000000004a5c001 CR4: 00000000000210f0
[    1.876194] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    1.878629] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: 0000000000000400
[    1.881105] Call Trace:
[    1.881936]  <TASK>
[    1.882642]  ? __die+0xda/0x120
[    1.883715]  ? page_fault_oops+0x330/0x3c0
[    1.885144]  ? exc_page_fault+0x43/0x100
[    1.886483]  ? exc_page_fault+0x62/0x100
[    1.887825]  ? __add_to_free_list+0xc0/0x160
[    1.891278]  ? asm_exc_page_fault+0x22/0x30
[    1.892706]  ? __queue_work+0x3f/0x610
[    1.894000]  ? __free_pages_ok+0x2b0/0x530
[    1.895416]  queue_work_on+0xb3/0x110
[    1.896673]  ? __accept_page+0x10b/0x170
[    1.898042]  cond_accept_memory+0x1dc/0x200
[    1.899496]  get_page_from_freelist+0x1ad/0x1380
[    1.901086]  __alloc_frozen_pages_noprof+0xff/0x280
[    1.902760]  alloc_pages_mpol+0x111/0x1c0
[    1.904159]  alloc_pages_noprof+0x7c/0xf0
[    1.905535]  __p4d_alloc+0x31/0x110
[    1.906729]  preallocate_vmalloc_pages+0xdf/0x160
[    1.908397]  mm_core_init+0x25/0x60
[    1.909590]  start_kernel+0x16a/0x400
[    1.910850]  x86_64_start_reservations+0x20/0x20
[    1.912454]  x86_64_start_kernel+0xaa/0xb0
[    1.913856]  common_startup_64+0x13e/0x140
[    1.915269]  </TASK>
[    1.916023] CR2: 00000000000001c1
[    1.917183] ---[ end trace 0000000000000000 ]---
[    1.918764] RIP: 0010:__queue_work+0x3f/0x610

This patch fixes it:

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 9540b41894da..ea5f7e0b675d 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -964,6 +964,9 @@ struct zone {
 #ifdef CONFIG_UNACCEPTED_MEMORY
 	/* Pages to be accepted. All pages on the list are MAX_PAGE_ORDER */
 	struct list_head	unaccepted_pages;
+
+	/* To be called once last page in the zone is accepted */
+	struct work_struct	unaccepted_cleanup;
 #endif
 
 	/* zone flags, see below */
diff --git a/mm/internal.h b/mm/internal.h
index 109ef30fee11..f2e6d42af6eb 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1516,6 +1516,7 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
 
 #ifdef CONFIG_UNACCEPTED_MEMORY
 void accept_page(struct page *page);
+void unaccepted_cleanup_work(struct work_struct *work);
 #else /* CONFIG_UNACCEPTED_MEMORY */
 static inline void accept_page(struct page *page)
 {
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 2630cc30147e..d5a51f65dc4d 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1404,6 +1404,7 @@ static void __meminit zone_init_free_lists(struct zone *zone)
 
 #ifdef CONFIG_UNACCEPTED_MEMORY
 	INIT_LIST_HEAD(&zone->unaccepted_pages);
+	INIT_WORK(&zone->unaccepted_cleanup, unaccepted_cleanup_work);
 #endif
 }
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 4fe93029bcb6..1b776d0c7784 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6921,6 +6921,11 @@ static DEFINE_STATIC_KEY_FALSE(zones_with_unaccepted_pages);
 
 static bool lazy_accept = true;
 
+void unaccepted_cleanup_work(struct work_struct *work)
+{
+	static_branch_dec(&zones_with_unaccepted_pages);
+}
+
 static int __init accept_memory_parse(char *p)
 {
 	if (!strcmp(p, "lazy")) {
@@ -6959,8 +6964,27 @@ static void __accept_page(struct zone *zone, unsigned long *flags,
 
 	__free_pages_ok(page, MAX_PAGE_ORDER, FPI_TO_TAIL);
 
-	if (last)
-		static_branch_dec(&zones_with_unaccepted_pages);
+	if (last) {
+		/*
+		 * There are two corner cases:
+		 *
+		 * - If allocation occurs during the CPU bring up,
+		 *   static_branch_dec() cannot be used directly as
+		 *   it causes a deadlock on cpu_hotplug_lock.
+		 *
+		 *   Instead, use schedule_work() to prevent deadlock.
+		 *
+		 * - If allocation occurs before workqueues are initialized,
+		 *   static_branch_dec() should be directly.
+		 *
+		 *   Workqueues are initialized before CPU bring up, so this
+		 *   will not conflict with the first scenario.
+		 */
+		if (system_wq)
+			schedule_work(&zone->unaccepted_cleanup);
+		else
+			unaccepted_cleanup_work(&zone->unaccepted_cleanup);
+	}
 }
 
 void accept_page(struct page *page)
-- 
  Kiryl Shutsemau / Kirill A. Shutemov

