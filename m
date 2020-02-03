Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 527231500AC
	for <lists+linux-next@lfdr.de>; Mon,  3 Feb 2020 04:16:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbgBCDQv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 2 Feb 2020 22:16:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:39478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726733AbgBCDQv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 2 Feb 2020 22:16:51 -0500
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4EFA220721;
        Mon,  3 Feb 2020 03:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580699809;
        bh=ae9YpC4L5lVTb2VIGcOUHSsDKMdaBBAmS5+A5LM1ZGc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KJUAjHcqiLWbPAwR172CD2SdNGcD+4Zz38mCThFSWejEPAAXoC/8itG90/Aid1Xu/
         qYE6p58B9z6Bc2EJ+3vTXdJeQPkQAv3cESO0ftj9LWkNq2kZCH3XdDssZ1mMg4NCmq
         muEPrvd5U7jjhM2Q7Xf+qmvoJIYn/kDcfqt7Uuxo=
Date:   Mon, 3 Feb 2020 12:16:45 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Arvind Sankar <nivedita@alum.mit.edu>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 ftrace tree
Message-Id: <20200203121645.18b8e5aaa6dd22b7f9e7c928@kernel.org>
In-Reply-To: <20200203115132.04e5ed05@canb.auug.org.au>
References: <20200115164708.6c51494c@canb.auug.org.au>
        <20200203115132.04e5ed05@canb.auug.org.au>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On Mon, 3 Feb 2020 11:51:32 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> On Wed, 15 Jan 2020 16:47:08 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> > 
> > Today's linux-next merge of the akpm-current tree got a conflict in:
> > 
> >   init/main.c
> > 
> > between commit:
> > 
> >   0068c92a9270 ("init/main.c: Alloc initcall_command_line in do_initcall() and free it")
> > 
> > from the ftrace tree and commit:
> > 
> >   21cc5aef9811 ("init/main.c: remove unnecessary repair_env_string in do_initcall_level")
> > 
> > from the akpm-current tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 

Thanks for noticing the conflict and fixing!


> > @@@ -1162,15 -990,22 +1161,21 @@@ static const char *initcall_level_names
> >   	"late",
> >   };
> >   
> > + static int __init ignore_unknown_bootoption(char *param, char *val,
> > + 			       const char *unused, void *arg)
> > + {
> > + 	return 0;
> > + }
> > + 
> >  -static void __init do_initcall_level(int level)
> >  +static void __init do_initcall_level(int level, char *command_line)
> >   {
> >   	initcall_entry_t *fn;
> >   
> >  -	strcpy(initcall_command_line, saved_command_line);
> >   	parse_args(initcall_level_names[level],
> >  -		   initcall_command_line, __start___param,
> >  +		   command_line, __start___param,
> >   		   __stop___param - __start___param,
> >   		   level, level,
> > - 		   NULL, &repair_env_string);
> > + 		   NULL, ignore_unknown_bootoption);
> >   
> >   	trace_initcall_level(initcall_level_names[level]);
> >   	for (fn = initcall_levels[level]; fn < initcall_levels[level+1]; fn++)
> 
> This is now a conflict between the ftrace tree and Linus' tree.

Yeah, this fix looks good to me.

As far as I can see, the issue is below 2 lines.

> >  -static void __init do_initcall_level(int level)
> >  +static void __init do_initcall_level(int level, char *command_line)

Basically, the command_line is copied from saved_command_line each time when
do_initcall_level() is invoked, so the precondition of the commit 21cc5aef9811
("init/main.c: remove unnecessary repair_env_string in do_initcall_level")
remains the same.

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
