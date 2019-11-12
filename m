Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0743EF9D51
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 23:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfKLWok (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 17:44:40 -0500
Received: from mail-pg1-f171.google.com ([209.85.215.171]:38993 "EHLO
        mail-pg1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726906AbfKLWok (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Nov 2019 17:44:40 -0500
Received: by mail-pg1-f171.google.com with SMTP id 29so12827256pgm.6
        for <linux-next@vger.kernel.org>; Tue, 12 Nov 2019 14:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C1muovplrNaPPT7QT8Z1yA2NWOBfnlBH2QBr7j8z4Q8=;
        b=P36dtm1ccvcCzqqsjkP1PV040I5IwewwSlq/C6nOzw4XRAF9CsE5CXJrk8Q4XoSPdt
         NINThNlafqMuUB6kM/dvFPYexVRvxHa9pBKnUl6ngf9xyp1SyLW3AEeifXg7PbAW3ihT
         e0gb3VwyDSPuNRyFrjiTmIQO/TITrKsFR/Ve0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C1muovplrNaPPT7QT8Z1yA2NWOBfnlBH2QBr7j8z4Q8=;
        b=tSED/5Oh3A8A31lEnynlPpNce/++teFeLDBlXcKdYT4ZgoEUjjVMHcppdm6LAIVN1n
         YSPvoFQ7FlgOxFmjCUltxC1VVgpKuPMsPzJfSLydJXxegAeyJU45tUGubK8Q0NQ/PGT3
         14WurqI9RzdqDDEHmc2Hsc6XNBE+E9R7HWePxK9/hbbXdDLmxrYXoi0LkY7q3w1Q36u/
         qIG49C2WUynkgM2T8crZHAK3IilosM3Wro4nGflqlv1CY9lby4c1NWHjst4ES/yEEpZU
         oGetorVNwch5tKyD+zjtGhoK/JZ2uzpQ3YeGgeoHsL13GlXwUqeeFnomPqENilev0HZc
         SJPw==
X-Gm-Message-State: APjAAAUtA/FvrGubJPYVIBAmWeUdojz9THS8x54gWcN+sS4QcA095TeG
        0ta8UQK6+I+6hIC8+NDB0KtYijUnyfQ=
X-Google-Smtp-Source: APXvYqxHFNLovY74mEz0ds/DGcQVG5m96Feh5UG/V0JZniuuQ/2IZ78EPp3GXTrjfeiatGSvbakfSw==
X-Received: by 2002:a63:1065:: with SMTP id 37mr37532828pgq.31.1573598678304;
        Tue, 12 Nov 2019 14:44:38 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s69sm24033pgs.65.2019.11.12.14.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 14:44:37 -0800 (PST)
Date:   Tue, 12 Nov 2019 14:44:36 -0800
From:   Kees Cook <keescook@chromium.org>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, xfs <linux-xfs@vger.kernel.org>
Subject: Re: Coverity: xlog_write_iclog(): Memory - corruptions
Message-ID: <201911121439.BFB4B66C@keescook>
References: <201911111734.4D8A1DB3DF@keescook>
 <20191112024130.GA6212@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112024130.GA6212@magnolia>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 11, 2019 at 06:41:30PM -0800, Darrick J. Wong wrote:
> [Might as well add the XFS list]
> 
> On Mon, Nov 11, 2019 at 05:34:25PM -0800, coverity-bot wrote:
> > Hello!
> > 
> > This is an experimental automated report about issues detected by Coverity
> > from a scan of next-20191108 as part of the linux-next weekly scan project:
> > https://scan.coverity.com/projects/linux-next-weekly-scan
> > 
> > You're getting this email because you were associated with the identified
> > lines of code (noted below) that were touched by recent commits:
> > 
> > 79b54d9bfcdc ("xfs: use bios directly to write log buffers")
> > 
> > Coverity reported the following:
> > 
> > *** CID 1487853:  Memory - corruptions  (BAD_FREE)
> > /fs/xfs/xfs_log.c: 1819 in xlog_write_iclog()
> > 1813     		submit_bio(split);
> > 1814
> > 1815     		/* restart at logical offset zero for the remainder */
> > 1816     		iclog->ic_bio.bi_iter.bi_sector = log->l_logBBstart;
> > 1817     	}
> > 1818
> > vvv     CID 1487853:  Memory - corruptions  (BAD_FREE)
> 
> Isn't this a duplicate of 1451989 in the main kernel coverity scan?
> Which, AFAICT 145989 is a false positive since iclog->ic_bio does not
> itself become the target of a bio_chain.

It might be, yes. The two projects are not correlated within Coverity,
and I've been trying to focus on "newly added" issues in linux-next.

I'm still trying to figure out where Coverity sees a "free" happening...

Thanks for looking at this!

-Kees

> 
> --D
> 
> > vvv     "submit_bio" frees address of "iclog->ic_bio".
> > 1819     	submit_bio(&iclog->ic_bio);
> > 1820     }
> > 1821
> > 1822     /*
> > 1823      * We need to bump cycle number for the part of the iclog that is
> > 1824      * written to the start of the log. Watch out for the header magic
> > 
> > If this is a false positive, please let us know so we can mark it as
> > such, or teach the Coverity rules to be smarter. If not, please make
> > sure fixes get into linux-next. :) For patches fixing this, please
> > include these lines (but double-check the "Fixes" first):
> > 
> > Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> > Addresses-Coverity-ID: 1487853 ("Memory - corruptions")
> > Fixes: 79b54d9bfcdc ("xfs: use bios directly to write log buffers")
> > 
> > 
> > Thanks for your attention!
> > 
> > -- 
> > Coverity-bot

-- 
Kees Cook
