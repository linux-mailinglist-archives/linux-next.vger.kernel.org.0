Return-Path: <linux-next+bounces-2682-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BADD918E80
	for <lists+linux-next@lfdr.de>; Wed, 26 Jun 2024 20:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10EBE288976
	for <lists+linux-next@lfdr.de>; Wed, 26 Jun 2024 18:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20E2190679;
	Wed, 26 Jun 2024 18:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNiZu23O"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D462C19067D;
	Wed, 26 Jun 2024 18:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719426561; cv=none; b=MsYwSJHo/ul6j1pLo60F76u/prLlLYl0+K6TiCcz96UkNUXvb82kD1VdW9GsKiqGUGBr9VwfTO8w2gHUb/PfbLWMPuWLwO1OjEbHBVxYO07/9fmNch1cAfABoYv6kV1kNXAcwEvxMWqczMipLl3A7pwTCWSbkqkobTEjCfMFK7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719426561; c=relaxed/simple;
	bh=0K15dYsBHbe6nUOdOFuuNPCUmqXkIKchea8H6yZTvsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VVx0CbfcQq/pi7WgM5z0QGFeLX2TVabTMdcbwVaIlfQDk6eihcd1sGWWivvRuehH9XKM3Nn/7uQSpdrkQnKPJwlCyMqcF+YVqSxLA5iUtmiv+7g7wPFmIdk8e/Qv3IA1foR1e3vmws9vQNel4JiMk6UOYVYlKF6ZhrpCNZ17XDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fNiZu23O; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a724a8097deso523110966b.1;
        Wed, 26 Jun 2024 11:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719426558; x=1720031358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHth2jg03MyzlLGWwQhmcfXuJ3Ll6vS/X6TQn7gC9gU=;
        b=fNiZu23Os0SkxUQBgWvPwZqZrdSKUCwZhcuNH2PL8erJYdV7Z7qNAtOAli3FbPIRda
         ef3GZLjlKZ1UYpwiUr8jmdoP3PT94l+cqxycx5btD8LcszYa3Joif8pgGw5+ok2NosuK
         9jRhtSwyJop7e2b1Y2j23kmXxbDuKw/SERK5jzy3q09SByxZm4aMQa9ZKbGVUA0yJ/Ti
         QUb5dh0j25YSaiT4iLC9vuJMJMvrKjZGlNd78RGVJ3thcICwynyko/3SUSg8ABN9NslI
         BhYvZ6nu/1M+HT7qXXKlwqDyo63Rk3mL1JjaqYq9SaTq44ZX63e9KF/FjGVaIYl9BuC8
         0k7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719426558; x=1720031358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHth2jg03MyzlLGWwQhmcfXuJ3Ll6vS/X6TQn7gC9gU=;
        b=dq+IwJvddW3Q1X+rO0CBFIVI2hyv0hFE7chj2p6JVp+QWQWQerC9YlDmYgEQ209cpV
         riO284vmDVODuewlEq81wletJGGfm9jTRGlNfkJp1vFZkN9No1Vw9ygaBBNCS9kyOXb7
         SgAplmfYrciREV+fxx1ktHgZXtXfd4Qty6/KQGbvRO4K9iDk3QitAzZGLsOD7wBiupFq
         ZaTBx3qSECS4YE+su6wAm+2BqkUissZDWH9tziPeSUVdX+0CuCq1XZMXaeGHIK1Wfq2f
         350KVH/J7QqZOrtU4F9gqgDssfzVaMsZcbtiA287HFqoGlFiUcTI2iDr+87rlei22E3p
         yrHA==
X-Forwarded-Encrypted: i=1; AJvYcCXW3N/re/UFqu0Y6HJfKHWG0JYB9MZBIhC4bgdJgVlAxehWI2KekadESkkTJs0l+eJ2B4Ot+hH4KWSTHaRGJCHa6aDM06FgdCdGfQ==
X-Gm-Message-State: AOJu0YxFIvU8nk2DPteqQTBzsn2KEP5SDXBt/Q/uAvUQUng4ClgexYZp
	2CJTaiA7C9T7XJRJo3E50+RquVpckALcM62UJJwv+K7x9a2VBxgc5NwgIbn9ntzZkXnb369G3a0
	slFrQYhRqweRpPYw4VckkkBpg3wk=
X-Google-Smtp-Source: AGHT+IE56tMz5yJHM6jMYjSTITH/k6cETcRVV8HNXzURrHqxIY57xRea3BG/AgPCMtmm2DbAUKqHnhnoRWbcYilqhMg=
X-Received: by 2002:a17:906:11d8:b0:a6f:b284:4279 with SMTP id
 a640c23a62f3a-a7242cb6f1dmr732413566b.36.1719426557823; Wed, 26 Jun 2024
 11:29:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240604174145.563900-1-sidhartha.kumar@oracle.com>
 <20240604174145.563900-14-sidhartha.kumar@oracle.com> <nchlkncjvmkhyw3fcp73defvj2dfd4ylheajlvtcfcvvs7ipo7@3xdxzwaa7duf>
 <ce163edf-6dc6-456b-b1b7-e2f15049a8dc@oracle.com>
In-Reply-To: <ce163edf-6dc6-456b-b1b7-e2f15049a8dc@oracle.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 26 Jun 2024 20:29:05 +0200
Message-ID: <CAGudoHHpYpL8HYGSJ9TBLpGXqcBvgASvjyub_Hm6CoJgpOD3cQ@mail.gmail.com>
Subject: Re: [PATCH 13/18] maple_tree: simplify mas_commit_b_node()
To: Sidhartha Kumar <sidhartha.kumar@oracle.com>
Cc: linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org, 
	linux-mm@kvack.org, akpm@linux-foundation.org, liam.howlett@oracle.com, 
	zhangpeng.00@bytedance.com, willy@infradead.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 7:45=E2=80=AFPM Sidhartha Kumar
<sidhartha.kumar@oracle.com> wrote:
>
> On 6/26/24 3:40 AM, Mateusz Guzik wrote:
> > On Tue, Jun 04, 2024 at 10:41:40AM -0700, Sidhartha Kumar wrote:
> >> Use mas->store_type to simplify the logic of identifying the type of
> >> write.
> >>
> >> Signed-off-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
> >> ---
> >>   lib/maple_tree.c | 6 ++----
> >>   1 file changed, 2 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> >> index 314691fd1c67..faadddbe2086 100644
> >> --- a/lib/maple_tree.c
> >> +++ b/lib/maple_tree.c
> >> @@ -3437,12 +3437,10 @@ static noinline_for_kasan int mas_commit_b_nod=
e(struct ma_wr_state *wr_mas,
> >>      enum maple_type b_type =3D b_node->type;
> >>
> >>      old_enode =3D wr_mas->mas->node;
> >> -    if ((b_end < mt_min_slots[b_type]) &&
> >> -        (!mte_is_root(old_enode)) &&
> >> -        (mas_mt_height(wr_mas->mas) > 1))
> >> +    if (wr_mas->mas->store_type =3D=3D wr_rebalance)
> >>              return mas_rebalance(wr_mas->mas, b_node);
> >>
> >> -    if (b_end >=3D mt_slots[b_type])
> >> +    if (wr_mas->mas->store_type =3D=3D wr_split_store)
> >>              return mas_split(wr_mas->mas, b_node);
> >>
> >>      if (mas_reuse_node(wr_mas, b_node, end))
> >
> >
> > This reliably results in "kernel BUG at mm/mmap.c:3412!".
> >
> > bt below
> >
> > reliably reproduces as follows: spawn "perf top", hit enter twice to
> > disassemble a func. tui hangs indefinitely, console shows the splat
> > below.
> >
>
> Hello,
>
> Thanks for your report. When I run perf top and disassemble a function tu=
i
> doesn't hang. In dmesg I see:
>
> [   17.836399] perf: interrupt took too long (2705 > 2500), lowering
> kernel.perf_event_max_sample_rate to 73000
> [   17.837532] perf: interrupt took too long (3561 > 3381), lowering
> kernel.perf_event_max_sample_rate to 56000
> [   17.838818] perf: interrupt took too long (4654 > 4451), lowering
> kernel.perf_event_max_sample_rate to 42000
> [   17.840267] perf: interrupt took too long (5930 > 5817), lowering
> kernel.perf_event_max_sample_rate to 33000
>
>
> but not the bug that your seeing. Could you send your config file so I co=
uld
> test with that?
>

https://people.freebsd.org/~mjg/.linux-crap/.config-maple-crash

I verified again this reliably crashes when going to:
commit 30e5748b1d44e3eefc41773e27c63e51910ed718 (HEAD)
Author: Sidhartha Kumar <sidhartha.kumar@oracle.com>
Date:   Tue Jun 18 13:47:45 2024 -0700

    maple_tree: simplify mas_commit_b_node()

on linux-next

Userspace is Debian 12 (which may be of significance), but just in
case I'll note I'm building the kernel on a Ubuntu 24.04.

> Thanks,
> Sid
>
>
>
> > I verified going one commit down produces a working kernel.
> >
> > kernel BUG at mm/mmap.c:3412!
> > [   35.820042] Oops: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> > [   35.821101] CPU: 4 PID: 1066 Comm: perf-top-UI Tainted: G        W  =
        6.10.0-rc5-00304-g30e5748b1d44 #155
> > [   35.822929] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS=
 rel-1.16.1-0-g3208b098f51a-prebuilt.qemu.org 04/01/2014
> > [   35.824957] RIP: 0010:exit_mmap+0x392/0x3a0
> > [   35.825794] Code: ef e8 02 9f fe ff eb d7 be 01 00 00 00 48 89 ef e8=
 73 a3 fe ff eb be 31 f6 48 89 ef
> > e8 a7 a2 fe ff eb a8 0f 0b e9 75 fe ff ff <0f> 0b e8 a7 b2 c1 00 0f 1f =
80 00 00 00 00 90 90 90 90 90 90 90 90
> > [   35.829141] RSP: 0018:ff7fe6c8c2393c40 EFLAGS: 00010293
> > [   35.830103] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000=
000000000
> > [   35.831398] RDX: ff39fe34499c3c00 RSI: 0000000000000001 RDI: ff39fe3=
4499c3c08
> > [   35.832705] RBP: ff39fe3441a28580 R08: 000000000000000c R09: 0000000=
000000060
> > [   35.834010] R10: ff39fe3450ad5600 R11: 0000000000000000 R12: 0000000=
0000000e8
> > [   35.835295] R13: 0000000000003593 R14: ff39fe3441a28628 R15: ff39fe3=
441a285c0
> > [   35.836569] FS:  0000000000000000(0000) GS:ff39fe39a7700000(0000) kn=
lGS:0000000000000000
> > [   35.838042] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   35.839093] CR2: 00007efd624f39ed CR3: 000000010130e001 CR4: 0000000=
000371ef0
> > [   35.840389] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000=
000000000
> > [   35.841892] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: 0000000=
000000400
> > [   35.843182] Call Trace:
> > [   35.843646]  <TASK>
> > [   35.844051]  ? die+0x36/0x90
> > [   35.844602]  ? do_trap+0xdd/0x100
> > [   35.845226]  ? exit_mmap+0x392/0x3a0
> > [   35.845915]  ? do_error_trap+0x65/0x80
> > [   35.846614]  ? exit_mmap+0x392/0x3a0
> > [   35.847287]  ? exc_invalid_op+0x50/0x70
> > [   35.847999]  ? exit_mmap+0x392/0x3a0
> > [   35.848662]  ? asm_exc_invalid_op+0x1a/0x20
> > [   35.849437]  ? exit_mmap+0x392/0x3a0
> > [   35.850120]  __mmput+0x3d/0x130
> > [   35.850713]  begin_new_exec+0x4ed/0xb00
> > [   35.851428]  ? load_elf_phdrs+0x6c/0xc0
> > [   35.852150]  load_elf_binary+0x2ca/0x15a0
> > [   35.852890]  ? __kernel_read+0x1d8/0x2f0
> > [   35.853621]  ? __kernel_read+0x1d8/0x2f0
> > [   35.854348]  ? load_misc_binary+0x1f6/0x310
> > [   35.855113]  bprm_execve+0x243/0x600
> > [   35.855784]  do_execveat_common.isra.0+0x1bd/0x220
> > [   35.856672]  __x64_sys_execve+0x36/0x40
> > [   35.857384]  do_syscall_64+0x52/0x150
> > [   35.858088]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > [   35.859014] RIP: 0033:0x7efd624f3a17
> > [   35.859677] Code: Unable to access opcode bytes at 0x7efd624f39ed.
> > [   35.860790] RSP: 002b:00007efd48bf8dc8 EFLAGS: 00000202 ORIG_RAX: 00=
0000000000003b
> > [   35.862170] RAX: ffffffffffffffda RBX: 000055e5736a44e3 RCX: 00007ef=
d624f3a17
> > [   35.863472] RDX: 000055e59c315000 RSI: 00007efd48bf9050 RDI: 000055e=
5736a44e3
> > [   35.864768] RBP: 00007efd48bf8e40 R08: 0000000000000000 R09: 00007ef=
d48c006c0
> > [   35.866475] R10: 00007efd62430e50 R11: 0000000000000202 R12: 00007ef=
d48bf9050
> > [   35.868167] R13: 000055e59c315000 R14: 0000000000000001 R15: 0000000=
000000001
> > [   35.869873]  </TASK>
> > [   35.870676] Modules linked in:
> > [   35.871944] ---[ end trace 0000000000000000 ]---
> >
>


--=20
Mateusz Guzik <mjguzik gmail.com>

