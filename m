Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCA0F9B54
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 21:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbfKLU4s (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 15:56:48 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37421 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727074AbfKLU4s (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Nov 2019 15:56:48 -0500
Received: by mail-pg1-f194.google.com with SMTP id z24so12650594pgu.4
        for <linux-next@vger.kernel.org>; Tue, 12 Nov 2019 12:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hS4OtHvtZukTGH9wioUXI8lN0ZxRIqGp4eGx3oD9f1c=;
        b=hsctiJ6z6RxZVP6Jq9YaUOGdD7IDgZNCIPI3SbtLM9p0GCsUMngwSxfbfU+3PUAhLg
         7JAcbIF6xdshhEQF6BRHinRXOS85x/0BqfSxjO0ziYHDOwC3CcDD9g9B5MCdEcExzjxU
         LEfZ8GTOAmaqXyodsGS2ac3YRLNcTKWRu28MU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hS4OtHvtZukTGH9wioUXI8lN0ZxRIqGp4eGx3oD9f1c=;
        b=Ae5eXGOqmXcyE+MREqiOj79FxkA6AzKPiCPb9Rw79gOxoRcb343z6lI8esXCuq2/8G
         OkhWgAuwfIv31VoftpZmhmD/WZbzYZkg7ybfxI6TFOTmgoQgf/E4K5S2Sx/OefUrMrWp
         CFN1JPJuSzlU1ipTzysgsjk83cc3cZtSkyQmdkOIjgsEVBwtuec5cdhpCCX2E6WTg8Ta
         GuysiWwJ3Yglgh0FuSWl6OKHnl5Ruc/nL7+Zkxt6c3rcxGHvGILbSVjMWz3zUcP7Y3ws
         Ji5HoN3W9l/+eHL5pgDIlvOIHcjX4qrj1N9l7Kyq1dpoaF7TwBQlOrs6yEqPXd0mDWsk
         bA9A==
X-Gm-Message-State: APjAAAUBuVEOxf9orjNZ6gHSn6B1MjakqHXGojGp2hywWBotAPHSYh7O
        7B91jaOTF0HtHXDKkuTLXf5ghg==
X-Google-Smtp-Source: APXvYqw/Ul9ZpJb5OZZjqjgHo/R3z9HDNI0kJOSlpTBOns9oLW9CR0U32YM6S6q3hWjxDRkAE7q33w==
X-Received: by 2002:a17:90a:f496:: with SMTP id bx22mr9290887pjb.101.1573592207017;
        Tue, 12 Nov 2019 12:56:47 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x2sm27110785pfj.90.2019.11.12.12.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 12:56:46 -0800 (PST)
Date:   Tue, 12 Nov 2019 12:56:45 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Jan Kara <jack@suse.cz>
Cc:     Matthew Bobrowski <mbobrowski@mbobrowski.org>,
        Theodore Ts'o <tytso@mit.edu>,
        Ritesh Harjani <riteshh@linux.ibm.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: ext4_iomap_alloc(): Integer handling issues
Message-ID: <201911121256.647DA73508@keescook>
References: <201911111735.1F45BB0B4@keescook>
 <20191112072239.GB15488@bobrowski>
 <20191112110004.GF1241@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112110004.GF1241@quack2.suse.cz>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 12, 2019 at 12:00:04PM +0100, Jan Kara wrote:
> On Tue 12-11-19 18:22:41, Matthew Bobrowski wrote:
> > On Mon, Nov 11, 2019 at 05:35:44PM -0800, coverity-bot wrote:
> > > This is an experimental automated report about issues detected by Coverity
> > > from a scan of next-20191108 as part of the linux-next weekly scan project:
> > > https://scan.coverity.com/projects/linux-next-weekly-scan
> > > 
> > > You're getting this email because you were associated with the identified
> > > lines of code (noted below) that were touched by recent commits:
> > > 
> > > 378f32bab371 ("ext4: introduce direct I/O write using iomap infrastructure")
> > > 
> > > Coverity reported the following:
> > > 
> > > *** CID 1487841:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
> > > /fs/ext4/inode.c: 3388 in ext4_iomap_alloc()
> > > 3382     	/*
> > > 3383     	 * We use i_size instead of i_disksize here because delalloc writeback
> > > 3384     	 * can complete at any point during the I/O and subsequently push the
> > > 3385     	 * i_disksize out to i_size. This could be beyond where direct I/O is
> > > 3386     	 * happening and thus expose allocated blocks to direct I/O reads.
> > > 3387     	 */
> > > vvv     CID 1487841:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
> > > vvv     Potentially overflowing expression "1 << blkbits" with type "int" (32 bits, signed) is evaluated using 32-bit arithmetic, and then used in a context that expects an expression of type "loff_t" (64 bits, signed).
> > > 3388     	else if ((map->m_lblk * (1 << blkbits)) >= i_size_read(inode))
> > > 3389     		m_flags = EXT4_GET_BLOCKS_CREATE;
> > > 3390     	else if (ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS))
> > > 3391     		m_flags = EXT4_GET_BLOCKS_IO_CREATE_EXT;
> > 
> > In the event of an overflow in this specific context, I don't think it
> > would matter too much to be perfectly honest. If 'blkbits' were to
> > actually ever push out the signed integer to a value that couldn't be
> > represented by this data type, I would expect the resulting wrapping
> > behaviour to _only_ affect how filesystem blocks are allocated. In
> > that case, I/O workloads would behave alot differently, and at that
> > point I would hope that our filesystem related testing infrastructure
> > would pick this up before allowing anything to leak out into the
> > wild...
> > 
> > Unless my trail of thought is wrong? Happy to be corrected here and
> > educated on this.
> 
> Fully agreed. blkbits is never expected to be larger than 16 in this code.
> So this is false positive.

Thanks for looking into this!

Is it worth changing the type to u8 or something?

-- 
Kees Cook
