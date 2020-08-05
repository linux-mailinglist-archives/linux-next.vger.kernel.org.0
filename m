Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD5C23CCEE
	for <lists+linux-next@lfdr.de>; Wed,  5 Aug 2020 19:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbgHERL4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 Aug 2020 13:11:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:33510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728541AbgHERJi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 5 Aug 2020 13:09:38 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6B3A322D2C;
        Wed,  5 Aug 2020 17:09:31 +0000 (UTC)
Date:   Wed, 5 Aug 2020 13:09:29 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Muchun Song <songmuchun@bytedance.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chengming Zhou <zhouchengming@bytedance.com>
Subject: Re: [External] linux-next: build warning after merge of the ftrace
 tree
Message-ID: <20200805130929.15ad82f4@oasis.local.home>
In-Reply-To: <20200806020445.649ddaa8b8ec1b91e23508e4@kernel.org>
References: <20200805142136.0331f7ea@canb.auug.org.au>
        <CAMZfGtX0a3tui_KQfCXLcARVcev9V-HV6HMkXgVXObq8w-4EQg@mail.gmail.com>
        <20200805111105.081276bb@oasis.local.home>
        <20200806020445.649ddaa8b8ec1b91e23508e4@kernel.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 6 Aug 2020 02:04:45 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> > Looks like that would work. Care to send a formal patch. Could you also
> > change arm_kprobe_ftrace() as well?  
> 
> Looks good to me too as far as updating it to static inline function.

Can you add an Acked-by to the final patch from Muchun?
(when he sends it out)

Thanks!

-- Steve
