Return-Path: <linux-next+bounces-2675-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EF7917E5A
	for <lists+linux-next@lfdr.de>; Wed, 26 Jun 2024 12:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31A9E1F2181E
	for <lists+linux-next@lfdr.de>; Wed, 26 Jun 2024 10:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA68171E7F;
	Wed, 26 Jun 2024 10:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+w4kgbF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75D9168487;
	Wed, 26 Jun 2024 10:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719398435; cv=none; b=MlRbOr6dYrTk596XZLqKLCWTNlvKIx/rw78ejkkoiyW/8m/MEiqL3RSmMHJqqZ2m3K0NfflYMyVTw7sS7bHb6KZKxKNpXiNtBXfba+kosF3ZV+N/09V9K8p04+OA2w1rCm8hnkjnXe1Rmy10aNUsAYsy68tsnIpUIipkvXeJzbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719398435; c=relaxed/simple;
	bh=4mNJ8RY4txGIapVkcakuKQ6Smhz6G83yWUYAWlPWqr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sj5IYPInMTOrqcrtpB2x4uTSrBly3z85/SxCWp43xL0vyZeDbhfl9odCnDpnFmkBmd1TGVHZmP2XFMaUwmn6ly5qWi/M57YK2EML3Qwr7IJV8ODBjTiwLwiUWNhwWPbrcXZSCxLsPoBQXx6V9JatHLd1SndurUZ5X0Ks2Xiuntg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+w4kgbF; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a7245453319so77744466b.1;
        Wed, 26 Jun 2024 03:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719398432; x=1720003232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IQLJslRmp35dAty14Bkyn/09X3ZFzPi4C80P20DsF14=;
        b=e+w4kgbFUumbUF1OKNw4k6ItlnPF2R3Qcj2kd1y9eNoiYjquXfoDRSABD0W5VzNpr0
         8toqW4rstlV4GSeN8qtOR1c19Yx0eKKRQO0YVvsr4/clYtuMdq582meXkV58vF0Blb9B
         AP1wa6ATdPPpn98OUk3hjtizkpg3v1Ry15QCEA4MsBVaBPofk3pOGP3wIJOjfeFVzkg/
         Wk01S/gpcTxlfc7tq5mMrZCEfo6ry4i0UNmDNpmZpKZLmMcnMJd9t0wnXseHnlG1EZGH
         /8kgQVcr2+LD1zXzSCHkC4e8ijDoavoqDWfhEnXSD9PE+D2O6O10WINeppFf+bUFC5cB
         ljqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719398432; x=1720003232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQLJslRmp35dAty14Bkyn/09X3ZFzPi4C80P20DsF14=;
        b=nLCsvCeDTxqE/c8XKcG8o+dcqxR5jTXTH9d3roFvy8XsnUH2S1BkCKCeNY0XOsE2pz
         2i8YExB34hBtvhMQiLXA0yy6tAyxI3X4Y5YS2KXE0wXBf34anBTgb4x5ZvIDzrS8F5as
         6cRvAb99Yb5Bxool1TZt1EI2pTGg9l9zveB2nwVU9D99tUkZvGPrgTsVpRLWixAiLJi0
         U1vh6FlVIOzZ2Diro378TgNQKv0hlyGXHZKCgLhBxcsh4scYY4S9NKaAVv6exmCuWRSg
         tCbX+/osrSAqowBefn2gSUvcGICf5yRYi73QYUOum4b1vJGQNvRRLp/DY5UWObgqh2if
         z8pg==
X-Forwarded-Encrypted: i=1; AJvYcCWBYaF13N/JAGkqqpjAZKERJ6Ar0s48uaXgcP0dUJQjm7rJDern1XklOCjkNZNwmGD5ET8JyI3JeCzl9CXlgOY24goc7LHwSh/cPw==
X-Gm-Message-State: AOJu0YxYDufwfyWm/7DAlXGiTmpp1B/v4hWkBd8RLQ9RvEjLVl3529rD
	b6z925Q8082mWPpnN+gfFNyGoHShwAYqTVHdSzhYWNvgjk9jGOOy
X-Google-Smtp-Source: AGHT+IHs8dGwUI4zun9DFWLUhqAKKJkZxNvyOpUKz6Y4pU+UdQ/YA2tgGiq4xp9nJnwP4O2G8PZKBQ==
X-Received: by 2002:a17:907:d309:b0:a72:5760:1424 with SMTP id a640c23a62f3a-a727f9394ffmr290434666b.0.1719398431946;
        Wed, 26 Jun 2024 03:40:31 -0700 (PDT)
Received: from f (cst-prg-81-171.cust.vodafone.cz. [46.135.81.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7260bfb85csm224652966b.40.2024.06.26.03.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 03:40:31 -0700 (PDT)
Date: Wed, 26 Jun 2024 12:40:19 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: Sidhartha Kumar <sidhartha.kumar@oracle.com>
Cc: linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org, 
	linux-mm@kvack.org, akpm@linux-foundation.org, liam.howlett@oracle.com, 
	zhangpeng.00@bytedance.com, willy@infradead.org, linux-next@vger.kernel.org
Subject: Re: [PATCH 13/18] maple_tree: simplify mas_commit_b_node()
Message-ID: <nchlkncjvmkhyw3fcp73defvj2dfd4ylheajlvtcfcvvs7ipo7@3xdxzwaa7duf>
References: <20240604174145.563900-1-sidhartha.kumar@oracle.com>
 <20240604174145.563900-14-sidhartha.kumar@oracle.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240604174145.563900-14-sidhartha.kumar@oracle.com>

On Tue, Jun 04, 2024 at 10:41:40AM -0700, Sidhartha Kumar wrote:
> Use mas->store_type to simplify the logic of identifying the type of
> write.
> 
> Signed-off-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
> ---
>  lib/maple_tree.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> index 314691fd1c67..faadddbe2086 100644
> --- a/lib/maple_tree.c
> +++ b/lib/maple_tree.c
> @@ -3437,12 +3437,10 @@ static noinline_for_kasan int mas_commit_b_node(struct ma_wr_state *wr_mas,
>  	enum maple_type b_type = b_node->type;
>  
>  	old_enode = wr_mas->mas->node;
> -	if ((b_end < mt_min_slots[b_type]) &&
> -	    (!mte_is_root(old_enode)) &&
> -	    (mas_mt_height(wr_mas->mas) > 1))
> +	if (wr_mas->mas->store_type == wr_rebalance)
>  		return mas_rebalance(wr_mas->mas, b_node);
>  
> -	if (b_end >= mt_slots[b_type])
> +	if (wr_mas->mas->store_type == wr_split_store)
>  		return mas_split(wr_mas->mas, b_node);
>  
>  	if (mas_reuse_node(wr_mas, b_node, end))


This reliably results in "kernel BUG at mm/mmap.c:3412!".

bt below

reliably reproduces as follows: spawn "perf top", hit enter twice to
disassemble a func. tui hangs indefinitely, console shows the splat
below.

I verified going one commit down produces a working kernel.

kernel BUG at mm/mmap.c:3412!
[   35.820042] Oops: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
[   35.821101] CPU: 4 PID: 1066 Comm: perf-top-UI Tainted: G        W          6.10.0-rc5-00304-g30e5748b1d44 #155
[   35.822929] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.1-0-g3208b098f51a-prebuilt.qemu.org 04/01/2014
[   35.824957] RIP: 0010:exit_mmap+0x392/0x3a0
[   35.825794] Code: ef e8 02 9f fe ff eb d7 be 01 00 00 00 48 89 ef e8 73 a3 fe ff eb be 31 f6 48 89 ef
e8 a7 a2 fe ff eb a8 0f 0b e9 75 fe ff ff <0f> 0b e8 a7 b2 c1 00 0f 1f 80 00 00 00 00 90 90 90 90 90 90 90 90
[   35.829141] RSP: 0018:ff7fe6c8c2393c40 EFLAGS: 00010293
[   35.830103] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
[   35.831398] RDX: ff39fe34499c3c00 RSI: 0000000000000001 RDI: ff39fe34499c3c08
[   35.832705] RBP: ff39fe3441a28580 R08: 000000000000000c R09: 0000000000000060
[   35.834010] R10: ff39fe3450ad5600 R11: 0000000000000000 R12: 00000000000000e8
[   35.835295] R13: 0000000000003593 R14: ff39fe3441a28628 R15: ff39fe3441a285c0
[   35.836569] FS:  0000000000000000(0000) GS:ff39fe39a7700000(0000) knlGS:0000000000000000
[   35.838042] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   35.839093] CR2: 00007efd624f39ed CR3: 000000010130e001 CR4: 0000000000371ef0
[   35.840389] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   35.841892] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: 0000000000000400
[   35.843182] Call Trace:
[   35.843646]  <TASK>
[   35.844051]  ? die+0x36/0x90
[   35.844602]  ? do_trap+0xdd/0x100
[   35.845226]  ? exit_mmap+0x392/0x3a0
[   35.845915]  ? do_error_trap+0x65/0x80
[   35.846614]  ? exit_mmap+0x392/0x3a0
[   35.847287]  ? exc_invalid_op+0x50/0x70
[   35.847999]  ? exit_mmap+0x392/0x3a0
[   35.848662]  ? asm_exc_invalid_op+0x1a/0x20
[   35.849437]  ? exit_mmap+0x392/0x3a0
[   35.850120]  __mmput+0x3d/0x130
[   35.850713]  begin_new_exec+0x4ed/0xb00
[   35.851428]  ? load_elf_phdrs+0x6c/0xc0
[   35.852150]  load_elf_binary+0x2ca/0x15a0
[   35.852890]  ? __kernel_read+0x1d8/0x2f0
[   35.853621]  ? __kernel_read+0x1d8/0x2f0
[   35.854348]  ? load_misc_binary+0x1f6/0x310
[   35.855113]  bprm_execve+0x243/0x600
[   35.855784]  do_execveat_common.isra.0+0x1bd/0x220
[   35.856672]  __x64_sys_execve+0x36/0x40
[   35.857384]  do_syscall_64+0x52/0x150
[   35.858088]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   35.859014] RIP: 0033:0x7efd624f3a17
[   35.859677] Code: Unable to access opcode bytes at 0x7efd624f39ed.
[   35.860790] RSP: 002b:00007efd48bf8dc8 EFLAGS: 00000202 ORIG_RAX: 000000000000003b
[   35.862170] RAX: ffffffffffffffda RBX: 000055e5736a44e3 RCX: 00007efd624f3a17
[   35.863472] RDX: 000055e59c315000 RSI: 00007efd48bf9050 RDI: 000055e5736a44e3
[   35.864768] RBP: 00007efd48bf8e40 R08: 0000000000000000 R09: 00007efd48c006c0
[   35.866475] R10: 00007efd62430e50 R11: 0000000000000202 R12: 00007efd48bf9050
[   35.868167] R13: 000055e59c315000 R14: 0000000000000001 R15: 0000000000000001
[   35.869873]  </TASK>
[   35.870676] Modules linked in:
[   35.871944] ---[ end trace 0000000000000000 ]---


