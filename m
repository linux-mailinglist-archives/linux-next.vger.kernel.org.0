Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3D5F1B4AC6
	for <lists+linux-next@lfdr.de>; Wed, 22 Apr 2020 18:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgDVQoT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Apr 2020 12:44:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38902 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726147AbgDVQoT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Apr 2020 12:44:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587573857;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=c0nWZoKPKTTJxXUMabK38nbk8dEd9Y8pN0ufpg96O1o=;
        b=UxLJZKb9MsRkBwiV1hzfSJOLlw3CH1uYFVthQ04Q3uWktLB66xz1PgxEyPzKYRAADwny75
        I7GZcsNXki14vu377EoIURykev/4LSlUG4dQTsZcq74YU9qAtHZM0woqtHu9ou0NxybMRy
        LXI3VDY9C+zGidn9KqHPOpoi112VjJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-9W6c9HByNa2NbULOmEnGpw-1; Wed, 22 Apr 2020 12:44:11 -0400
X-MC-Unique: 9W6c9HByNa2NbULOmEnGpw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D753418FE860;
        Wed, 22 Apr 2020 16:44:09 +0000 (UTC)
Received: from treble (ovpn-117-114.rdu2.redhat.com [10.10.117.114])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 957706084B;
        Wed, 22 Apr 2020 16:44:08 +0000 (UTC)
Date:   Wed, 22 Apr 2020 11:44:06 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: Tree for Apr 22 (objtool warnings)
Message-ID: <20200422164406.qhvd2my35wnjlzyg@treble>
References: <20200422171016.484b031d@canb.auug.org.au>
 <2bf0635d-1406-23db-28c7-e55da9a07e05@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2bf0635d-1406-23db-28c7-e55da9a07e05@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Apr 22, 2020 at 08:35:29AM -0700, Randy Dunlap wrote:
> On 4/22/20 12:10 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200421:
> > 
> 
> on x86_64:

In both cases the unreachable instruction happens immediately after a
call to a function which is truncated with a UD2 (because of
UBSAN_TRAP).

When I remove UBSAN_TRAP, the UD2s are replaced with calls to
__ubsan_handle_type_mismatch_v1().

Kees, any idea?

> arch/x86/net/bpf_jit_comp.o: warning: objtool: bpf_int_jit_compile()+0x246: unreachable instruction

00000000000010a1 <do_jit>:
    10a1:	55                   	push   %rbp
    10a2:	53                   	push   %rbx
    10a3:	48 81 ec d0 00 00 00 	sub    $0xd0,%rsp
    10aa:	48 89 fb             	mov    %rdi,%rbx
    10ad:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
    10b4:	00 00 
    10b6:	48 89 84 24 c8 00 00 	mov    %rax,0xc8(%rsp)
    10bd:	00 
    10be:	31 c0                	xor    %eax,%eax
    10c0:	48 8b bc 24 e0 00 00 	mov    0xe0(%rsp),%rdi
    10c7:	00 
    10c8:	e8 00 00 00 00       	callq  10cd <do_jit+0x2c>
			10c9: R_X86_64_PLT32	__tsan_func_entry-0x4
    10cd:	f6 c3 07             	test   $0x7,%bl
    10d0:	75 7f                	jne    1151 <do_jit+0xb0>
    10d2:	48 8d 7b 0c          	lea    0xc(%rbx),%rdi
    10d6:	e8 00 00 00 00       	callq  10db <do_jit+0x3a>
			10d7: R_X86_64_PLT32	__tsan_read4-0x4
    10db:	48 89 e7             	mov    %rsp,%rdi
    10de:	e8 00 00 00 00       	callq  10e3 <do_jit+0x42>
			10df: R_X86_64_PLT32	__tsan_write8-0x4
    10e3:	48 8d 6c 24 08       	lea    0x8(%rsp),%rbp
    10e8:	48 89 2c 24          	mov    %rbp,(%rsp)
    10ec:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
    10f0:	e8 00 00 00 00       	callq  10f5 <do_jit+0x54>
			10f1: R_X86_64_PLT32	__tsan_read4-0x4
    10f5:	48 8d 7b 20          	lea    0x20(%rbx),%rdi
    10f9:	e8 00 00 00 00       	callq  10fe <do_jit+0x5d>
			10fa: R_X86_64_PLT32	__tsan_read8-0x4
    10fe:	48 8b 7b 20          	mov    0x20(%rbx),%rdi
    1102:	40 f6 c7 07          	test   $0x7,%dil
    1106:	75 49                	jne    1151 <do_jit+0xb0>
    1108:	48 83 c7 18          	add    $0x18,%rdi
    110c:	e8 00 00 00 00       	callq  1111 <do_jit+0x70>
			110d: R_X86_64_PLT32	__tsan_read4-0x4
    1111:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
			1114: R_X86_64_32S	ideal_nops
    1118:	e8 00 00 00 00       	callq  111d <do_jit+0x7c>
			1119: R_X86_64_PLT32	__tsan_read8-0x4
    111d:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 1124 <do_jit+0x83>
			1120: R_X86_64_PC32	ideal_nops-0x4
    1124:	48 8d 7b 48          	lea    0x48(%rbx),%rdi
    1128:	f6 c3 07             	test   $0x7,%bl
    112b:	75 24                	jne    1151 <do_jit+0xb0>
    112d:	e8 00 00 00 00       	callq  1132 <do_jit+0x91>
			112e: R_X86_64_PLT32	__tsan_read8-0x4
    1132:	48 8b 43 48          	mov    0x48(%rbx),%rax
    1136:	8b 10                	mov    (%rax),%edx
    1138:	89 55 00             	mov    %edx,0x0(%rbp)
    113b:	0f b6 40 04          	movzbl 0x4(%rax),%eax
    113f:	88 45 04             	mov    %al,0x4(%rbp)
    1142:	48 8d 7c 24 0d       	lea    0xd(%rsp),%rdi
    1147:	e8 00 00 00 00       	callq  114c <do_jit+0xab>
			1148: R_X86_64_PLT32	__tsan_write1-0x4
    114c:	c6 44 24 0d 55       	movb   $0x55,0xd(%rsp)
    1151:	0f 0b                	ud2    

> drivers/media/i2c/ir-kbd-i2c.o: warning: objtool: ir_probe()+0x745: unreachable instruction

000000000000091e <zilog_init>:
     91e:	55                   	push   %rbp
     91f:	48 83 ec 70          	sub    $0x70,%rsp
     923:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
     92a:	00 00 
     92c:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
     931:	31 c0                	xor    %eax,%eax
     933:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
     938:	e8 00 00 00 00       	callq  93d <zilog_init+0x1f>
			939: R_X86_64_PLT32	__tsan_func_entry-0x4
     93d:	48 8d 6c 24 08       	lea    0x8(%rsp),%rbp
     942:	be 60 00 00 00       	mov    $0x60,%esi
     947:	48 89 ef             	mov    %rbp,%rdi
     94a:	e8 00 00 00 00       	callq  94f <zilog_init+0x31>
			94b: R_X86_64_PLT32	__tsan_write_range-0x4
     94f:	b9 0c 00 00 00       	mov    $0xc,%ecx
     954:	31 c0                	xor    %eax,%eax
     956:	48 89 ef             	mov    %rbp,%rdi
     959:	f3 48 ab             	rep stos %rax,%es:(%rdi)
     95c:	48 89 ef             	mov    %rbp,%rdi
     95f:	e8 00 00 00 00       	callq  964 <zilog_init+0x46>
			960: R_X86_64_PLT32	__tsan_write1-0x4
     964:	c6 44 24 08 60       	movb   $0x60,0x8(%rsp)
     969:	0f 0b                	ud2    


-- 
Josh

