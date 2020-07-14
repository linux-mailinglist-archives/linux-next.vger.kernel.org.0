Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA14821EE47
	for <lists+linux-next@lfdr.de>; Tue, 14 Jul 2020 12:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbgGNKrP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jul 2020 06:47:15 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:45957 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725884AbgGNKrN (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Jul 2020 06:47:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594723631;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hFSCGa2faOc4YtJn6Usmp29e4JLiVkSJQ5USz3jN4SM=;
        b=XYFP3uXvcQpOdfrLrlukq/gqkrJ60YIseMBDXmrlF0f0rd/Tq8X6ltzMPd8wBPLcwFo2Yo
        9C/yaes0pRwBuQ0a2/lui/Zh+Aa6+H4ts7xCSWon05cRITBgvsZFVc5kFbq2YSPx9XZiSv
        2zhS1ezRVLySX8islVsYk2gnem7wWZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-QVsaaGwXMPK9qQ7Nt3uv_Q-1; Tue, 14 Jul 2020 06:47:07 -0400
X-MC-Unique: QVsaaGwXMPK9qQ7Nt3uv_Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C05441092;
        Tue, 14 Jul 2020 10:47:05 +0000 (UTC)
Received: from krava (unknown [10.40.193.14])
        by smtp.corp.redhat.com (Postfix) with SMTP id 5596E2E020;
        Tue, 14 Jul 2020 10:47:02 +0000 (UTC)
Date:   Tue, 14 Jul 2020 12:47:02 +0200
From:   Jiri Olsa <jolsa@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Networking <netdev@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiri Olsa <jolsa@kernel.org>,
        David Miller <davem@davemloft.net>
Subject: Re: linux-next: build warning after merge of the bpf-next tree
Message-ID: <20200714104702.GH183694@krava>
References: <20200714121608.58962d66@canb.auug.org.au>
 <20200714090048.GG183694@krava>
 <20200714203341.4664dda3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714203341.4664dda3@canb.auug.org.au>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jul 14, 2020 at 08:33:41PM +1000, Stephen Rothwell wrote:

SNIP

> > diff --git a/tools/bpf/resolve_btfids/Makefile b/tools/bpf/resolve_btfids/Makefile
> > index 948378ca73d4..a88cd4426398 100644
> > --- a/tools/bpf/resolve_btfids/Makefile
> > +++ b/tools/bpf/resolve_btfids/Makefile
> > @@ -16,6 +16,20 @@ else
> >    MAKEFLAGS=--no-print-directory
> >  endif
> >  
> > +# always use the host compiler
> > +ifneq ($(LLVM),)
> > +HOSTAR  ?= llvm-ar
> > +HOSTCC  ?= clang
> > +HOSTLD  ?= ld.lld
> > +else
> > +HOSTAR  ?= ar
> > +HOSTCC  ?= gcc
> > +HOSTLD  ?= ld
> > +endif
> > +AR       = $(HOSTAR)
> > +CC       = $(HOSTCC)
> > +LD       = $(HOSTLD)
> > +
> >  OUTPUT ?= $(srctree)/tools/bpf/resolve_btfids/
> >  
> >  LIBBPF_SRC := $(srctree)/tools/lib/bpf/
> > 
> 
> Thanks for the quick response.  However, in the mean time the bpf-next
> tree has been merged into the net-next tree, so these fixes will be
> needed there ASAP.

I just posted it

jirka

