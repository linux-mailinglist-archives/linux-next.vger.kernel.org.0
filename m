Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94D3A4394E9
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 13:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbhJYLhh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 07:37:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:34144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231513AbhJYLhg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 Oct 2021 07:37:36 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 16C1060F22;
        Mon, 25 Oct 2021 11:35:14 +0000 (UTC)
Date:   Mon, 25 Oct 2021 07:35:11 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp-gustavo tree
Message-ID: <20211025073511.6e9e44d8@gandalf.local.home>
In-Reply-To: <20211025153029.1e307fcf@canb.auug.org.au>
References: <20211018181559.5d3bcf7e@canb.auug.org.au>
        <20211025125446.51bed661@canb.auug.org.au>
        <20211025021119.GA1424114@embeddedor>
        <20211024224215.018c36cd@gandalf.local.home>
        <20211025153029.1e307fcf@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 25 Oct 2021 15:30:29 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > Which shouldn't need this fix.  
> 
> Well, that is in your tree today, but (1) doesn't help with the build
> failure in Gustavo's tree on its own (i.e. it creates a dependency
> between Gustavo's tree and your tree) and (2) now I will get a conflict
> between the two trees today.  Oh, well.

Gustavo was only holding that commit so that he can have his commit still
build. We knew of the dependency, and was going to let Linus know of it too.

Gustavo should be able to remove the conflicting commit now.

-- Steve
