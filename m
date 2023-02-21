Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 415E469EA54
	for <lists+linux-next@lfdr.de>; Tue, 21 Feb 2023 23:41:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjBUWlg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Feb 2023 17:41:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbjBUWlg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Feb 2023 17:41:36 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CFB210FD
        for <linux-next@vger.kernel.org>; Tue, 21 Feb 2023 14:41:26 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id bh19-20020a056830381300b00690bf2011b2so1091403otb.6
        for <linux-next@vger.kernel.org>; Tue, 21 Feb 2023 14:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=70NEIG7dPw85xNyUz123aLCI747RTlD28I7LT+LO0Ps=;
        b=X+gpWh9hVizU+OWsUyVnNUVUVTmPeV0hBctGB1PvqmF80bWtEXX1f+f4fTD39NqUKT
         bbFY2lWtMLQW6UfKLLkVCd0wJFCApjco9te6jcLWrfvvYsRocUHbSkm6fK5Xg0tXV+zp
         uHwtMDu8uYGFa1kT/XtLF5iAI9Zg4WIxBIZOqn1IvlR039dgkyK02ltpARk8wovafWXk
         OuD/GFzBRo+/yY9iR2dvtZvw4UfYy6qEbfXnKfcKfCz/2wIf+8muOucw9zVLkiWxCooT
         9/UcsEMTQqcrrl/sTpDW6M9G39g37ON4UPOUyi5hcoALDeQKhPx4UH0IZLTk0mUy2HJB
         jlfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=70NEIG7dPw85xNyUz123aLCI747RTlD28I7LT+LO0Ps=;
        b=38AzXNMwKD4AC+OwYiC5WzxFBxoR1tjp8XLYZNJvo8utvMc+TZm/mUC8+mtSpJgywR
         A+QAQcTKlJnDRccpE369Y9yG0uDwMiVY4BjmRkni7trjC938SyuQAVbPTYy3fzS83WuD
         LdH1C0PtJWnXXdz/az34cbZgkr+pQXJQTOfY/Mx0NpiWhHmDZyrvqHewxY5O3+tOvyLW
         vsK4iKqxDUfcQqmcjNiePKmBtI2/Y0UFs0uOecEEUchMTCIWPke5nX4w6mudKIYQJM8l
         Ng9nsC0eXqMsGobCtepiurm5r50m+MXZSr3oxF4/9ZDIP7dca6HXz6Stc+YwtpZFER34
         5Xqw==
X-Gm-Message-State: AO0yUKVEbtal+AcqK6F4TCXwlu5GKtUt+wyxzdmKRDHmIoK4NeM0/aqv
        WXyZ62z8LuZyOEP/KWvqyrDSBQ==
X-Google-Smtp-Source: AK7set+cWw0qeWzPMZvc8FYPF6bi/aMCuY0gsP24wf9X7ofAlNJlaLtoyNGQu8obXk8S53OWK/qwUQ==
X-Received: by 2002:a05:6830:3116:b0:68b:bb82:a937 with SMTP id b22-20020a056830311600b0068bbb82a937mr7731121ots.34.1677019285376;
        Tue, 21 Feb 2023 14:41:25 -0800 (PST)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 90-20020a9d06e3000000b0068abc8e786fsm145511otx.10.2023.02.21.14.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 14:41:23 -0800 (PST)
Date:   Tue, 21 Feb 2023 14:41:21 -0800 (PST)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To:     David Howells <dhowells@redhat.com>
cc:     Matthew Wilcox <willy@infradead.org>,
        Hugh Dickins <hughd@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Steve French <smfrench@gmail.com>,
        Steve French <stfrench@microsoft.com>,
        Shyam Prasad N <nspmangalore@gmail.com>,
        Rohith Surabattula <rohiths.msft@gmail.com>,
        Tom Talpey <tom@talpey.com>, Paulo Alcantara <pc@cjr.nz>,
        Jeff Layton <jlayton@kernel.org>, linux-cifs@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Obsolete comment on page swizzling (written by Hugh)?
In-Reply-To: <2890066.1676993700@warthog.procyon.org.uk>
Message-ID: <ec3b5661-e99-fb46-b678-66a7daf43d82@google.com>
References: <2888446.1676992843@warthog.procyon.org.uk> <Y/TbYGXC4HKunymf@casper.infradead.org> <20230221184225.0e734f0e@canb.auug.org.au> <20230221174401.7198357d@canb.auug.org.au> <20230220152933.1ab8fa4a@canb.auug.org.au> <Y/N8hVWeR3AjssUC@casper.infradead.org>
 <20230220190157.3b43b9a7@canb.auug.org.au> <Y/Pe2xHklSr1hDtz@casper.infradead.org> <2351091.1676963957@warthog.procyon.org.uk> <2885897.1676990364@warthog.procyon.org.uk> <2890066.1676993700@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 21 Feb 2023, David Howells wrote:
> David Howells <dhowells@redhat.com> wrote:
> 
> > > > +			/* At this point we hold neither the i_pages lock nor the
> > > > +			 * page lock: the page may be truncated or invalidated
> > > > +			 * (changing page->mapping to NULL), or even swizzled
> > > > +			 * back from swapper_space to tmpfs file mapping
> > > 
> > > Where does this comment come from?  This is cifs, not tmpfs.  You'll
> > > never be asked to writeback a page from the swap cache.  Dirty pages
> > > can be truncated, so the first half of the comment is still accurate.
> > > I'd rather it moved down to below the folio lock, and was rephrased
> > > so it described why we're checking everything again.
> > 
> > Actually, it's in v6.2 cifs and I just move it in the patch where I copy the
> > afs writepages implementation into cifs.  afs got it in 2007 when I added
> > write support[1] and I suspect I copied it from cifs.  cifs got it in 2005
> > when Steve added writepages support[2].  I think he must've got it from
> > fs/mpage.c and the comment there is prehistoric.
> 
> The ultimate source is Hugh Dickins, it would seem:
> 
> 	commit 820ef9df32856bb54fe5bc995153feb276420e15
> 	Author: Andrew Morton <akpm@digeo.com>
> 	Date:   Fri Nov 15 18:52:38 2002 -0800
> 
> 	[PATCH] handle pages which alter their ->mapping
> 
> 	Patch from Hugh Dickins <hugh@veritas.com>
> 
> 	tmpfs failed fsx+swapout tests after many hours, a page found zeroed.
> 	Not a truncate problem, but mirror image of earlier truncate problems:
> 	swap goes through mpage_writepages, which must therefore allow for a
> 	sudden swizzle back to file identity.
> 
> 	Second time this caught us, so I've audited the tree for other places
> 	which might be surprised by such swizzling.  The only others I found
> 	were (perhaps) in the parisc and sparc64 flush_dcache_page called
> 	from do_generic_mapping_read on a looped tmpfs file which is also
> 	mmapped; but that's a very marginal case, I wanted to understand it
> 	better before making any edit, and now realize that hch's sendfile
> 	in loop eliminates it (now go through do_shmem_file_read instead:
> 	similar but crucially this locks the page when raising its count,
> 	which is enough to keep vmscan from interfering).
> 
> Maybe we should delete or amend the comment now?

Yes, that comment does not belong in afs or btrfs or cifs - though it
does explain why we have sometimes chosen to compare folio_mapping(folio)
with expected mapping, rather than against NULL.

But "now" is not the moment to amend it: it looks like these sources
are in flux at present.  And truncate_cleanup_folio() has a "swizzles"
comment without even a mapping to compare with.

Hugh
