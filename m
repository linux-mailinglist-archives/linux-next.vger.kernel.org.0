Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38652441AE2
	for <lists+linux-next@lfdr.de>; Mon,  1 Nov 2021 12:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbhKALxc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Nov 2021 07:53:32 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:44130 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231485AbhKALxc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Nov 2021 07:53:32 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 952A91FD3B;
        Mon,  1 Nov 2021 11:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1635767458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fI/7zBLNASK1SbusA4CGgEhNkrv5qrtkIuO6C83IXWQ=;
        b=kyZdwYqusc2DtXNAALClR+GBhMS1A7IGBqZ1NK6Q7/3qt02Dqqi3rNs2FMc/3TOGDi2u44
        ayMhygt4C09SRSwNDSHZRM7EtAxFzBza9Y2/DMXIte7lU62V8jUP55L4zlzY8qFLvhptq9
        J8ocnKjhtLcwWhImjGHkko3aJpduxto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1635767458;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fI/7zBLNASK1SbusA4CGgEhNkrv5qrtkIuO6C83IXWQ=;
        b=OKWYy5mY6KFxyPtuRxTQi9YwxcrYBiJHFITQ87baJT64TLJ8LLaxqekX1xtq6JMLxRNh/r
        rLTnaxPpdgpNLDBA==
Received: from quack2.suse.cz (unknown [10.163.28.18])
        by relay2.suse.de (Postfix) with ESMTP id 84F63A3B81;
        Mon,  1 Nov 2021 11:50:58 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 5000D1E0922; Mon,  1 Nov 2021 12:50:58 +0100 (CET)
Date:   Mon, 1 Nov 2021 12:50:58 +0100
From:   Jan Kara <jack@suse.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jan Kara <jack@suse.cz>,
        Gabriel Krisman Bertazi <krisman@collabora.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the ext3 tree
Message-ID: <20211101115058.GC21679@quack2.suse.cz>
References: <20211028211053.0c504d48@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
In-Reply-To: <20211028211053.0c504d48@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu 28-10-21 21:10:53, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the ext3 tree, today's linux-next build (powerpc
> allyesconfig) produced this warning:
> 
> samples/fanotify/fs-monitor.c: In function 'handle_notifications':
> samples/fanotify/fs-monitor.c:68:36: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
>    68 |    printf("unexpected FAN MARK: %llx\n", event->mask);
>       |                                 ~~~^     ~~~~~~~~~~~
>       |                                    |          |
>       |                                    |          __u64 {aka long unsigned int}
>       |                                    long long unsigned int
>       |                                 %lx
> 
> Introduced by commit
> 
>   5451093081db ("samples: Add fs error monitoring example")

Thanks for report Stephen. I've added attached patch to my tree to fix it
up.

									Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--zhXaljGHf11kAtnf
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="0001-samples-Fix-warning-in-fsnotify-sample.patch"

From b7eccf75c28e5469bb4685a03310dbb66ee323f9 Mon Sep 17 00:00:00 2001
From: Jan Kara <jack@suse.cz>
Date: Mon, 1 Nov 2021 12:47:32 +0100
Subject: [PATCH] samples: Fix warning in fsnotify sample

The fsnotify sample code generates the following warning on powerpc:

samples/fanotify/fs-monitor.c: In function 'handle_notifications':
samples/fanotify/fs-monitor.c:68:36: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
   68 |    printf("unexpected FAN MARK: %llx\n", event->mask);
      |                                 ~~~^     ~~~~~~~~~~~
      |                                    |          |
      |                                    |          __u64 {aka long unsigned int}
      |                                    long long unsigned int
      |                                 %lx

Fix the problem by explicitely typing the argument to proper type.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Jan Kara <jack@suse.cz>
---
 samples/fanotify/fs-monitor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/samples/fanotify/fs-monitor.c b/samples/fanotify/fs-monitor.c
index a0e44cd31e6f..2e08a1807db7 100644
--- a/samples/fanotify/fs-monitor.c
+++ b/samples/fanotify/fs-monitor.c
@@ -65,7 +65,8 @@ static void handle_notifications(char *buffer, int len)
 	for (; FAN_EVENT_OK(event, len); event = FAN_EVENT_NEXT(event, len)) {
 
 		if (event->mask != FAN_FS_ERROR) {
-			printf("unexpected FAN MARK: %llx\n", event->mask);
+			printf("unexpected FAN MARK: %llx\n",
+							(unsigned long long)event->mask);
 			goto next_event;
 		}
 
-- 
2.26.2


--zhXaljGHf11kAtnf--
