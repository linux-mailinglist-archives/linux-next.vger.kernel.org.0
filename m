Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4FC3F4C04
	for <lists+linux-next@lfdr.de>; Mon, 23 Aug 2021 16:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhHWOA5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Aug 2021 10:00:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:58648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229625AbhHWOA5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Aug 2021 10:00:57 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6B108613A8;
        Mon, 23 Aug 2021 14:00:14 +0000 (UTC)
Date:   Mon, 23 Aug 2021 10:00:07 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the ftrace tree
Message-ID: <20210823100007.71ce2ba9@oasis.local.home>
In-Reply-To: <20210823195804.10c5758a@canb.auug.org.au>
References: <20210823195804.10c5758a@canb.auug.org.au>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 23 Aug 2021 19:58:04 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the ftrace tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/trace/histogram.rst:80: WARNING: Malformed table.
> Text in column margin in table line 8.
> 
> =========== ==========================================
> .hex        display a number as a hex value
> .sym        display an address as a symbol
> .sym-offset display an address as a symbol and offset
> .syscall    display a syscall id as a system call name
> .execname   display a common_pid as a program name
> .log2       display log2 value rather than raw number
> .buckets=size  display grouping of values rather than raw number
> .usecs      display a common_timestamp in microseconds
> =========== ==========================================
> 
> Introduced by commit
> 
>   370364351926 ("tracing/histogram: Update the documentation for the buckets modifier")
> 

Hi Stephen,

Does the below fix it?

-- Steve

diff --git a/Documentation/trace/histogram.rst b/Documentation/trace/histogram.rst
index 4e650671f245..533415644c54 100644
--- a/Documentation/trace/histogram.rst
+++ b/Documentation/trace/histogram.rst
@@ -70,16 +70,16 @@ Documentation written by Tom Zanussi
   modified by appending any of the following modifiers to the field
   name:
 
-	=========== ==========================================
-        .hex        display a number as a hex value
-	.sym        display an address as a symbol
-	.sym-offset display an address as a symbol and offset
-	.syscall    display a syscall id as a system call name
-	.execname   display a common_pid as a program name
-	.log2       display log2 value rather than raw number
+	=============  =================================================
+        .hex           display a number as a hex value
+	.sym           display an address as a symbol
+	.sym-offset    display an address as a symbol and offset
+	.syscall       display a syscall id as a system call name
+	.execname      display a common_pid as a program name
+	.log2          display log2 value rather than raw number
 	.buckets=size  display grouping of values rather than raw number
-	.usecs      display a common_timestamp in microseconds
-	=========== ==========================================
+	.usecs         display a common_timestamp in microseconds
+	=============  =================================================
 
   Note that in general the semantics of a given field aren't
   interpreted when applying a modifier to it, but there are some
