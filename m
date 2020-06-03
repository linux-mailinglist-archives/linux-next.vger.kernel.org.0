Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 901BC1ED33B
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 17:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgFCPW0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 11:22:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:36226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726032AbgFCPW0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Jun 2020 11:22:26 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5E44120738;
        Wed,  3 Jun 2020 15:22:25 +0000 (UTC)
Date:   Wed, 3 Jun 2020 11:22:23 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tom Zanussi <zanussi@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: build failure after merge of the ftrace tree
Message-ID: <20200603112223.3adc3451@gandalf.local.home>
In-Reply-To: <20200603174253.60deace5@canb.auug.org.au>
References: <20200603174253.60deace5@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 3 Jun 2020 17:42:53 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the ftrace tree, today's linux-next build (htmldocs)
> failed like this:
> 
> 
> Sphinx parallel build error:
> docutils.utils.SystemMessage: /home/sfr/next/next/Documentation/trace/histogram-design.rst:219: (SEVERE/4) Unexpected section title.
> 
> .
> .
> 
> Caused by commit
> 
>   16b585fe7192 ("tracing: Add histogram-design document")
> 
> I am running a slightly out of date version os sphynx (2.4.3) ...
> 

It appears to be the ascii art that is causing the issue. I have no idea
how to fix it. If someone has a patch they would like to submit, I will
take it before I push it off to Linus.

-- Steve
