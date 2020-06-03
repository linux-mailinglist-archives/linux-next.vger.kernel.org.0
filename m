Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD88F1ED35F
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 17:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgFCPbA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 11:31:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:38234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbgFCPbA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Jun 2020 11:31:00 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8C6FB205CB;
        Wed,  3 Jun 2020 15:30:59 +0000 (UTC)
Date:   Wed, 3 Jun 2020 11:30:58 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Tom Zanussi <zanussi@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: build failure after merge of the ftrace tree
Message-ID: <20200603113058.11895c24@gandalf.local.home>
In-Reply-To: <af08615d0ce87b7c920a0ac6a5389834a0504cb7.camel@kernel.org>
References: <20200603174253.60deace5@canb.auug.org.au>
        <20200603112223.3adc3451@gandalf.local.home>
        <af08615d0ce87b7c920a0ac6a5389834a0504cb7.camel@kernel.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 03 Jun 2020 10:24:36 -0500
Tom Zanussi <zanussi@kernel.org> wrote:

> > It appears to be the ascii art that is causing the issue. I have no
> > idea
> > how to fix it. If someone has a patch they would like to submit, I
> > will
> > take it before I push it off to Linus.
> > 
> > -- Steve  
> 
> I just sent you/posted a patch to fix this.  Should be in your inbox
> already.

Thanks Tom!

Stephen,

Can you test if this fixes the issue for you? If so, I'll add it push it to
my for-next branch.

-- Steve
