Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B91CAA3A21
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2019 17:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728325AbfH3POd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Aug 2019 11:14:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:45666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727754AbfH3POd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Aug 2019 11:14:33 -0400
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2961623407;
        Fri, 30 Aug 2019 15:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567178072;
        bh=ksfYPmmrs+WYuh4ofGlziSddxlUzqS2w6Ab2GpuPRAQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZpLvyj+z3+uwozel4zvAeQF1YxixtpnJkvj65hLfC6X2KXqXgyl/Roz9K0L58l0vz
         eDwZRMC2jEoysaVckbLhp/QkgAtqaGZDpqYNzUtynCulGcEwRigwD2V5wiueBUQ+4E
         ILJDxStCoDQZfWMl/Qnd74wcrCdPUaLd+FosA87E=
Date:   Sat, 31 Aug 2019 00:14:27 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Aug 27 (objtool)
Message-Id: <20190831001427.4781757c2028e142bafc5446@kernel.org>
In-Reply-To: <20190830152351.9311610b5cffb93110cbd6da@kernel.org>
References: <20190827190526.6f27e763@canb.auug.org.au>
        <6c42e32f-901d-be78-e69b-cb9ff8703932@infradead.org>
        <20190827155911.ct2zzo2zhcrauf3z@treble>
        <2e8b18a0-a09c-b67e-c99f-45066ab9d511@infradead.org>
        <20190828155147.v6eowc7rr7upr7dr@treble>
        <f354f4be-99c7-346f-c7c5-ac5ce8a72a16@infradead.org>
        <20190828161331.kvikro257blxtzu5@treble>
        <20190828163433.4ltoxmtuujkqspar@treble>
        <20190829105356.1fd4859f49c142945146855f@kernel.org>
        <20190829175931.sru23aud33hrdqbj@treble>
        <20190830152351.9311610b5cffb93110cbd6da@kernel.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 30 Aug 2019 15:23:51 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> > Actually I wonder if X86_DECODER_SELFTEST is even still needed these
> > days, since objtool is enabled on default configs.  Objtool already uses
> > the decoder to disassemble every instruction in the kernel (except for a
> > few whitelisted files).
> 
> Sometimes it have found bugs, so I would like to keep it. That test runs
> build time and in-kernel decoder is somewhat critical. It is better to
> run a test before install it.

But yes, I think it may not need to run always anymore. So let's make it
disabled by default.

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
