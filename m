Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D41A0F899C
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 08:22:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbfKLHWs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 02:22:48 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43807 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727024AbfKLHWs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Nov 2019 02:22:48 -0500
Received: by mail-pf1-f194.google.com with SMTP id 3so12685713pfb.10
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 23:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mbobrowski-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gO9YPHVQsoqeQasrpa3BV/v4PKMeL3hfYMR0BVuIRVc=;
        b=zNqsREJ7mBL2FMwvWvTeyut46xH80rU9wY/8vrw9pypLnCeoV78ZpTiAeVC0t8ulzc
         /rYC73dAhcSgWJRRVQcI6W2It8bGrsQVque/m4deqqcEPhNQxiqoupzT04R4iyeD+v+H
         HGofsIW85EcxPSXG5tmZNchZJ0duVVZabOJqgd5RGXQ5BqI+FMWWxpJMwpULmGTWV8Lw
         7KaaQj7GpHDZ6nbTw+J9rkHyhPeFBSntPPIE/G2cmYN/HfNER9ZwUe5CF2NLUUVOszVy
         QloZD3Vpv8MUkyn3ZNG2Cu3MlSBkHYj6XtPuPlval0itqLMZMqoiE7uDwffyj/xDd9uU
         Rp3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gO9YPHVQsoqeQasrpa3BV/v4PKMeL3hfYMR0BVuIRVc=;
        b=RAkXfidv7snbM0QDA86H2h9rnyKagZS5bwQhQS+j3A465xPsSabRHsYwvA8k+W3r1A
         AX8oi/2aNzexKiPj6TMYV8LBOuYFSmFGqt6hiZjsZ1vXwIkIAxT7A2AYpj+EFQnfDpak
         aF3Gku9ih0+Na70iHVB7iq6b5im9ku1nltmr6cMr4iOLbneQq2OS8rRq58Ydo0vjCB+j
         b2l4n5fHu2KjymmxjK3zMmJkA0gM0CcHcx9rbzZlCKADhdx3qo+NlvXAJ8xwKXA+0X8y
         EhcnQt8CfQCa6WgTc2h3znH1xwAsWZK3BG2rFd4i2P9g2I7UwkM/3iM6B1vZLTmw33TM
         pt0w==
X-Gm-Message-State: APjAAAVr8LtFqHzYD/LjnKCJEc5b3ZITO7jDgTS2SkkOV5MzhprQP1ZA
        9ZbHd6k8eze5KtnawXNklHPW
X-Google-Smtp-Source: APXvYqwxTn2M+olDT0ziF4H5UjjqZNlLBqhqd2RteYUi9wbMeXB78zX2LJy3HdoX3LrCRpV1QUGLdA==
X-Received: by 2002:aa7:961d:: with SMTP id q29mr33573726pfg.89.1573543367360;
        Mon, 11 Nov 2019 23:22:47 -0800 (PST)
Received: from bobrowski ([110.232.114.101])
        by smtp.gmail.com with ESMTPSA id l33sm16999718pgb.79.2019.11.11.23.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 23:22:46 -0800 (PST)
Date:   Tue, 12 Nov 2019 18:22:41 +1100
From:   Matthew Bobrowski <mbobrowski@mbobrowski.org>
To:     coverity-bot <keescook@chromium.org>
Cc:     Jan Kara <jack@suse.cz>, Theodore Ts'o <tytso@mit.edu>,
        Ritesh Harjani <riteshh@linux.ibm.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: ext4_iomap_alloc(): Integer handling issues
Message-ID: <20191112072239.GB15488@bobrowski>
References: <201911111735.1F45BB0B4@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201911111735.1F45BB0B4@keescook>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 11, 2019 at 05:35:44PM -0800, coverity-bot wrote:
> This is an experimental automated report about issues detected by Coverity
> from a scan of next-20191108 as part of the linux-next weekly scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by recent commits:
> 
> 378f32bab371 ("ext4: introduce direct I/O write using iomap infrastructure")
> 
> Coverity reported the following:
> 
> *** CID 1487841:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
> /fs/ext4/inode.c: 3388 in ext4_iomap_alloc()
> 3382     	/*
> 3383     	 * We use i_size instead of i_disksize here because delalloc writeback
> 3384     	 * can complete at any point during the I/O and subsequently push the
> 3385     	 * i_disksize out to i_size. This could be beyond where direct I/O is
> 3386     	 * happening and thus expose allocated blocks to direct I/O reads.
> 3387     	 */
> vvv     CID 1487841:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
> vvv     Potentially overflowing expression "1 << blkbits" with type "int" (32 bits, signed) is evaluated using 32-bit arithmetic, and then used in a context that expects an expression of type "loff_t" (64 bits, signed).
> 3388     	else if ((map->m_lblk * (1 << blkbits)) >= i_size_read(inode))
> 3389     		m_flags = EXT4_GET_BLOCKS_CREATE;
> 3390     	else if (ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS))
> 3391     		m_flags = EXT4_GET_BLOCKS_IO_CREATE_EXT;

In the event of an overflow in this specific context, I don't think it
would matter too much to be perfectly honest. If 'blkbits' were to
actually ever push out the signed integer to a value that couldn't be
represented by this data type, I would expect the resulting wrapping
behaviour to _only_ affect how filesystem blocks are allocated. In
that case, I/O workloads would behave alot differently, and at that
point I would hope that our filesystem related testing infrastructure
would pick this up before allowing anything to leak out into the
wild...

Unless my trail of thought is wrong? Happy to be corrected here and
educated on this.

/M
