Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7971443BAD9
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 21:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238769AbhJZTe2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 15:34:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:51518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237035AbhJZTe2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Oct 2021 15:34:28 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 56E8960F39;
        Tue, 26 Oct 2021 19:32:03 +0000 (UTC)
Date:   Tue, 26 Oct 2021 15:32:01 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Heiko Carstens <hca@linux.ibm.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jiri Olsa <jolsa@redhat.com>,
        Vasily Gorbik <gor@linux.ibm.com>, linux-next@vger.kernel.org
Subject: Re: Upcoming merge conflict between ftrace and s390 trees
Message-ID: <20211026153201.78ab9f1c@gandalf.local.home>
In-Reply-To: <YXAqZ/EszRisunQw@osiris>
References: <YXAqZ/EszRisunQw@osiris>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 20 Oct 2021 16:40:39 +0200
Heiko Carstens <hca@linux.ibm.com> wrote:

> Hi Stephen,
> 
> just as heads-up: there will be an upcoming merge conflict between
> ftrace and s390 trees in linux-next which will cause a compile error
> for s390.
> 
> With the s390 tree this commit is already in linux-next:
> https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git/commit/?h=features&id=c316eb4460463b6dd1aee6d241cb20323a0030aa
> 
> And soon this patch will likely be within the ftrace tree:
> https://lore.kernel.org/lkml/20211008091336.33616-9-jolsa@kernel.org/
> 
> Maybe Steven could reply to this when he applies it.

BTW, is this in your tree, or would you like me to take this through my
tree?

If so, I need a proper patch.

-- Steve
