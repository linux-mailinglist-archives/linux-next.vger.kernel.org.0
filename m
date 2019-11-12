Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 544BBF9CD3
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 23:17:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfKLWRg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 17:17:36 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45390 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726896AbfKLWRg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Nov 2019 17:17:36 -0500
Received: by mail-pf1-f193.google.com with SMTP id z4so63211pfn.12
        for <linux-next@vger.kernel.org>; Tue, 12 Nov 2019 14:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0T7KogKFofoC5Ts4V8FRe0Htuj53upBRUcsIvIUqWYM=;
        b=jujXSgV3/XBHadilEIg62jlFswTi+VHxCfrIfh/BgLMH4se6r639bj/FMqDWk2RtGY
         mOhMovtvLvb3/hBWnfQVuvYKNypV11lwdSPjq0E3UCvKfI8ayFB9zLLJhmnYPBVon9mw
         kZ/dgW+rlpCsBTymcC4b015v7F+iIf56+b9eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0T7KogKFofoC5Ts4V8FRe0Htuj53upBRUcsIvIUqWYM=;
        b=dJAAjcgjHO88/n4ekLoTl6tk0h6EcFjUCvEY8bjxHLkgdQ0RDgC3Uunu8wS+OD7vkm
         h+KOgO97MSowAjvbJP71zx1Zhwunt6C0qR3xvj5ZBKzQBT174I5JQzD/OCa76+xSufXR
         9heJNAxSG8aQkHTUnECE6uyAeOZTHD3a6nR4Y2aeo++st1YhzmKhsHm4JUnQEpiOjiJV
         XML2JJoBgdPriGry5DU/fZqTJTopRqJMf5WzOAe+vNZFFGtqAYM87x80m6h7Emj69Icb
         /grOh89RLnROCGj+jajtiWWBZGN3iAFMOxKmSA0Cg0T4s9lWN3vGncXEqWEChVpaEpZ7
         wSsg==
X-Gm-Message-State: APjAAAWb9/qYuZ+Mb5HdYeA8TrMOnetjzY2vjRJM29PRWo9zqc2zKTdZ
        ELmnR8hYBRqKxMJZidJoeGvPDw==
X-Google-Smtp-Source: APXvYqzNYCHx5TgnEBA97P0M9F+oD0F4ZHHN0hxGUC64DnukiE0M+oAGmUz4VNPJ6j7NQ+XeAI1yYA==
X-Received: by 2002:aa7:83c2:: with SMTP id j2mr222831pfn.225.1573597055631;
        Tue, 12 Nov 2019 14:17:35 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g4sm14601912pfh.172.2019.11.12.14.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 14:17:34 -0800 (PST)
Date:   Tue, 12 Nov 2019 14:17:33 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Matthew Bobrowski <mbobrowski@mbobrowski.org>
Cc:     Jan Kara <jack@suse.cz>, Theodore Ts'o <tytso@mit.edu>,
        Ritesh Harjani <riteshh@linux.ibm.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: ext4_iomap_alloc(): Integer handling issues
Message-ID: <201911121414.ECAA926@keescook>
References: <201911111735.1F45BB0B4@keescook>
 <20191112072239.GB15488@bobrowski>
 <20191112110004.GF1241@quack2.suse.cz>
 <201911121256.647DA73508@keescook>
 <20191112212846.GA29863@bobrowski>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112212846.GA29863@bobrowski>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 13, 2019 at 08:28:47AM +1100, Matthew Bobrowski wrote:
> On Tue, Nov 12, 2019 at 12:56:45PM -0800, Kees Cook wrote:
> > On Tue, Nov 12, 2019 at 12:00:04PM +0100, Jan Kara wrote:
> > > On Tue 12-11-19 18:22:41, Matthew Bobrowski wrote:
> > > > On Mon, Nov 11, 2019 at 05:35:44PM -0800, coverity-bot wrote:
> > > > > This is an experimental automated report about issues detected by Coverity
> > > > > from a scan of next-20191108 as part of the linux-next weekly scan project:
> > > > > https://scan.coverity.com/projects/linux-next-weekly-scan
> > > > > 
> > > > > You're getting this email because you were associated with the identified
> > > > > lines of code (noted below) that were touched by recent commits:
> > > > > 
> > > > > 378f32bab371 ("ext4: introduce direct I/O write using iomap infrastructure")
> > > > > 
> > > > > Coverity reported the following:
> > > > > 
> > > > > *** CID 1487841:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
> > > > > /fs/ext4/inode.c: 3388 in ext4_iomap_alloc()
> > > > > 3382     	/*
> > > > > 3383     	 * We use i_size instead of i_disksize here because delalloc writeback
> > > > > 3384     	 * can complete at any point during the I/O and subsequently push the
> > > > > 3385     	 * i_disksize out to i_size. This could be beyond where direct I/O is
> > > > > 3386     	 * happening and thus expose allocated blocks to direct I/O reads.
> > > > > 3387     	 */
> > > > > vvv     CID 1487841:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
> > > > > vvv     Potentially overflowing expression "1 << blkbits" with type "int" (32 bits, signed) is evaluated using 32-bit arithmetic, and then used in a context that expects an expression of type "loff_t" (64 bits, signed).
> > > > > 3388     	else if ((map->m_lblk * (1 << blkbits)) >= i_size_read(inode))
> > > > > 3389     		m_flags = EXT4_GET_BLOCKS_CREATE;
> > > > > 3390     	else if (ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS))
> > > > > 3391     		m_flags = EXT4_GET_BLOCKS_IO_CREATE_EXT;
> > > > 
> > > > In the event of an overflow in this specific context, I don't think it
> > > > would matter too much to be perfectly honest. If 'blkbits' were to
> > > > actually ever push out the signed integer to a value that couldn't be
> > > > represented by this data type, I would expect the resulting wrapping
> > > > behaviour to _only_ affect how filesystem blocks are allocated. In
> > > > that case, I/O workloads would behave alot differently, and at that
> > > > point I would hope that our filesystem related testing infrastructure
> > > > would pick this up before allowing anything to leak out into the
> > > > wild...
> > > > 
> > > > Unless my trail of thought is wrong? Happy to be corrected here and
> > > > educated on this.
> > > 
> > > Fully agreed. blkbits is never expected to be larger than 16 in this code.
> > > So this is false positive.
> > 
> > Thanks for looking into this!
> 
> No problem!
>  
> > Is it worth changing the type to u8 or something?
> 
> 'blkbits' in this case is already of data type u8, so this would
> effectively be a no-op. :)

Hm, yeah. I guess Coverity doesn't see anything bounding it or i_blkbits
to 16. Would add something like this make sense just to validate
assumptions?

if (WARN_ON_ONCE(blkbits > 16))
    return -ENOSPC;

-- 
Kees Cook
