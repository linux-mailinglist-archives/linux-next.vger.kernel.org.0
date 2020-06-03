Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA6381ED341
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 17:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgFCPYi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 11:24:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:36656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725810AbgFCPYi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Jun 2020 11:24:38 -0400
Received: from tzanussi-mobl (c-73-211-240-131.hsd1.il.comcast.net [73.211.240.131])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C9328206A2;
        Wed,  3 Jun 2020 15:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591197878;
        bh=wYhSFD9Khcc0Z3mpqxy4+CiNsLPVPcf8WqMe+UPsLC8=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=ERkS2pLmp6VM8p5BRD0VinxXrkbvVSPIGRdqKX7nRekXAl0RJYTIgfotZGeiJWSxA
         5PQxfRgNoFaPNC1SFuXplrT4vXmJxvdLREX/1UU63tNq9In+eFzN5j1dVfvYbbktHx
         Q3LZ+9KbtRSp+7EppzCQ3/XWYBUP9T9FEGNjB5gs=
Message-ID: <af08615d0ce87b7c920a0ac6a5389834a0504cb7.camel@kernel.org>
Subject: Re: linux-next: build failure after merge of the ftrace tree
From:   Tom Zanussi <zanussi@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Date:   Wed, 03 Jun 2020 10:24:36 -0500
In-Reply-To: <20200603112223.3adc3451@gandalf.local.home>
References: <20200603174253.60deace5@canb.auug.org.au>
         <20200603112223.3adc3451@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Steve,

On Wed, 2020-06-03 at 11:22 -0400, Steven Rostedt wrote:
> On Wed, 3 Jun 2020 17:42:53 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > After merging the ftrace tree, today's linux-next build (htmldocs)
> > failed like this:
> > 
> > 
> > Sphinx parallel build error:
> > docutils.utils.SystemMessage:
> > /home/sfr/next/next/Documentation/trace/histogram-design.rst:219:
> > (SEVERE/4) Unexpected section title.
> > 
> > .
> > .
> > 
> > Caused by commit
> > 
> >   16b585fe7192 ("tracing: Add histogram-design document")
> > 
> > I am running a slightly out of date version os sphynx (2.4.3) ...
> > 
> 
> It appears to be the ascii art that is causing the issue. I have no
> idea
> how to fix it. If someone has a patch they would like to submit, I
> will
> take it before I push it off to Linus.
> 
> -- Steve

I just sent you/posted a patch to fix this.  Should be in your inbox
already.

Thanks,

Tom

