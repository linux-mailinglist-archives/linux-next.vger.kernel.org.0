Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA10C284DAF
	for <lists+linux-next@lfdr.de>; Tue,  6 Oct 2020 16:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgJFOaY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Oct 2020 10:30:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47842 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725902AbgJFOaY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Oct 2020 10:30:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601994623;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=L0qPbFUZ/qt4FGGU6g+o4zEWbey9ptsPz5J7GxXywRQ=;
        b=OkxfYjT44fUHLmDj6Uvdh5d7Hs3+c75hAEbmXgDtW1bSmDNP/vfWxTiUdqsdF5/FK4qgS1
        eMxNoZJ9fnLMlBFzrSLPAJndMCuW8/kXH6ep+A0DSBgJmS/q0iLc6ts/klQMo6w2AyUkZZ
        nBFZw0eJxOyueD2Uh3LY0Q24g7fLNI0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-daJnqIMbNcOIPacIa9Ds5Q-1; Tue, 06 Oct 2020 10:30:20 -0400
X-MC-Unique: daJnqIMbNcOIPacIa9Ds5Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13EED425E5;
        Tue,  6 Oct 2020 14:30:18 +0000 (UTC)
Received: from treble (ovpn-120-58.rdu2.redhat.com [10.10.120.58])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id D54041002C05;
        Tue,  6 Oct 2020 14:30:15 +0000 (UTC)
Date:   Tue, 6 Oct 2020 09:30:12 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@suse.de>
Subject: Re: linux-next: build failure after merge of the vfs tree
Message-ID: <20201006143012.fgpyujguzvcwszp4@treble>
References: <20200924183038.3c6da86e@canb.auug.org.au>
 <20200924200807.GU3421308@ZenIV.linux.org.uk>
 <20200925220128.1604f09b@canb.auug.org.au>
 <20200925133820.GW3421308@ZenIV.linux.org.uk>
 <20200929041056.uj6gedgm6hfjaxrx@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200929041056.uj6gedgm6hfjaxrx@treble>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 28, 2020 at 11:10:56PM -0500, Josh Poimboeuf wrote:
> > Josh, any ideas?  We could, of course, make it "r"(size), but that would
> > be unpleasant in all existing callers...
> 
> Sorry, I've been traveling.  I'd just vote for making it "r".
> 
> array_index_nospec() is always called after a usercopy.  I don't think
> anyone will notice the extra mov, for the cases where it would be
> propagated as an immediate.  And the argument *is* an unsigned long
> after all.
> 
> Stephen, can you confirm this fixes it?

Still traveling, I didn't see an update on this.  Any objections to the
below?  I assume it fixes Stephen's build issue.

> 
> diff --git a/arch/x86/include/asm/barrier.h b/arch/x86/include/asm/barrier.h
> index d158ea1fa250..69045ac62f58 100644
> --- a/arch/x86/include/asm/barrier.h
> +++ b/arch/x86/include/asm/barrier.h
> @@ -40,7 +40,7 @@ static inline unsigned long array_index_mask_nospec(unsigned long index,
>  
>  	asm volatile ("cmp %1,%2; sbb %0,%0;"
>  			:"=r" (mask)
> -			:"g"(size),"r" (index)
> +			:"r"(size), "r"(index)
>  			:"cc");
>  	return mask;
>  }
> 

-- 
Josh

