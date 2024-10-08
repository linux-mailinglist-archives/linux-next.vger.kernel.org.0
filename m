Return-Path: <linux-next+bounces-4146-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F46994E54
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 15:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E19BB28174
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 13:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587D91DF24A;
	Tue,  8 Oct 2024 13:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PcNaA1L7"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C1A1DF251
	for <linux-next@vger.kernel.org>; Tue,  8 Oct 2024 13:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728393082; cv=none; b=Qm0niM9WP964VH7bQ/xEVyjMnzAg6RzLUWklT5NiQGXNs54DtM0TxbCKumsIWteoUB+otKf6t+PJ95SocKeazhsNSkqYIxKo4/+ojP5Vn6/jTfMMsgXi59gWPh/APhpxQfAS55CkEgfWBuXRYcewewp+/BV5eJJTYLK/0I51c1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728393082; c=relaxed/simple;
	bh=g4LkqEN3dYgiM8VjT20OoFm7VORQJNkkf/HeINmnowM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SbT9pmVEEV/IH31SEzbIbs3n1Owtm0gis6tBTvllIPEPOohms9j+HAliXwgGtbA0R1qOBRnDj4tlbk9HzsHbw18CR4u9csEaQZYbfPhFgDRGTLCuco5wO4CYJpvJmdZFkaftiE+d2ZAhT5DFId1J7vE2+y1MDuPHBT+1FibNvO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PcNaA1L7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728393079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mXA2lalUCXsfo+LGy+ufmP1K/Zeb2aqRU3I87tuemdw=;
	b=PcNaA1L7JSh/GqqGZKoTC5RYnHp+sf6bA510Ap6KduL6Mlzz3LmiYdfLVSemERpFlPimkS
	fW9obw3GWLL6tEJp/EAoxNNt4Uh6Xzdld+31Nut+dX2k4uCYQXeYdhOjJitOTm3eMLYOA+
	2UTtKyVtyrObxdURoFedBTUYaSg6Eig=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-ur6pViInMGSTav_aATMHDw-1; Tue, 08 Oct 2024 09:11:18 -0400
X-MC-Unique: ur6pViInMGSTav_aATMHDw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42cb479fab2so30726885e9.1
        for <linux-next@vger.kernel.org>; Tue, 08 Oct 2024 06:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728393077; x=1728997877;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXA2lalUCXsfo+LGy+ufmP1K/Zeb2aqRU3I87tuemdw=;
        b=AA1uFIGhij7QEkwTxSONA7Wcu/TMCZKfX5cLPXvUJgUuWCqHVmCcsXlKC0P1bXhCxR
         PPVhMvCJX8pdSFIVfBcunHL9IqVaW4CfJsElfe9pRkOL4VzVWbPj4mrsiXJzj83pzRgQ
         rKaF9bfBc6wLGtgxMg1PJPvk/qeL6gauNw3eawgzW+AAqvOhbdr72KvO2IB4WHZXFIWm
         E0UlQeeWJXhnigkRqgHgVzkwxVnWCv8oaFprNJfqlm1C0zPWPqo+jDJw9MSSauo9l1Ay
         awxWJ4ixb18LP89CTp/2yJ+fz55m3dCa6INep/8yGBRRjLgl/hlrrQCnBGMhd9zksiC5
         HQYg==
X-Forwarded-Encrypted: i=1; AJvYcCWfBtZ6QWaSwHUrNtLw/7/ymvkbdtvy8Yopu8R9n72h1DIZLIMTw25GJ0LgOB1DT4PDQmDsCBzqW/4u@vger.kernel.org
X-Gm-Message-State: AOJu0YyC9VVdL79qqjj8oRhrUJ9zSTV2jwGaV6VmStOvL/CKVL8uJmNR
	HV6noSFwhq4AdMkH6in0/T1Y71PxL0vWMToQsFlfETYW+Haqq7yB9cFxuQ5fWCAKxvTxYFBRQUL
	U+270aNECHIWEnG2cfZffBwKsSXavGf0+Bw8yPO5jzCTpglMcJEEzoA18j1E=
X-Received: by 2002:a05:600c:458f:b0:424:8743:86b4 with SMTP id 5b1f17b1804b1-42f94bcdbf3mr19991115e9.6.1728393076623;
        Tue, 08 Oct 2024 06:11:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQ9Icv6swARE96wMfKHpxOWRwGgHLFFetY92FUJK5ycuYVhhqbMKEqiHNjWfSQHcapO9uAtA==
X-Received: by 2002:a05:600c:458f:b0:424:8743:86b4 with SMTP id 5b1f17b1804b1-42f94bcdbf3mr19990955e9.6.1728393076150;
        Tue, 08 Oct 2024 06:11:16 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72f:c700:a76f:473d:d5cf:25a8? (p200300cbc72fc700a76f473dd5cf25a8.dip0.t-ipconnect.de. [2003:cb:c72f:c700:a76f:473d:d5cf:25a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1695e5fbsm8103565f8f.73.2024.10.08.06.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 06:11:15 -0700 (PDT)
Message-ID: <5e42fd02-1470-4e4e-892b-edefd32fbc5a@redhat.com>
Date: Tue, 8 Oct 2024 15:11:14 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] linux-next test error: kernel BUG in
 folio_add_new_anon_rmap
To: syzbot <syzbot+619c487ed60780dab217@syzkaller.appspotmail.com>,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-next@vger.kernel.org, sfr@canb.auug.org.au,
 syzkaller-bugs@googlegroups.com
References: <6704d667.050a0220.1e4d62.0082.GAE@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <6704d667.050a0220.1e4d62.0082.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.10.24 08:51, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    58ca61c1a866 Add linux-next specific files for 20241004
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=1265e7d0580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=94f9caf16c0af42d
> dashboard link: https://syzkaller.appspot.com/bug?extid=619c487ed60780dab217
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/ff0999f3e964/disk-58ca61c1.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/d0d9a5bad786/vmlinux-58ca61c1.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/3b53cdc9ba34/bzImage-58ca61c1.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+619c487ed60780dab217@syzkaller.appspotmail.com
> 
> cfg80211: Loading compiled-in X.509 certificates for regulatory database
> Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
> Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db18c600'
> clk: Disabling unused clocks
> ALSA device list:
>    #0: Dummy 1
>    #1: Loopback 1
>    #2: Virtual MIDI Card 1
> md: Waiting for all devices to be available before autodetect
> md: If you don't use raid, use raid=noautodetect
> md: Autodetecting RAID arrays.
> md: autorun ...
> md: ... autorun DONE.
> EXT4-fs (sda1): mounted filesystem b4773fba-1738-4da0-8a90-0fe043d0a496 ro with ordered data mode. Quota mode: none.
> VFS: Mounted root (ext4 filesystem) readonly on device 8:1.
> devtmpfs: mounted
> Freeing unused kernel image (initmem) memory: 26720K
> Write protecting the kernel read-only data: 219136k
> Freeing unused kernel image (rodata/data gap) memory: 1108K
> x86/mm: Checked W+X mappings: passed, no W+X pages found.
> x86/mm: Checking user space page tables
> x86/mm: Checked W+X mappings: passed, no W+X pages found.
> Failed to set sysctl parameter 'max_rcu_stall_to_panic=1': parameter not found
> Run /sbin/init as init process
> page: refcount:1 mapcount:1 mapping:0000000000000000 index:0x7fffffffe pfn:0x13fe93
> memcg:ffff888140adc000
> anon flags: 0x17ff00000020008(uptodate|swapbacked|node=0|zone=2|lastcpupid=0x7ff)
> raw: 017ff00000020008 0000000000000000 dead000000000122 ffff888030587001
> raw: 00000007fffffffe 0000000000000000 0000000100000000 ffff888140adc000
> page dumped because: VM_BUG_ON_PAGE(PageAnonNotKsm(page))
> page_owner tracks the page as allocated
> page last allocated via order 0, migratetype Movable, gfp_mask 0x140dca(GFP_HIGHUSER_MOVABLE|__GFP_COMP|__GFP_ZERO), pid 1, tgid 1 (swapper/0), ts 14891998308, free_ts 0
>   set_page_owner include/linux/page_owner.h:32 [inline]
>   post_alloc_hook+0x1f3/0x230 mm/page_alloc.c:1537
>   prep_new_page mm/page_alloc.c:1545 [inline]
>   get_page_from_freelist+0x3129/0x3270 mm/page_alloc.c:3493
>   __alloc_pages_noprof+0x256/0x6c0 mm/page_alloc.c:4769
>   alloc_pages_mpol_noprof+0x3e8/0x680 mm/mempolicy.c:2265
>   folio_alloc_mpol_noprof mm/mempolicy.c:2283 [inline]
>   vma_alloc_folio_noprof+0x12e/0x230 mm/mempolicy.c:2314
>   folio_prealloc+0x31/0x170
>   alloc_anon_folio mm/memory.c:4738 [inline]
>   do_anonymous_page mm/memory.c:4795 [inline]
>   do_pte_missing mm/memory.c:3971 [inline]
>   handle_pte_fault+0x2518/0x6830 mm/memory.c:5778
>   __handle_mm_fault mm/memory.c:5921 [inline]
>   handle_mm_fault+0x1106/0x1bb0 mm/memory.c:6089
>   faultin_page mm/gup.c:1187 [inline]
>   __get_user_pages+0x1b16/0x48d0 mm/gup.c:1485
>   __get_user_pages_locked mm/gup.c:1751 [inline]
>   get_user_pages_remote+0x31e/0xb60 mm/gup.c:2618
>   get_arg_page+0x266/0x580 fs/exec.c:225
>   copy_string_kernel+0x148/0x1f0 fs/exec.c:684
>   kernel_execve+0x5e2/0xa50 fs/exec.c:1999
>   try_to_run_init_process init/main.c:1394 [inline]
>   kernel_init+0xed/0x2b0 init/main.c:1522
>   ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
> page_owner free stack trace missing
> ------------[ cut here ]------------
> kernel BUG at include/linux/page-flags.h:1134!
> Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
> CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.12.0-rc1-next-20241004-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
> RIP: 0010:SetPageAnonExclusive include/linux/page-flags.h:1134 [inline]
> RIP: 0010:folio_add_new_anon_rmap+0x14d3/0x1fe0 mm/rmap.c:1442
> Code: ff 0f 00 00 0f 84 9e 02 00 00 e8 28 91 a9 ff e9 fa ec ff ff e8 1e 91 a9 ff 48 8b 3c 24 48 c7 c6 e0 ff 15 8c e8 3e 13 f5 ff 90 <0f> 0b e8 06 91 a9 ff 48 89 ef 48 c7 c6 a0 00 16 8c e8 27 13 f5 ff
> RSP: 0000:ffffc90000067348 EFLAGS: 00010246
> RAX: 3219d577e7cba600 RBX: 0000000000000001 RCX: ffffc90000066f03
> RDX: 0000000000000003 RSI: ffffffff8c0adc40 RDI: ffffffff8c610f60
> RBP: 0000000000000000 R08: ffffffff901d2caf R09: 1ffffffff203a595
> R10: dffffc0000000000 R11: fffffbfff203a596 R12: 00000007fffffffe
> R13: 1ffff1100614ca00 R14: ffff888030587001 R15: ffff888030a65078
> FS:  0000000000000000(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000000 CR3: 000000000e734000 CR4: 00000000003526f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>   <TASK>
>   do_anonymous_page mm/memory.c:4841 [inline]
>   do_pte_missing mm/memory.c:3971 [inline]
>   handle_pte_fault+0x4aec/0x6830 mm/memory.c:5778
>   __handle_mm_fault mm/memory.c:5921 [inline]
>   handle_mm_fault+0x1106/0x1bb0 mm/memory.c:6089
>   faultin_page mm/gup.c:1187 [inline]
>   __get_user_pages+0x1b16/0x48d0 mm/gup.c:1485
>   __get_user_pages_locked mm/gup.c:1751 [inline]
>   get_user_pages_remote+0x31e/0xb60 mm/gup.c:2618
>   get_arg_page+0x266/0x580 fs/exec.c:225
>   copy_string_kernel+0x148/0x1f0 fs/exec.c:684
>   kernel_execve+0x5e2/0xa50 fs/exec.c:1999
>   try_to_run_init_process init/main.c:1394 [inline]
>   kernel_init+0xed/0x2b0 init/main.c:1522
>   ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
>   </TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:SetPageAnonExclusive include/linux/page-flags.h:1134 [inline]
> RIP: 0010:folio_add_new_anon_rmap+0x14d3/0x1fe0 mm/rmap.c:1442
> Code: ff 0f 00 00 0f 84 9e 02 00 00 e8 28 91 a9 ff e9 fa ec ff ff e8 1e 91 a9 ff 48 8b 3c 24 48 c7 c6 e0 ff 15 8c e8 3e 13 f5 ff 90 <0f> 0b e8 06 91 a9 ff 48 89 ef 48 c7 c6 a0 00 16 8c e8 27 13 f5 ff
> RSP: 0000:ffffc90000067348 EFLAGS: 00010246
> RAX: 3219d577e7cba600 RBX: 0000000000000001 RCX: ffffc90000066f03
> RDX: 0000000000000003 RSI: ffffffff8c0adc40 RDI: ffffffff8c610f60
> RBP: 0000000000000000 R08: ffffffff901d2caf R09: 1ffffffff203a595
> R10: dffffc0000000000 R11: fffffbfff203a596 R12: 00000007fffffffe
> R13: 1ffff1100614ca00 R14: ffff888030587001 R15: ffff888030a65078
> FS:  0000000000000000(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000000 CR3: 000000000e734000 CR4: 00000000003526f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup
> 

#syz fix: mm-add-pageanonnotksm-fix


-- 
Cheers,

David / dhildenb


