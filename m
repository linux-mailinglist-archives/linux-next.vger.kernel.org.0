Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29EECFA910
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2019 05:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727187AbfKMEi7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 23:38:59 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34169 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727001AbfKMEi7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Nov 2019 23:38:59 -0500
Received: by mail-pg1-f194.google.com with SMTP id z188so562877pgb.1
        for <linux-next@vger.kernel.org>; Tue, 12 Nov 2019 20:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mbobrowski-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WnBWTNr1wp6ZQih5z2eNrezznniAB/ILGBQAuiv5Byk=;
        b=IcHIh4Il+5IRl8GRCU2WN0suwD2gIUQZMYSz/b0m+KcnQKEDZ51cn3lhGFaL51PDH2
         vtsak900C1d9tBU/K2ngkmCEyQoSm0c+IU7CN4PRiypuptA/DjyIuEMOoTzVnQ3l33O1
         tEIs7X94/hsEZZgx4UGLzqHO+mWzEAauPOsZYBCU5NeKj4TpwjKSnP7pZdzFrbVnXejX
         qtHnzpvbhIzuNtI0Vn2ZA0hYS1VwXHlAOHFJgbXJI2shhjrkc5sdPjWTUX5gAT1wB94u
         31rVHHy33kA7apjTmgD/gTdOLWNHtw+JUuunsKpQwtGMYGv4b7uS6rWpIDKwfzGwWdeu
         UuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WnBWTNr1wp6ZQih5z2eNrezznniAB/ILGBQAuiv5Byk=;
        b=lT5aauVF6Co0CnWKvUfFp+trQCYpG9xvbvr4hU/92Vl6dry/b76rwscsWuRG4vN/vV
         qIS95/WSVbFzJ8Jqcq1N9lxKegLLWn05/rCOEV8zQufkeonKz+rktD0KVpZiDJnH6Cd8
         tJv1dMSIvyoEC7kfcfWxso/e1igtqkqT7ZvJqzCzM9kvemcYwHHYxH7Td+lxjJvDPYZb
         6UtvAuWF9d6ZCbDm+V6m7IwbbnxuyvQ9ihKW261iOC+FMolbgkKqSjZSpzdv7sFszh9y
         xAlUk7FnDk5fb3Hi/jvo0PiVJW9rN4FkkppqWotnSISesM1TWA/gw+4RRB18GCJZRh6p
         cJKw==
X-Gm-Message-State: APjAAAXX0CMzfiGiLOl0GCTyUPdkyd/rrgj/HBKBnQJ3hLpqSjv278Jf
        QH+RDOO9+oI3PB8MX+2Lw+eltU1AOQ==
X-Google-Smtp-Source: APXvYqxw4zrclAnKcKrJIRxorwXkNtrL3nyMnApsZMYDhnHIuAfIX9mRzHI5FM39xggb9XR+ccNfhA==
X-Received: by 2002:a63:dd58:: with SMTP id g24mr1408565pgj.376.1573619937599;
        Tue, 12 Nov 2019 20:38:57 -0800 (PST)
Received: from bobrowski ([110.232.114.101])
        by smtp.gmail.com with ESMTPSA id b137sm626257pga.91.2019.11.12.20.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 20:38:56 -0800 (PST)
Date:   Wed, 13 Nov 2019 15:38:51 +1100
From:   Matthew Bobrowski <mbobrowski@mbobrowski.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Jan Kara <jack@suse.cz>, Theodore Ts'o <tytso@mit.edu>,
        Ritesh Harjani <riteshh@linux.ibm.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: ext4_iomap_alloc(): Integer handling issues
Message-ID: <20191113043849.GD29863@bobrowski>
References: <201911111735.1F45BB0B4@keescook>
 <20191112072239.GB15488@bobrowski>
 <20191112110004.GF1241@quack2.suse.cz>
 <201911121256.647DA73508@keescook>
 <20191112212846.GA29863@bobrowski>
 <201911121414.ECAA926@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201911121414.ECAA926@keescook>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 12, 2019 at 02:17:33PM -0800, Kees Cook wrote:
> On Wed, Nov 13, 2019 at 08:28:47AM +1100, Matthew Bobrowski wrote:
> > On Tue, Nov 12, 2019 at 12:56:45PM -0800, Kees Cook wrote:
> > > On Tue, Nov 12, 2019 at 12:00:04PM +0100, Jan Kara wrote:
> > > > On Tue 12-11-19 18:22:41, Matthew Bobrowski wrote:
> > > > > On Mon, Nov 11, 2019 at 05:35:44PM -0800, coverity-bot wrote:
> > > > > > This is an experimental automated report about issues detected by Coverity
> > > > > > from a scan of next-20191108 as part of the linux-next weekly scan project:
> > > > > > https://scan.coverity.com/projects/linux-next-weekly-scan
> > > > > > 
> > > > > > You're getting this email because you were associated with the identified
> > > > > > lines of code (noted below) that were touched by recent commits:
> > > > > > 
> > > > > > 378f32bab371 ("ext4: introduce direct I/O write using iomap infrastructure")
> > > > > > 
> > > > > > Coverity reported the following:
> > > > > > 
> > > > > > *** CID 1487841:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
> > > > > > /fs/ext4/inode.c: 3388 in ext4_iomap_alloc()
> > > > > > 3382     	/*
> > > > > > 3383     	 * We use i_size instead of i_disksize here because delalloc writeback
> > > > > > 3384     	 * can complete at any point during the I/O and subsequently push the
> > > > > > 3385     	 * i_disksize out to i_size. This could be beyond where direct I/O is
> > > > > > 3386     	 * happening and thus expose allocated blocks to direct I/O reads.
> > > > > > 3387     	 */
> > > > > > vvv     CID 1487841:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
> > > > > > vvv     Potentially overflowing expression "1 << blkbits" with type "int" (32 bits, signed) is evaluated using 32-bit arithmetic, and then used in a context that expects an expression of type "loff_t" (64 bits, signed).
> > > > > > 3388     	else if ((map->m_lblk * (1 << blkbits)) >= i_size_read(inode))
> > > > > > 3389     		m_flags = EXT4_GET_BLOCKS_CREATE;
> > > > > > 3390     	else if (ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS))
> > > > > > 3391     		m_flags = EXT4_GET_BLOCKS_IO_CREATE_EXT;
> > > > > 
> > > > > In the event of an overflow in this specific context, I don't think it
> > > > > would matter too much to be perfectly honest. If 'blkbits' were to
> > > > > actually ever push out the signed integer to a value that couldn't be
> > > > > represented by this data type, I would expect the resulting wrapping
> > > > > behaviour to _only_ affect how filesystem blocks are allocated. In
> > > > > that case, I/O workloads would behave alot differently, and at that
> > > > > point I would hope that our filesystem related testing infrastructure
> > > > > would pick this up before allowing anything to leak out into the
> > > > > wild...
> > > > > 
> > > > > Unless my trail of thought is wrong? Happy to be corrected here and
> > > > > educated on this.
> > > > 
> > > > Fully agreed. blkbits is never expected to be larger than 16 in this code.
> > > > So this is false positive.
> > > 
> > > Thanks for looking into this!
> > 
> > No problem!
> >  
> > > Is it worth changing the type to u8 or something?
> > 
> > 'blkbits' in this case is already of data type u8, so this would
> > effectively be a no-op. :)
> 
> Hm, yeah. I guess Coverity doesn't see anything bounding it or i_blkbits
> to 16. Would add something like this make sense just to validate
> assumptions?
> 
> if (WARN_ON_ONCE(blkbits > 16))
>     return -ENOSPC;

In the realm of filesystem code, we'd lean towards using a different
error code if we went down the route of adding such a check i.e. -EIO
rather than -ENOSPC, where -ENOSPC is typically used to signify that
there's no space left on an underlying device.

That said, I still don't think this would be necessary here though...

/M
